import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class TabBarClass {
  ///Label color
  Color? labelColor;

  ///Label Padding
  EdgeInsets? labelPadding;

  ///Label color
  Color? indicatorColor;

  TabBarClass({
    this.labelColor,
    this.labelPadding,
    this.indicatorColor,
  });

  TabBarClass.fromJson(Map<String, dynamic> json) {
    labelColor = json['labelColor'] != null ? fromJsonColor(json['labelColor']) : DEFAULT_TAB_BAR_LABEL_COLOR;
    labelPadding = json['labelPadding'] != null ? fromJsonPadding(json['labelPadding']) : EdgeInsets.zero;
    indicatorColor = json['indicatorColor'] != null ? fromJsonColor(json['indicatorColor']) : DEFAULT_TAB_BAR_INDICATOR_COLOR;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.labelColor != null) {
      data['labelColor'] = toJsonColor(this.labelColor!);
    }
    if (this.labelPadding != null) {
      data['labelPadding'] = toJsonPadding(this.labelPadding!);
    }
    if (this.indicatorColor != null) {
      data['indicatorColor'] = toJsonColor(this.indicatorColor!);
    }

    return data;
  }

  Widget getTabBarWidget({Widget? widget}) {
    if (widget != null) {
      return TabBar(
        // Properties
        labelColor: labelColor ?? DEFAULT_TAB_BAR_LABEL_COLOR,
        // Properties
        labelPadding: labelPadding ?? EdgeInsets.zero,
        // Properties
        indicatorColor: indicatorColor ?? DEFAULT_TAB_BAR_INDICATOR_COLOR,
        tabs: <Widget>[
          widget,
        ],
      );
    } else {
      return TabBar(
        // Properties
        labelColor: labelColor ?? DEFAULT_TAB_BAR_LABEL_COLOR,
        // Properties
        labelPadding: labelPadding ?? EdgeInsets.zero,
        // Properties
        indicatorColor: indicatorColor ?? DEFAULT_TAB_BAR_INDICATOR_COLOR,
        tabs: [],
      );
    }
  }

  getTabBarString(bool isChild) {
    if (isChild) {
      return "\nTabBar(\n,"
          "labelColor: ${labelColor ?? DEFAULT_TAB_BAR_LABEL_COLOR},\n"
          "labelPadding: ${labelPadding ?? EdgeInsets.zero},\n"
          "indicatorColor: ${indicatorColor ?? DEFAULT_TAB_BAR_INDICATOR_COLOR},\n"
          "tabs: <Widget>[\n";
    } else {
      return "\nTabBar(\n,"
          "labelColor: ${labelColor ?? DEFAULT_TAB_BAR_LABEL_COLOR},\n"
          "labelPadding: ${labelPadding ?? EdgeInsets.zero},\n"
          "indicatorColor: ${indicatorColor ?? DEFAULT_TAB_BAR_INDICATOR_COLOR},\n"
          "tabs: <Widget>[]\n"
          ")";
    }
  }

  /// For view code
  getCodeAsString(isChild) {
    return getTabBarString(isChild);
  }
}
