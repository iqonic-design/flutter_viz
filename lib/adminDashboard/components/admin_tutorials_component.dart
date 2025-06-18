import 'package:flutter_viz/adminDashboard/model/tutorials_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import '../../widgetsProperty/comman_property_view.dart';
import 'admin_tutorials_dialog.dart';

class AdminTutorialsComponent extends StatefulWidget {
  static String tag = '/AdminTutorialsComponent';

  @override
  AdminTutorialsComponentState createState() => AdminTutorialsComponentState();
}

class AdminTutorialsComponentState extends State<AdminTutorialsComponent> {
  List<TutorialsData> tutorialsList = [];
  int currentPage = 1;
  int? totalPage = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tutorialsListApi(currentPage);
  }

  ///Tutorials List api call
  Future<void> tutorialsListApi(int page) async {
    appStore.setLoading(true);

    await getTutorialsList(page).then((value) async {
      appStore.setLoading(false);
      tutorialsList.clear();
      tutorialsList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;
      currentPage = value.pagination!.currentPage!;
      if (tutorialsList.isEmpty && currentPage != 1) {
        selectedIndex = 0;
        tutorialsListApi(currentPage - 1);
      }
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///Delete tutorial api
  Future<void> deleteTutorialApi(int id) async {
    appStore.setLoading(true);

    Map req = {
      "id": id.toString(),
    };

    await deleteTutorial(req).then((value) async {
      appStore.setLoading(false);
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
  Widget build(BuildContext context) {
    return Container(
      color: centerBackgroundColor,
      child: Stack(
        children: [
          tutorialsList.isNotEmpty
              ? SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Wrap(
                      runSpacing: 16,
                      spacing: 16,
                      children: tutorialsList.map((tutorialsItem) {
                        return Container(
                          width: context.width() * 0.20,
                          decoration: boxDecorationWithRoundedCorners(
                            boxShadow: [
                              commonCardBoxShadow(),
                            ],
                            backgroundColor: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonCachedNetworkImage(
                                tutorialsItem.thumbnail.validate(),
                                fit: BoxFit.cover,
                              ).cornerRadiusWithClipRRectOnly(
                                topLeft: COMMON_CARD_BORDER_RADIUS.toInt(),
                                topRight: COMMON_CARD_BORDER_RADIUS.toInt(),
                              ),
                              8.height,
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      tutorialsItem.title.validate(),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ).expand(),
                                    8.width,
                                    deleteIcon(context).onTap(() async {
                                      deleteConfirmationDialog(
                                        context: context,
                                        messageText: "Are you sure you want to delete tutorial?",
                                        onAccept: () async {
                                          finish(context);
                                          await deleteTutorialApi(tutorialsItem.id.validate());
                                          tutorialsList.remove(tutorialsItem);
                                          tutorialsListApi(currentPage);
                                          setState(() {});
                                        },
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              4.height,
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  tutorialsItem.description.validate(),
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              8.height,
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                child: Text(
                                  "${getDateFormatted(DateTime.parse(tutorialsItem.createdAt.validate()))}",
                                  style: secondaryTextStyle(size: 12),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              : Text('No Data Found', style: boldTextStyle()).visible(!appStore.isLoading).center(),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(right: 8),
                      itemCount: totalPage,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return paginationWidget(index, selectedIndex).onTap(() {
                          selectedIndex = index;
                          setState(() {});
                          tutorialsListApi(index + 1);
                        });
                      }),
                ).visible(tutorialsList.isNotEmpty),
                addButtonRounded().onTap(
                  () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: AdminTutorialsDialog(onUpdate: () {
                          tutorialsListApi(currentPage);
                        }),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Observer(builder: (_) => loadingAnimation().visible(appStore.isLoading).center()),
        ],
      ),
    );
  }
}
