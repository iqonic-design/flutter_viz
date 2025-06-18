import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class OpacityClass {
  ///The number of clockwise quarter turns the child should be rotated
  double? opacity;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  OpacityClass({
    this.opacity,
    this.isExpanded = false,
    this.flex = 1,
  });

  OpacityClass.fromJson(Map<String, dynamic> json) {
    opacity = json['opacity'] != null ? json['opacity'] : DEFAULT_OPACITY;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.opacity != null) {
      data['opacity'] = this.opacity;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getOpacityWidget(WidgetModel widgetModel, {Widget? widget}) {
    Widget childData;
    if (widget != null) {
      childData = Opacity(
        opacity: opacity ?? DEFAULT_OPACITY,
        child: widget,
      );
    } else {
      childData = Opacity(
        opacity: opacity ?? DEFAULT_OPACITY,
        child: Text('Opacity Widget'),
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isOpacityExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  getOpacityString(bool isChild) {
    if (isChild) {
      return "Opacity(\n"
          "opacity:${opacity ?? DEFAULT_OPACITY},\n"
          "child:";
    } else {
      return "Opacity(\n"
          "opacity:${opacity ?? DEFAULT_OPACITY},\n"
          ")";
    }
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child";
  }

  /// For view code
  getCodeAsString(bool? isChild, WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getOpacityString(isChild!));
    } else {
      return getOpacityString(isChild!);
    }
  }

  /// End Code String
  getEndCodeAsString(bool isChild, WidgetModel widgetModel) {
    String finalString = "";
    if (isChild) {
      finalString = "),";
    }
    if (getExpanded(widgetModel, isExpanded)) {
      if (isChild) {
        return finalString + "),";
      } else {
        return finalString + ")";
      }
    }
    return finalString;
  }
}
