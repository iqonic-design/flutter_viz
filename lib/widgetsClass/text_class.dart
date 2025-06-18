import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextClass {
  ///Padding
  EdgeInsets? padding;

  /// The text to display.
  String? text;

  /// Font Color
  Color? textColor;

  /// Font weight
  String? fWeight;

  /// The size of font.
  double? fontSize;

  /// Font Style
  FontStyle? fontStyle;

  /// max line of text
  int? maxLines;

  /// How the text should be aligned horizontally.
  TextAlign? textAlign;

  /// overflow
  String? overflow;

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

  TextClass({
    this.text,
    this.textAlign,
    this.fontSize,
    this.textColor,
    this.fWeight,
    this.fontStyle,
    this.overflow,
    this.padding,
    this.maxLines,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  TextClass.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? json['text'] : "Text";
    textAlign = json['textAlign'] != null ? fromJsonTextAlign(json['textAlign']) : TextAlign.start;
    fontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_FONT_SIZE;
    textColor = json['textColor'] != null ? fromJsonColor(json['textColor']) : DEFAULT_TEXT_COLOR;
    fWeight = json['fWeight'] != null ? json['fWeight'] : FontWeightTypeNormal;
    fontStyle = json['fontStyle'] != null ? fromJsonFontStyle(json['fontStyle']) : FontStyle.normal;
    overflow = json['overflow'] != null ? json['overflow'] : OverflowTypeClip;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    maxLines = json['maxLines'] != null ? json['maxLines'] : null;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.text != null) {
      data['text'] = this.text;
    }
    if (this.textAlign != null) {
      data['textAlign'] = toJsonTextAlign(this.textAlign);
    }
    if (this.fontSize != null) {
      data['fontSize'] = this.fontSize;
    }
    if (this.textColor != null) {
      data['textColor'] = toJsonColor(this.textColor!);
    }
    if (this.fWeight != null) {
      data['fWeight'] = this.fWeight;
    }
    if (this.fontStyle != null) {
      data['fontStyle'] = toJsonFontStyle(this.fontStyle);
    }
    if (this.overflow != null) {
      data['overflow'] = this.overflow;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.maxLines != null) {
      data['maxLines'] = this.maxLines;
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

  Widget getTextDefaultWidget(WidgetModel widgetModel) {
    Widget childData = Text(
      text ?? "Text",
      // textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? null,
      overflow: overflow != null ? getOverflow(overflow) : TextOverflow.clip,
      style: TextStyle(
        fontWeight: fWeight != null ? getFontWeight(fWeight) : FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? DEFAULT_FONT_SIZE,
        color: textColor ?? DEFAULT_TEXT_COLOR,
      ),
    );

    return getGestureDetector(widgetModel, childData);
  }

  Widget getTextWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextExpanded(_getTextPadding(_getTextAlign(getTextDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getTextExpanded(_getTextPadding(getTextDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextExpanded(_getTextAlign(getTextDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextPadding(_getTextAlign((getTextDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getTextPadding(getTextDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextAlign(getTextDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getTextExpanded(getTextDefaultWidget(widgetModel));
    } else {
      return getTextDefaultWidget(widgetModel);
    }
  }

  _getTextExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getTextPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getTextAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  getTextString() {
    return "Text(\n"
        "\"${getDollarString(text ?? "Text")}\",\n"
        "textAlign: ${textAlign ?? TextAlign.start},\n"
        "${maxLines != null ? "maxLines:$maxLines,\n" : ""}"
        "overflow:${overflow != null ? getOverflow(overflow) : TextOverflow.clip},\n"
        "style:TextStyle(\n"
        "fontWeight:${fWeight != null ? getFontWeight(fWeight) : FontWeight.normal},\n"
        "fontStyle:${fontStyle ?? FontStyle.normal},\n"
        "fontSize:${fontSize ?? DEFAULT_FONT_SIZE},\n"
        "color:${textColor ?? DEFAULT_TEXT_COLOR},\n"
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
        "child:${getTextString()},\n"
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
      return _getStringExpanded(_getStringPadding(getTextString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getTextString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getTextString());
    } else {
      return getTextString();
    }
  }
}
