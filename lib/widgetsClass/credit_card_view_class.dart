import 'package:flutter_viz/externalClasses/flutterViz_credit_card_view.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class CreditCardViewClass {
  ///padding
  EdgeInsets? padding;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  /// hide CardNumber or not
  bool? obscureCardNumber;

  /// hide CVV or not
  bool? obscureCVV;

  /// Is fill color of TextField
  bool? filled;

  /// Is Dense
  bool? isDense;

  /// Fill Color of TextField
  Color? fillColor;

  /// Vertical space
  double? spacing;

  /// Content Padding of TextField
  EdgeInsets? contentPadding;

  /// Font Color
  Color? fontColor;

  /// Font Size
  double? fontSize;

  /// Font Style
  FontStyle? fontStyle;

  /// Font Weight
  String? fontWeight;

  ///Input Border
  String? inputBorder;

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

  CreditCardViewClass({
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.obscureCardNumber,
    this.obscureCVV,
    this.filled,
    this.isDense,
    this.fillColor,
    this.spacing,
    this.contentPadding,
    this.fontColor,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.inputBorder,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.isExpanded,
    this.flex = 1,
  });

  CreditCardViewClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    filled = json['filled'] != null ? json['filled'] : true;
    isDense = json['isDense'] != null ? json['isDense'] : false;
    obscureCardNumber = json['obscureCardNumber'] != null ? json['obscureCardNumber'] : true;
    obscureCVV = json['obscureCVV'] != null ? json['obscureCVV'] : false;
    fontWeight = json['fontWeight'] != null ? json['fontWeight'] : FontWeightTypeNormal;
    fontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_FONT_SIZE;
    fontStyle = json['fontStyle'] != null ? fromJsonFontStyle(json['fontStyle']) : FontStyle.normal;
    fontColor = json['fontColor'] != null ? fromJsonColor(json['fontColor']) : DEFAULT_TEXT_COLOR;
    fillColor = json['fillColor'] != null ? fromJsonColor(json['fillColor']) : DEFAULT_TEXT_FIELD_COLOR;
    contentPadding = json['contentPadding'] != null ? fromJsonPadding(json['contentPadding']) : EdgeInsets.fromLTRB(12, 8, 12, 8);
    spacing = json['spacing'] != null ? json['spacing'] : 16;
    inputBorder = json['inputBorder'] != null ? json['inputBorder'] : InputBorderTypeOutLine;
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.circular(4.0);
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_BORDER_COLOR;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false);
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
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
    if (this.filled != null) {
      data['filled'] = this.filled;
    }
    if (this.fillColor != null) {
      data['fillColor'] = toJsonColor(this.fillColor!);
    }
    if (this.contentPadding != null) {
      data['contentPadding'] = toJsonPadding(this.contentPadding!);
    }
    if (this.fontWeight != null) {
      data['fontWeight'] = this.fontWeight;
    }
    if (this.fontSize != null) {
      data['fontSize'] = this.fontSize;
    }
    if (this.fontStyle != null) {
      data['fontStyle'] = toJsonFontStyle(this.fontStyle);
    }
    if (this.fontColor != null) {
      data['fontColor'] = toJsonColor(this.fontColor!);
    }
    if (this.isDense != null) {
      data['isDense'] = this.isDense;
    }
    if (this.obscureCardNumber != null) {
      data['obscureCardNumber'] = this.obscureCardNumber;
    }
    if (this.obscureCVV != null) {
      data['obscureCVV'] = this.obscureCVV;
    }
    if (this.spacing != null) {
      data['spacing'] = this.spacing;
    }
    if (this.inputBorder != null) {
      data['inputBorder'] = this.inputBorder;
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

  InputBorder _getInputBorder() {
    return (inputBorder == InputBorderTypeOutLine)
        ? OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: borderColor ?? DEFAULT_BORDER_COLOR,
              width: borderWidth ?? DEFAULT_BORDER_WIDTH,
            ),
          )
        : (inputBorder == InoutBorderTypeUnderLine)
            ? UnderlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(4.0),
                borderSide: BorderSide(
                  color: borderColor ?? DEFAULT_BORDER_COLOR,
                  width: borderWidth ?? DEFAULT_BORDER_WIDTH,
                ),
              )
            : (inputBorder == InputBorderTypeNone)
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: borderColor ?? DEFAULT_BORDER_COLOR,
                      width: borderWidth ?? DEFAULT_BORDER_WIDTH,
                    ),
                  );
  }

  Widget getDefaultCreditCardViewWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: FlutterVizCreditCardView(
        obscureCardNumber: obscureCardNumber ?? true,
        obscureCVV: obscureCVV ?? false,
        spacing: spacing ?? 16,
        filled: filled ?? true,
        fillColor: fillColor ?? DEFAULT_TEXT_FIELD_COLOR,
        contentPadding: contentPadding ?? EdgeInsets.fromLTRB(12, 8, 12, 8),
        isDense: isDense ?? false,
        textStyle: TextStyle(
          color: fontColor ?? DEFAULT_TEXT_COLOR,
          fontSize: fontSize ?? DEFAULT_FONT_SIZE,
          fontWeight: fontWeight != null ? getFontWeight(fontWeight) : FontWeight.normal,
          fontStyle: fontStyle ?? FontStyle.normal,
        ),
        inputBorder: _getInputBorder(),
      ),
    );

    return getGestureDetector(widgetModel, childData);
  }

  _getCreditCardViewClassExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getCreditCardViewClassPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getCreditCardViewClassAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getCreditCardViewClassWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCreditCardViewClassExpanded(_getCreditCardViewClassPadding(_getCreditCardViewClassAlign(getDefaultCreditCardViewWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getCreditCardViewClassExpanded(_getCreditCardViewClassPadding(getDefaultCreditCardViewWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCreditCardViewClassExpanded(_getCreditCardViewClassAlign(getDefaultCreditCardViewWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCreditCardViewClassPadding(_getCreditCardViewClassAlign((getDefaultCreditCardViewWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getCreditCardViewClassPadding(getDefaultCreditCardViewWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCreditCardViewClassAlign(getDefaultCreditCardViewWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getCreditCardViewClassExpanded(getDefaultCreditCardViewWidget(widgetModel));
    } else {
      return getDefaultCreditCardViewWidget(widgetModel);
    }
  }

  String _getInputDecorationString() {
    return (inputBorder == InputBorderTypeOutLine)
        ? 'OutlineInputBorder(\n'
            'borderRadius:${borderRadius ?? 'BorderRadius.circular(4.0)'},\n'
            'borderSide:BorderSide(\n'
            'color:${borderColor ?? DEFAULT_BORDER_COLOR},\n'
            'width:${borderWidth ?? DEFAULT_BORDER_WIDTH}\n'
            '),\n'
            ')'
        : (inputBorder == InoutBorderTypeUnderLine)
            ? 'UnderlineInputBorder(\n'
                'borderRadius:${borderRadius ?? 'BorderRadius.circular(4.0)'},\n'
                'borderSide:BorderSide(\n'
                'color:${borderColor ?? DEFAULT_BORDER_COLOR},\n'
                'width:${borderWidth ?? DEFAULT_BORDER_WIDTH}\n'
                '),\n'
                ')'
            : (inputBorder == InputBorderTypeNone)
                ? 'InputBorder.none'
                : 'OutlineInputBorder(\n'
                    'borderRadius:${borderRadius ?? 'BorderRadius.circular(4.0)'},\n'
                    'borderSide:BorderSide(\n'
                    'color:${borderColor ?? DEFAULT_BORDER_COLOR},\n'
                    'width:${borderWidth ?? DEFAULT_BORDER_WIDTH}\n'
                    '),\n'
                    ')';
  }

  getCreditCardViewClassString() {
    return "FlutterVizCreditCardView( \n"
        "obscureCardNumber: ${obscureCardNumber ?? true},\n"
        "obscureCVV: ${obscureCVV ?? false},\n"
        "spacing: ${spacing ?? 16},\n"
        "filled: ${filled ?? true},\n"
        "fillColor: ${fillColor ?? DEFAULT_TEXT_FIELD_COLOR},\n"
        "contentPadding:${contentPadding != null ? getPaddingString(contentPadding) : 'EdgeInsets.fromLTRB(12, 8, 12, 8)'},\n"
        "isDense: ${isDense ?? false},\n"
        "textStyle: TextStyle(\n"
        "color: ${fontColor ?? DEFAULT_TEXT_COLOR},\n"
        "fontSize: ${fontSize ?? DEFAULT_FONT_SIZE},\n"
        "fontWeight: ${fontWeight != null ? getFontWeight(fontWeight) : FontWeight.normal},\n"
        "fontStyle: ${fontStyle ?? FontStyle.normal},\n"
        "),\n"
        "inputBorder: ${_getInputDecorationString()},\n"
        ")";
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "child: $_child,\n"
        ")";
  }

  _getStringAlign() {
    return "Align(\n"
        "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:${getCreditCardViewClassString()},\n"
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
      return _getStringExpanded(_getStringPadding(getCreditCardViewClassString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getCreditCardViewClassString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getCreditCardViewClassString());
    } else {
      return getCreditCardViewClassString();
    }
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'flutterViz_credit_card_view.dart';"];
  }
}
