import 'package:flutter_viz/adminDashboard/model/tutorials_model.dart';
import 'package:flutter_viz/externalClasses/flutterViz_youtube_player.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class TutorialsComponent extends StatefulWidget {
  static String tag = '/TutorialsComponent';

  @override
  TutorialsComponentState createState() => TutorialsComponentState();
}

class TutorialsComponentState extends State<TutorialsComponent> {
  ScrollController controller = ScrollController();
  List<TutorialsData> tutorialsList = [];

  int page = 1;
  int? totalPage = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    trackScreenView(TUTORIAL_SCREEN);
    init();
  }

  Future<void> init() async {
    tutorialsListApi(page);
  }

  ///Tutorials List api call
  Future<void> tutorialsListApi(int page) async {
    appStore.setLoading(true);

    await getTutorialsList(page).then((value) async {
      appStore.setLoading(false);
      tutorialsList.clear();
      tutorialsList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;

      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
      child: Stack(
        children: [
          if (tutorialsList.isNotEmpty)
            SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Image.asset(
                            'images/flutterviz_bg.jpg',
                            height: 140,
                            width: context.width(),
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRectOnly(bottomLeft: COMMON_CARD_BORDER_RADIUS.toInt(), bottomRight: COMMON_CARD_BORDER_RADIUS.toInt()),
                          Text(language!.tutorials, style: primaryTextStyle(color: Colors.white, size: 34)).paddingAll(32),
                        ],
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -36, 0),
                        width: context.width(),
                        decoration: boxDecorationWithRoundedCorners(
                          backgroundColor: appStore.isDarkMode ? darkModePrimaryColorBackground : Colors.white,
                          borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                          boxShadow: [
                            appStore.isDarkMode ? commonCardBoxShadowDarkMode() : commonCardBoxShadow(),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        padding: EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                runSpacing: 24,
                                spacing: 24,
                                children: tutorialsList.map((tutorialsItem) {
                                  return Container(
                                    width: context.width() * 0.20,
                                    decoration: boxDecorationWithRoundedCorners(
                                      borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                      backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        commonCachedNetworkImage(
                                          tutorialsItem.thumbnail.validate(),
                                          fit: BoxFit.cover,
                                        ).cornerRadiusWithClipRRectOnly(topLeft: COMMON_CARD_BORDER_RADIUS.toInt(), topRight: COMMON_CARD_BORDER_RADIUS.toInt()),
                                        8.height,
                                        Text(
                                          tutorialsItem.title.validate(),
                                          style: boldTextStyle(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ).paddingOnly(left: 16, right: 16),
                                        4.height,
                                        Text(
                                          tutorialsItem.description.validate(),
                                          style: primaryTextStyle(size: 12, weight: FontWeight.normal),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ).paddingOnly(left: 16, right: 16),
                                        8.height,
                                        Text(
                                          "${getDateFormatted(DateTime.parse(tutorialsItem.createdAt.validate()))}",
                                          style: secondaryTextStyle(size: 12),
                                        ).paddingOnly(left: 16, right: 16),
                                        16.height,
                                      ],
                                    ),
                                  ).onTap(() {
                                    showInDialog(context, builder: (_) {
                                      return FlutterVizYoutubePlayer(
                                        url: (tutorialsItem.url != null) ? getYoutubeVideoId(tutorialsItem.url!) : DEFAULT_YOUTUBE_ID,
                                        autoPlay: false,
                                        looping: false,
                                        mute: false,
                                        showControls: true,
                                        showFullScreen: true,
                                        height: context.height() * 0.8,
                                        width: context.width() * 0.6,
                                      ).cornerRadiusWithClipRRectOnly(topLeft: COMMON_CARD_BORDER_RADIUS.toInt(), topRight: COMMON_CARD_BORDER_RADIUS.toInt());
                                    }, contentPadding: EdgeInsets.all(0));
                                  });
                                }).toList(),
                              ),
                              16.height,
                              SizedBox(
                                height: 30,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.only(right: 32),
                                    itemCount: totalPage,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context, int index) {
                                      return paginationWidget(index, selectedIndex).paddingOnly(left: 32).onTap(() {
                                        selectedIndex = index;
                                        setState(() {});
                                        tutorialsListApi(index + 1);
                                      });
                                    }),
                              ).visible(tutorialsList.isNotEmpty)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Text(language!.noDataFound, style: boldTextStyle()).visible(!appStore.isLoading).center(),
          loadingAnimation().visible(appStore.isLoading).center(),
        ],
      ),
    );
  }
}
