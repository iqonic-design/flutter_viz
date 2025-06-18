import 'package:flutter_viz/adminDashboard/components/admin_header_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_menu_component.dart';
import 'package:flutter_viz/screen/mobile_view_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'admin_child_view_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  AdminDashboardScreenState createState() => AdminDashboardScreenState();
}

class AdminDashboardScreenState extends State<AdminDashboardScreen> with TickerProviderStateMixin {
  bool isExpanded = false;

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
      body: Responsive(
        mobile: MobileViewScreen(),
        web: Container(
          width: context.width(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  AdminHeaderComponent(onUpdate: () {
                    setState(() {});
                  }),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: menuShadowColor,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: isExpanded ? Curves.easeIn : Curves.easeOut,
                              child: AdminMenuComponent(isExpanded: isExpanded),
                              width: getAdminMenuWidth(context, isExpanded: isExpanded),
                            ),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: Container(
                                padding: EdgeInsets.all(isExpanded ? 8 : 4),
                                decoration: BoxDecoration(color: btnBackgroundColor, shape: BoxShape.circle),
                                child: Icon(isExpanded ? Icons.navigate_before_outlined : Icons.navigate_next_outlined, color: Colors.white).onTap(() {
                                  isExpanded = !isExpanded;
                                  setState(() {});
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: isExpanded ? Curves.easeIn : Curves.easeOut,
                          child: AdminChildViewScreen(),
                          width: getAdminChildViewWidth(context, isExpanded: isExpanded),
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
