import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgetsClass/app_bar_class.dart';
import 'package:flutter_viz/widgetsClass/bottom_navigation_bar_class.dart';
import 'package:flutter_viz/widgetsClass/left_drawer_class.dart';
import 'package:flutter_viz/widgetsClass/root_view_class.dart';

import 'screen_json_data.dart';

class RootScreenJsonData {
  ScreenJsonData? widgetsData;
  ScaffoldData? scaffoldData;
  AppBarData? appBarData;
  BottomNavigationBarData? bottomNavigationBarData;
  LeftDrawerData? drawerData;

  RootScreenJsonData({this.widgetsData, this.scaffoldData, this.appBarData, this.bottomNavigationBarData, this.drawerData});

  RootScreenJsonData.fromJson(Map<String, dynamic> json) {
    widgetsData = json[JSON_WIDGET_DATA] != null ? new ScreenJsonData.fromJson(json[JSON_WIDGET_DATA]) : null;
    scaffoldData = json[JSON_SCAFFOLD_DATA] != null ? new ScaffoldData.fromJson(json[JSON_SCAFFOLD_DATA]) : null;
    if (json[JSON_APPBAR_DATA] != null) {
      appBarData = new AppBarData.fromJson(json[JSON_APPBAR_DATA]);
    }
    if (json[JSON_BOTTOM_BAR_NAVIGATION_DATA] != null) {
      bottomNavigationBarData = new BottomNavigationBarData.fromJson(json[JSON_BOTTOM_BAR_NAVIGATION_DATA]);
    }
    if (json[JSON_DRAWER_DATA] != null) {
      drawerData = new LeftDrawerData.fromJson(json[JSON_DRAWER_DATA]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.widgetsData != null) {
      data[JSON_WIDGET_DATA] = this.widgetsData!.toJson();
    }
    if (this.scaffoldData != null) {
      data[JSON_SCAFFOLD_DATA] = this.scaffoldData!.toJson();
    }
    if (this.appBarData != null) {
      data[JSON_APPBAR_DATA] = this.appBarData!.toJson();
    }
    if (this.bottomNavigationBarData != null) {
      data[JSON_BOTTOM_BAR_NAVIGATION_DATA] = this.bottomNavigationBarData!.toJson();
    }
    if (this.drawerData != null) {
      data[JSON_DRAWER_DATA] = this.drawerData!.toJson();
    }
    return data;
  }
}

class ScaffoldData {
  String? widgetId;
  String? type;
  String? subType;
  RootViewClass? scaffold;

  ScaffoldData({this.widgetId, this.type, this.subType, this.scaffold});

  ScaffoldData.fromJson(Map<String, dynamic> json) {
    widgetId = json[JSON_WIDGET_ID] != null ? json[JSON_WIDGET_ID] : "";
    type = json[JSON_TYPE] ?? "";
    subType = json[JSON_SUB_TYPE] ?? "";
    scaffold = json[WidgetTypeRootView] != null ? new RootViewClass.fromJson(json[WidgetTypeRootView]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[JSON_WIDGET_ID] = this.widgetId;
    data[JSON_TYPE] = this.type;
    data[JSON_SUB_TYPE] = this.subType;
    data[WidgetTypeRootView] = this.scaffold;
    return data;
  }
}

class AppBarData {
  String? widgetId;
  String? type;
  String? subType;
  AppBarClass? appbar;

  AppBarData({this.widgetId, this.type, this.subType, this.appbar});

  AppBarData.fromJson(Map<String, dynamic> json) {
    widgetId = json[JSON_WIDGET_ID] != null ? json[JSON_WIDGET_ID] : "";
    type = json[JSON_TYPE] ?? "";
    subType = json[JSON_SUB_TYPE] ?? "";
    appbar = json[WidgetTypeAppBar] != null ? new AppBarClass.fromJson(json[WidgetTypeAppBar]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[JSON_WIDGET_ID] = this.widgetId;
    data[JSON_TYPE] = this.type;
    data[JSON_SUB_TYPE] = this.subType;
    if (this.appbar != null) {
      data[WidgetTypeAppBar] = this.appbar!.toJson();
    }
    return data;
  }
}

class BottomNavigationBarData {
  String? widgetId;
  String? type;
  String? subType;
  BottomNavigationBarClass? bottomNavigationBar;

  BottomNavigationBarData({this.widgetId, this.type, this.subType, this.bottomNavigationBar});

  BottomNavigationBarData.fromJson(Map<String, dynamic> json) {
    widgetId = json[JSON_WIDGET_ID] != null ? json[JSON_WIDGET_ID] : "";
    type = json[JSON_TYPE] ?? "";
    subType = json[JSON_SUB_TYPE] ?? "";
    bottomNavigationBar = json[WidgetTypeBottomNavigationBar] != null ? new BottomNavigationBarClass.fromJson(json[WidgetTypeBottomNavigationBar]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[JSON_WIDGET_ID] = this.widgetId;
    data[JSON_TYPE] = this.type;
    data[JSON_SUB_TYPE] = this.subType;
    if (this.bottomNavigationBar != null) {
      data[WidgetTypeBottomNavigationBar] = this.bottomNavigationBar!.toJson();
    }
    return data;
  }
}

class LeftDrawerData {
  String? widgetId;
  String? type;
  String? subType;
  LeftDrawerClass? leftDrawer;

  LeftDrawerData({this.widgetId, this.type, this.subType, this.leftDrawer});

  LeftDrawerData.fromJson(Map<String, dynamic> json) {
    widgetId = json[JSON_WIDGET_ID] != null ? json[JSON_WIDGET_ID] : "";
    type = json[JSON_TYPE] ?? "";
    subType = json[JSON_SUB_TYPE] ?? "";
    leftDrawer = json[WidgetTypeLeftDrawer] != null ? new LeftDrawerClass.fromJson(json[WidgetTypeLeftDrawer]) : null;
  }

  Map<String, dynamic> toJson() {
    //printLogData("toJson" );
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[JSON_WIDGET_ID] = this.widgetId;
    data[JSON_TYPE] = this.type;
    data[JSON_SUB_TYPE] = this.subType;
    if (this.leftDrawer != null) {
      data[WidgetTypeLeftDrawer] = this.leftDrawer!.toJson();
    }
    return data;
  }
}
