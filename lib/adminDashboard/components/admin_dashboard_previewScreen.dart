import 'package:flutter_viz/components/header_component.dart';
import 'package:flutter_viz/components/menu_component.dart';
import 'package:flutter_viz/components/centerView/center_child_view_screen.dart';
import 'package:flutter_viz/screen/mobile_view_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminDashboardPreviewScreen extends StatefulWidget {
  static String tag = '/AdminDashboardPreviewScreen';

  @override
  AdminDashboardPreviewScreenState createState() => AdminDashboardPreviewScreenState();
}

class AdminDashboardPreviewScreenState extends State<AdminDashboardPreviewScreen> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldSecondaryDark,
      body: Responsive(
        mobile: MobileViewScreen(),
        web: Container(
          width: context.width(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  HeaderComponent(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: headerLineColor,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: isExpanded ? Curves.easeIn : Curves.easeOut,
                          child: Stack(
                            children: [
                              MenuComponent(isExpanded: isExpanded),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: EdgeInsets.all(isExpanded ? 8 : 4),
                                  decoration: BoxDecoration(color: btnBackgroundColor, shape: BoxShape.circle),
                                  child: Icon(
                                    isExpanded ? Icons.navigate_before_outlined : Icons.navigate_next_outlined,
                                    color: Colors.white,
                                  ).onTap(() {
                                    isExpanded = !isExpanded;
                                    setState(() {});
                                  }),
                                ),
                              ),
                            ],
                          ),
                          width: getMenuWidth(context, isExpanded: isExpanded),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: isExpanded ? Curves.easeIn : Curves.easeOut,
                          child: CenterChildViewScreen(isExpanded: isExpanded),
                          width: getChildWidgetsWidth(context, isExpanded: isExpanded),
                        ),
                      ),
                    ],
                  ).expand(),
                ],
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
