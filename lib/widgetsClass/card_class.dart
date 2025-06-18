import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class CardClass {
  ///shadowColor
  Color? shadowColor;

  /// Background Color
  Color? color;

  ///Card Elevation
  double? elevation;

  /// Card BorderRadius
  BorderRadius? borderRadius;

  /// Border Color
  Color? borderColor;

  /// Border Width
  double? borderWidth;

  /// margin
  EdgeInsets? margin;

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

  CardClass({
    this.shadowColor,
    this.color,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.margin,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  CardClass.fromJson(Map<String, dynamic> json) {
    shadowColor = json['shadowColor'] != null ? fromJsonColor(json['shadowColor']) : Colors.black;
    color = json['color'] != null ? fromJsonColor(json['color']) : DEFAULT_CARD_COLOR;
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.circular(DEFAULT_CARD_RADIUS);
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_CONTAINER_BORDER_COLOR;
    elevation = json['elevation'] != null ? json['elevation'] : DEFAULT_CARD_ELEVATION;
    margin = json['margin'] != null ? fromJsonMargin(json['margin']) : EdgeInsets.all(4.0);
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shadowColor != null) {
      data['shadowColor'] = toJsonColor(this.shadowColor!);
    }
    if (this.color != null) {
      data['color'] = toJsonColor(this.color!);
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.borderColor != null) {
      data['borderColor'] = toJsonColor(this.borderColor!);
    }
    if (this.elevation != null) {
      data['elevation'] = this.elevation;
    }
    if (this.margin != null) {
      data['margin'] = toJsonMargin(this.margin!);
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

  Widget getCardDefaultWidget(WidgetModel widgetModel, {Widget? widget}) {
    Widget childData;
    if (widget != null) {
      childData = Card(
        margin: margin ?? EdgeInsets.all(4.0),
        shadowColor: shadowColor ?? Colors.black,
        color: color ?? DEFAULT_CARD_COLOR,
        elevation: elevation ?? DEFAULT_CARD_ELEVATION,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(DEFAULT_CARD_RADIUS),
          side: BorderSide(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
        ),
        child: widget,
      );
    } else {
      childData = Card(
        margin: margin ?? EdgeInsets.all(4.0),
        shadowColor: shadowColor ?? Colors.black,
        color: color ?? DEFAULT_CARD_COLOR,
        elevation: elevation ?? DEFAULT_CARD_ELEVATION,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(DEFAULT_CARD_RADIUS),
          side: BorderSide(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 120,
          child: Text('Card View'),
        ),
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isCardExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  _getCardAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getCardWidget(WidgetModel widgetModel, {Widget? widget}) {
    if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCardAlign(getCardDefaultWidget(widgetModel, widget: widget));
    } else {
      return getCardDefaultWidget(widgetModel, widget: widget);
    }
  }

  /// For view code
  getCardString(bool isChild) {
    if (isChild) {
      return "\nCard( \n"
          "margin:${getPaddingString(margin) ?? 'EdgeInsets.all(4.0)'},\n"
          "color:${color ?? DEFAULT_CARD_COLOR},\n"
          "shadowColor:${shadowColor ?? Colors.black},\n"
          "elevation:${elevation ?? DEFAULT_CARD_ELEVATION},\n"
          "shape:RoundedRectangleBorder(\n"
          "borderRadius:${borderRadius ?? BorderRadius.circular(DEFAULT_CARD_RADIUS)},\n"
          "${(borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR).alpha != 0 ? 'side: BorderSide(color:${borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR}, width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
          "),\n"
          "child:";
    } else {
      return "\nCard( \n"
          "margin:${getPaddingString(margin) ?? 'EdgeInsets.all(4.0)'},\n"
          "color:${color ?? DEFAULT_CARD_COLOR},\n"
          "shadowColor:${shadowColor ?? Colors.black},\n"
          "elevation:${elevation ?? DEFAULT_CARD_ELEVATION},\n"
          "shape:RoundedRectangleBorder(\n"
          "borderRadius:${borderRadius ?? BorderRadius.circular(DEFAULT_CARD_RADIUS)},\n"
          "${(borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR).alpha != 0 ? 'side: BorderSide(color:${borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR}, width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
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
      return _getStringExpanded(_getStringAlign(getCardString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getCardString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getCardString(isChild!));
    } else {
      return getCardString(isChild!);
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
