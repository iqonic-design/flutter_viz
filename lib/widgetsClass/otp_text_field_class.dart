import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPTextFieldClass {
  /// Number of fields
  int? numberOfFields;

  /// Is Show Field as Box or underline
  bool? showFieldAsBox;

  /// Fill Color
  Color? fillColor;

  /// Enable Border Color
  Color? enabledBorderColor;

  /// Focus Border Color
  Color? focusBorderColor;

  /// Border width
  double? borderWidth;

  /// Cross Axis Alignment
  String? crossAxisAlignment;

  /// Main Axis Alignment
  String? mainAxisAlignment;

  /// Field Width
  double? fieldWidth;

  /// margin
  EdgeInsets? margin;

  /// obscureText
  bool? obscureText;

  /// Border Radius
  BorderRadius? borderRadius;

  /// TextStyle
  String? fontWeight;
  double? fontSize;
  FontStyle? fontStyle;
  Color? fontColor;

  ///Padding
  EdgeInsets? padding;

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

  OTPTextFieldClass({
    this.numberOfFields,
    this.borderWidth,
    this.fieldWidth,
    this.margin,
    this.obscureText,
    this.showFieldAsBox,
    this.fillColor,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.borderRadius,
    this.enabledBorderColor,
    this.focusBorderColor,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.fontColor,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  OTPTextFieldClass.fromJson(Map<String, dynamic> json) {
    numberOfFields = json['numberOfFields'] != null ? json['numberOfFields'] : OTP_NUMBER_OF_FIELD;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : OTP_BORDER_WIDTH;
    fieldWidth = json['fieldWidth'] != null ? json['fieldWidth'] : OTP_FIELD_WIDTH;
    margin = json['margin'] != null ? fromJsonMargin(json['margin']) : OTP_MARGIN;
    obscureText = json['obscureText'] != null ? json['obscureText'] : false;
    showFieldAsBox = json['showFieldAsBox'] != null ? json['showFieldAsBox'] : false;
    mainAxisAlignment = json['mainAxisAlignment'] != null ? json['mainAxisAlignment'] : AxisAlignmentCenter;
    crossAxisAlignment = json['crossAxisAlignment'] != null ? json['crossAxisAlignment'] : AxisAlignmentCenter;
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : OTP_BORDER_RADIUS;
    fillColor = json['fillColor'] != null ? fromJsonColor(json['fillColor']) : OTP_FILL_COLOR;
    enabledBorderColor = json['enabledBorderColor'] != null ? fromJsonColor(json['enabledBorderColor']) : OTP_ENABLE_BORDER_COLOR;
    focusBorderColor = json['focusBorderColor'] != null ? fromJsonColor(json['focusBorderColor']) : COMMON_BG_COLOR;
    fontWeight = json['fontWeight'] != null ? json['fontWeight'] : FontWeightTypeNormal;
    fontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_FONT_SIZE;
    fontStyle = json['fontStyle'] != null ? fromJsonFontStyle(json['fontStyle']) : FontStyle.normal;
    fontColor = json['fontColor'] != null ? fromJsonColor(json['fontColor']) : DEFAULT_TEXT_COLOR;
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
    if (this.numberOfFields != null) {
      data['numberOfFields'] = this.numberOfFields;
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.fieldWidth != null) {
      data['fieldWidth'] = this.fieldWidth;
    }
    if (this.margin != null) {
      data['margin'] = toJsonMargin(this.margin!);
    }
    if (this.showFieldAsBox != null) {
      data['showFieldAsBox'] = this.showFieldAsBox;
    }
    if (this.obscureText != null) {
      data['obscureText'] = this.obscureText;
    }
    if (this.fillColor != null) {
      data['fillColor'] = toJsonColor(this.fillColor!);
    }
    if (this.enabledBorderColor != null) {
      data['enabledBorderColor'] = toJsonColor(this.enabledBorderColor!);
    }
    if (this.focusBorderColor != null) {
      data['focusBorderColor'] = toJsonColor(this.focusBorderColor!);
    }
    if (this.crossAxisAlignment != null) {
      data['crossAxisAlignment'] = this.crossAxisAlignment;
    }
    if (this.mainAxisAlignment != null) {
      data['mainAxisAlignment'] = this.mainAxisAlignment;
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
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

  Widget getOTPTextFieldDefaultWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: OtpTextField(
        numberOfFields: numberOfFields ?? OTP_NUMBER_OF_FIELD,
        showFieldAsBox: showFieldAsBox ?? false,
        fieldWidth: fieldWidth ?? OTP_FIELD_WIDTH,
        filled: true,
        fillColor: fillColor ?? OTP_FILL_COLOR,
        enabledBorderColor: enabledBorderColor ?? OTP_ENABLE_BORDER_COLOR,
        focusedBorderColor: focusBorderColor ?? COMMON_BG_COLOR,
        borderWidth: borderWidth ?? OTP_BORDER_WIDTH,
        margin: margin ?? OTP_MARGIN,
        mainAxisAlignment: mainAxisAlignment != null ? getMainAxisAlignment(mainAxisAlignment: mainAxisAlignment) : MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment != null ? getCrossAxisAlignment(crossAxisAlignment: crossAxisAlignment) : CrossAxisAlignment.center,
        obscureText: obscureText ?? false,
        borderRadius: borderRadius ?? OTP_BORDER_RADIUS,
        textStyle: TextStyle(
          fontWeight: fontWeight != null ? getFontWeight(fontWeight) : FontWeight.normal,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? DEFAULT_FONT_SIZE,
          color: fontColor ?? DEFAULT_TEXT_COLOR,
        ),
        onCodeChanged: (String code) {},
        onSubmit: (String verificationCode) {},
      ),
    );

    return getGestureDetector(widgetModel, childData);
  }

  _getOTPTextFieldExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getOTPTextFieldPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getOTPTextFieldAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getOTPTextFieldWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getOTPTextFieldExpanded(_getOTPTextFieldPadding(_getOTPTextFieldAlign(getOTPTextFieldDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getOTPTextFieldExpanded(_getOTPTextFieldPadding(getOTPTextFieldDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getOTPTextFieldExpanded(_getOTPTextFieldAlign(getOTPTextFieldDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getOTPTextFieldPadding(_getOTPTextFieldAlign((getOTPTextFieldDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getOTPTextFieldPadding(getOTPTextFieldDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getOTPTextFieldAlign(getOTPTextFieldDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getOTPTextFieldExpanded(getOTPTextFieldDefaultWidget(widgetModel));
    } else {
      return getOTPTextFieldDefaultWidget(widgetModel);
    }
  }

  getOTPTextFieldString() {
    return "OtpTextField(\n"
        "numberOfFields: ${numberOfFields ?? OTP_NUMBER_OF_FIELD},\n"
        "showFieldAsBox: ${showFieldAsBox ?? false},\n"
        "fieldWidth: ${fieldWidth ?? OTP_FIELD_WIDTH},\n"
        "filled: true,\n"
        "fillColor: ${fillColor ?? OTP_FILL_COLOR},\n"
        "enabledBorderColor: ${enabledBorderColor ?? OTP_ENABLE_BORDER_COLOR},\n"
        "focusedBorderColor: ${focusBorderColor ?? COMMON_BG_COLOR},\n"
        "borderWidth: ${borderWidth ?? OTP_BORDER_WIDTH},\n"
        "margin:${getPaddingString(margin ?? OTP_MARGIN)},\n"
        "mainAxisAlignment: ${mainAxisAlignment != null ? getMainAxisAlignment(mainAxisAlignment: mainAxisAlignment) : MainAxisAlignment.center},\n"
        "crossAxisAlignment: ${crossAxisAlignment != null ? getCrossAxisAlignment(crossAxisAlignment: crossAxisAlignment) : CrossAxisAlignment.center},\n"
        "obscureText: ${obscureText ?? false},\n"
        "borderRadius: ${borderRadius ?? OTP_BORDER_RADIUS},\n"
        "textStyle: TextStyle(\n"
        "fontWeight: ${fontWeight != null ? getFontWeight(fontWeight) : FontWeight.normal},\n"
        "fontStyle: ${fontStyle ?? FontStyle.normal},\n"
        "fontSize: ${fontSize ?? DEFAULT_FONT_SIZE},\n"
        "color: ${fontColor ?? DEFAULT_TEXT_COLOR},\n"
        "),\n"
        "onCodeChanged: (String code) {},\n"
        "onSubmit: (String verificationCode) {},\n"
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
        "child:${getOTPTextFieldString()},\n"
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
      return _getStringExpanded(_getStringPadding(getOTPTextFieldString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getOTPTextFieldString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getOTPTextFieldString());
    } else {
      return getOTPTextFieldString();
    }
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';"];
  }

  /// Import pubspec.yaml lib name
  getYamlLib() {
    return ["#OTP TextField lib", "flutter_otp_text_field: ^1.0.0 \n\n"];
  }
}
