import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class FeedbackDialog extends StatefulWidget {
  static String tag = '/FeedbackDialog';

  @override
  FeedbackDialogState createState() => FeedbackDialogState();
}

class FeedbackDialogState extends State<FeedbackDialog> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController descriptionController = TextEditingController();

  FocusNode descriptionNode = FocusNode();

  int activeIndex = 0;
  String feedbackType = language!.getBugReport;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _tabController = TabController(length: 3, vsync: this);

    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          activeIndex = _tabController!.index;
          if (activeIndex == 0) {
            feedbackType = language!.getBugReport;
          } else if (activeIndex == 1) {
            feedbackType = language!.featureRequest;
          } else {
            feedbackType = language!.generalFeedBack;
          }
        });
      }
    });
  }

  Future<void> addFeedBackApi() async {
    if (descriptionController.text.trim().isEmpty) return getToast(errorThisFieldRequired);

    hideKeyboard(context);
    appStore.setLoading(true);
    Map req = {
      "type": feedbackType,
      "user_id": getIntAsync(USER_ID),
      "description": descriptionController.text,
    };

    await addFeedback(req).then((value) {
      appStore.setLoading(false);

      finish(context);
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 380,
        width: context.width() / 2.0,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(language!.pleaseProvideFeedback, style: boldTextStyle(size: 20)),
                    CloseButton(),
                  ],
                ),
                16.height,
                Text(language!.youHaveQuestionNeedHelp, style: secondaryTextStyle()),
                30.height,
                Text(language!.feedbackType, style: boldTextStyle(size: 14)),
                16.height,
                Container(
                  height: 45,
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                    backgroundColor: centerBackgroundColor,
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: boxDecorationWithRoundedCorners(
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                      backgroundColor: btnBackgroundColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: language!.getBugReport),
                      Tab(text: language!.featureRequest),
                      Tab(text: language!.generalFeedBack),
                    ],
                  ),
                ),
                16.height,
                TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(language!.whatWentWrong, style: boldTextStyle()),
                          16.height,
                          AppTextField(
                            controller: descriptionController,
                            textFieldType: TextFieldType.MULTILINE,
                            focus: descriptionNode,
                            maxLines: 5,
                            autoFocus: false,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.name,
                            decoration: commonInputDecoration(
                              hintName: language!.pleaseProvideFeedBack,
                            ),
                          ),
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              dialogGrayBorderButton(
                                text: language!.cancel,
                                onTap: () {
                                  finish(context);
                                },
                              ),
                              16.width,
                              dialogPrimaryColorButton(
                                text: language!.save,
                                onTap: () {
                                  addFeedBackApi();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(language!.whatWouldYouLikeToBuild, style: boldTextStyle()),
                          16.height,
                          AppTextField(
                            controller: descriptionController,
                            textFieldType: TextFieldType.MULTILINE,
                            focus: descriptionNode,
                            maxLines: 5,
                            autoFocus: false,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.name,
                            decoration: commonInputDecoration(
                              hintName: language!.pleaseProvideFeedBack,
                            ),
                          ),
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              dialogGrayBorderButton(
                                text: language!.cancel,
                                onTap: () {
                                  finish(context);
                                },
                              ),
                              16.width,
                              dialogPrimaryColorButton(
                                text: language!.save,
                                onTap: () {
                                  addFeedBackApi();
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(language!.whatsOnYourMind, style: boldTextStyle()),
                          16.height,
                          AppTextField(
                            controller: descriptionController,
                            textFieldType: TextFieldType.MULTILINE,
                            focus: descriptionNode,
                            maxLines: 5,
                            autoFocus: false,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.name,
                            decoration: commonInputDecoration(
                              hintName: language!.pleaseProvideFeedBack,
                            ),
                          ),
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              dialogGrayBorderButton(
                                text: language!.cancel,
                                onTap: () {
                                  finish(context);
                                },
                              ),
                              16.width,
                              dialogPrimaryColorButton(
                                text: language!.save,
                                onTap: () {
                                  addFeedBackApi();
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ).expand(),
              ],
            ),
            Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
          ],
        ),
      ),
    );
  }
}
