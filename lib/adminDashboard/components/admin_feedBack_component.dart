import 'package:flutter_viz/adminDashboard/model/feed_back_model.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/feedback_status_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminFeedBackComponent extends StatefulWidget {
  static String tag = '/AdminFeedBackComponent';

  @override
  AdminFeedBackComponentState createState() => AdminFeedBackComponentState();
}

class AdminFeedBackComponentState extends State<AdminFeedBackComponent> {
  int page = 1;
  int? totalPage = 1;
  int selectedIndex = 0;
  int totalFeedback = 0;
  int isCompleted = 0;

  List<FeedBackData> feedbackList = [];
  List<FeedbackStatusModel> feedbackStatus = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    feedbackStatus.add(FeedbackStatusModel(title: COMPLETE, value: 1));
    feedbackStatus.add(FeedbackStatusModel(title: INCOMPLETE, value: 0));
    feedBackListApi(page);
  }

  ///feedback List api call
  Future<void> feedBackListApi(int page, {int? status}) async {
    appStore.setLoading(true);

    await getFeedbackList(page, isCompleted: status.validate()).then((value) async {
      appStore.setLoading(false);
      feedbackList.clear();
      feedbackList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;
      totalFeedback = value.pagination!.totalItems.validate();

      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///feedback status api call
  Future<void> feedbackStatusApi(id, {int? status}) async {
    appStore.setLoading(true);
    Map req = {"feedback_id": id, "is_completed": status};

    await updateFeedBackStatus(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  Color feedBackTypeColor(feedbackType) {
    if (feedbackType == FEEDBACK_TYPE_GENERAL_FEEDBACK) {
      return btnBackgroundColor;
    } else if (feedbackType == FEEDBACK_TYPE_FEAUTURE_REQUEST) {
      return Colors.green;
    } else if (feedbackType == FEEDBACK_TYPE_BUG_REPORT) {
      return Colors.red;
    }
    return Colors.grey;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          color: centerBackgroundColor,
          child: Stack(
            children: [
              if (feedbackList.isNotEmpty && !appStore.isLoading)
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16, 60, 16, 60),
                  child: Wrap(
                    runSpacing: 16,
                    spacing: 16,
                    children: feedbackList.map((feedBackItem) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        width: (context.width() * 0.33) - (70 - (6 * 3)),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                          boxShadow: [
                            commonCardBoxShadow(),
                          ],
                          backgroundColor: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      visualDensity: VisualDensity.compact,
                                      icon: Icon(Icons.mail_outline_rounded, size: 18).withTooltip(
                                        msg: feedBackItem.userEmail.validate(),
                                      ),
                                      onPressed: () {
                                        copyToClipboard(copyValue: feedBackItem.userEmail.validate(), message: "User Email copied to clipboard");
                                      },
                                    ),
                                    Text(feedBackItem.username.validate(), style: boldTextStyle(size: 14)).paddingTop(4),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${getDateFormatted(DateTime.parse(feedBackItem.createdAt.validate()))}",
                                          style: secondaryTextStyle(size: 11),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "${feedBackItem.type.validate()}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: boldTextStyle(size: 12, color: feedBackTypeColor(feedBackItem.type)),
                                        ),
                                      ],
                                    ).expand(),
                                    8.width,
                                    Container(
                                      decoration: boxDecorationDefault(
                                        color: feedBackItem.isCompleted == 0 ? Colors.green : Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                          padding: EdgeInsets.all(4),
                                          constraints: BoxConstraints(),
                                          iconSize: 18,
                                          icon: Icon(feedBackItem.isCompleted == 0 ? Icons.done : Icons.close, color: white),
                                          onPressed: () async {
                                            await showConfirmDialogCustom(context,
                                                dialogType: DialogType.CONFIRMATION,
                                                title: "Feedback",
                                                subTitle: "Do you want to change feedback status?",
                                                negativeText: language!.no,
                                                positiveText: language!.yes,
                                                primaryColor: btnBackgroundColor, onAccept: (c) async {
                                              if (feedBackItem.isCompleted == 0) {
                                                feedbackList.remove(feedBackItem);
                                                await feedbackStatusApi(feedBackItem.id.validate(), status: 1);
                                                setState(() {});
                                              } else {
                                                feedbackList.remove(feedBackItem);
                                                await feedbackStatusApi(feedBackItem.id.validate(), status: 0);
                                                setState(() {});
                                              }
                                            });
                                          }),
                                    ),
                                  ],
                                ).expand(),
                              ],
                            ),
                            16.height,
                            ReadMoreText(
                              "${feedBackItem.description.validate()}",
                              style: primaryTextStyle(size: 14),
                              trimLines: 1,
                              colorClickableText: btnBackgroundColor,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                            ),
                            24.height,
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              if (feedbackList.isEmpty && !appStore.isLoading) Text('No Data Found', style: boldTextStyle()).center().visible(!appStore.isLoading),
              if (feedbackList.isNotEmpty && !appStore.isLoading)
                Positioned(
                  top: 10,
                  right: 16,
                  left: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Feedback: $totalFeedback', style: primaryTextStyle()),
                      DropdownButton<int>(
                        items: feedbackStatus.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.title.toString(), style: primaryTextStyle()),
                            value: e.value,
                          );
                        }).toList(),
                        underline: Offstage(),
                        value: isCompleted,
                        onChanged: (val) {
                          isCompleted = val.validate();
                          feedBackListApi(page, status: isCompleted);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              Positioned(
                bottom: 16,
                left: 16,
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(right: 8),
                    itemCount: totalPage,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return paginationWidget(index, selectedIndex).paddingOnly(left: 8).onTap(() {
                        feedBackListApi(index + 1);
                        selectedIndex = index;
                        setState(() {});
                      });
                    }),
              ).visible(feedbackList.isNotEmpty),
              if (appStore.isLoading) loadingAnimation().center(),
            ],
          ),
        );
      },
    );
  }
}
