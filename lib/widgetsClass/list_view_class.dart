import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class ListViewClass {
  /// Padding
  EdgeInsets? padding;

  ///you can change this behavior so that the ListView only occupies the space it needs
  bool? shrinkWrap;

  ///Scroll Direction
  String? axis;

  ///scrollPhysics
  String? scrollPhysics;

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

  ListViewClass({
    this.padding,
    this.shrinkWrap = false,
    this.axis = AxisVertical,
    this.scrollPhysics,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = true,
    this.flex = 1,
  });

  ListViewClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    shrinkWrap = json['shrinkWrap'] != null ? json['shrinkWrap'] : false;
    axis = json['axis'] != null ? json['axis'] : AxisVertical;
    scrollPhysics = json['scrollPhysics'] != null ? json['scrollPhysics'] : ScrollScrollPhysics;
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

  Widget getDefaultListViewWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    Widget childData;
    if (widget != null) {
      childData = ListView(
        scrollDirection: axis != null ? getAxis(axis: axis) : Axis.vertical,
        padding: padding ?? EdgeInsets.zero,
        shrinkWrap: shrinkWrap ?? false,
        physics: scrollPhysics != null ? getScrollPhysics(scrollPhysics: scrollPhysics) : ScrollPhysics(),
        children: widget,
      );
    } else {
      childData = ListView(
        scrollDirection: axis != null ? getAxis(axis: axis) : Axis.vertical,
        padding: padding ?? EdgeInsets.zero,
        shrinkWrap: shrinkWrap ?? false,
        physics: scrollPhysics != null ? getScrollPhysics(scrollPhysics: scrollPhysics) : ScrollPhysics(),
        children: [],
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isListViewExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded);
    return layoutExpanded;
  }

  _getListViewAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getListViewWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getListViewAlign(getDefaultListViewWidget(widgetModel, widget: widget));
    } else {
      return getDefaultListViewWidget(widgetModel, widget: widget);
    }
  }

  getListViewString(bool isChild) {
    if (isChild) {
      return "\nListView(\n"
          "scrollDirection: ${axis != null ? getAxis(axis: axis) : Axis.vertical},\n"
          "padding:${getPaddingString(padding) ?? EdgeInsets.zero},\n"
          "shrinkWrap:${shrinkWrap ?? false},\n"
          "physics:${scrollPhysics != null ? '$scrollPhysics()' : "ScrollPhysics()"}, \n"
          "children:[\n";
    } else {
      return "\nListView(\n"
          "scrollDirection: ${axis != null ? getAxis(axis: axis) : Axis.vertical},\n"
          "padding:${getPaddingString(padding) ?? EdgeInsets.zero},\n"
          "shrinkWrap:${shrinkWrap ?? false},\n"
          "physics:${scrollPhysics != null ? '$scrollPhysics()' : "ScrollPhysics()"}, \n"
          "children:[],\n"
          ")";
    }
  }

  _getStringExpanded(String _child) {
    return "\nExpanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child";
  }

  _getStringAlign(String _child) {
    return "\nAlign(\n"
        "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:$_child";
  }

  /// For view code
  getCodeAsString(bool? isChild, WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(getListViewString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getListViewString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getListViewString(isChild!));
    } else {
      return getListViewString(isChild!);
    }
  }

  /// End code string
  getEndCodeAsString(bool isChild, WidgetModel widgetModel) {
    String finalString = "";
    if (isChild) {
      finalString = "],),";
    }
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + '),),';
    } else if (getExpanded(widgetModel, isExpanded)) {
      return finalString + '),';
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + '),';
    } else {
      return finalString;
    }
  }
}
