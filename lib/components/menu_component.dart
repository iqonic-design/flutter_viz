import 'package:flutter_viz/model/menu_widgets_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/handle_keyboard_event.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class MenuComponent extends StatefulWidget {
  final bool isExpanded;

  MenuComponent({this.isExpanded = false});

  @override
  _MenuComponentState createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    appStore.menuList.clear();

    if (appStore.screenTemplateData == null) {
      appStore.menuList.add(MenuWidgetsModel(
        menuName: language!.screenList,
        svgFileName: "project_list.svg",
        index: SCREEN_LIST_INDEX,
        isOnHover: false,
      ));
    }
    appStore.menuList.add(MenuWidgetsModel(
      menuName: language!.widgets,
      svgFileName: "widgets.svg",
      index: WIDGETS_INDEX,
      isOnHover: false,
    ));
    appStore.menuList.add(MenuWidgetsModel(
      menuName: language!.treeView,
      svgFileName: "account_tree.svg",
      index: TREE_INDEX,
      isOnHover: false,
    ));
    if (appStore.screenTemplateData == null) {
      appStore.menuList.add(MenuWidgetsModel(
        menuName: language!.profile,
        svgFileName: "profile.svg",
        index: PROFILE_INDEX,
        isOnHover: false,
      ));
      appStore.menuList.add(MenuWidgetsModel(
        menuName: language!.tutorials,
        svgFileName: "video_collection.svg",
        index: TUTORIALS_INDEX,
        isOnHover: false,
      ));
      appStore.menuList.add(MenuWidgetsModel(
        menuName: language!.widgetsInfo,
        svgFileName: "widgets_info.svg",
        index: WIDGETS_INFO_INDEX,
        isOnHover: false,
      ));
      appStore.menuList.add(MenuWidgetsModel(
        menuName: language!.faq,
        svgFileName: "faqs.svg",
        index: FAQS_INDEX,
        isOnHover: false,
      ));
      appStore.menuList.add(MenuWidgetsModel(
        menuName: "Project Media",
        svgFileName: "Image.svg",
        index: MEDIA_INDEX,
        isOnHover: false,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: KeyboardListener(
        focusNode: focusNode,
        autofocus: true,
        onKeyEvent: (event) {
          handleKeyboardEvent(event, context);
        },
        child: Observer(
          builder: (_) => Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  color: appStore.isDarkMode ? Colors.transparent : menuShadowColor,
                  blurRadius: 4.0,
                ),
              ],
              border: Border(
                left: BorderSide(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : menuShadowColor, width: 2),
                right: BorderSide(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : menuShadowColor, width: 2),
                bottom: BorderSide(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : menuShadowColor, width: 2),
                top: BorderSide.none,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: appStore.menuList.map((item) {
                  int position = appStore.menuList.indexOf(item);
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: HoverWidget(
                        builder: (context, isHovering) {
                          return AnimatedContainer(
                            duration: commonAnimationDuration,
                            child: tooltipView(
                              message: appStore.menuList[position].menuName!,
                              child: Container(
                                alignment: widget.isExpanded ? Alignment.centerLeft : Alignment.center,
                                height: 45,
                                width: widget.isExpanded ? null : 45,
                                padding: EdgeInsets.all(10),
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                                  backgroundColor: isHovering
                                      ? (appStore.isDarkMode ? darkModeHighLightColor : menuMouseHoverColor)
                                      : (appStore.selectedMenu == appStore.menuList[position].index)
                                          ? btnBackgroundColor
                                          : Colors.transparent,
                                  border: Border.all(
                                    color: (isHovering && !appStore.isDarkMode) ? menuMouseHoverColor : Colors.transparent,
                                    width: 1,
                                  ),
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
                                              "$WidgetIconPath${appStore.menuList[position].svgFileName}",
                                              semanticsLabel: "${appStore.menuList[position].menuName}",
                                              height: btnIconSize,
                                              width: btnIconSize,
                                              color: isHovering
                                                  ? btnBackgroundColor
                                                  : (appStore.selectedMenu == appStore.menuList[position].index)
                                                      ? Colors.white
                                                      : appStore.isDarkMode
                                                          ? context.iconColor
                                                          : menuIconColor,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "${appStore.menuList[position].menuName}",
                                              style: primaryTextStyle(
                                                color: isHovering
                                                    ? btnBackgroundColor
                                                    : (appStore.selectedMenu == appStore.menuList[position].index)
                                                        ? Colors.white
                                                        : appStore.isDarkMode
                                                            ? context.iconColor
                                                            : menuTextColor,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SvgPicture.asset(
                                        "$WidgetIconPath${appStore.menuList[position].svgFileName}",
                                        semanticsLabel: "${appStore.menuList[position].menuName}",
                                        color: isHovering
                                            ? btnBackgroundColor
                                            : (appStore.selectedMenu == appStore.menuList[position].index)
                                                ? Colors.white
                                                : appStore.isDarkMode
                                                    ? context.iconColor
                                                    : menuIconColor,
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                      onTap: () async {
                        setState(() {
                          appStore.selectedMenu = appStore.menuList[position].index;
                          if (appStore.selectedMenu == WIDGETS_INDEX) {
                            if (appStore.isLanguageChanged) {
                              showInDialog(
                                context,
                                contentPadding: EdgeInsets.all(20),
                                barrierDismissible: true,
                                builder: (context) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(language!.reloadPageMsgForLanguage, style: primaryTextStyle()),
                                      16.height,
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          child: Text(language!.ok, style: boldTextStyle()),
                                          onPressed: () {
                                            finish(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            appStore.setIsLanguageChanged(false);
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
