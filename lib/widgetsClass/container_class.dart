import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class ContainerClass {
  /// BG Color
  Color? bgColor;

  /// Padding
  EdgeInsets? padding;

  /// margin
  EdgeInsets? margin;

  /// Border Width
  double? borderWidth;

  /// Border Radius
  BorderRadius? borderRadius;

  /// Border Color
  Color? borderColor;

  ///Alignment
  String? alignment;

  String? shape;
  double? height;
  double? width;

  /// width type
  String? widthType;

  /// height type
  String? heightType;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  /// Height isClear or not
  bool? isHeightClear;

  /// Width isClear or not
  bool? isWidthClear;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  ContainerClass({
    this.bgColor,
    this.padding,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.alignment = AlignmentTypeNone,
    this.shape,
    this.height,
    this.width,
    this.margin,
    this.widthType = TypePX,
    this.heightType = TypePX,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isHeightClear = false,
    this.isWidthClear = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  ContainerClass.fromJson(Map<String, dynamic> json) {
    bgColor = json['bgColor'] != null ? fromJsonColor(json['bgColor']) : DEFAULT_CONTAINER_BG_COLOR;
    alignment = json['alignment'] != null ? json['alignment'] : AlignmentTypeNone;
    height = json['height'] != null ? fromJsonHeight(json['height'], heightType ?? TypePX) : null;
    width = json['width'] != null ? fromJsonWidth(json['width'], widthType ?? TypePX) : null;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_CONTAINER_BORDER_COLOR;
    shape = json['shape'] != null ? json['shape'] : BoxShapeTypeRectangle;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    margin = json['margin'] != null ? fromJsonMargin(json['margin']) : EdgeInsets.zero;
    borderRadius = getBoxShape(shape) == BoxShape.circle ? null : (json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.zero);
    widthType = json['widthType'] != null ? json['widthType'] : TypePX;
    heightType = json['heightType'] != null ? json['heightType'] : TypePX;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isHeightClear = json['isHeightClear'] != null ? json['isHeightClear'] : false;
    isWidthClear = json['isWidthClear'] != null ? json['isWidthClear'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bgColor != null) {
      data['bgColor'] = toJsonColor(this.bgColor!);
    }
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.width != null) {
      data['width'] = this.width;
    }
    if (this.alignment != null) {
      data['alignment'] = this.alignment;
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.borderColor != null) {
      data['borderColor'] = toJsonColor(this.borderColor!);
    }
    if (this.shape != null) {
      data['shape'] = this.shape;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.margin != null) {
      data['margin'] = toJsonMargin(this.margin!);
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
    }
    if (this.widthType != null) {
      data['widthType'] = this.widthType;
    }
    if (this.heightType != null) {
      data['heightType'] = this.heightType;
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
    if (this.isHeightClear != null) {
      data['isHeightClear'] = this.isHeightClear;
    }
    if (this.isWidthClear != null) {
      data['isWidthClear'] = this.isWidthClear;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getDefaultContainerWidget(WidgetModel widgetModel, {Widget? widget, bool isDefault = false, BuildContext? context}) {
    Widget childData;
    if (widget != null) {
      childData = Container(
        child: widget,
        alignment: getAlignment(alignment),
        padding: padding ?? EdgeInsets.zero,
        margin: margin ?? EdgeInsets.zero,
        width: (isDefault) ? MediaQuery.of(context!).size.width : (isWidthClear! ? null : fromJsonWidth(width ?? DEFAULT_CONTAINER_WIDTH, widthType)),
        height: (isDefault) ? MediaQuery.of(context!).size.height : (isHeightClear! ? null : fromJsonHeight(height ?? DEFAULT_CONTAINER_HEIGHT, heightType)),
        decoration: BoxDecoration(
          color: bgColor ?? DEFAULT_CONTAINER_BG_COLOR,
          shape: shape != null ? getBoxShape(shape)! : BoxShape.rectangle,
          borderRadius: getBoxShape(shape) == BoxShape.circle ? null : (borderRadius ?? BorderRadius.zero),
          border: Border.all(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
        ),
      );
    } else {
      if (!isWidthClear! && !isHeightClear!) {
        childData = Container(
          alignment: getAlignment(alignment),
          padding: padding ?? EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          width: (isDefault) ? MediaQuery.of(context!).size.width : (fromJsonWidth(width ?? DEFAULT_CONTAINER_WIDTH, widthType)),
          height: (isDefault) ? MediaQuery.of(context!).size.height : (fromJsonHeight(height ?? DEFAULT_CONTAINER_HEIGHT, heightType)),
          decoration: BoxDecoration(
            color: bgColor ?? DEFAULT_CONTAINER_BG_COLOR,
            shape: shape != null ? getBoxShape(shape)! : BoxShape.rectangle,
            borderRadius: getBoxShape(shape) == BoxShape.circle ? null : (borderRadius ?? BorderRadius.zero),
            border: Border.all(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
          ),
        );
      } else if (!isWidthClear!) {
        childData = Container(
          alignment: getAlignment(alignment),
          padding: padding ?? EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          width: (isDefault) ? MediaQuery.of(context!).size.width : (fromJsonWidth(width ?? DEFAULT_CONTAINER_WIDTH, widthType)),
          height: (isDefault) ? MediaQuery.of(context!).size.height : (alignment == AlignmentTypeNone ? 0 : null),
          decoration: BoxDecoration(
            color: bgColor ?? DEFAULT_CONTAINER_BG_COLOR,
            shape: shape != null ? getBoxShape(shape)! : BoxShape.rectangle,
            borderRadius: getBoxShape(shape) == BoxShape.circle ? null : (borderRadius ?? BorderRadius.zero),
            border: Border.all(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
          ),
        );
      } else if (!isHeightClear!) {
        childData = Container(
          alignment: getAlignment(alignment),
          padding: padding ?? EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          height: (isDefault) ? MediaQuery.of(context!).size.height : (fromJsonHeight(height ?? DEFAULT_CONTAINER_HEIGHT, heightType)),
          width: (isDefault) ? MediaQuery.of(context!).size.width : (alignment == AlignmentTypeNone ? 0 : null),
          decoration: BoxDecoration(
            color: bgColor ?? DEFAULT_CONTAINER_BG_COLOR,
            shape: shape != null ? getBoxShape(shape)! : BoxShape.rectangle,
            borderRadius: getBoxShape(shape) == BoxShape.circle ? null : (borderRadius ?? BorderRadius.zero),
            border: Border.all(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
          ),
        );
      } else {
        childData = Container(
          alignment: getAlignment(alignment),
          padding: padding ?? EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          width: (isDefault) ? MediaQuery.of(context!).size.width : (alignment == AlignmentTypeNone ? 0 : null),
          height: (isDefault) ? MediaQuery.of(context!).size.height : (alignment == AlignmentTypeNone ? 0 : null),
          decoration: BoxDecoration(
            color: bgColor ?? DEFAULT_CONTAINER_BG_COLOR,
            shape: shape != null ? getBoxShape(shape)! : BoxShape.rectangle,
            borderRadius: getBoxShape(shape) == BoxShape.circle ? null : (borderRadius ?? BorderRadius.zero),
            border: Border.all(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
          ),
        );
      }
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isContainerExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  _getContainerAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getContainerWidget(WidgetModel widgetModel, {Widget? widget, isDefault = false, context}) {
    if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getContainerAlign(getDefaultContainerWidget(widgetModel, widget: widget, isDefault: isDefault, context: context));
    } else {
      return getDefaultContainerWidget(widgetModel, widget: widget, isDefault: isDefault, context: context);
    }
  }

  getContainerString(bool isChild) {
    if (isChild) {
      return "Container(\n"
          "${getAlignment(alignment) != null ? "alignment:${getAlignment(alignment)},\n" : ""}"
          "margin:${getPaddingString(margin) ?? EdgeInsets.zero},\n"
          "padding:${getPaddingString(padding) ?? EdgeInsets.zero},\n"
          "${isWidthClear! ? "" : "width:${getWidthString(width ?? DEFAULT_CONTAINER_WIDTH, widthType)},\n"}"
          "${isHeightClear! ? "" : "height:${getHeightString(height ?? DEFAULT_CONTAINER_HEIGHT, heightType)},\n"}"
          "decoration: BoxDecoration(\n"
          "color:${bgColor ?? DEFAULT_CONTAINER_BG_COLOR},\n"
          "shape:${shape != null ? getBoxShape(shape) : BoxShape.rectangle},\n"
          "${getBoxShape(shape) == BoxShape.circle ? "" : "borderRadius:${(borderRadius ?? BorderRadius.zero)},\n"}"
          "${(borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR).alpha != 0 ? 'border:Border.all(color:${borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR},width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
          "),\n"
          "child:";
    } else {
      return "Container(\n"
          "${getAlignment(alignment) != null ? "alignment:${getAlignment(alignment)},\n" : ""}"
          "margin:${getPaddingString(margin) ?? EdgeInsets.zero},\n"
          "padding:${getPaddingString(padding) ?? EdgeInsets.zero},\n"
          "${isWidthClear! ? "" : "width:${getWidthString(width ?? DEFAULT_CONTAINER_WIDTH, widthType)},\n"}"
          "${isHeightClear! ? "" : "height:${getHeightString(height ?? DEFAULT_CONTAINER_HEIGHT, heightType)},\n"}"
          "decoration: BoxDecoration(\n"
          "color:${bgColor ?? DEFAULT_CONTAINER_BG_COLOR},\n"
          "shape:${shape != null ? getBoxShape(shape) : BoxShape.rectangle},\n"
          "${getBoxShape(shape) == BoxShape.circle ? "" : "borderRadius:${(borderRadius ?? BorderRadius.zero)},\n"}"
          "${(borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR).alpha != 0 ? 'border:Border.all(color:${borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR},width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
          "),\n"
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
      return _getStringExpanded(_getStringAlign(getContainerString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getContainerString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getContainerString(isChild!));
    } else {
      return getContainerString(isChild!);
    }
  }

  /// End Code String
  getEndCodeAsString(bool isChild, WidgetModel widgetModel) {
    String finalString = "";
    if (isChild) {
      finalString = "),";
    }

    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      if (isChild) {
        return finalString + "),),";
      } else {
        return finalString + "),)";
      }
    } else if (getExpanded(widgetModel, isExpanded)) {
      if (isChild) {
        return finalString + "),";
      } else {
        return finalString + ")";
      }
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      if (isChild) {
        return finalString + "),";
      } else {
        return finalString + ")";
      }
    } else {
      return finalString;
    }
  }
}
