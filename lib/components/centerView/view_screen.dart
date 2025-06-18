import 'dart:convert';

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/root_screen_json_data.dart';
import 'package:flutter_viz/model/screen_json_data.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsClass/app_bar_class.dart';
import 'package:flutter_viz/widgetsClass/bottom_navigation_bar_class.dart';
import 'package:flutter_viz/widgetsClass/left_drawer_class.dart';
import 'package:flutter_viz/widgetsClass/root_view_class.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class ViewScreen extends StatefulWidget {
  String? screenJsonData;

  ViewScreen(this.screenJsonData);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  List<WidgetModel> selectedWidgetList = [];

  WidgetModel? appBarClass;
  WidgetModel? bottomNavigationClass;
  WidgetModel? drawerClass;
  WidgetModel? rootView;

  @override
  void initState() {
    super.initState();
  }

  void applyScreenJsonToView(String? screenJsonData) async {
    appBarClass = null;
    bottomNavigationClass = null;
    drawerClass = null;
    rootView = null;
    selectedWidgetList.clear();

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
        appBarClass = appBarData;
      } else {
        appBarClass = null;
      }

      /// Set BottomNavigationBar Json Data to Original BottomNavigationBar View
      if (rootScreenJsonData.bottomNavigationBarData != null) {
        if (rootScreenJsonData.bottomNavigationBarData!.widgetId!.isNotEmpty) {
          WidgetModel bottomNavigationBarData = WidgetModel(
            id: rootScreenJsonData.bottomNavigationBarData!.widgetId,
            title: getWidgetTitle(rootScreenJsonData.bottomNavigationBarData!.subType),
            displayWidget: getDisplayWidget(getWidgetsIcon(rootScreenJsonData.bottomNavigationBarData!.subType), getWidgetTitle(WidgetTypeRootView)),
            widgetSubType: rootScreenJsonData.bottomNavigationBarData!.subType,
            widgetViewModel: rootScreenJsonData.bottomNavigationBarData!.bottomNavigationBar,
            widgetType: rootScreenJsonData.bottomNavigationBarData!.type,
          );

          /// Update existing rootView
          bottomNavigationClass = bottomNavigationBarData;
        } else {
          bottomNavigationClass = null;
        }
      } else {
        bottomNavigationClass = null;
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
            widgetType: rootScreenJsonData.drawerData!.type,
          );

          /// Update existing rootView
          drawerClass = drawerData;
        } else {
          drawerClass = null;
        }
      } else {
        drawerClass = null;
      }
      /// Set Scaffold Json Data to Original Scaffold View
      if (rootScreenJsonData.scaffoldData!.widgetId != null) {
        WidgetModel scaffoldData = WidgetModel(
          id: rootScreenJsonData.scaffoldData!.widgetId,
          title: getWidgetTitle(WidgetTypeRootView),
          displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeRootView), getWidgetTitle(WidgetTypeRootView)),
          widgetSubType: WidgetTypeRootView,
          widgetViewModel: rootScreenJsonData.scaffoldData!.scaffold,
          widgetType: WidgetTypeRootView,
        );

        /// Update existing rootView
        rootView = scaffoldData;
      } else {
        rootView = null;
      }

      /// Assign widgets list to Store class.
      selectedWidgetList.addAll(widgetList);
    } else {
      List<WidgetModel> widgetList = [];
      selectedWidgetList.addAll(widgetList);
      appBarClass = null;
      bottomNavigationClass = null;
      drawerClass = null;
      rootView = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screenJsonData != null) {
      applyScreenJsonToView(widget.screenJsonData!);
    }

    Widget scaffoldBody(context) {
      WidgetModel rootModelView = selectedWidgetList[0];
      return subChildView(rootModelView);
    }

    Widget blankScreen() {
      return Container(
        width: 300,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(language!.emptyScreenTemplates, style: boldTextStyle(size: 15)),
          ],
        ),
      );
    }

    /// Scaffold background color
    getBackgroundColor() {
      if (rootView != null && rootView!.widgetViewModel != null) {
        if ((rootView!.widgetViewModel as RootViewClass).bgColor != null)
          return (rootView!.widgetViewModel as RootViewClass).getColor();
        else {
          return Colors.white;
        }
      } else {
        return Colors.white;
      }
    }

    return Scaffold(
      backgroundColor: getBackgroundColor(),
      body: (selectedWidgetList.length > 0) ? scaffoldBody(context) : blankScreen(),
      appBar: (appBarClass != null) ? (appBarClass!.widgetViewModel as AppBarClass).getAppBarWidget() as PreferredSizeWidget? : null,
      bottomNavigationBar: (bottomNavigationClass != null) ? (bottomNavigationClass!.widgetViewModel as BottomNavigationBarClass).getBottomNavigationBarWidget() : null,
      drawer: (drawerClass != null) ? (drawerClass!.widgetViewModel as LeftDrawerClass).getLeftDrawerWidget() : null,
    );
  }
}
