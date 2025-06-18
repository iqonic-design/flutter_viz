import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class TabClass {
  /// The tabText to display.
  String? tabText;

  /// Tab Icon
  dynamic tabIconDataJson;

  /// margin
  EdgeInsets? margin;

  TabClass({
    this.tabText,
    this.tabIconDataJson,
    this.margin,
  });

  TabClass.fromJson(Map<String, dynamic> json) {
    tabText = json['tabText'] != null ? json['tabText'] : DEFAULT_TAB_NAME;
    tabIconDataJson = json['tabIconDataJson'] != null ? json['tabIconDataJson'] : {'iconName': 'add', 'codePoint': 58727, 'fontFamily': 'MaterialIcons'};
    margin = json['margin'] != null ? fromJsonMargin(json['margin']) : EdgeInsets.zero;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tabText != null) {
      data['tabText'] = this.tabText;
    }
    if (this.tabIconDataJson != null) {
      data['tabIconDataJson'] = this.tabIconDataJson;
    }
    if (this.margin != null) {
      data['margin'] = toJsonMargin(this.margin!);
    }
    return data;
  }

  Widget getTabWidget() {
    return Tab(
      // Properties
      text: tabText ?? DEFAULT_TAB_NAME,
      // Properties
      icon: Icon(
        tabIconDataJson != null ? IconData(tabIconDataJson['codePoint'], fontFamily: tabIconDataJson['fontFamily']) : Icons.add,
      ),
      // Properties
      iconMargin: margin ?? EdgeInsets.zero,
    );
  }

  /// For view code
  getCodeAsString() {
    return "\nTab(\n"
        "text:tabText ?? DEFAULT_TAB_NAME,\n"
        "icon:Icon(\n"
        "${tabIconDataJson != null ? 'Icons.${tabIconDataJson['iconName']}' : 'Icons.add'},\n"
        "),\n"
        "iconMargin: ${margin ?? EdgeInsets.zero},\n"
        ")";
  }
}
