import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class RowClass {
  /// Padding
  EdgeInsets? padding;

  ///You control how a row or column aligns its children using the mainAxisAlignment
  String? mainAxisAlignment;

  ///You control how a row or column aligns its children using the crossAxisAlignment
  String? crossAxisAlignment;

  ///MainAxisSize
  String? mainAxisSize;

  ///Is Scrollable
  bool? isScrollable;

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

  RowClass({
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.isScrollable = false,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  RowClass.fromJson(Map<String, dynamic> json) {
    mainAxisAlignment = json['mainAxisAlignment'] != null ? json['mainAxisAlignment'] : AxisAlignmentStart;
    crossAxisAlignment = json['crossAxisAlignment'] != null ? json['crossAxisAlignment'] : AxisAlignmentCenter;
    mainAxisSize = json['mainAxisSize'] != null ? json['mainAxisSize'] : AxisMax;
    isScrollable = json['isScrollable'] != null ? json['isScrollable'] : false;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainAxisAlignment != null) {
      data['mainAxisAlignment'] = this.mainAxisAlignment;
    }

    if (this.crossAxisAlignment != null) {
      data['crossAxisAlignment'] = this.crossAxisAlignment;
    }

    if (this.mainAxisSize != null) {
      data['mainAxisSize'] = this.mainAxisSize;
    }

    if (this.isScrollable != null) {
      data['isScrollable'] = this.isScrollable;
    }

    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
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

  Widget getRowDefaultWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    Widget childData;
    if (widget != null) {
      childData = Row(
        mainAxisAlignment: mainAxisAlignment != null ? getMainAxisAlignment(mainAxisAlignment: mainAxisAlignment) : MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment != null ? getCrossAxisAlignment(crossAxisAlignment: crossAxisAlignment) : CrossAxisAlignment.center,
        mainAxisSize: mainAxisSize != null ? getMainAxisSize(axisSize: mainAxisSize) : MainAxisSize.max,
        children: widget,
      );
    } else {
      childData = Row(
        mainAxisAlignment: mainAxisAlignment != null ? getMainAxisAlignment(mainAxisAlignment: mainAxisAlignment) : MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment != null ? getCrossAxisAlignment(crossAxisAlignment: crossAxisAlignment) : CrossAxisAlignment.center,
        mainAxisSize: mainAxisSize != null ? getMainAxisSize(axisSize: mainAxisSize) : MainAxisSize.max,
        children: [],
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isRowExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  _getRowPadding(Widget _child) {
    return Padding(
      padding: padding!,
      child: _child,
    );
  }

  _getRowAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  _getRowSingleChildScrollView(Widget _child) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal, child: _child);
  }

  Widget getRowWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return _getRowAlign(_getRowPadding(_getRowSingleChildScrollView(getRowDefaultWidget(widgetModel, widget: widget))));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRowAlign(_getRowPadding(getRowDefaultWidget(widgetModel, widget: widget)));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return _getRowAlign(_getRowSingleChildScrollView(getRowDefaultWidget(widgetModel, widget: widget)));
    } else if (getPadding(padding) && isScrollable!) {
      return _getRowPadding(_getRowSingleChildScrollView(getRowDefaultWidget(widgetModel, widget: widget)));
    } else if (getPadding(padding)) {
      return _getRowPadding(getRowDefaultWidget(widgetModel, widget: widget));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRowAlign(getRowDefaultWidget(widgetModel, widget: widget));
    } else if (isScrollable!) {
      return _getRowSingleChildScrollView(getRowDefaultWidget(widgetModel, widget: widget));
    } else {
      return getRowDefaultWidget(widgetModel, widget: widget);
    }
  }

  getRowString(bool isChild) {
    if (isChild) {
      return "Row(\n"
          "mainAxisAlignment:${mainAxisAlignment != null ? getMainAxisAlignment(mainAxisAlignment: mainAxisAlignment) : MainAxisAlignment.start},\n"
          "crossAxisAlignment:${crossAxisAlignment != null ? getCrossAxisAlignment(crossAxisAlignment: crossAxisAlignment) : CrossAxisAlignment.center},\n"
          "mainAxisSize:${mainAxisSize != null ? getMainAxisSize(axisSize: mainAxisSize) : MainAxisSize.max},\n"
          "children:[\n";
    } else {
      return "\nRow(\n"
          "mainAxisAlignment:${mainAxisAlignment != null ? getMainAxisAlignment(mainAxisAlignment: mainAxisAlignment) : MainAxisAlignment.start},\n"
          "crossAxisAlignment:${crossAxisAlignment != null ? getCrossAxisAlignment(crossAxisAlignment: crossAxisAlignment) : CrossAxisAlignment.center},\n"
          "mainAxisSize:${mainAxisSize != null ? getMainAxisSize(axisSize: mainAxisSize) : MainAxisSize.max},\n"
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

  _getStringPadding(String _child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$_child";
  }

  _getStringSingleChildScrollView(String _child) {
    return "SingleChildScrollView(\n"
        "scrollDirection: Axis.horizontal,\n"
        "child:$_child";
  }

  /// For view code
  getCodeAsString(bool? isChild, WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding) && isScrollable!) {
      return _getStringExpanded(_getStringAlign(_getStringPadding(_getStringSingleChildScrollView(getRowString(isChild!)))));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      return _getStringExpanded(_getStringAlign(_getStringPadding(getRowString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return _getStringExpanded(_getStringAlign(_getStringSingleChildScrollView(getRowString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && isScrollable!) {
      return _getStringExpanded(_getStringPadding(_getStringSingleChildScrollView(getRowString(isChild!))));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return _getStringAlign(_getStringPadding(_getStringSingleChildScrollView(getRowString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(getRowString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getRowString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded) && isScrollable!) {
      return _getStringExpanded(_getStringSingleChildScrollView(getRowString(isChild!)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(_getStringPadding(getRowString(isChild!)));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return _getStringAlign(_getStringSingleChildScrollView(getRowString(isChild!)));
    } else if (getPadding(padding) && isScrollable!) {
      return _getStringPadding(_getStringSingleChildScrollView(getRowString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getRowString(isChild!));
    } else if (getPadding(padding)) {
      return _getStringPadding(getRowString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getRowString(isChild!));
    } else if (isScrollable!) {
      return _getStringSingleChildScrollView(getRowString(isChild!));
    } else {
      return getRowString(isChild!);
    }
  }

  /// End code string
  getEndCodeAsString(bool isChild, WidgetModel widgetModel) {
    String finalString = "";
    if (isChild) {
      finalString = "],),";
    }
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding) && isScrollable!) {
      return finalString + "),),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      return finalString + "),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return finalString + "),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && isScrollable!) {
      return finalString + "),),),";
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return finalString + "),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),),";
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return finalString + "),),";
    } else if (getExpanded(widgetModel, isExpanded) && isScrollable!) {
      return finalString + "),),";
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),),";
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && isScrollable!) {
      return finalString + "),),";
    } else if (getPadding(padding) && isScrollable!) {
      return finalString + "),),";
    } else if (getExpanded(widgetModel, isExpanded)) {
      return finalString + "),";
    } else if (getPadding(padding)) {
      return finalString + "),";
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),";
    } else if (isScrollable!) {
      return finalString + "),";
    } else {
      return finalString;
    }
  }
}
