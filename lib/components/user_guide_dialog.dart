import 'dart:ui';

import 'package:flutter_viz/model/walk_through_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class UserGuideDialog extends StatefulWidget {
  static String tag = '/UserGuideDialog';

  @override
  UserGuideDialogState createState() => UserGuideDialogState();
}

class UserGuideDialogState extends State<UserGuideDialog> {
  PageController pageController = PageController();

  List<WalkThroughModel> list = [];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    list.add(
      WalkThroughModel(
        title: language!.addWidgets,
        subTitle: language!.dragAndDropWidget,
        image: 'images/gif_intro1.gif',
      ),
    );
    list.add(
      WalkThroughModel(
        title: language!.setProperties,
        subTitle: language!.clickOnWidgetFromCanvas,
        image: 'images/gif_intro2.gif',
      ),
    );
    list.add(
      WalkThroughModel(
        title: language!.viewSourceCode,
        subTitle: language!.clickOnViewCodeButton,
        image: 'images/gif_intro3.gif',
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() * 0.55,
      height: context.height() * 0.65,
      child: Stack(
        children: [
          Column(
            children: [
              Text('Get Started in 3 different Steps : ${currentPage + 1} / 3', style: boldTextStyle(size: 20)),
              16.height,
              Divider(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, thickness: 2),
              16.height,
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.navigate_before, color: iconColor),
                    onPressed: () {
                      pageController.animateToPage(currentPage - 1, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    },
                  ).visible(currentPage != 0),
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                      },
                    ),
                    child: PageView(
                      controller: pageController,
                      children: list.map((e) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title!, style: boldTextStyle(size: 20)),
                            16.height,
                            Text(e.subTitle!, style: secondaryTextStyle(), textAlign: TextAlign.center),
                            30.height,
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(e.image!, height: context.height(), width: context.width(), fit: BoxFit.contain),
                            ).expand(),
                          ],
                        ).paddingRight(30);
                      }).toList(),
                      onPageChanged: (i) {
                        currentPage = i;
                        setState(() {});
                      },
                    ).paddingSymmetric(horizontal: 30).expand(),
                  ),
                  IconButton(
                    splashRadius: 20.0,
                    icon: Icon(Icons.navigate_next, color: iconColor),
                    onPressed: () {
                      pageController.animateToPage(currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    },
                  ).visible(currentPage != 2)
                ],
              ).expand(),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      language!.skip,
                      style: boldTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor),
                    ),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                  DotIndicator(
                    pageController: pageController,
                    pages: list,
                    indicatorColor: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor,
                    unselectedIndicatorColor: Colors.grey,
                  ),
                  TextButton(
                    child: Text(
                      currentPage != 2 ? language!.next : language!.finish,
                      style: boldTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor),
                    ),
                    onPressed: () {
                      if (currentPage == 2) {
                        finish(context);
                      } else {
                        pageController.animateToPage(currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.linear);
                      }
                    },
                  )
                ],
              ).paddingSymmetric(horizontal: 30)
            ],
          ),
          Positioned(
            right: 30,
            top: 0,
            child: IconButton(
              splashRadius: 20.0,
              icon: Icon(Icons.close_outlined),
              onPressed: () {
                finish(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
