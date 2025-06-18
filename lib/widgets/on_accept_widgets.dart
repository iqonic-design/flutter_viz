import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/column_class.dart';
import 'package:flutter_viz/widgetsClass/list_view_class.dart';
import 'package:flutter_viz/widgetsClass/row_class.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'widgets.dart';
import 'widgets_dialogs.dart';

/// Accept drawer, appbar and bottom navigation bar widget
acceptScaffoldOtherPart(WidgetModel item) {
  /// Appbar
  if (item.widgetType == WidgetTypeAppBarLayout) {
    if (appStore.appBarClass != null) {
      appBarMessage();
    } else {
      appStore.addAppBar(item);
    }
  }

  /// Side drawer
  else if (item.widgetType == WidgetTypeLeftDrawerLayout) {
    if (appStore.drawerClass != null) {
      drawerMessage();
    } else {
      appStore.addDrawer(item);
    }
  }

  /// bottom navigation bar
  else if (item.widgetType == WidgetTypeBottomNavigationBarLayout) {
    if (appStore.bottomNavigationBarClass != null) {
      bottomNavigationBarMessage();
    } else {
      appStore.addBottomNavigation(item);
    }
  }
}

addChildWidgets(WidgetModel item, WidgetModel widgetModel) {
  if (isSingleChildLayout(widgetModel)) {
    if (widgetModel.subWidgetsList!.length > 0) {
      showContainerConfirmDialog(
        getContext,
        "${language!.doYouWantToReplace} [${widgetModel.subWidgetsList![0]!.widgetSubType}] ${language!.lblWith} [${item.widgetSubType}] ${language!.insideThe} [${widgetModel.widgetSubType}] ${language!.orAddRowOrColumn}",
        onColumnAccept: () {
          appStore.addToChangeStack();
          WidgetModel tempWidgetModel = widgetModel.subWidgetsList![0]!;
          item.parentWidgetType = WidgetTypeColumn;
          tempWidgetModel.parentWidgetType = WidgetTypeColumn;
          widgetModel.subWidgetsList!.removeAt(0);
          widgetModel.subWidgetsList!.insert(0, getWidgets(WidgetTypeColumn));
          widgetModel.subWidgetsList![0]!.subWidgetsList!.add(tempWidgetModel);
          widgetModel.subWidgetsList![0]!.subWidgetsList!.add(item);
          appStore.updateSelectedWidget(item);
          appStore.refreshMainViewData();
        },
        onRowAccept: () {
          appStore.addToChangeStack();
          WidgetModel tempWidgetModel = widgetModel.subWidgetsList![0]!;
          item.parentWidgetType = WidgetTypeRow;
          tempWidgetModel.parentWidgetType = WidgetTypeRow;
          if (fullWidthWidgetTypeList.contains(tempWidgetModel.widgetSubType)) {
            getWidgetCasting(tempWidgetModel).isExpanded = true;
          }
          widgetModel.subWidgetsList!.removeAt(0);
          widgetModel.subWidgetsList!.insert(0, getWidgets(WidgetTypeRow));
          widgetModel.subWidgetsList![0]!.subWidgetsList!.add(tempWidgetModel);
          widgetModel.subWidgetsList![0]!.subWidgetsList!.add(item);
          appStore.updateSelectedWidget(item);
          appStore.refreshMainViewData();
        },
        onReplaceAccept: () {
          appStore.addToChangeStack();

          /// Container, Card, Opacity, ClipRRect, RotatedBox, Constrained view have only single child
          widgetModel.subWidgetsList!.clear();
          widgetModel.subWidgetsList!.insert(0, item);
          appStore.updateSelectedWidget(item);
        },
        buttonColor: textColorPrimary,
        columnText: language!.addColumn,
        replaceText: language!.replace,
        negativeText: language!.cancel,
        rowText: language!.addRow,
      );
    } else {
      appStore.addToChangeStack();
      widgetModel.subWidgetsList!.insert(0, item);
      appStore.updateSelectedWidget(item);
      appStore.refreshMainViewData();
    }
  } else {
    /// Remove Default Child View
    if (widgetModel.subWidgetsList!.length > 0) {
      removeDefaultChildView(widgetModel.subWidgetsList!);
    }

    /// Not accept child if Column1|Row1->Column2|Row2->ExpandedChild and Column2|Row2 is not expanded
    if ((widgetModel.widgetSubType == WidgetTypeRow || widgetModel.widgetSubType == WidgetTypeColumn) &&
        (widgetModel.parentWidgetType == WidgetTypeColumn || widgetModel.parentWidgetType == WidgetTypeRow)) {
      bool? isExpanded = false;

      if (widgetModel.widgetSubType == WidgetTypeColumn) {
        isExpanded = (widgetModel.widgetViewModel as ColumnClass).isExpanded;
      } else if (widgetModel.widgetSubType == WidgetTypeRow) {
        isExpanded = (widgetModel.widgetViewModel as RowClass).isExpanded;
      }

      if (!isExpanded!) {
        if (widgetModel.parentWidgetType == WidgetTypeColumn && fullHeightWidgetTypeList.contains(item.widgetSubType)) {
          getSnackBarWidget('you can not drag this widget because it have an unbounded height. Set its parent widget property "expanded" to true');
          return;

          /// Not accept child : Column -> Column/Row(Not expanded) -> ListView/GridView(expanded in Column)
          /// you cannot drag this widget because parent Widget is not expanded
        } else if (widgetModel.parentWidgetType == WidgetTypeRow && fullWidthWidgetTypeList.contains(item.widgetSubType)) {
          getSnackBarWidget('you can not drag this widget because it have an unbounded width. Set its parent widget property "expanded" to true');
          return;

          /// Not accept child : Row -> Column/Row(Not expanded) -> List/Grid/TextField/ListTile/SwitchListTile/CheckboxListTile/Calender/VideoPlayer/CreditCardView/LinearProgressIndicator
          /// you cannot drag this widget because parent Widget is not expanded
        }
      }
    }

    /// Not accept child widgets if parent type is list and subParent type is Row or Column
    if (widgetModel.parentWidgetType == WidgetTypeList && (widgetModel.widgetSubType == WidgetTypeRow || widgetModel.widgetSubType == WidgetTypeColumn)) {
      dynamic view;

      if (widgetModel.parentWidgetId != null) {
        view = appStore.getParentWidgetsClass(widgetModel, widgetModel.parentWidgetType);
      }
      if (view != null) {
        /// Not accept child if parent type is list with vertical axis
        if ((view as ListViewClass).axis == AxisVertical) {
          if (fullHeightWidgetTypeList.contains(item.widgetSubType)) {
            getSnackBarWidget('Vertical viewport was given unbounded height. \nYou cannot drag this widget because it have an undefined height.');
            return;
          }
        }

        /// Not accept child widgets if parent type is list with horizontal Axis
        if (view.axis == AxisHorizontal) {
          if (fullWidthWidgetTypeList.contains(item.widgetSubType)) {
            getSnackBarWidget('Horizontal viewport was given unbounded width. \nyou cannot drag this widget because it have an undefined width');
            return;
          }
        }
      }
    }

    /// Not accept child if parent Type is List
    if (!checkExpandedWidgetAccept(widgetModel, item)) {
      return;
    }

    appStore.addToChangeStack();
    item.parentWidgetType = widgetModel.widgetSubType;
    item.parentWidgetId = widgetModel.id;

    widgetModel.subWidgetsList!.add(item);
    appStore.updateSelectedWidget(item);
    appStore.refreshMainViewData();
  }
}

bool checkExpandedWidgetAccept(WidgetModel widgetModel, WidgetModel item) {
  if (widgetModel.widgetSubType == WidgetTypeList) {
    if ((widgetModel.widgetViewModel as ListViewClass).axis == AxisVertical) {
      if (fullHeightWidgetTypeList.contains(item.widgetSubType)) {
        getSnackBarWidget('Vertical viewport was given unbounded height.\n You cannot drag this widget because it have an undefined height.');
        return false;
      }
    }
    if ((widgetModel.widgetViewModel as ListViewClass).axis == AxisHorizontal) {
      if (fullWidthWidgetTypeList.contains(item.widgetSubType)) {
        getSnackBarWidget('You cannot drag this widget because it have an undefined width.');
        return false;
      }
    }
  } else if (widgetModel.widgetSubType == WidgetTypeRow || widgetModel.widgetSubType == WidgetTypeColumn) {
    if (widgetModel.widgetSubType == WidgetTypeColumn && getWidgetCasting(widgetModel).isScrollable) {
      if (fullHeightWidgetTypeList.contains(item.widgetSubType)) {
        getSnackBarWidget('You can not drag this widget because it have an undefined height and its parent is scrollable');
        return false;
      }
    }
    if (widgetModel.widgetSubType == WidgetTypeRow && getWidgetCasting(widgetModel).isScrollable) {
      if (fullWidthWidgetTypeList.contains(item.widgetSubType)) {
        getSnackBarWidget('You can not drag this widget because it have an undefined width and its parent is scrollable');
        return false;
      }
    }
  }
  return true;
}

/// Layout widgets on accept child data
layoutWidgetsOnAccept(WidgetModel item, WidgetModel widgetModel) {
  WidgetModel currentModel = getWidgets(item.widgetSubType);
  if (currentModel.widgetType == WidgetTypeAppBarLayout || currentModel.widgetType == WidgetTypeLeftDrawerLayout || currentModel.widgetType == WidgetTypeBottomNavigationBarLayout) {
    acceptScaffoldOtherPart(currentModel);
  } else {
    addChildWidgets(currentModel, widgetModel);
  }
}

/// Blank screen child accept dialog
blankScreenChildAccept(WidgetModel currentModel) {
  if (currentModel.widgetType == WidgetTypeAppBarLayout || currentModel.widgetType == WidgetTypeLeftDrawerLayout || currentModel.widgetType == WidgetTypeBottomNavigationBarLayout) {
    acceptScaffoldOtherPart(currentModel);
  } else {
    if (currentModel.widgetType == WidgetTypeNormal) {
      showRootConfirmDialog(
        getContext,
        language!.selectLayoutForScaffold,
        onColumnAccept: () {
          appStore.addToChangeStack();
          currentModel.parentWidgetType = WidgetTypeColumn;
          appStore.selectedWidgetList.add(getWidgets(WidgetTypeColumn));
          appStore.selectedWidgetList[0].subWidgetsList!.add(currentModel);
          appStore.updateSelectedWidget(currentModel);
          appStore.refreshMainViewData();
        },
        onRowAccept: () {
          appStore.addToChangeStack();
          currentModel.parentWidgetType = WidgetTypeRow;
          appStore.selectedWidgetList.add(getWidgets(WidgetTypeRow));
          appStore.selectedWidgetList[0].subWidgetsList!.add(currentModel);
          appStore.updateSelectedWidget(currentModel);
          appStore.refreshMainViewData();
        },
        onContainerAccept: () {
          appStore.addToChangeStack();
          appStore.selectedWidgetList.add(getWidgets(WidgetTypeContainer));
          appStore.selectedWidgetList[0].subWidgetsList!.add(currentModel);
          appStore.updateSelectedWidget(currentModel);
          appStore.refreshMainViewData();
        },
        onDefaultAccept: () {
          appStore.addToChangeStack();
          appStore.selectedWidgetList.add(currentModel);
          appStore.updateSelectedWidget(currentModel);
          appStore.refreshMainViewData();
        },
        buttonColor: textColorPrimary,
        columnText: language!.addColumn,
        containerText: language!.addContainer,
        negativeText: language!.cancel,
        defaultView: "${language!.titleDefault} [${currentModel.widgetSubType}]",
        rowText: language!.addRow,
      );
    } else if (currentModel.widgetType == WidgetTypeTabViewLayout) {
      addTabViewWidget(appStore.selectedWidgetList, currentModel);
    } else {
      appStore.addToChangeStack();
      WidgetModel model = defaultChildWidget(currentModel);
      appStore.selectedWidgetList.add(model);
      appStore.updateSelectedWidget(model);
      appStore.refreshMainViewData();
    }
  }
}

/// Accept child by scaffold view
rootViewAcceptChild(WidgetModel childWidgets) {
  WidgetModel item = getWidgets(childWidgets.widgetSubType);
  if (item.widgetType == WidgetTypeAppBarLayout || item.widgetType == WidgetTypeLeftDrawerLayout || item.widgetType == WidgetTypeBottomNavigationBarLayout) {
    acceptScaffoldOtherPart(item);
  } else {
    if (appStore.selectedWidgetList.length > 0) {
      WidgetModel itemWidgets = getWidgets(item.widgetSubType);
      showContainerConfirmDialog(
        getContext,
        "${language!.replaceWidgetInsideOfScaffold} [${appStore.selectedWidgetList[0].widgetSubType}]?",
        onColumnAccept: () {
          appStore.addToChangeStack();
          WidgetModel tempWidgetModel = appStore.selectedWidgetList[0];
          appStore.selectedWidgetList.clear();

          tempWidgetModel.parentWidgetType = WidgetTypeColumn;
          itemWidgets.parentWidgetType = WidgetTypeColumn;
          WidgetModel columnWidgetModel = getWidgets(WidgetTypeColumn);
          columnWidgetModel.subWidgetsList!.add(tempWidgetModel);
          columnWidgetModel.subWidgetsList!.add(itemWidgets);

          appStore.selectedWidgetList.add(columnWidgetModel);

          appStore.refreshMainViewData();
        },
        onRowAccept: () {
          appStore.addToChangeStack();
          WidgetModel tempWidgetModel = appStore.selectedWidgetList[0];
          appStore.selectedWidgetList.clear();

          tempWidgetModel.parentWidgetType = WidgetTypeRow;
          itemWidgets.parentWidgetType = WidgetTypeRow;

          if (fullWidthWidgetTypeList.contains(tempWidgetModel.widgetSubType)) {
            getWidgetCasting(tempWidgetModel).isExpanded = true;
          }

          WidgetModel rowWidgetModel = getWidgets(WidgetTypeRow);
          rowWidgetModel.subWidgetsList!.add(tempWidgetModel);
          rowWidgetModel.subWidgetsList!.add(itemWidgets);

          appStore.selectedWidgetList.add(rowWidgetModel);

          appStore.refreshMainViewData();
        },
        onReplaceAccept: () {
          appStore.addToChangeStack();
          appStore.selectedWidgetList.clear();
          appStore.selectedWidgetList.add(itemWidgets);
          appStore.refreshMainViewData();
        },
        buttonColor: textColorPrimary,
        columnText: language!.addColumn,
        replaceText: language!.replace,
        negativeText: language!.cancel,
        rowText: language!.addRow,
      );
    } else {
      printLogData("ACCEPT CENTER BODY ELSE PART");
    }
  }
}

/// Accept child of scaffold first root child
scaffoldFirstWidgetAcceptChild(WidgetModel childWidgets, WidgetModel rootModelView) {
  WidgetModel item = getWidgets(childWidgets.widgetSubType);
  WidgetModel currentModel = getWidgets(item.widgetSubType);
  if (item.widgetType == WidgetTypeAppBarLayout || item.widgetType == WidgetTypeLeftDrawerLayout || item.widgetType == WidgetTypeBottomNavigationBarLayout) {
    acceptScaffoldOtherPart(item);
  } else {
    if (isSingleChildLayout(rootModelView)) {
      if (rootModelView.subWidgetsList!.length > 0) {
        showContainerConfirmDialog(
          getContext,
          "${language!.doYouWantToReplace} [${rootModelView.subWidgetsList![0]!.widgetSubType}] ${language!.lblWith} [${item.widgetSubType}] ${language!.insideThe} [${rootModelView.widgetSubType}] ${language!.orAddRowOrColumn}",
          onColumnAccept: () {
            appStore.addToChangeStack();
            WidgetModel tempWidgetModel = appStore.selectedWidgetList[0].subWidgetsList![0]!;
            currentModel.parentWidgetType = WidgetTypeColumn;
            tempWidgetModel.parentWidgetType = WidgetTypeColumn;
            appStore.selectedWidgetList[0].subWidgetsList!.removeAt(0);
            appStore.selectedWidgetList[0].subWidgetsList!.insert(0, getWidgets(WidgetTypeColumn));
            appStore.selectedWidgetList[0].subWidgetsList![0]!.subWidgetsList!.add(tempWidgetModel);
            appStore.selectedWidgetList[0].subWidgetsList![0]!.subWidgetsList!.add(currentModel);
            appStore.updateSelectedWidget(currentModel);
            appStore.refreshMainViewData();
          },
          onRowAccept: () {
            appStore.addToChangeStack();
            WidgetModel tempWidgetModel = appStore.selectedWidgetList[0].subWidgetsList![0]!;
            currentModel.parentWidgetType = WidgetTypeRow;
            tempWidgetModel.parentWidgetType = WidgetTypeRow;
            if (fullWidthWidgetTypeList.contains(tempWidgetModel.widgetSubType)) {
              getWidgetCasting(tempWidgetModel).isExpanded = true;
            }
            appStore.selectedWidgetList[0].subWidgetsList!.removeAt(0);
            appStore.selectedWidgetList[0].subWidgetsList!.insert(0, getWidgets(WidgetTypeRow));
            appStore.selectedWidgetList[0].subWidgetsList![0]!.subWidgetsList!.add(tempWidgetModel);
            appStore.selectedWidgetList[0].subWidgetsList![0]!.subWidgetsList!.add(currentModel);
            appStore.updateSelectedWidget(currentModel);
            appStore.refreshMainViewData();
          },
          onReplaceAccept: () {
            appStore.addToChangeStack();
            appStore.selectedWidgetList[0].subWidgetsList!.removeAt(0);
            appStore.selectedWidgetList[0].subWidgetsList!.insert(0, currentModel);
            appStore.updateSelectedWidget(currentModel);
            appStore.refreshMainViewData();
          },
          buttonColor: textColorPrimary,
          columnText: language!.addColumn,
          replaceText: language!.replace,
          negativeText: language!.cancel,
          rowText: language!.addRow,
        );
      } else {
        appStore.addToChangeStack();
        rootModelView.subWidgetsList!.insert(0, currentModel);
        appStore.updateSelectedWidget(currentModel);
        appStore.refreshMainViewData();
      }
    } else if (rootModelView.widgetSubType == WidgetTypeRow ||
        rootModelView.widgetSubType == WidgetTypeColumn ||
        rootModelView.widgetSubType == WidgetTypeStack ||
        rootModelView.widgetSubType == WidgetTypeList ||
        rootModelView.widgetSubType == WidgetTypeGrid) {
      /// Not accept child if parent Type is List
      if (!checkExpandedWidgetAccept(rootModelView, item)) {
        return;
      }
      appStore.addToChangeStack();

      /// Remove Default Child View
      if (appStore.selectedWidgetList[0].subWidgetsList!.length > 0) {
        removeDefaultChildView(appStore.selectedWidgetList[0].subWidgetsList!);
      }

      WidgetModel currentDefaultViewModel = defaultChildWidget(item);
      currentDefaultViewModel.parentWidgetType = rootModelView.widgetSubType;
      currentDefaultViewModel.parentWidgetId = rootModelView.id;

      appStore.selectedWidgetList[0].subWidgetsList!.add(currentDefaultViewModel);
      appStore.updateSelectedWidget(currentDefaultViewModel);
      appStore.refreshMainViewData();
    }
  }
}
