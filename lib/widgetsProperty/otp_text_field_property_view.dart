import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/otp_text_field_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class OTPTextFieldPropertyView extends StatefulWidget {
  @override
  OTPTextFieldPropertyViewState createState() => OTPTextFieldPropertyViewState();
}

class OTPTextFieldPropertyViewState extends State<OTPTextFieldPropertyView> {
  var otpTextFieldClass;

  init() async {
    otpTextFieldClass = appStore.currentSelectedWidget!.widgetViewModel as OTPTextFieldClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              padding: otpTextFieldClass.padding,
              onPaddingChanged: (l, t, r, b) {
                otpTextFieldClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(otpTextFieldClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: otpTextFieldClass.isAlignX,
              isAlignY: otpTextFieldClass.isAlignY,
              alignX: otpTextFieldClass.horizontalAlignment ?? 0,
              alignY: otpTextFieldClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                otpTextFieldClass.horizontalAlignment = h;
                otpTextFieldClass.verticalAlignment = v;
                appStore.updateData(otpTextFieldClass);
              },
              isAlignXChanged: (value) {
                otpTextFieldClass.isAlignX = value;
                appStore.updateData(otpTextFieldClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                otpTextFieldClass.isAlignY = value;
                appStore.updateData(otpTextFieldClass);
                appStore.setIsAlignY(value);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.expandedAndFlex,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkBoxView(
                  otpTextFieldClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      otpTextFieldClass.isExpanded = value;
                      appStore.updateData(otpTextFieldClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: otpTextFieldClass.flex != null ? otpTextFieldClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      otpTextFieldClass.flex = int.tryParse(s);
                      appStore.updateData(otpTextFieldClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(otpTextFieldClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.filedStyle,
          context,
          <Widget>[
            checkBoxView(
              otpTextFieldClass.showFieldAsBox ?? false,
              language!.showFieldAsBox,
              onChanged: (value) {
                otpTextFieldClass.showFieldAsBox = value;
                appStore.updateData(otpTextFieldClass);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.fillColor,
          context,
          <Widget>[
            ColorView(
              color: otpTextFieldClass.fillColor ?? OTP_FILL_COLOR,
              applyColor: () {
                otpTextFieldClass.fillColor = appStore.color;
                setState(() {});
                appStore.updateData(otpTextFieldClass);
              },
              pickColor: () {
                showColorPicker(context, otpTextFieldClass.fillColor ?? OTP_FILL_COLOR, applyOnWidget: (color) {
                  otpTextFieldClass.fillColor = color;
                  setState(() {});
                  appStore.updateData(otpTextFieldClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.enableBorderColor,
          context,
          <Widget>[
            ColorView(
              color: otpTextFieldClass.enabledBorderColor ?? OTP_ENABLE_BORDER_COLOR,
              applyColor: () {
                otpTextFieldClass.enabledBorderColor = appStore.color;
                setState(() {});
                appStore.updateData(otpTextFieldClass);
              },
              pickColor: () {
                showColorPicker(context, otpTextFieldClass.enabledBorderColor ?? OTP_ENABLE_BORDER_COLOR, applyOnWidget: (color) {
                  otpTextFieldClass.enabledBorderColor = color;
                  setState(() {});
                  appStore.updateData(otpTextFieldClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.focusBorderColor,
          context,
          <Widget>[
            ColorView(
              color: otpTextFieldClass.focusBorderColor ?? COMMON_BG_COLOR,
              applyColor: () {
                otpTextFieldClass.focusBorderColor = appStore.color;
                setState(() {});
                appStore.updateData(otpTextFieldClass);
              },
              pickColor: () {
                showColorPicker(context, otpTextFieldClass.focusBorderColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  otpTextFieldClass.focusBorderColor = color;
                  setState(() {});
                  appStore.updateData(otpTextFieldClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.borderWidth,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: otpTextFieldClass.borderWidth != null ? otpTextFieldClass.borderWidth.toString() : OTP_BORDER_WIDTH.toString()),
                textAlign: TextAlign.center,
                contentPadding: EdgeInsets.all(18),
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (String s) {
                  if (s.isDigit()) {
                    otpTextFieldClass.borderWidth = s.toInt().toDouble();
                  } else {
                    otpTextFieldClass.borderWidth = OTP_BORDER_WIDTH;
                  }
                  appStore.updateData(otpTextFieldClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.fieldWidth,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: otpTextFieldClass.fieldWidth != null ? otpTextFieldClass.fieldWidth.toString() : OTP_FIELD_WIDTH.toString()),
                textAlign: TextAlign.center,
                contentPadding: EdgeInsets.all(18),
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (String s) {
                  if (s.isDigit()) {
                    otpTextFieldClass.fieldWidth = s.toInt().toDouble();
                  } else {
                    otpTextFieldClass.fieldWidth = OTP_FIELD_WIDTH;
                  }
                  appStore.updateData(otpTextFieldClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.margin,
          context,
          <Widget>[
            paddingView(
                padding: otpTextFieldClass.margin ?? OTP_MARGIN,
                onPaddingChanged: (l, t, r, b) {
                  otpTextFieldClass.margin = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(otpTextFieldClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.mainAxisAlignment,
          context,
          <Widget>[
            getDropDownField(mainAxisAlignment, defaultValue: otpTextFieldClass.mainAxisAlignment ?? AxisAlignmentCenter, onChanged: (value) {
              otpTextFieldClass.mainAxisAlignment = value;
              setState(() {});
              appStore.updateData(otpTextFieldClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.crossAxisAlignment,
          context,
          <Widget>[
            getDropDownField(crossAxisAlignment, defaultValue: otpTextFieldClass.crossAxisAlignment ?? AxisAlignmentCenter, onChanged: (value) {
              otpTextFieldClass.crossAxisAlignment = value;
              setState(() {});
              appStore.updateData(otpTextFieldClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.obsureText,
          context,
          <Widget>[
            checkBoxView(
              otpTextFieldClass.obscureText ?? false,
              language!.passwordFiled,
              onChanged: (value) {
                otpTextFieldClass.obscureText = value;
                appStore.updateData(otpTextFieldClass);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.borderRadius,
          context,
          <Widget>[
            radiusView(
              radius: otpTextFieldClass.borderRadius,
              onRadiusChanged: (tl, tr, br, bt) {
                otpTextFieldClass.borderRadius = BorderRadius.only(
                  topLeft: Radius.circular(tl),
                  topRight: Radius.circular(tr),
                  bottomLeft: Radius.circular(br),
                  bottomRight: Radius.circular(bt),
                );
                appStore.updateData(otpTextFieldClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.textStyle,
          context,
          <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language!.fontWeight,
                      style: secondaryTextStyle(),
                    ),
                    8.height,
                    getDropDownField(fontWeight, defaultValue: otpTextFieldClass.fontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      otpTextFieldClass.fontWeight = value;
                      setState(() {});
                      appStore.updateData(otpTextFieldClass);
                    }),
                  ],
                ).expand(flex: 2),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language!.fontSize,
                      style: secondaryTextStyle(),
                    ),
                    8.height,
                    getTextField(
                      controller: TextEditingController(text: otpTextFieldClass.fontSize != null ? otpTextFieldClass.fontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        otpTextFieldClass.fontSize = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_FONT_SIZE;
                        appStore.updateData(otpTextFieldClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ],
                ).expand(),
              ],
            ),
            10.height,
            getSubPropertyWidget(
              title: language!.fontColor,
              widget: ColorView(
                color: otpTextFieldClass.fontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  otpTextFieldClass.fontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(otpTextFieldClass);
                },
                pickColor: () {
                  showColorPicker(context, otpTextFieldClass.fontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    otpTextFieldClass.fontColor = color;
                    appStore.updateData(otpTextFieldClass);
                    setState(() {});
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontStyle,
              widget: checkBoxView(
                otpTextFieldClass.fontStyle == FontStyle.italic ? true : false,
                language!.italic,
                onChanged: (value) {
                  otpTextFieldClass.fontStyle = value ? FontStyle.italic : FontStyle.normal;
                  setState(() {});
                  appStore.updateData(otpTextFieldClass);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
