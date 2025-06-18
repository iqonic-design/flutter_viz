import 'package:flutter_viz/components/code_view.dart';
import 'package:flutter_viz/components/code_view_header_component.dart';
import 'package:flutter_viz/components/pubSpec_file_details.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'mobile_view_screen.dart';

class CodeViewScreen extends StatefulWidget {
  @override
  _CodeViewScreenState createState() => _CodeViewScreenState();
}

class _CodeViewScreenState extends State<CodeViewScreen> {
  @override
  void initState() {
    super.initState();
    trackScreenView(VIEW_CODE_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    /// Old Design
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : scaffoldSecondaryDark,
        body: Responsive(
          mobile: MobileViewScreen(),
          web: Container(
            width: context.width(),
            child: Column(
              children: [
                CodeViewHeaderComponent(true),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : headerLineColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CodeView(),
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    Container(
                      child: PubSpecFileDetails(),
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ],
                ).expand(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
