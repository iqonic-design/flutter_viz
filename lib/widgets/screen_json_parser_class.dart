import 'dart:convert';

import 'package:flutter_viz/model/download_model.dart';
import 'package:flutter_viz/model/root_screen_json_data.dart';
import 'package:flutter_viz/model/screen_json_data.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';

import '../main.dart';
import 'widgets.dart';

/// This function apply screen json data to actual class view

applyScreenJsonToView(String? screenJsonData, {bool isForDownload = false}) async {
  DownloadModel downloadModel = DownloadModel();
  if (screenJsonData != null) {
    RootScreenJsonData rootScreenJsonData = RootScreenJsonData.fromJson(json.decode(screenJsonData));
    List<WidgetModel> widgetList = [];

    /// Set Widgets Json Data to Original Widgets View
    if (rootScreenJsonData.widgetsData != null && rootScreenJsonData.widgetsData!.id!.isNotEmpty) {
      ScreenJsonData screenJsonData = rootScreenJsonData.widgetsData!;
      WidgetModel rootWidgetModel = WidgetModel(
          id: screenJsonData.id,
          title: getWidgetTitle(screenJsonData.subType),
          displayWidget: getDisplayWidget(getWidgetsIcon(screenJsonData.type), getWidgetTitle(screenJsonData.subType)),
          widgetSubType: screenJsonData.subType,
          widgetViewModel: getWidgetJsonData(screenJsonData),
          widgetType: screenJsonData.type,
          headerImport: getHeaderClassFiles(screenJsonData),
          yamlLibName: getYamlLib(screenJsonData),
          subWidgetsList: []);
      if (screenJsonData.childData != null) {
        /// Widget with child view
        for (int index = 0; index < screenJsonData.childData!.length; index++) {
          WidgetModel rootChildWidgetModel = WidgetModel(
              id: screenJsonData.childData![index].id,
              title: getWidgetTitle(screenJsonData.childData![index].subType),
              displayWidget: getDisplayWidget(getWidgetsIcon(screenJsonData.childData![index].type), getWidgetTitle(screenJsonData.childData![index].subType)),
              widgetSubType: screenJsonData.childData![index].subType,
              parentWidgetType: screenJsonData.subType,
              parentWidgetId: screenJsonData.id,
              widgetViewModel: getWidgetJsonData(screenJsonData.childData![index]),
              widgetType: screenJsonData.childData![index].type,
              headerImport: getHeaderClassFiles(screenJsonData.childData![index]),
              yamlLibName: getYamlLib(screenJsonData.childData![index]),
              subWidgetsList: []);
          if (screenJsonData.childData![index].childData != null) {
            setChildJsonData(screenJsonData.childData![index], screenJsonData.childData![index].childData, rootChildWidgetModel);
          }
          rootWidgetModel.subWidgetsList!.add(rootChildWidgetModel);
        }
      } else {
        /// Single default child
        WidgetModel rootChildWidgetModel = WidgetModel(
            id: screenJsonData.id,
            title: getWidgetTitle(screenJsonData.subType),
            displayWidget: getDisplayWidget(getWidgetsIcon(screenJsonData.type), getWidgetTitle(screenJsonData.subType)),
            widgetSubType: screenJsonData.subType,
            widgetViewModel: getWidgetJsonData(screenJsonData),
            widgetType: screenJsonData.type,
            headerImport: getHeaderClassFiles(screenJsonData),
            yamlLibName: getYamlLib(screenJsonData),
            subWidgetsList: []);
        rootWidgetModel.subWidgetsList!.add(rootChildWidgetModel);
      }
      widgetList.add(rootWidgetModel);
    }

    /// Set AppBar Json Data to Original AppBar View
    if (rootScreenJsonData.appBarData!.widgetId!.isNotEmpty) {
      WidgetModel appBarData = WidgetModel(
        id: rootScreenJsonData.appBarData!.widgetId,
        title: getWidgetTitle(rootScreenJsonData.appBarData!.subType),
        displayWidget: getDisplayWidget(getWidgetsIcon(rootScreenJsonData.appBarData!.subType), getWidgetTitle(WidgetTypeRootView)),
        widgetSubType: rootScreenJsonData.appBarData!.subType,
        widgetViewModel: rootScreenJsonData.appBarData!.appbar,
        widgetType: rootScreenJsonData.appBarData!.type,
      );

      /// Update existing rootView
      if (isForDownload) {
        downloadModel.appBarClass = appBarData;
      } else {
        appStore.appBarClass = appBarData;
      }
    } else {
      if (!isForDownload) {
        appStore.appBarClass = null;
      }
    }

    /// Set Drawer Json Data to Original Drawer View
    if (rootScreenJsonData.drawerData != null) {
      if (rootScreenJsonData.drawerData!.widgetId!.isNotEmpty) {
        WidgetModel drawerData = WidgetModel(
          id: rootScreenJsonData.drawerData!.widgetId,
          title: getWidgetTitle(rootScreenJsonData.drawerData!.subType),
          displayWidget: getDisplayWidget(getWidgetsIcon(rootScreenJsonData.drawerData!.subType), getWidgetTitle(WidgetTypeRootView)),
          widgetSubType: rootScreenJsonData.drawerData!.subType,
          widgetViewModel: rootScreenJsonData.drawerData!.leftDrawer,
          headerImport: rootScreenJsonData.drawerData!.leftDrawer!.getHeaderClassFiles(),
          widgetType: rootScreenJsonData.drawerData!.type,
        );

        /// Update existing rootView
        if (isForDownload) {
          downloadModel.drawerClass = drawerData;
        } else {
          appStore.drawerClass = drawerData;
        }
      } else {
        if (!isForDownload) {
          appStore.drawerClass = null;
        }
      }
    } else {
      if (!isForDownload) {
        appStore.drawerClass = null;
      }
    }

    /// Set BottomNavigation Json Data to Original BottomNavigation View
    if (rootScreenJsonData.bottomNavigationBarData != null) {
      if (rootScreenJsonData.bottomNavigationBarData!.widgetId!.isNotEmpty) {
        WidgetModel bottomNavigationData = WidgetModel(
          id: rootScreenJsonData.bottomNavigationBarData!.widgetId,
          title: getWidgetTitle(rootScreenJsonData.bottomNavigationBarData!.subType),
          displayWidget: getDisplayWidget(getWidgetsIcon(rootScreenJsonData.bottomNavigationBarData!.subType), getWidgetTitle(WidgetTypeRootView)),
          widgetSubType: rootScreenJsonData.bottomNavigationBarData!.subType,
          widgetViewModel: rootScreenJsonData.bottomNavigationBarData!.bottomNavigationBar,
          headerImport: rootScreenJsonData.bottomNavigationBarData!.bottomNavigationBar!.getHeaderClassFiles(),
          widgetType: rootScreenJsonData.bottomNavigationBarData!.type,
        );

        /// Update existing rootView
        if (isForDownload) {
          downloadModel.bottomNavigationBarClass = bottomNavigationData;
        } else {
          appStore.bottomNavigationBarClass = bottomNavigationData;
        }
      } else {
        if (!isForDownload) {
          appStore.bottomNavigationBarClass = null;
        }
      }
    } else {
      if (!isForDownload) {
        appStore.bottomNavigationBarClass = null;
      }
    }

    /// Set Scaffold Json Data to Original Scaffold View
    if (rootScreenJsonData.scaffoldData != null && rootScreenJsonData.scaffoldData!.widgetId!.isNotEmpty) {
      WidgetModel scaffoldData = WidgetModel(
        id: rootScreenJsonData.scaffoldData!.widgetId,
        title: getWidgetTitle(WidgetTypeRootView),
        displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeRootView), getWidgetTitle(WidgetTypeRootView)),
        widgetSubType: WidgetTypeRootView,
        widgetViewModel: rootScreenJsonData.scaffoldData!.scaffold,
        widgetType: WidgetTypeRootView,
      );

      /// Update existing rootView
      if (isForDownload) {
        downloadModel.rootView = scaffoldData;
      } else {
        appStore.rootView = scaffoldData;
      }
    } else {
      if (!isForDownload) {
        appStore.rootView = null;
      }
    }

    /// Assign widgets list to Store class.
    if (isForDownload) {
      downloadModel.selectedWidgetList = widgetList;
    } else {
      appStore.setWidgetsList(widgetList);
      appStore.finishLoadingData();
    }
  } else {
    if (!isForDownload) {
      List<WidgetModel> widgetList = [];
      appStore.setWidgetsList(widgetList);
      appStore.appBarClass = null;
      appStore.bottomNavigationBarClass = null;
      appStore.rootView = null;
      appStore.drawerClass = null;
      appStore.finishLoadingData();
    }
  }
  if (isForDownload) {
    return downloadModel;
  }
}

setChildJsonData(ScreenJsonData screenJsonData, List<ScreenJsonData>? childData, WidgetModel widgetModel) async {
  if (childData != null) {
    for (int index = 0; index < childData.length; index++) {
      WidgetModel childWidgetModel = WidgetModel(
          id: childData[index].id,
          title: getWidgetTitle(childData[index].subType),
          displayWidget: getDisplayWidget(getWidgetsIcon(childData[index].type), getWidgetTitle(childData[index].subType)),
          widgetSubType: childData[index].subType,
          parentWidgetType: screenJsonData.subType,
          parentWidgetId: screenJsonData.id,
          widgetViewModel: getWidgetJsonData(childData[index]),
          widgetType: childData[index].type,
          headerImport: getHeaderClassFiles(childData[index]),
          yamlLibName: getYamlLib(childData[index]),
          subWidgetsList: []);
      if (childData[index].childData != null) {
        setChildJsonData(childData[index], childData[index].childData, childWidgetModel);
        widgetModel.subWidgetsList!.add(childWidgetModel);
      } else {
        widgetModel.subWidgetsList!.add(childWidgetModel);
      }
    }
  }
}

/// Convert Widgets Call to json data
Future<Map<String, dynamic>> widgetClassToJsonData() async {
  Map<String, dynamic> rootScreenDataJson = {};
  Map<String, dynamic> widgetDataJson = {};

  /// Widgets json data
  if (appStore.selectedWidgetList.length > 0) {
    List<Map<String, dynamic>> screenDataJson = [];
    if (appStore.selectedWidgetList[0].subWidgetsList != null) {
      for (int index = 0; index < appStore.selectedWidgetList[0].subWidgetsList!.length; index++) {
        if (appStore.selectedWidgetList[0].subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          List<Map<String, dynamic>> childScreenDataJson = [];

          subViewJsonData(appStore.selectedWidgetList[0].subWidgetsList![index]!, childScreenDataJson);

          screenDataJson.add({
            JSON_WIDGET_ID: appStore.selectedWidgetList[0].subWidgetsList![index]!.id,
            JSON_TYPE: appStore.selectedWidgetList[0].subWidgetsList![index]!.widgetType,
            JSON_SUB_TYPE: appStore.selectedWidgetList[0].subWidgetsList![index]!.widgetSubType,
            appStore.selectedWidgetList[0].subWidgetsList![index]!.widgetSubType!: getWidgetsClassData(appStore.selectedWidgetList[0].subWidgetsList![index]!, isPropertyJsonData: true),
            JSON_CHILD_DATA: childScreenDataJson.toList()
          });
        } else {
          screenDataJson.add({
            JSON_WIDGET_ID: appStore.selectedWidgetList[0].subWidgetsList![index]!.id,
            JSON_TYPE: appStore.selectedWidgetList[0].subWidgetsList![index]!.widgetType,
            JSON_SUB_TYPE: appStore.selectedWidgetList[0].subWidgetsList![index]!.widgetSubType,
            appStore.selectedWidgetList[0].subWidgetsList![index]!.widgetSubType!: getWidgetsClassData(appStore.selectedWidgetList[0].subWidgetsList![index]!, isPropertyJsonData: true),
          });
        }
      }
      widgetDataJson.addAll({
        JSON_WIDGET_ID: appStore.selectedWidgetList[0].id,
        JSON_TYPE: appStore.selectedWidgetList[0].widgetType,
        JSON_SUB_TYPE: appStore.selectedWidgetList[0].widgetSubType,
        appStore.selectedWidgetList[0].widgetSubType!: getWidgetsClassData(appStore.selectedWidgetList[0], isPropertyJsonData: true),
        JSON_CHILD_DATA: screenDataJson
      });
    } else {
      widgetDataJson.addAll({
        JSON_WIDGET_ID: appStore.selectedWidgetList[0].id,
        JSON_TYPE: appStore.selectedWidgetList[0].widgetType,
        JSON_SUB_TYPE: appStore.selectedWidgetList[0].widgetSubType,
        appStore.selectedWidgetList[0].widgetSubType!: getWidgetsClassData(appStore.selectedWidgetList[0], isPropertyJsonData: true),
      });
    }
  }

  /// Appbar json data
  Map<String, dynamic> appBarJsonData = {};
  if (appStore.appBarClass != null) {
    appBarJsonData.addAll({
      JSON_WIDGET_ID: appStore.appBarClass!.id,
      JSON_TYPE: appStore.appBarClass!.widgetType,
      JSON_SUB_TYPE: appStore.appBarClass!.widgetSubType,
      appStore.appBarClass!.widgetSubType!: getWidgetsClassData(appStore.appBarClass!, isPropertyJsonData: true),
    });
  }

  /// BottomBar Navigation json data
  Map<String, dynamic> bottomNavigationJsonData = {};
  if (appStore.bottomNavigationBarClass != null) {
    bottomNavigationJsonData.addAll({
      JSON_WIDGET_ID: appStore.bottomNavigationBarClass!.id,
      JSON_TYPE: appStore.bottomNavigationBarClass!.widgetType,
      JSON_SUB_TYPE: appStore.bottomNavigationBarClass!.widgetSubType,
      appStore.bottomNavigationBarClass!.widgetSubType!: getWidgetsClassData(appStore.bottomNavigationBarClass!, isPropertyJsonData: true),
    });
  }

  /// Drawer json data
  Map<String, dynamic> drawerJsonData = {};
  if (appStore.drawerClass != null) {
    drawerJsonData.addAll({
      JSON_WIDGET_ID: appStore.drawerClass!.id,
      JSON_TYPE: appStore.drawerClass!.widgetType,
      JSON_SUB_TYPE: appStore.drawerClass!.widgetSubType,
      appStore.drawerClass!.widgetSubType!: getWidgetsClassData(appStore.drawerClass!, isPropertyJsonData: true),
    });
  }

  /// Scaffold json Data
  Map<String, dynamic> scaffoldJsonData = {};
  if (appStore.rootView != null) {
    scaffoldJsonData.addAll({
      JSON_WIDGET_ID: appStore.rootView!.id,
      JSON_TYPE: appStore.rootView!.widgetType,
      JSON_SUB_TYPE: appStore.rootView!.widgetSubType,
      appStore.rootView!.widgetSubType!: getWidgetsClassData(appStore.rootView!, isPropertyJsonData: true),
    });
  }

  rootScreenDataJson.addAll({
    JSON_WIDGET_DATA: widgetDataJson,
    JSON_SCAFFOLD_DATA: scaffoldJsonData,
    JSON_APPBAR_DATA: appBarJsonData,
    JSON_BOTTOM_BAR_NAVIGATION_DATA: bottomNavigationJsonData,
    JSON_DRAWER_DATA: drawerJsonData,
  });
  return rootScreenDataJson;
}

void subViewJsonData(WidgetModel widgetModel, List<Map<String, dynamic>> aScreenDataJson) {
  if (widgetModel.subWidgetsList!.length > 0) {
    for (int index = 0; index < widgetModel.subWidgetsList!.length; index++) {
      if (widgetModel.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
        List<Map<String, dynamic>> weightData = [];
        subViewJsonData(widgetModel.subWidgetsList![index]!, weightData);
        aScreenDataJson.add({
          JSON_WIDGET_ID: widgetModel.subWidgetsList![index]!.id,
          JSON_TYPE: widgetModel.subWidgetsList![index]!.widgetType,
          JSON_SUB_TYPE: widgetModel.subWidgetsList![index]!.widgetSubType,
          widgetModel.subWidgetsList![index]!.widgetSubType!: getWidgetsClassData(widgetModel.subWidgetsList![index]!, isPropertyJsonData: true),
          JSON_CHILD_DATA: weightData.toList()
        });
      } else {
        aScreenDataJson.add({
          JSON_WIDGET_ID: widgetModel.subWidgetsList![index]!.id,
          JSON_TYPE: widgetModel.subWidgetsList![index]!.widgetType,
          JSON_SUB_TYPE: widgetModel.subWidgetsList![index]!.widgetSubType,
          widgetModel.subWidgetsList![index]!.widgetSubType!: getWidgetsClassData(widgetModel.subWidgetsList![index]!, isPropertyJsonData: true)
        });
      }
    }
  }
}
