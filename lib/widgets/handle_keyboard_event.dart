import 'dart:html';

import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppCommonApiCall.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import 'right_click_menu_items.dart';

bool isPreviousKeyControl() {
  if (appStore.previousKey == LogicalKeyboardKey.controlRight) {
    return true;
  } else if (appStore.previousKey == LogicalKeyboardKey.controlLeft) {
    return true;
  }
  // For MAC OS
  else if (appStore.previousKey == LogicalKeyboardKey.metaLeft) {
    return true;
  } else if (appStore.previousKey == LogicalKeyboardKey.metaRight) {
    return true;
  }
  return false;
}

/// Handle Keyboard key press Event
void handleKeyboardEvent(KeyEvent event, BuildContext context) async {
  if (!appStore.isPreviewCode) {
    if (appStore.previousKey == null) {
      appStore.previousKey = event.logicalKey;
    }
    if (event.runtimeType == KeyDownEvent) {
      if (isPreviousKeyControl()) {
        /// Add child widget to selected view
        /// Key => Ctrl + A
        if (event.logicalKey == LogicalKeyboardKey.keyA) {
          trackUserEvent("Keyboard(Ctrl+A) - Add Child");
          if (appStore.currentSelectedWidget!.widgetType == WidgetTypeNormal) {
            performWrapWidgetAction(context);
          } else {
            performAddWidgetAction(context);
          }
        } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
          trackUserEvent("Keyboard(Ctrl+S) - Save data");
          saveScreenApi();
        }

        /// Wrap Selected with new widget
        /// Key => Ctrl + B
        else if (event.logicalKey == LogicalKeyboardKey.keyB) {
          trackUserEvent("Keyboard(Ctrl+B) - Wrap Widget");
          performWrapWidgetAction(context);
        }

        /// Undo Widgets
        /// Key => Ctrl + Z
        else if (event.logicalKey == LogicalKeyboardKey.keyZ) {
          trackUserEvent("Keyboard(Ctrl+Z) - Undo");
          printLogData("Undo(${appStore.undoWidgetsList.length}): " + appStore.canUndo().toString());
          appStore.undo();
          printLogData("Undo(${appStore.undoWidgetsList.length}): " + appStore.canUndo().toString());
        }

        /// Redo Widgets
        /// Key => Ctrl + Y
        else if (event.logicalKey == LogicalKeyboardKey.keyY) {
          trackUserEvent("Keyboard(Ctrl+Y) - Redo");
          printLogData("Redo:" + appStore.canRedo().toString());
          appStore.redo();
          printLogData("Redo:" + appStore.canRedo().toString());
        }

        appStore.previousKey = event.logicalKey;
      }

      /// Delete Selected View
      /// Key => Delete
      else if (event.logicalKey == LogicalKeyboardKey.delete) {
        trackUserEvent("Keyboard(Delete Key) - Delete Child");
        appStore.removeSelectedWidget();
      }

      /// Key => Arrow Up Or Arrow Left
      else if ((event.logicalKey == LogicalKeyboardKey.arrowUp || event.logicalKey == LogicalKeyboardKey.arrowLeft) &&
          (appStore.previousKey != LogicalKeyboardKey.arrowUp || appStore.previousKey != LogicalKeyboardKey.arrowLeft)) {
        appStore.previousKey = event.logicalKey;
        trackUserEvent("Keyboard(Up or Left) - Move Child");
        appStore.moveWidget(isMoveUpOperation: true);
        appStore.refreshMainViewData();
      }

      /// Key => Arrow Down Or Arrow Right
      else if (event.logicalKey == LogicalKeyboardKey.arrowDown || event.logicalKey == LogicalKeyboardKey.arrowRight) {
        trackUserEvent("Keyboard(Down Or Right) - Move Child");
        appStore.moveWidget(isMoveUpOperation: false);
        appStore.refreshMainViewData();
      } else {
        appStore.previousKey = event.logicalKey;
      }
    }
  }
}

tabKeyEvent(FocusScopeNode _node) {
  if (kIsWeb) {
    document.addEventListener('keydown', (event) => {if (event.type == 'tab') _node.nextFocus()});
  }
}
