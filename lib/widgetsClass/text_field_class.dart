import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TextFieldClass {
  /// TextField widget to automatically convert all the entered text
  bool? obscureText;

  /// How the text should be aligned horizontally.
  TextAlign? textAlign;

  /// max line of text
  int? maxLines;

  ///Border Radius
  BorderRadius? borderRadius;

  ///Change Border Color
  Color? borderColor;

  ///Border Width
  double? borderWidth;

  ///Fill Color
  Color? fillColor;

  /// The hint text to display.
  String? hintText;

  /// The label text to display.
  String? labelText;

  ///less vertical space
  bool? isDense;

  ///Fill
  bool? isFill;

  ///Initial text value
  String? initialValue;

  /// Padding
  EdgeInsets? contentPadding;

  ///Input Border
  String? inputBorder;

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

  /// TextStyle
  String? fontWeight;
  double? fontSize;
  FontStyle? fontStyle;
  Color? fontColor;

  /// Hint TextStyle
  String? hintFontWeight;
  double? hintFontSize;
  FontStyle? hintFontStyle;
  Color? hintFontColor;

  /// Label TextStyle
  String? labelFontWeight;
  double? labelFontSize;
  FontStyle? labelFontStyle;
  Color? labelFontColor;

  ///prefix Icon
  dynamic prefixIconDataJson;
  Color? prefixIconColor;
  double? prefixIconSize;

  /// suffix Icon
  dynamic suffixIconDataJson;
  Color? suffixIconColor;
  double? suffixIconSize;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  TextFieldClass({
    this.obscureText,
    this.textAlign,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.fontColor,
    this.labelFontWeight,
    this.labelFontSize,
    this.labelFontStyle,
    this.labelFontColor,
    this.hintFontWeight,
    this.hintFontSize,
    this.hintFontStyle,
    this.hintFontColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.fillColor,
    this.hintText,
    this.labelText,
    this.isDense,
    this.initialValue,
    this.contentPadding,
    this.inputBorder,
    this.isFill = true,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.prefixIconDataJson,
    this.suffixIconDataJson,
    this.prefixIconColor,
    this.prefixIconSize,
    this.suffixIconColor,
    this.suffixIconSize,
    this.isExpanded,
    this.flex = 1,
  });

  TextFieldClass.fromJson(Map<String, dynamic> json) {
    obscureText = json['obscureText'] != null ? json['obscureText'] : false;
    textAlign = json['textAlign'] != null ? fromJsonTextAlign(json['textAlign']) : TextAlign.start;
    maxLines = (obscureText ?? false) ? 1 : (json['maxLines'] != null ? json['maxLines'] : 1);
    fontWeight = json['fontWeight'] != null ? json['fontWeight'] : FontWeightTypeNormal;
    fontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_FONT_SIZE;
    fontStyle = json['fontStyle'] != null ? fromJsonFontStyle(json['fontStyle']) : FontStyle.normal;
    fontColor = json['fontColor'] != null ? fromJsonColor(json['fontColor']) : DEFAULT_TEXT_COLOR;

    hintFontWeight = json['hintFontWeight'] != null ? json['hintFontWeight'] : FontWeightTypeNormal;
    hintFontSize = json['hintFontSize'] != null ? json['hintFontSize'] : DEFAULT_FONT_SIZE;
    hintFontStyle = json['hintFontStyle'] != null ? fromJsonFontStyle(json['hintFontStyle']) : FontStyle.normal;
    hintFontColor = json['hintFontColor'] != null ? fromJsonColor(json['hintFontColor']) : DEFAULT_TEXT_COLOR;

    labelFontWeight = json['labelFontWeight'] != null ? json['labelFontWeight'] : FontWeightTypeNormal;
    labelFontSize = json['labelFontSize'] != null ? json['labelFontSize'] : DEFAULT_FONT_SIZE;
    labelFontStyle = json['labelFontStyle'] != null ? fromJsonFontStyle(json['labelFontStyle']) : FontStyle.normal;
    labelFontColor = json['labelFontColor'] != null ? fromJsonColor(json['labelFontColor']) : DEFAULT_TEXT_COLOR;

    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.circular(4.0);
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_BORDER_COLOR;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    fillColor = json['fillColor'] != null ? fromJsonColor(json['fillColor']) : DEFAULT_TEXT_FIELD_COLOR;
    hintText = json['hintText'] != null ? json['hintText'] : 'Enter Text';
    labelText = json['labelText'] != null ? json['labelText'] : null;
    isDense = json['isDense'] != null ? json['isDense'] : false;
    initialValue = json['initialValue'] != null ? json['initialValue'] : "";
    contentPadding = json['contentPadding'] != null ? fromJsonPadding(json['contentPadding']) : EdgeInsets.fromLTRB(12, 8, 12, 8);
    inputBorder = json['inputBorder'] != null ? json['inputBorder'] : InputBorderTypeOutLine;
    isFill = json['isFill'] != null ? json['isFill'] : true;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    prefixIconDataJson = json['prefixIconDataJson'] != null ? json['prefixIconDataJson'] : null;
    suffixIconDataJson = json['suffixIconDataJson'] != null ? json['suffixIconDataJson'] : null;
    prefixIconColor = json['prefixIconColor'] != null ? fromJsonColor(json['prefixIconColor']) : DEFAULT_ICON_COLOR;
    suffixIconColor = json['suffixIconColor'] != null ? fromJsonColor(json['suffixIconColor']) : DEFAULT_ICON_COLOR;
    prefixIconSize = json['prefixIconSize'] != null ? json['prefixIconSize'] : DEFAULT_ICON_SIZE;
    suffixIconSize = json['suffixIconSize'] != null ? json['suffixIconSize'] : DEFAULT_ICON_SIZE;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false);
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.obscureText != null) {
      data['obscureText'] = this.obscureText;
    }
    if (this.textAlign != null) {
      data['textAlign'] = toJsonTextAlign(this.textAlign);
    }
    if (this.maxLines != null) {
      data['maxLines'] = this.maxLines;
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

    if (this.labelFontWeight != null) {
      data['labelFontWeight'] = this.labelFontWeight;
    }
    if (this.labelFontSize != null) {
      data['labelFontSize'] = this.labelFontSize;
    }
    if (this.labelFontStyle != null) {
      data['labelFontStyle'] = toJsonFontStyle(this.labelFontStyle);
    }
    if (this.labelFontColor != null) {
      data['labelFontColor'] = toJsonColor(this.labelFontColor!);
    }

    if (this.hintFontWeight != null) {
      data['hintFontWeight'] = this.hintFontWeight;
    }
    if (this.hintFontSize != null) {
      data['hintFontSize'] = this.hintFontSize;
    }
    if (this.hintFontStyle != null) {
      data['hintFontStyle'] = toJsonFontStyle(this.hintFontStyle);
    }
    if (this.hintFontColor != null) {
      data['hintFontColor'] = toJsonColor(this.hintFontColor!);
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
    if (this.fillColor != null) {
      data['fillColor'] = toJsonColor(this.fillColor!);
    }
    if (this.hintText != null) {
      data['hintText'] = this.hintText;
    }
    if (this.labelText != null) {
      data['labelText'] = this.labelText;
    }
    if (this.isDense != null) {
      data['isDense'] = this.isDense;
    }
    if (this.initialValue != null) {
      data['initialValue'] = this.initialValue;
    }
    if (this.contentPadding != null) {
      data['contentPadding'] = toJsonPadding(this.contentPadding!);
    }
    if (this.inputBorder != null) {
      data['inputBorder'] = this.inputBorder;
    }
    if (this.isFill != null) {
      data['isFill'] = this.isFill;
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
    if (this.prefixIconDataJson != null) {
      data['prefixIconDataJson'] = this.prefixIconDataJson;
    }
    if (this.suffixIconDataJson != null) {
      data['suffixIconDataJson'] = this.suffixIconDataJson;
    }
    if (this.prefixIconColor != null) {
      data['prefixIconColor'] = toJsonColor(this.prefixIconColor!);
    }
    if (this.suffixIconColor != null) {
      data['suffixIconColor'] = toJsonColor(this.suffixIconColor!);
    }
    if (this.prefixIconSize != null) {
      data['prefixIconSize'] = this.prefixIconSize;
    }
    if (this.suffixIconSize != null) {
      data['suffixIconSize'] = this.suffixIconSize;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  InputBorder getInputBorder() {
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

  Widget getTextFieldDefaultWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: TextField(
        enabled: true,
        controller: TextEditingController(text: initialValue ?? ""),
        obscureText: obscureText ?? false,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: (obscureText ?? false) ? 1 : (maxLines ?? 1),
        style: TextStyle(
          fontWeight: fontWeight != null ? getFontWeight(fontWeight) : FontWeight.normal,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? DEFAULT_FONT_SIZE,
          color: fontColor ?? DEFAULT_TEXT_COLOR,
        ),
        decoration: InputDecoration(
          disabledBorder: getInputBorder(),
          focusedBorder: getInputBorder(),
          enabledBorder: getInputBorder(),
          labelText: labelText ?? null,
          labelStyle: TextStyle(
            fontWeight: labelFontWeight != null ? getFontWeight(labelFontWeight) : FontWeight.normal,
            fontStyle: labelFontStyle ?? FontStyle.normal,
            fontSize: labelFontSize ?? DEFAULT_FONT_SIZE,
            color: labelFontColor ?? DEFAULT_TEXT_COLOR,
          ),
          hintText: hintText ?? 'Enter Text',
          hintStyle: TextStyle(
            fontWeight: hintFontWeight != null ? getFontWeight(hintFontWeight) : FontWeight.normal,
            fontStyle: hintFontStyle ?? FontStyle.normal,
            fontSize: hintFontSize ?? DEFAULT_FONT_SIZE,
            color: hintFontColor ?? DEFAULT_TEXT_COLOR,
          ),
          filled: isFill ?? true,
          fillColor: fillColor ?? DEFAULT_TEXT_FIELD_COLOR,
          isDense: isDense ?? false,
          contentPadding: contentPadding ?? EdgeInsets.fromLTRB(12, 8, 12, 8),
          prefixIcon: prefixIconDataJson != null
              ? Icon(
                  IconData(prefixIconDataJson['codePoint'], fontFamily: prefixIconDataJson['fontFamily']),
                  color: prefixIconColor ?? DEFAULT_ICON_COLOR,
                  size: prefixIconSize ?? DEFAULT_ICON_SIZE,
                )
              : null,
          suffixIcon: suffixIconDataJson != null
              ? Icon(
                  IconData(suffixIconDataJson['codePoint'], fontFamily: suffixIconDataJson['fontFamily']),
                  color: suffixIconColor ?? DEFAULT_ICON_COLOR,
                  size: suffixIconSize ?? DEFAULT_ICON_SIZE,
                )
              : null,
        ),
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getTextFieldExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getTextFieldPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getTextFieldAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getTextFieldWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldExpanded(_getTextFieldPadding(_getTextFieldAlign(getTextFieldDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getTextFieldExpanded(_getTextFieldPadding(getTextFieldDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldExpanded(_getTextFieldAlign(getTextFieldDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldPadding(_getTextFieldAlign((getTextFieldDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getTextFieldPadding(getTextFieldDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldAlign(getTextFieldDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getTextFieldExpanded(getTextFieldDefaultWidget(widgetModel));
    } else {
      return getTextFieldDefaultWidget(widgetModel);
    }
  }

  String getInputDecorationString() {
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

  getTextFiledString() {
    return "TextField(\n"
        "controller:TextEditingController(${(initialValue != null && initialValue!.isNotEmpty) ? 'text:\"${getDollarString(initialValue!)}\"' : ""}),\n"
        "obscureText:${obscureText ?? false},\n"
        "textAlign:${textAlign ?? TextAlign.start},\n"
        "maxLines:${(obscureText ?? false) ? 1 : (maxLines ?? 1)},\n"
        "style:TextStyle(\n"
        "fontWeight:${fontWeight != null ? getFontWeight(fontWeight) : FontWeight.normal},\n"
        "fontStyle:${fontStyle ?? FontStyle.normal},\n"
        "fontSize:${fontSize ?? DEFAULT_FONT_SIZE},\n"
        "color:${fontColor ?? DEFAULT_TEXT_COLOR},\n"
        "),\n"
        "decoration:InputDecoration(\n"
        "disabledBorder:${getInputDecorationString()},\n"
        "focusedBorder:${getInputDecorationString()},\n"
        "enabledBorder:${getInputDecorationString()},\n"
        "${(labelText != "" && labelText != null) ? 'labelText:\"${getDollarString(labelText!)}\",\n'
            "labelStyle:TextStyle(\n"
            "fontWeight:${labelFontWeight != null ? getFontWeight(labelFontWeight) : FontWeight.normal},\n"
            "fontStyle:${labelFontStyle ?? FontStyle.normal},\n"
            "fontSize:${labelFontSize ?? DEFAULT_FONT_SIZE},\n"
            "color:${labelFontColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n" : ""}"
        "${hintText != "" ? "hintText:\"${getDollarString(hintText ?? 'Hint Text')}\",\n"
            "hintStyle:TextStyle(\n"
            "fontWeight:${hintFontWeight != null ? getFontWeight(hintFontWeight) : FontWeight.normal},\n"
            "fontStyle:${hintFontStyle ?? FontStyle.normal},\n"
            "fontSize:${hintFontSize ?? DEFAULT_FONT_SIZE},\n"
            "color:${hintFontColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n" : ""}"
        "filled:${isFill ?? true},\n"
        "fillColor:${fillColor ?? DEFAULT_TEXT_FIELD_COLOR},\n"
        "isDense:${isDense ?? false},\n"
        "contentPadding:${contentPadding != null ? getPaddingString(contentPadding) : 'EdgeInsets.fromLTRB(12, 8, 12, 8)'},\n"
        "${prefixIconDataJson != null ? "prefixIcon:Icon(Icons.${prefixIconDataJson['iconName']},color:${prefixIconColor ?? DEFAULT_ICON_COLOR},size:${prefixIconSize ?? DEFAULT_ICON_SIZE}),\n" : ""}"
        "${suffixIconDataJson != null ? "suffixIcon:Icon(Icons.${suffixIconDataJson['iconName']},color:${suffixIconColor ?? DEFAULT_ICON_COLOR},size:${suffixIconSize ?? DEFAULT_ICON_SIZE}),\n" : ""}"
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
        "child:${getTextFiledString()},\n"
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
      return _getStringExpanded(_getStringPadding(getTextFiledString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getTextFiledString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getTextFiledString());
    } else {
      return getTextFiledString();
    }
  }
}
