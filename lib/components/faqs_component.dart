import 'package:flutter_viz/model/faq_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/utils/DataProvider.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class FaqsComponent extends StatefulWidget {
  static String tag = '/FaqsComponent';

  @override
  FaqsComponentState createState() => FaqsComponentState();
}

class FaqsComponentState extends State<FaqsComponent> {
  List<FAQModel> faqList = getFAQInfoList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
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
                Text(
                  language!.frequentlyAskedQuestions,
                  style: primaryTextStyle(color: Colors.white, size: 24),
                ).paddingAll(32),
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
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(faqList.length, (index) {
                    FAQModel mData = faqList[index];
                    return Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent, dividerTheme: DividerThemeData(space: 0)),
                      child: ExpansionTile(
                        leading: Icon(Icons.fiber_manual_record, size: 10),
                        tilePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        collapsedIconColor: appStore.isDarkMode ? Colors.white : Colors.black,
                        expandedAlignment: Alignment.topLeft,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: EdgeInsets.only(left: 40, right: 16, bottom: 16),
                        title: Transform.translate(
                          offset: Offset(-30, -2),
                          child: Text('${mData.title.validate()}', style: primaryTextStyle()).paddingLeft(16),
                        ),
                        children: [
                          Text(mData.description.validate(), style: secondaryTextStyle()),
                          mData.image != null ? SizedBox(height: 16) : SizedBox(),
                          mData.image != null ? Image.asset(mData.image!, width: context.width(), height: 120, fit: BoxFit.fill) : SizedBox(),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
