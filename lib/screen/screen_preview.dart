import 'package:flutter_viz/components/code_view_header_component.dart';
import 'package:flutter_viz/components/centerView/dashboard-preview_component.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'mobile_view_screen.dart';

class ScreenPreview extends StatefulWidget {
  @override
  _ScreenPreviewState createState() => _ScreenPreviewState();
}

class _ScreenPreviewState extends State<ScreenPreview> {
  double _minScale = 0.1;
  double _maxScale = 3.0;

  @override
  void initState() {
    super.initState();
    trackScreenView(PREVIEW_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
        body: Responsive(
          mobile: MobileViewScreen(),
          web: Container(
            width: context.width(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CodeViewHeaderComponent(false),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : headerLineColor,
                  ),
                  InteractiveViewer(
                    minScale: _minScale,
                    maxScale: _maxScale,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                      color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                      child: Center(
                        child: Container(
                          width: deviceWidth,
                          height: deviceHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: COMMON_BORDER_COLOR, width: 1),
                            borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
                          ),
                          child: DashboardPreviewComponent(isViewKey: true).cornerRadiusWithClipRRect(0),
                        ).cornerRadiusWithClipRRect(5),
                      ),
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
