import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class DividerClass {
  /// Divider Color
  Color? dividerColor;

  /// Divider height
  double? height;

  /// Divider thickness
  double? dividerThickness;

  /// Divider indent
  double? dividerIndent;

  /// Divider endIndent
  double? dividerEndIndent;

  /// Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  DividerClass({
    this.dividerColor,
    this.height,
    this.dividerThickness,
    this.dividerIndent,
    this.dividerEndIndent,
    this.isExpanded = false,
    this.flex = 1,
  });

  DividerClass.fromJson(Map<String, dynamic> json) {
    dividerColor = json['dividerColor'] != null ? fromJsonColor(json['dividerColor']) : DEFAULT_DIVIDER_COLOR;
    height = json['height'] != null ? json['height'] : DEFAULT_DIVIDER_HEIGHT as double?;
    dividerThickness = json['dividerThickness'] != null ? json['dividerThickness'] : DEFAULT_DIVIDER_THICKNESS;
    dividerIndent = json['dividerIndent'] != null ? json['dividerIndent'] : DEFAULT_DIVIDER_INDENT;
    dividerEndIndent = json['dividerEndIndent'] != null ? json['dividerEndIndent'] : DEFAULT_DIVIDER_END_INDENT;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dividerColor != null) {
      data['dividerColor'] = toJsonColor(this.dividerColor!);
    }
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.dividerThickness != null) {
      data['dividerThickness'] = this.dividerThickness;
    }
    if (this.dividerIndent != null) {
      data['dividerIndent'] = this.dividerIndent;
    }
    if (this.dividerEndIndent != null) {
      data['dividerEndIndent'] = this.dividerEndIndent;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getDividerDefaultWidget(WidgetModel widgetModel) {
    Widget childData = Divider(
      color: dividerColor ?? DEFAULT_DIVIDER_COLOR,
      height: height ?? DEFAULT_DIVIDER_HEIGHT as double?,
      thickness: dividerThickness ?? DEFAULT_DIVIDER_THICKNESS,
      indent: dividerIndent ?? DEFAULT_DIVIDER_INDENT,
      endIndent: dividerEndIndent ?? DEFAULT_DIVIDER_END_INDENT,
    );
    return getGestureDetector(widgetModel, childData);
  }

  Widget getDividerWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded)) {
      return Expanded(
        child: getDividerDefaultWidget(widgetModel),
        flex: flex ?? 1,
      );
    } else {
      return getDividerDefaultWidget(widgetModel);
    }
  }

  getDividerString() {
    return "Divider(\n"
        "color:${dividerColor ?? DEFAULT_DIVIDER_COLOR},\n"
        "height:${height ?? DEFAULT_DIVIDER_HEIGHT},\n"
        "thickness:${dividerThickness ?? DEFAULT_DIVIDER_THICKNESS},\n"
        "indent:${dividerIndent ?? DEFAULT_DIVIDER_INDENT},\n"
        "endIndent:${dividerEndIndent ?? DEFAULT_DIVIDER_END_INDENT},\n"
        ")";
  }

  /// For view code
  getCodeAsString(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded)) {
      return "Expanded(\n"
          "flex: ${flex ?? 1},\n"
          "child: ${getDividerString()},\n"
          ")";
    } else {
      return getDividerString();
    }
  }
}
