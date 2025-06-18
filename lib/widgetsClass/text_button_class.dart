import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class TextButtonClass {
  /// Text background Color
  Color? backgroundColor;

  /// controls the size of the shadow below the material and the opacity of the elevation overlay color if it is applied
  double? elevation;

  ///Border Color
  Color? borderColor;

  ///Border Width
  double? borderWidth;

  ///Border Radius
  BorderRadius? borderRadius;

  ///Button text
  String? text;

  /// Font Weight
  String? tFontWeight;

  /// Font size
  double? tFontSize;

  /// Font Style is italic or not
  FontStyle? tFontStyle;

  ///contentPadding
  EdgeInsets? contentPadding;

  ///Padding
  EdgeInsets? padding;

  ///Text Color
  Color? textColor;

  double? height;
  double? minWidth;

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

  TextButtonClass({
    this.text,
    this.textColor,
    this.tFontSize,
    this.backgroundColor,
    this.elevation,
    this.borderColor,
    this.tFontWeight,
    this.contentPadding,
    this.tFontStyle,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.height,
    this.minWidth,
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

  TextButtonClass.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? json['text'] : 'Button';
    textColor = json['textColor'] != null ? fromJsonColor(json['textColor']) : DEFAULT_TEXT_COLOR;
    tFontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_FONT_SIZE;
    backgroundColor = json['backgroundColor'] != null ? fromJsonColor(json['backgroundColor']) : DEFAULT_TEXT_BUTTON_BG_COLOR;
    elevation = json['elevation'] != null ? json['elevation'] : DEFAULT_TEXT_BUTTON_ELEVATION;
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_TEXT_BUTTON_BORDER_COLOR;
    tFontWeight = json['tFontWeight'] != null ? json['tFontWeight'] : FontWeightTypeNormal;
    contentPadding = json['contentPadding'] != null ? fromJsonPadding(json['contentPadding']) : EdgeInsets.symmetric(horizontal: 16, vertical: 16);
    tFontStyle = json['tFontStyle'] != null ? fromJsonFontStyle(json['tFontStyle']) : FontStyle.normal;
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.zero;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    height = json['height'] != null ? fromJsonHeight(json['height'], heightType ?? TypePX) : DEFAULT_TEXT_BUTTON_HEIGHT;
    minWidth = json['minWidth'] != null ? fromJsonWidth(json['minWidth'], widthType ?? TypePX) : DEFAULT_TEXT_BUTTON_WIDTH;
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
    if (this.text != null) {
      data['text'] = this.text;
    }
    if (this.textColor != null) {
      data['textColor'] = toJsonColor(this.textColor!);
    }
    if (this.tFontSize != null) {
      data['fontSize'] = this.tFontSize;
    }
    if (this.backgroundColor != null) {
      data['backgroundColor'] = toJsonColor(this.backgroundColor!);
    }
    if (this.elevation != null) {
      data['elevation'] = this.elevation;
    }
    if (this.borderColor != null) {
      data['borderColor'] = toJsonColor(this.borderColor!);
    }
    if (this.tFontWeight != null) {
      data['tFontWeight'] = this.tFontWeight;
    }
    if (this.contentPadding != null) {
      data['contentPadding'] = toJsonPadding(this.contentPadding!);
    }
    if (this.tFontStyle != null) {
      data['tFontStyle'] = toJsonFontStyle(this.tFontStyle);
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.minWidth != null) {
      data['minWidth'] = this.minWidth;
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

  Widget getDefaultTextButtonWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: MaterialButton(
          onPressed: () {
            getToast("Button Press");
          },
          color: backgroundColor ?? DEFAULT_TEXT_BUTTON_BG_COLOR,
          elevation: elevation ?? DEFAULT_TEXT_BUTTON_ELEVATION,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
            side: BorderSide(color: borderColor ?? DEFAULT_TEXT_BUTTON_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
          ),
          padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            text ?? 'Button',
            style: TextStyle(
              fontSize: tFontSize ?? DEFAULT_FONT_SIZE,
              fontWeight: tFontWeight != null ? getFontWeight(tFontWeight) : FontWeight.normal,
              fontStyle: tFontStyle ?? FontStyle.normal,
            ),
          ),
          textColor: textColor ?? DEFAULT_TEXT_COLOR,
          height: isHeightClear! ? null : fromJsonHeight(height ?? DEFAULT_TEXT_BUTTON_HEIGHT, heightType),
          minWidth: isWidthClear! ? null : fromJsonWidth(minWidth ?? DEFAULT_TEXT_BUTTON_WIDTH, widthType)),
    );
    return getGestureDetector(widgetModel, childData);
  }

  Widget getTextButtonWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextButtonExpanded(_getTextButtonPadding(_getTextButtonAlign(getDefaultTextButtonWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getTextButtonExpanded(_getTextButtonPadding(getDefaultTextButtonWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextButtonExpanded(_getTextButtonAlign(getDefaultTextButtonWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextButtonPadding(_getTextButtonAlign((getDefaultTextButtonWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getTextButtonPadding(getDefaultTextButtonWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextButtonAlign(getDefaultTextButtonWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getTextButtonExpanded(getDefaultTextButtonWidget(widgetModel));
    } else {
      return getDefaultTextButtonWidget(widgetModel);
    }
  }

  _getTextButtonExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getTextButtonPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getTextButtonAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  getMaterialButtonString() {
    return "MaterialButton(\n"
        "onPressed:(){},\n"
        "color:${backgroundColor ?? DEFAULT_TEXT_BUTTON_BG_COLOR},\n"
        "elevation:${elevation ?? DEFAULT_TEXT_BUTTON_ELEVATION},\n"
        "shape:RoundedRectangleBorder(\n"
        "borderRadius:${borderRadius ?? BorderRadius.zero},\n"
        "${(borderColor ?? DEFAULT_TEXT_BUTTON_BORDER_COLOR).alpha != 0 ? 'side:BorderSide(color:${borderColor ?? DEFAULT_TEXT_BUTTON_BORDER_COLOR},width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
        "),\n"
        "padding:${contentPadding != null ? getPaddingString(contentPadding) : 'EdgeInsets.symmetric(horizontal: 16, vertical: 8)'},\n"
        "child:Text(\"${getDollarString(text ?? 'Text Button')}\", "
        "style: TextStyle( fontSize:${tFontSize ?? DEFAULT_FONT_SIZE},\n"
        "fontWeight:${tFontWeight != null ? getFontWeight(tFontWeight) : FontWeight.normal},\n"
        "fontStyle:${tFontStyle ?? FontStyle.normal},\n"
        "),"
        "),\n"
        "textColor:${textColor ?? DEFAULT_TEXT_COLOR},\n"
        "${isHeightClear! ? "" : 'height:${getHeightString(height ?? DEFAULT_TEXT_BUTTON_HEIGHT, heightType)},\n'}"
        "${isWidthClear! ? "" : 'minWidth:${getWidthString(minWidth ?? DEFAULT_TEXT_BUTTON_WIDTH, widthType)},\n'}"
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
        "child:${getMaterialButtonString()},\n"
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
      return _getStringExpanded(_getStringPadding(getMaterialButtonString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getMaterialButtonString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getMaterialButtonString());
    } else {
      return getMaterialButtonString();
    }
  }
}
