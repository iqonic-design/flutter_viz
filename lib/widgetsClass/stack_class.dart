import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';

class StackClass {
  /// padding
  EdgeInsets? padding;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  ///Height
  double? height;

  ///Width
  double? width;

  /// width type
  String? widthType;

  /// height type
  String? heightType;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  ///Alignment
  String? alignment;

  StackClass({
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.height,
    this.width,
    this.widthType = TypePX,
    this.heightType = TypePX,
    this.isExpanded = false,
    this.flex = 1,
    this.alignment = AlignmentTypeTopLeft,
  });

  StackClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    height = json['height'] != null ? fromJsonHeight(json['height'], heightType ?? TypePX) : null;
    width = json['width'] != null ? fromJsonWidth(json['width'], widthType ?? TypePX) : null;
    widthType = json['widthType'] != null ? json['widthType'] : TypePX;
    heightType = json['heightType'] != null ? json['heightType'] : TypePX;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
    alignment = json['alignment'] != null ? json['alignment'] : AlignmentTypeTopLeft;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.width != null) {
      data['width'] = this.width;
    }
    if (this.widthType != null) {
      data['widthType'] = this.widthType;
    }
    if (this.heightType != null) {
      data['heightType'] = this.heightType;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    if (this.alignment != null) {
      data['alignment'] = this.alignment;
    }
    return data;
  }

  Widget getStackDefaultWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    Widget childData;
    if (widget != null) {
      childData = SizedBox(
        height: height != null ? fromJsonHeight(height, heightType) : DEFAULT_STACK_HEIGHT,
        width: width != null ? fromJsonWidth(width, widthType) : DEFAULT_STACK_WIDTH,
        child: Stack(
          alignment: getAlignment(alignment)!,
          children: widget,
        ),
      );
    } else {
      childData = SizedBox(
        height: height != null ? fromJsonHeight(height, heightType) : DEFAULT_STACK_HEIGHT,
        width: width != null ? fromJsonWidth(width, widthType) : DEFAULT_STACK_WIDTH,
        child: Stack(
          alignment: getAlignment(alignment)!,
          children: [
            //
          ],
        ),
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isStackExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  _getStackAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  _getStackPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  Widget getStackWidget(WidgetModel widgetModel, {List<Widget>? widget}) {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStackPadding(_getStackAlign(getStackDefaultWidget(widgetModel, widget: widget)));
    } else if (getPadding(padding)) {
      return _getStackPadding(getStackDefaultWidget(widgetModel, widget: widget));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStackAlign(getStackDefaultWidget(widgetModel, widget: widget));
    } else {
      return getStackDefaultWidget(widgetModel, widget: widget);
    }
  }

  getStackString(bool isChild) {
    if (isChild) {
      return "\nStack(\n"
          "${getAlignment(alignment) != null ? "alignment:${getAlignment(alignment)},\n" : ""}"
          "children: [";
    } else {
      return "\nStack(\n"
          "${getAlignment(alignment) != null ? "alignment:${getAlignment(alignment)},\n" : ""}"
          "children: [],\n"
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

  _getStringSizedBox(String _child) {
    return "SizedBox(\n"
        "${height != null ? 'height:${getHeightString(height, heightType)},\n' : ''}"
        "${width != null ? 'width:${getWidthString(width, widthType)},\n' : ''}"
        "child:$_child";
  }

  /// For view code
  getCodeAsString(bool? isChild, WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) &&
        getPadding(padding) &&
        getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) &&
        (height != null || width != null)) {
      return _getStringExpanded(_getStringAlign(_getStringPadding(_getStringSizedBox(getStackString(isChild!)))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(_getStringPadding(getStackString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && (height != null || width != null)) {
      return _getStringExpanded(_getStringPadding(_getStringSizedBox(getStackString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && (height != null || width != null)) {
      return _getStringExpanded(_getStringAlign(_getStringSizedBox(getStackString(isChild!))));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && (height != null || width != null)) {
      return _getStringAlign(_getStringPadding(_getStringSizedBox(getStackString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getStackString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(getStackString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded) && (height != null || width != null)) {
      return _getStringExpanded(_getStringSizedBox(getStackString(isChild!)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(_getStringPadding(getStackString(isChild!)));
    } else if (getPadding(padding) && (height != null || width != null)) {
      return _getStringPadding(_getStringSizedBox(getStackString(isChild!)));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && (height != null || width != null)) {
      return _getStringAlign(_getStringSizedBox(getStackString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getStackString(isChild!));
    } else if (getPadding(padding)) {
      return _getStringPadding(getStackString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getStackString(isChild!));
    } else if ((height != null || width != null)) {
      return _getStringSizedBox(getStackString(isChild!));
    } else {
      return getStackString(isChild!);
    }
  }

  /// End code string
  getEndCodeAsString(bool isChild, WidgetModel widgetModel) {
    String finalString = "";
    if (isChild) {
      finalString = "],),";
    }

    if (getExpanded(widgetModel, isExpanded) &&
        getPadding(padding) &&
        getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) &&
        (height != null || width != null)) {
      return finalString + "),),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && (height != null || width != null)) {
      return finalString + "),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && (height != null || width != null)) {
      return finalString + "),),),";
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && (height != null || width != null)) {
      return finalString + "),),),";
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return finalString + "),),";
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),),";
    } else if (getExpanded(widgetModel, isExpanded) && (height != null || width != null)) {
      return finalString + "),),";
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),),";
    } else if (getPadding(padding) && (height != null || width != null)) {
      return finalString + "),),";
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && (height != null || width != null)) {
      return finalString + "),),";
    } else if (getExpanded(widgetModel, isExpanded)) {
      return finalString + "),";
    } else if (getPadding(padding)) {
      return finalString + "),";
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return finalString + "),";
    } else if ((height != null || width != null)) {
      return finalString + "),";
    } else {
      return finalString;
    }
  }
}
