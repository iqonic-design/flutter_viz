import 'package:flutter_viz/model/models.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/utils/DataProvider.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class WidgetsInformationComponent extends StatefulWidget {
  static String tag = '/WidgetsInformationComponent';

  @override
  WidgetsInformationComponentState createState() => WidgetsInformationComponentState();
}

class WidgetsInformationComponentState extends State<WidgetsInformationComponent> {
  List<WidgetsInformationModel> widgetInfoList = getWidgetInfo();
  List<WidgetsInformationModel> filterList = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    widgetInfoList.sort((a, b) => a.title!.compareTo(b.title!));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
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
                Text(language!.widgetsInfo, style: primaryTextStyle(color: Colors.white, size: 34)).paddingAll(32),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: alphabetList.map((item) {
                      int index = alphabetList.indexOf(item);
                      return Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(item,
                            style: primaryTextStyle(
                              size: 18,
                              color: appStore.isDarkMode
                                  ? index == selectedIndex
                                      ? darkModeHighLightColor
                                      : darModePrimaryTextColor
                                  : index == selectedIndex
                                      ? btnBackgroundColor
                                      : textColorPrimary,
                              weight: index == selectedIndex ? FontWeight.bold : FontWeight.normal,
                            )).onTap(() {
                          selectedIndex = index;
                          if (index > 0) {
                            filterList.clear();
                            widgetInfoList.forEach((element) {
                              if (element.title!.toUpperCase().startsWith(alphabetList[selectedIndex])) {
                                filterList.add(element);
                              }
                            });
                          }
                          setState(() {});
                        }),
                      );
                    }).toList(),
                  ),
                  30.height,
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: (selectedIndex == 0 ? widgetInfoList : filterList).map((item) {
                      return Container(
                        width: context.width() * 0.20,
                        height: 320,
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                          backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.image!,
                              height: 140,
                              width: 140,
                              fit: BoxFit.contain,
                            ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS).center(),
                            16.height,
                            Text(item.title!, style: boldTextStyle(size: 18)),
                            8.height,
                            Text(
                              item.description!,
                              style: secondaryTextStyle(color: widgetDesColor),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ).onTap(() {
                        launchUrl(Uri.parse(item.url!));
                      });
                    }).toList(),
                  ),
                  Text(
                    'No Data Found',
                    style: boldTextStyle(),
                  ).visible((selectedIndex == 0 ? widgetInfoList : filterList).isEmpty).center(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
