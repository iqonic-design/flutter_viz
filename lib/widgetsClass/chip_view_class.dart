import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class ChipViewClass {
  ///Label Padding
  EdgeInsets? labelPadding;

  /// Text
  String? text;

  ///Change Text Color
  Color? textColor;

  ///Change bg Color
  Color? bgColor;

  /// controls the size of the shadow below the material and the opacity of the elevation overlay color if it is applied
  double? elevation;

  ///Shadow Color
  Color? shadowColor;

  /// Padding
  EdgeInsets? padding;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  /// Font Weight
  String? tFontWeight;

  /// Font size
  double? tFontSize;

  /// Font Style is italic or not
  FontStyle? tFontStyle;

  ///Border Radius
  BorderRadius? borderRadius;

  ///Change Border Color
  Color? borderColor;

  ///Border Width
  double? borderWidth;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  ChipViewClass({
    this.labelPadding,
    this.text,
    this.textColor,
    this.bgColor,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignY = false,
    this.isAlignX = false,
    this.tFontWeight,
    this.tFontSize,
    this.tFontStyle,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.isExpanded = false,
    this.flex = 1,
  });

  ChipViewClass.fromJson(Map<String, dynamic> json) {
    labelPadding = json['labelPadding'] != null ? fromJsonPadding(json['labelPadding']) : EdgeInsets.symmetric(horizontal: 4, vertical: 0);
    text = json['text'] != null ? json['text'] : 'Chip View';
    textColor = json['textColor'] != null ? fromJsonColor(json['textColor']) : DEFAULT_CHIP_TEXT_COLOR;
    bgColor = json['bgColor'] != null ? fromJsonColor(json['bgColor']) : COMMON_BG_COLOR;
    elevation = json['elevation'] != null ? json['elevation'] : DEFAULT_CHIP_ELEVATION;
    shadowColor = json['shadowColor'] != null ? fromJsonColor(json['shadowColor']) : DEFAULT_CHIP_SHADOW_COLOR;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    tFontWeight = json['tFontWeight'] != null ? json['tFontWeight'] : FontWeightTypeNormal;
    tFontStyle = json['tFontStyle'] != null ? fromJsonFontStyle(json['tFontStyle']) : FontStyle.normal;
    tFontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_FONT_SIZE;
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.circular(16.0);
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : TRANSPARENT_COLOR;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.labelPadding != null) {
      data['labelPadding'] = toJsonPadding(this.labelPadding!);
    }
    if (this.text != null) {
      data['text'] = this.text;
    }
    if (this.textColor != null) {
      data['textColor'] = toJsonColor(this.textColor!);
    }
    if (this.bgColor != null) {
      data['bgColor'] = toJsonColor(this.bgColor!);
    }
    if (this.elevation != null) {
      data['elevation'] = this.elevation;
    }
    if (this.shadowColor != null) {
      data['shadowColor'] = toJsonColor(this.shadowColor!);
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
    if (this.tFontWeight != null) {
      data['tFontWeight'] = this.tFontWeight;
    }
    if (this.tFontStyle != null) {
      data['tFontStyle'] = toJsonFontStyle(this.tFontStyle);
    }
    if (this.tFontSize != null) {
      data['fontSize'] = this.tFontSize;
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
    }
    if (this.borderColor != null) {
      data['borderColor'] = toJsonColor(this.borderColor!);
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }

    return data;
  }

  Widget getDefaultChipWidget(WidgetModel widgetModel) {
    Widget childData = Chip(
      labelPadding: labelPadding ?? EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      label: Text(text ?? 'Chip View'),
      labelStyle: TextStyle(
        color: textColor ?? DEFAULT_CHIP_TEXT_COLOR,
        fontSize: tFontSize ?? DEFAULT_FONT_SIZE,
        fontWeight: tFontWeight != null ? getFontWeight(tFontWeight) : FontWeight.normal,
        fontStyle: tFontStyle ?? FontStyle.normal,
      ),
      backgroundColor: bgColor ?? COMMON_BG_COLOR,
      elevation: elevation ?? DEFAULT_CHIP_ELEVATION,
      shadowColor: shadowColor ?? DEFAULT_CHIP_SHADOW_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(16.0),
        side: BorderSide(color: borderColor ?? TRANSPARENT_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  Widget getChipWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getChipExpanded(_getChipPadding(_getChipAlign(getDefaultChipWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getChipExpanded(_getChipPadding(getDefaultChipWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getChipExpanded(_getChipAlign(getDefaultChipWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getChipPadding(_getChipAlign((getDefaultChipWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getChipPadding(getDefaultChipWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getChipAlign(getDefaultChipWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getChipExpanded(getDefaultChipWidget(widgetModel));
    } else {
      return getDefaultChipWidget(widgetModel);
    }
  }

  _getChipExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getChipPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getChipAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  getChipViewString() {
    return "Chip(\n"
        "labelPadding:${labelPadding != null ? getPaddingString(labelPadding) : 'EdgeInsets.symmetric(horizontal: 4, vertical: 0)'},\n"
        "label:Text(\"${getDollarString(text ?? 'Chip View')}\"), "
        "labelStyle: TextStyle( fontSize:${tFontSize ?? DEFAULT_FONT_SIZE},\n"
        "fontWeight:${tFontWeight != null ? getFontWeight(tFontWeight) : FontWeight.normal},\n"
        "fontStyle:${tFontStyle ?? FontStyle.normal},\n"
        "color:${textColor ?? DEFAULT_CHIP_TEXT_COLOR},\n"
        "),\n"
        "backgroundColor:${bgColor ?? COMMON_BG_COLOR},\n"
        "elevation:${elevation ?? DEFAULT_CHIP_ELEVATION},\n"
        "shadowColor:${shadowColor ?? DEFAULT_CHIP_SHADOW_COLOR},\n"
        "shape: RoundedRectangleBorder(\n"
        "borderRadius:${borderRadius ?? 'BorderRadius.circular(16.0)'},\n"
        "${(borderColor ?? TRANSPARENT_COLOR).alpha != 0 ? 'side: BorderSide(color:${borderColor ?? TRANSPARENT_COLOR},width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
        "),\n"
        ")";
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child,\n"
        ")";
  }

  _getStringAlign() {
    return "Align(\n"
        "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:${getChipViewString()},\n"
        ")";
  }

  _getStringPadding(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$child,\n"
        ")";
  }

  /// For view code
  getCodeAsString(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringPadding(_getStringAlign()));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getChipViewString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getChipViewString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getChipViewString());
    } else {
      return getChipViewString();
    }
  }
}
