import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/menu_widgets_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminMenuComponent extends StatefulWidget {
  final bool isExpanded;

  AdminMenuComponent({this.isExpanded = false});

  static String tag = '/AdminMenuComponent';

  @override
  AdminMenuComponentState createState() => AdminMenuComponentState();
}

class AdminMenuComponentState extends State<AdminMenuComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    appStore.adminMenuList.clear();
    appStore.adminMenuList.add(MenuWidgetsModel(
      menuName: "DashBoard",
      index: ADMIN_DASHBOARD_INDEX,
      isOnHover: false,
      svgFileName: "dashboard.svg",
    ));
    appStore.adminMenuList.add(MenuWidgetsModel(
      menuName: "Users",
      index: ADMIN_USERS_INDEX,
      isOnHover: false,
      svgFileName: "profile.svg",
    ));
    appStore.adminMenuList.add(MenuWidgetsModel(
      menuName: "Categories",
      index: ADMIN_CATEGORIES_INDEX,
      isOnHover: false,
      svgFileName: "account_tree.svg",
    ));
    appStore.adminMenuList.add(MenuWidgetsModel(
      menuName: "Templates",
      index: ADMIN_TEMPLATES_INDEX,
      isOnHover: false,
      svgFileName: "templates.svg",
    ));
    appStore.adminMenuList.add(MenuWidgetsModel(
      menuName: "Projects",
      index: ADMIN_PROJECT_INDEX,
      isOnHover: false,
      svgFileName: "project.svg",
    ));
    appStore.adminMenuList.add(MenuWidgetsModel(
      menuName: "FeedBack",
      index: ADMIN_FEEDBACK_INDEX,
      isOnHover: false,
      svgFileName: "feedback.svg",
    ));
    appStore.adminMenuList.add(MenuWidgetsModel(
      menuName: "Tutorials",
      index: ADMIN_TUTORIALS_INDEX,
      isOnHover: false,
      svgFileName: "video_collection.svg",
    ));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorPrimary,
            boxShadow: [
              BoxShadow(offset: Offset(3, 3), color: menuShadowColor, blurRadius: 4.0),
            ],
            border: Border(
              left: BorderSide(color: menuShadowColor, width: 2),
              right: BorderSide(color: menuShadowColor, width: 2),
              bottom: BorderSide(color: menuShadowColor, width: 2),
              top: BorderSide.none,
            ),
          ),
          child: ListView.builder(
            itemCount: appStore.adminMenuList.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                child: HoverWidget(
                  builder: (context, isHovering) {
                    return AnimatedContainer(
                      duration: commonAnimationDuration,
                      child: tooltipView(
                        message: appStore.adminMenuList[position].menuName!,
                        child: Container(
                          alignment: widget.isExpanded ? Alignment.centerLeft : Alignment.center,
                          height: 45,
                          width: widget.isExpanded ? null : 45,
                          padding: EdgeInsets.all(10),
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                            backgroundColor: isHovering
                                ? menuMouseHoverColor
                                : (appStore.selectedMenu == appStore.adminMenuList[position].index)
                                    ? btnBackgroundColor
                                    : Colors.transparent,
                            border: Border.all(color: isHovering ? menuMouseHoverColor : Colors.transparent, width: 1),
                          ),
                          child: widget.isExpanded
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        "images/svgicons/${appStore.adminMenuList[position].svgFileName}",
                                        semanticsLabel: "${appStore.adminMenuList[position].menuName}",
                                        color: isHovering
                                            ? btnBackgroundColor
                                            : (appStore.selectedMenu == appStore.adminMenuList[position].index)
                                                ? Colors.white
                                                : menuIconColor,
                                        height: btnIconSize,
                                        width: btnIconSize,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        appStore.adminMenuList[position].menuName!,
                                        style: primaryTextStyle(
                                            color: isHovering
                                                ? btnBackgroundColor
                                                : (appStore.selectedMenu == appStore.adminMenuList[position].index)
                                                    ? Colors.white
                                                    : menuTextColor),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                )
                              : SvgPicture.asset(
                                  "$WidgetIconPath${appStore.adminMenuList[position].svgFileName}",
                                  semanticsLabel: "${appStore.adminMenuList[position].menuName}",
                                  color: isHovering
                                      ? btnBackgroundColor
                                      : (appStore.selectedMenu == appStore.adminMenuList[position].index)
                                          ? Colors.white
                                          : menuIconColor,
                                  height: btnIconSize,
                                  width: btnIconSize,
                                ),
                        ),
                      ),
                    );
                  },
                ),
                onTap: () {
                  setState(() {
                    appStore.selectedMenu = appStore.adminMenuList[position].index;
                  });
                },
              );
            },
          ),
        );
      },
    );
  }
}
