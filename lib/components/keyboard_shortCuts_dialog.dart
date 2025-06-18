import 'package:flutter_viz/model/models.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/utils/DataProvider.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class KeyboardShortCutsDialog extends StatefulWidget {
  static String tag = '/KeyboardShortCutsDialog';

  @override
  KeyboardShortCutsDialogState createState() => KeyboardShortCutsDialogState();
}

class KeyboardShortCutsDialogState extends State<KeyboardShortCutsDialog> {
  List<KeyBoardShortcutsModel> keyboardShortCutsList = getKeyBoardShortCuts();

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(language!.keyboardShortcuts, style: boldTextStyle(color: appStore.isDarkMode ? darModePrimaryTextColor : btnBackgroundColor)),
                IconButton(
                  icon: Icon(Icons.close, color: appStore.isDarkMode ? darModePrimaryTextColor : btnBackgroundColor),
                  onPressed: () {
                    finish(context);
                  },
                ),
              ],
            ),
            30.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: keyboardShortCutsList.map((KeyBoardShortcutsModel mData) {
                return tooltipView(
                  message: "${mData.description}",
                  child: Column(
                    children: [
                      12.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${mData.title}', style: primaryTextStyle(size: 14)),
                          Container(
                            child: Text(
                              '${mData.action}',
                              style: secondaryTextStyle(color: appStore.isDarkMode ? black : btnBackgroundColor, size: 14),
                            ),
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: appStore.isDarkMode ? white : btnBackgroundColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                        ],
                      ),
                      12.height,
                      Container(
                        width: context.width(),
                        height: 0.2,
                        color: appStore.isDarkMode ? Colors.grey : btnBackgroundColor,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
