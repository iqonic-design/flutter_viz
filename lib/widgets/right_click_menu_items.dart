import 'package:flutter_viz/components/add_widget_dialog.dart';
import 'package:flutter_viz/components/wrap_widget_dialog.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/AppConstant.dart';

getTextStyle() {
  return primaryTextStyle();
}

/// Perform Wrap widget functionality with current selected widgets
performWrapWidgetAction(context) async {
  if (appStore.currentSelectedWidget!.widgetSubType != WidgetTypeRootView) {
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("${language!.currentSelectedWidget} [${appStore.currentSelectedWidget!.widgetSubType}] ${language!.wrapWithWidget}"),
            titleTextStyle: primaryTextStyle(size: 20),
            content: WrapWidgetDialog(),
            backgroundColor: appStore.isDarkMode ? darkModePrimaryColorBackground : Colors.white,
          );
        });
  }
}

performAddWidgetAction(context) {
  showInDialog(
    context,
    title: Text("${language!.selectWidgetToAdd} [${appStore.currentSelectedWidget!.widgetSubType}]"),
    builder: (context) {
      return AddWidgetDialog(
        isWidgetAddOnly: true,
      );
    },
    titleTextStyle: primaryTextStyle(size: 20),
    backgroundColor: appStore.isDarkMode ? darkModePrimaryColorBackground : Colors.white,
  );
}

performRemoveAction(BuildContext context) {
  deleteConfirmationDialog(
    context: context,
    messageText: language!.areYouSureWantToDeleteWidget,
    onAccept: () {
      appStore.removeSelectedWidget();
    },
  );
}

performDuplicateWidgetAction() {
  appStore.copyWidget();
}

performMoveUpWidgetAction() {
  appStore.moveWidget(isMoveUpOperation: true);
}

performMoveDownWidgetAction() {
  appStore.moveWidget(isMoveUpOperation: false);
}

performMoveLeftWidgetAction() {
  appStore.moveWidget(isMoveUpOperation: true);
}

performMoveRightWidgetAction() {
  appStore.moveWidget(isMoveUpOperation: false);
}

performParentSelectionWidgetAction(String id) {
  appStore.findParentViewFromRoot(widgetId: id.replaceAll(PARENT_INDEX, ""), isPopupClick: true);
}

titleMenuItem() {
  return PopupMenuItem(
    child: Text("${appStore.currentSelectedWidget!.widgetSubType} ${language!.widget}", style: secondaryTextStyle()),
    value: WRONG_INDEX,
    enabled: false,
  );
}

lineMenuItem() {
  return PopupMenuDivider(
    height: 2,
  );
}

copyWidgetMenuItem() {
  return PopupMenuItem(
    child: Text(language!.duplicateWidget),
    textStyle: getTextStyle(),
    value: DUPLICATE_WIDGET_INDEX,
  );
}

moveLeftWidgetMenuItem() {
  return PopupMenuItem(
    child: Text(language!.moveLeftKey),
    textStyle: getTextStyle(),
    value: MOVE_LEFT_WIDGET_INDEX,
  );
}

moveRightWidgetMenuItem() {
  return PopupMenuItem(
    child: Text(language!.moveRightKey),
    textStyle: getTextStyle(),
    value: MOVE_RIGHT_WIDGET_INDEX,
  );
}

moveDownWidgetMenuItem() {
  return PopupMenuItem(
    child: Text(language!.moveDownKey),
    textStyle: getTextStyle(),
    value: MOVE_DOWN_WIDGET_INDEX,
  );
}

moveUpWidgetMenuItem() {
  return PopupMenuItem(
    child: Text(language!.moveUpKey),
    textStyle: getTextStyle(),
    value: MOVE_UP_WIDGET_INDEX,
  );
}

moveDownAndRightMenuItem() {
  return PopupMenuItem(
    child: Text(language!.moveDownAndRight),
    textStyle: getTextStyle(),
    value: MOVE_DOWN_WIDGET_INDEX,
  );
}

moveUpAndLeftWidgetMenuItem() {
  return PopupMenuItem(
    child: Text(language!.moveUpAndLeft),
    textStyle: getTextStyle(),
    value: MOVE_UP_WIDGET_INDEX,
  );
}

wrapMenuItem() {
  return PopupMenuItem(
    child: Text(language!.wrapWidgetCtrlB),
    textStyle: getTextStyle(),
    value: WRAP_WIDGET_INDEX,
  );
}

addChildMenuItem() {
  return PopupMenuItem(
    child: Text(language!.addChildWidgetCtrlA),
    textStyle: getTextStyle(),
    value: ADD_WIDGET_CHILD_INDEX,
  );
}

deleteWidgetMenuItem() {
  return PopupMenuItem(
    child: Text(language!.deleteWidgetDeleteKey),
    textStyle: getTextStyle(),
    value: DELETE_WIDGET_INDEX,
  );
}

generateLayoutMenuItem() {
  List<PopupMenuEntry<String>> items = <PopupMenuEntry<String>>[];

  if (appStore.currentSelectedWidget!.widgetType == WidgetTypeAppBarLayout) {
    /// App bar view
    items.add(titleMenuItem());
    items.add(lineMenuItem());
    items.add(deleteWidgetMenuItem());
    return items;
  }

  if (appStore.currentSelectedWidget!.widgetType == WidgetTypeBottomNavigationBarLayout) {
    /// BottomNavigationBar view
    items.add(titleMenuItem());
    items.add(lineMenuItem());
    items.add(deleteWidgetMenuItem());
    return items;
  }

  if (appStore.currentSelectedWidget!.widgetType == WidgetTypeLeftDrawerLayout) {
    /// LeftDrawer view
    items.add(titleMenuItem());
    items.add(lineMenuItem());
    items.add(deleteWidgetMenuItem());
    return items;
  }

  if (appStore.currentSelectedWidget!.widgetType != WidgetTypeNormal) {
    if (appStore.selectedWidgetList.length > 0 && appStore.currentSelectedWidget!.widgetSubType != WidgetTypeRootView) {
      if (appStore.currentSelectedWidget!.id == appStore.selectedWidgetList[0].id) {
        /// Root view
        items.add(titleMenuItem());
        items.add(lineMenuItem());
        items.add(wrapMenuItem());
        items.add(addChildMenuItem());
        items.add(lineMenuItem());
        items.add(deleteWidgetMenuItem());
      } else {
        items.add(titleMenuItem());
        items.add(lineMenuItem());
        items.add(wrapMenuItem());
        items.add(addChildMenuItem());
        items.add(lineMenuItem());
        if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow) {
          items.add(moveLeftWidgetMenuItem());
          items.add(moveRightWidgetMenuItem());
          items.add(lineMenuItem());
        } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeStack) {
          items.add(moveUpWidgetMenuItem());
          items.add(moveDownWidgetMenuItem());
          items.add(lineMenuItem());
        } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeList) {
          items.add(moveDownAndRightMenuItem());
          items.add(moveUpAndLeftWidgetMenuItem());
          items.add(lineMenuItem());
        } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeGrid) {
          items.add(moveDownAndRightMenuItem());
          items.add(moveUpAndLeftWidgetMenuItem());
          items.add(lineMenuItem());
        }
        addParentWidgets(items);
        items.add(deleteWidgetMenuItem());
      }
    } else {
      /// Scaffold View Click handle
      items.add(titleMenuItem());
      items.add(lineMenuItem());
      items.add(addChildMenuItem());
    }
  } else {
    items.add(titleMenuItem());
    items.add(lineMenuItem());
    items.add(wrapMenuItem());
    items.add(lineMenuItem());

    if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow) {
      items.add(moveLeftWidgetMenuItem());
      items.add(moveRightWidgetMenuItem());
      items.add(lineMenuItem());
    } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeStack) {
      items.add(moveUpWidgetMenuItem());
      items.add(moveDownWidgetMenuItem());
      items.add(lineMenuItem());
    } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeList) {
      items.add(moveDownAndRightMenuItem());
      items.add(moveUpAndLeftWidgetMenuItem());
      items.add(lineMenuItem());
    } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeGrid) {
      items.add(lineMenuItem());
    }
    addParentWidgets(items);
    items.add(deleteWidgetMenuItem());
  }
  return items;
}

addParentWidgets(List<PopupMenuEntry<String>> items) {
  if (appStore.parentWidgetsList.isNotEmpty) {
    items.add(PopupMenuItem(
      child: Text('${language!.selectWidget}...', style: secondaryTextStyle()),
      value: WRONG_INDEX,
      enabled: false,
    ));
    int totalItem = 0;

    interLoop:
    for (int i = appStore.parentWidgetsList.length - 1; i >= 0; i--) {
      if (totalItem == MAX_PARENT_WIDGETS) {
        break interLoop;
      }
      items.add(PopupMenuItem(
        child: Text("${appStore.parentWidgetsList[i].widgetSubType} (***${appStore.parentWidgetsList[i].id!.substring(appStore.parentWidgetsList[i].id!.length - 4, appStore.parentWidgetsList[i].id!.length)})"),
        textStyle: getTextStyle(),
        value: "$PARENT_INDEX${appStore.parentWidgetsList[i].id}",
      ));
      totalItem = totalItem + 1;
    }
    items.add(lineMenuItem());
  }
}

Future<void> onLayoutWidgetMenuItem(PointerDownEvent event, context) async {
  if (event.kind == PointerDeviceKind.mouse && event.buttons == kSecondaryMouseButton) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    String? menuItem = await showMenu<String>(
      context: context,
      color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : dropDownColor,
      items: generateLayoutMenuItem(),
      position: RelativeRect.fromSize(event.position & Size(48.0, 48.0), overlay.size),
    );
    if (menuItem == WRAP_WIDGET_INDEX) {
      performWrapWidgetAction(context);
    } else if (menuItem == DELETE_WIDGET_INDEX) {
      performRemoveAction(context);
    } else if (menuItem == ADD_WIDGET_CHILD_INDEX) {
      performAddWidgetAction(context);
    } else if (menuItem == DUPLICATE_WIDGET_INDEX) {
      performDuplicateWidgetAction();
    } else if (menuItem == MOVE_UP_WIDGET_INDEX) {
      performMoveUpWidgetAction();
    } else if (menuItem == MOVE_DOWN_WIDGET_INDEX) {
      performMoveDownWidgetAction();
    } else if (menuItem == MOVE_LEFT_WIDGET_INDEX) {
      performMoveLeftWidgetAction();
    } else if (menuItem == MOVE_RIGHT_WIDGET_INDEX) {
      performMoveRightWidgetAction();
    } else if (menuItem.toString().startsWith(PARENT_INDEX.toString())) {
      performParentSelectionWidgetAction(menuItem!);
    }
  }
}
