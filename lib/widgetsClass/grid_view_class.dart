import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class GridViewClass {
  /// Padding
  EdgeInsets? padding;

  ///shrinkWrap
  bool? shrinkWrap;

  ///Scroll Direction
  String? axis;

  ///scrollPhysics
  String? scrollPhysics;

  ///A widget that attempts to size the child to a specific aspect ratio.
  double? childAspectRatio;

  ///specify the number of columns in a grid view
  int? crossAxisCount;

  ///specify the number of pixels between widgets to all the children listed in the main axis
  double? mainAxisSpacing;

  /// specify the number of pixels between widgets to all the children listed in the cross axis
  double? crossAxisSpacing;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  GridViewClass({
    this.padding,
    this.shrinkWrap = false,
    this.scrollPhysics,
    this.axis = AxisVertical,
    this.childAspectRatio,
    this.crossAxisCount,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = true,
    this.flex = 1,
  });

  GridViewClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    shrinkWrap = json['shrinkWrap'] != null ? json['shrinkWrap'] : false;
    axis = json['axis'] != null ? json['axis'] : AxisVertical;
    scrollPhysics = json['scrollPhysics'] != null ? json['scrollPhysics'] : ScrollScrollPhysics;
    childAspectRatio = json['childAspectRatio'] != null ? json['childAspectRatio'] : DEFAULT_CHILD_ASPECT_RATIO;
    crossAxisCount = json['crossAxisCount'] != null ? json['crossAxisCount'] : DEFAULT_CROSS_AXIS_COUNT;
    crossAxisSpacing = json['crossAxisSpacing'] != null ? json['crossAxisSpacing'] : DEFAULT_CROSS_AXIS_SPACING;
    mainAxisSpacing = json['mainAxisSpacing'] != null ? json['mainAxisSpacing'] : DEFAULT_MAIN_AXIS_SPACING;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : true;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.shrinkWrap != null) {
      data['shrinkWrap'] = this.shrinkWrap;
    }
    if (this.axis != null) {
      data['axis'] = this.axis;
    }
    if (this.scrollPhysics != null) {
      data['scrollPhysics'] = this.scrollPhysics;
    }
    if (this.childAspectRatio != null) {
      data['childAspectRatio'] = this.childAspectRatio;
    }
    if (this.crossAxisCount != null) {
      data['crossAxisCount'] = this.crossAxisCount;
    }
    if (this.crossAxisSpacing != null) {
      data['crossAxisSpacing'] = this.crossAxisSpacing;
    }
    if (this.mainAxisSpacing != null) {
      data['mainAxisSpacing'] = this.mainAxisSpacing;
    }
    if (this.horizontalAlignment != null && this.verticalAlignment != null) {
      data['horizontalAlignment'] = this.horizontalAlignment;
      data['verticalAlignment'] = this.verticalAlignment;
    } else if (this.horizontalAlignment != null) {
      data['horizontalAlignment'] = this.horizontalAlignment;
    } else if (this.verticalAlignment != null) {
      data['verticalAlignment'] = this.verticalAlignment;
    }
    if (this.isAlignX != null) {
      data['isAlignX'] = this.isAlignX;
    }
    if (this.isAlignY != null) {
      data['isAlignY'] = this.isAlignY;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getGridViewDefaultWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    Widget childData;
    if (widget != null) {
      childData = GridView(
          padding: padding ?? EdgeInsets.zero,
          shrinkWrap: shrinkWrap ?? false,
          scrollDirection: getAxis(axis: axis ?? AxisVertical),
          physics: scrollPhysics != null ? getScrollPhysics(scrollPhysics: scrollPhysics) : ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount != null && crossAxisCount! > 0 ? crossAxisCount! : DEFAULT_CROSS_AXIS_COUNT,
            crossAxisSpacing: crossAxisSpacing ?? DEFAULT_CROSS_AXIS_SPACING,
            mainAxisSpacing: mainAxisSpacing ?? DEFAULT_MAIN_AXIS_SPACING,
            childAspectRatio: childAspectRatio != null && childAspectRatio! > 0 ? childAspectRatio! : DEFAULT_CHILD_ASPECT_RATIO,
          ),
          children: widget);
    } else {
      childData = GridView(
        padding: padding ?? EdgeInsets.zero,
        shrinkWrap: shrinkWrap ?? false,
        scrollDirection: getAxis(axis: axis ?? AxisVertical),
        physics: scrollPhysics != null ? getScrollPhysics(scrollPhysics: scrollPhysics) : ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount != null && crossAxisCount! > 0 ? crossAxisCount! : DEFAULT_CROSS_AXIS_COUNT,
          crossAxisSpacing: crossAxisSpacing ?? DEFAULT_CROSS_AXIS_SPACING,
          mainAxisSpacing: mainAxisSpacing ?? DEFAULT_MAIN_AXIS_SPACING,
          childAspectRatio: childAspectRatio != null && childAspectRatio! > 0 ? childAspectRatio! : DEFAULT_CHILD_ASPECT_RATIO,
        ),
        children: [],
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isGridViewExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  _getGridViewAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getGridViewWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getGridViewAlign(getGridViewDefaultWidget(widgetModel, widget: widget));
    } else {
      return getGridViewDefaultWidget(widgetModel, widget: widget);
    }
  }

  /// For view code
  getGridViewString(bool isChild) {
    if (isChild) {
      return "\nGridView( \n"
          "padding:${getPaddingString(padding) ?? EdgeInsets.zero},\n"
          "shrinkWrap:${shrinkWrap ?? false},\n"
          "scrollDirection:${axis != null ? getAxis(axis: axis) : Axis.vertical},\n"
          "physics:${scrollPhysics != null ? "$scrollPhysics()" : "ScrollPhysics()"}, \n"
          "gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( \n"
          "crossAxisCount:${crossAxisCount != null && crossAxisCount! > 0 ? crossAxisCount : DEFAULT_CROSS_AXIS_COUNT},\n"
          "crossAxisSpacing:${crossAxisSpacing ?? DEFAULT_CROSS_AXIS_SPACING},\n"
          "mainAxisSpacing:${mainAxisSpacing ?? DEFAULT_MAIN_AXIS_SPACING},\n"
          "childAspectRatio:${childAspectRatio != null && childAspectRatio! > 0 ? childAspectRatio : DEFAULT_CHILD_ASPECT_RATIO},\n"
          "),\n"
          "children:[";
    } else {
      return "\nGridView( \n"
          "padding:${getPaddingString(padding) ?? EdgeInsets.zero},\n"
          "shrinkWrap:${shrinkWrap ?? false},\n"
          "scrollDirection:${axis != null ? getAxis(axis: axis) : Axis.vertical},\n"
          "physics:${scrollPhysics != null ? "$scrollPhysics()" : "ScrollPhysics()"}, \n"
          "gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( \n"
          "crossAxisCount:${crossAxisCount != null && crossAxisCount! > 0 ? crossAxisCount : DEFAULT_CROSS_AXIS_COUNT},\n"
          "crossAxisSpacing:${crossAxisSpacing ?? DEFAULT_CROSS_AXIS_SPACING},\n"
          "mainAxisSpacing:${mainAxisSpacing ?? DEFAULT_MAIN_AXIS_SPACING},\n"
          "childAspectRatio:${childAspectRatio != null && childAspectRatio! > 0 ? childAspectRatio : DEFAULT_CHILD_ASPECT_RATIO},\n"
          "),\n"
          "children:[],\n"
          ")";
    }
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child";
  }

  _getStringAlign(String _child) {
    return "Align(\n"
        "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:$_child";
  }

  /// For view code
  getCodeAsString(bool? isChild, WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(getGridViewString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getGridViewString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getGridViewString(isChild!));
    } else {
      return getGridViewString(isChild!);
    }
  }

  /// End Code String
  getEndCodeAsString(bool isChild, WidgetModel widgetModel) {
    String finalString = "";
    if (isChild) {
      finalString = "],),";
    }

    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),),";
    } else if (getExpanded(widgetModel, isExpanded)) {
      return finalString + "),";
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),";
    } else {
      return finalString;
    }
  }
}
