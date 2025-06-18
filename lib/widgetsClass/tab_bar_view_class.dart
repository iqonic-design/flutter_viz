import 'package:flutter/material.dart';

class TabBarViewClass {
  TabBarViewClass();

  TabBarViewClass.fromJson(Map<String, dynamic>? json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }

  Widget getTabBarViewWidget({Widget? widget}) {
    if (widget != null) {
      return TabBarView(
        children: <Widget>[widget],
      );
    } else {
      return TabBarView(
        children: [],
      );
    }
  }

  getTabBarString(isChild) {
    if (isChild) {
      return "\nTabBarView(,\n"
          "children: <Widget>[,\n";
    } else {
      return "\nTabBarView(,\n"
          "children: [],\n"
          ")";
    }
  }

  /// For view code
  getCodeAsString(isChild) {
    return getTabBarString(isChild);
  }
}
