import 'dart:html';

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgets/handle_keyboard_event.dart';
import 'package:flutter_viz/widgets/right_click_menu_items.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgets/on_accept_widgets.dart';
import 'package:flutter_viz/widgetsClass/app_bar_class.dart';
import 'package:flutter_viz/widgetsClass/bottom_navigation_bar_class.dart';
import 'package:flutter_viz/widgetsClass/left_drawer_class.dart';
import 'package:flutter_viz/widgetsClass/root_view_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class DashboardPreviewComponent extends StatefulWidget {
  bool isViewKey = false;

  DashboardPreviewComponent({this.isViewKey = false});

  @override
  DashboardPreviewComponentState createState() => DashboardPreviewComponentState();
}

class DashboardPreviewComponentState extends State<DashboardPreviewComponent> {
  @override
  void initState() {
    super.initState();
    document.onContextMenu.listen((event) => event.preventDefault());
  }

  @override
  Widget build(BuildContext context) {
    /// Blank screen View
    Widget blankScreen() {
      return DragTarget<WidgetModel>(
        builder: (context, candidateItems, rejectedItems) {
          return Container(
            color: candidateItems.isNotEmpty
                ? appStore.isDarkMode
                    ? darkModePrimaryColorBackground.withValues(alpha: 0.8)
                    : Colors.grey
                : appStore.isDarkMode
                    ? darkModePrimaryColorBackground
                    : Colors.transparent,
            width: deviceWidth,
            height: deviceHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add, color: context.iconColor),
                Text(
                  language!.emptyScreen,
                  style: boldTextStyle(size: 15, color: appStore.isDarkMode ? darModePrimaryTextColor : Colors.black),
                ),
                Text(
                  language!.dragAndDropWidget,
                  style: secondaryTextStyle(size: 10),
                ),
              ],
            ).visible(appStore.selectedWidgetList.isEmpty && appStore.appBarClass == null && appStore.drawerClass == null && appStore.bottomNavigationBarClass == null),
          );
        },
        onAccept: (item) {
          WidgetModel currentModel = getWidgets(item.widgetSubType);
          blankScreenChildAccept(currentModel);
        },
      );
    }

    /// All the rendering goes here
    /// here you have to wait and think the most of the time
    /// think if you have the file how your going to sent data here
    /// here is the process goes and data render
    ///

    Widget scaffoldBody(context) {
      if (appStore.selectedWidgetList.length > 0) {
        WidgetModel rootModelView = appStore.selectedWidgetList[0];
        if (isRootTypeView(rootModelView)) {
          return DragTarget<WidgetModel>(
            builder: (context, candidateItems, rejectedItems) {
              return GestureDetector(
                child: Container(
                  color: candidateItems.isNotEmpty ? Colors.grey : Colors.transparent,
                  child: HoverWidget(
                    builder: (context, isHovering) {
                      return AnimatedContainer(
                        decoration: getBoxDecoration(rootModelView, isHovering),
                        duration: commonAnimationDuration,
                        child: subChildView(rootModelView),
                      );
                    },
                  ),
                ),
                onTap: () {
                  onViewTap(rootModelView);
                },
              );
            },
            onAccept: (item) {
              scaffoldFirstWidgetAcceptChild(item, rootModelView);
            },
          );
        } else {
          return DragTarget<WidgetModel>(
            builder: (context, candidateItems, rejectedItems) {
              return GestureDetector(
                onTap: () {
                  onViewTap(rootModelView);
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: candidateItems.isNotEmpty ? Colors.grey : Colors.transparent,
                  child: subChildView(rootModelView),
                ),
              );
            },
            onAccept: (item) {
              WidgetModel currentModel = getWidgets(item.widgetSubType);
              if (item.widgetType == WidgetTypeAppBarLayout || item.widgetType == WidgetTypeLeftDrawerLayout || item.widgetType == WidgetTypeBottomNavigationBarLayout) {
                acceptScaffoldOtherPart(item);
              } else {
                if (rootModelView.widgetType == WidgetTypeNormal) {
                  rootViewAcceptChild(currentModel);
                }
              }
            },
          );
        }
      } else {
        return blankScreen();
      }
    }

    /// Scaffold background color
    getBackgroundColor() {
      if (appStore.rootView != null && appStore.rootView!.widgetViewModel != null) {
        if ((appStore.rootView!.widgetViewModel as RootViewClass).bgColor != null)
          return (appStore.rootView!.widgetViewModel as RootViewClass).getColor();
        else {
          return Colors.white;
        }
      } else {
        return Colors.white;
      }
    }

    getScaffoldKey() {
      if (widget.isViewKey) {
        return null;
      }
      if (appStore.scaffold_key == null) {
        appStore.scaffold_key = GlobalKey();
      }
      return appStore.scaffold_key;
    }

    /// Return root class
    getRootClass() {
      return Listener(
        child: Scaffold(
          key: getScaffoldKey(),
          backgroundColor: getBackgroundColor(),

          /// we are going to sent the data into
          /// selectedWidgetList list of json object
          ///

          body: (appStore.selectedWidgetList.length > 0) ? scaffoldBody(context) : blankScreen(),
          appBar: (appStore.appBarClass != null) ? (appStore.appBarClass!.widgetViewModel as AppBarClass).getAppBarWidget() as PreferredSizeWidget? : null,
          bottomNavigationBar: (appStore.bottomNavigationBarClass != null) ? (appStore.bottomNavigationBarClass!.widgetViewModel as BottomNavigationBarClass).getBottomNavigationBarWidget() : null,
          drawer: (appStore.drawerClass != null) ? (appStore.drawerClass!.widgetViewModel as LeftDrawerClass).getLeftDrawerWidget() : null,
        ),
        onPointerDown: (event) {
          if (!widget.isViewKey) {
            onLayoutWidgetMenuItem(event, context);
          }
        },
      );
    }

    /// Check for safeArea class
    getScaffold() {
      appStore.widgetCodeData.clear();
      if (appStore.rootView != null) {
        if ((appStore.rootView!.widgetViewModel as RootViewClass).getSafeArea()) {
          return SafeArea(
            child: getRootClass(),
          );
        } else {
          return getRootClass();
        }
      } else {
        return getRootClass();
      }
    }

    return Observer(
      builder: (_) => KeyboardListener(
        focusNode: mainFocusNode,
        autofocus: true,
        onKeyEvent: (event) {
          handleKeyboardEvent(event, context);
        },
        child: getScaffold(),
      ),
    );
  }
}
