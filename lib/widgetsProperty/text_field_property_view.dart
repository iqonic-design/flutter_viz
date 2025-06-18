import 'dart:convert';

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/text_field_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class TextFieldPropertyView extends StatefulWidget {
  static String tag = '/TextFieldPropertyView';

  @override
  TextFieldPropertyViewState createState() => TextFieldPropertyViewState();
}

class TextFieldPropertyViewState extends State<TextFieldPropertyView> {
  var textFiledClass;

  init() async {
    textFiledClass = appStore.currentSelectedWidget!.widgetViewModel as TextFieldClass?;
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
              padding: textFiledClass.padding,
              onPaddingChanged: (l, t, r, b) {
                textFiledClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(textFiledClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: textFiledClass.isAlignX,
              isAlignY: textFiledClass.isAlignY,
              alignX: textFiledClass.horizontalAlignment ?? 0,
              alignY: textFiledClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                textFiledClass.horizontalAlignment = h;
                textFiledClass.verticalAlignment = v;
                appStore.updateData(textFiledClass);
              },
              isAlignXChanged: (value) {
                textFiledClass.isAlignX = value;
                appStore.updateData(textFiledClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                textFiledClass.isAlignY = value;
                appStore.updateData(textFiledClass);
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
                  textFiledClass.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      textFiledClass.isExpanded = value;
                      appStore.updateData(textFiledClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: 70,
                  child: getTextField(
                    controller: TextEditingController(text: textFiledClass.flex != null ? textFiledClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      textFiledClass.flex = int.tryParse(s);
                      appStore.updateData(textFiledClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(textFiledClass.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.initialValue,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: textFiledClass.initialValue != null ? textFiledClass.initialValue : ""),
              onChanged: (value) {
                textFiledClass.initialValue = value;
                appStore.updateData(textFiledClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.labelText,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: textFiledClass.labelText != null ? textFiledClass.labelText : null),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  textFiledClass.labelText = value;
                } else {
                  textFiledClass.labelText = null;
                }
                appStore.updateData(textFiledClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.hintText,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: textFiledClass.hintText != null ? textFiledClass.hintText : "Enter Text"),
              onChanged: (value) {
                textFiledClass.hintText = value;
                appStore.updateData(textFiledClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.textAlign,
          context,
          <Widget>[
            TextAlignView(
              tAlign: textFiledClass.textAlign,
              onTextAlignChanged: (textAlign) {
                textFiledClass.textAlign = textAlign;
                appStore.updateData(textFiledClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.filled,
          context,
          <Widget>[
            checkBoxView(
              textFiledClass.isFill ?? false,
              language!.filled,
              onChanged: (value) {
                textFiledClass.isFill = value;
                appStore.updateData(textFiledClass);
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
              color: textFiledClass.fillColor ?? DEFAULT_TEXT_FIELD_COLOR,
              applyColor: () {
                textFiledClass.fillColor = appStore.color;
                setState(() {});
                appStore.updateData(textFiledClass);
              },
              pickColor: () {
                showColorPicker(context, textFiledClass.fillColor ?? DEFAULT_TEXT_FIELD_COLOR, applyOnWidget: (color) {
                  if (textFiledClass.isFill) {
                    textFiledClass.fillColor = color;
                    setState(() {});
                    appStore.updateData(textFiledClass);
                  }
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.contentPadding,
          context,
          <Widget>[
            paddingView(
              onPaddingChanged: (l, t, r, b) {
                textFiledClass.contentPadding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(textFiledClass);
              },
              padding: textFiledClass.contentPadding ?? EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                    getDropDownField(fontWeight, defaultValue: textFiledClass.fontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      textFiledClass.fontWeight = value;
                      setState(() {});
                      appStore.updateData(textFiledClass);
                    }),
                  ],
                ).expand(flex: 2),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(language!.fontSize, style: secondaryTextStyle()),
                    8.height,
                    getTextField(
                      controller: TextEditingController(text: textFiledClass.fontSize != null ? textFiledClass.fontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        textFiledClass.fontSize = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_FONT_SIZE;
                        appStore.updateData(textFiledClass);
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
                color: textFiledClass.fontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  textFiledClass.fontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(textFiledClass);
                },
                pickColor: () {
                  showColorPicker(context, textFiledClass.fontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    textFiledClass.fontColor = color;
                    appStore.updateData(textFiledClass);
                    setState(() {});
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontStyle,
              widget: checkBoxView(
                textFiledClass.fontStyle == FontStyle.italic ? true : false,
                language!.italic,
                onChanged: (value) {
                  textFiledClass.fontStyle = value ? FontStyle.italic : FontStyle.normal;
                  setState(() {});
                  appStore.updateData(textFiledClass);
                },
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.hintTextStyle,
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
                      style: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : DEFAULT_TEXT_COLOR, fontSize: 14),
                    ),
                    8.height,
                    getDropDownField(fontWeight, defaultValue: textFiledClass.hintFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      textFiledClass.hintFontWeight = value;
                      setState(() {});
                      appStore.updateData(textFiledClass);
                    }),
                  ],
                ).expand(flex: 2),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language!.fontSize,
                      style: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : DEFAULT_TEXT_COLOR, fontSize: 14),
                    ),
                    8.height,
                    getTextField(
                      controller: TextEditingController(text: textFiledClass.hintFontSize != null ? textFiledClass.hintFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        textFiledClass.hintFontSize = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_FONT_SIZE;
                        appStore.updateData(textFiledClass);
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
                color: textFiledClass.hintFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  textFiledClass.hintFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(textFiledClass);
                },
                pickColor: () {
                  showColorPicker(context, textFiledClass.hintFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    textFiledClass.hintFontColor = color;
                    appStore.updateData(textFiledClass);
                    setState(() {});
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontStyle,
              widget: checkBoxView(
                textFiledClass.hintFontStyle == FontStyle.italic ? true : false,
                language!.italic,
                onChanged: (value) {
                  textFiledClass.hintFontStyle = value ? FontStyle.italic : FontStyle.normal;
                  setState(() {});
                  appStore.updateData(textFiledClass);
                },
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.labelTextStyle,
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
                    getDropDownField(fontWeight, defaultValue: textFiledClass.labelFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      textFiledClass.labelFontWeight = value;
                      setState(() {});
                      appStore.updateData(textFiledClass);
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
                      controller: TextEditingController(text: textFiledClass.labelFontSize != null ? textFiledClass.labelFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        textFiledClass.labelFontSize = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_FONT_SIZE;
                        appStore.updateData(textFiledClass);
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
                color: textFiledClass.labelFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  textFiledClass.labelFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(textFiledClass);
                },
                pickColor: () {
                  showColorPicker(context, textFiledClass.labelFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    textFiledClass.labelFontColor = color;
                    appStore.updateData(textFiledClass);
                    setState(() {});
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontStyle,
              widget: checkBoxView(
                textFiledClass.labelFontStyle == FontStyle.italic ? true : false,
                language!.italic,
                onChanged: (value) {
                  textFiledClass.labelFontStyle = value ? FontStyle.italic : FontStyle.normal;
                  setState(() {});
                  appStore.updateData(textFiledClass);
                },
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.borderProperties,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.inputBorderType,
              widget: getDropDownField(inputBorderType, defaultValue: textFiledClass.inputBorder ?? InputBorderTypeOutLine, onChanged: (value) {
                textFiledClass.inputBorder = value;
                setState(() {});
                appStore.updateData(textFiledClass);
              }),
            ),
            getSubPropertyWidget(
              title: language!.radius,
              widget: radiusView(
                radius: textFiledClass.borderRadius,
                onRadiusChanged: (tl, tr, br, bt) {
                  textFiledClass.borderRadius = BorderRadius.only(
                    topLeft: Radius.circular(tl),
                    topRight: Radius.circular(tr),
                    bottomLeft: Radius.circular(br),
                    bottomRight: Radius.circular(bt),
                  );
                  appStore.updateData(textFiledClass);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: textFiledClass.borderColor ?? DEFAULT_BORDER_COLOR,
                applyColor: () {
                  textFiledClass.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(textFiledClass);
                },
                pickColor: () {
                  showColorPicker(context, textFiledClass.borderColor ?? DEFAULT_BORDER_COLOR, applyOnWidget: (color) {
                    textFiledClass.borderColor = color;
                    setState(() {});

                    appStore.updateData(textFiledClass);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                    contentPadding: EdgeInsets.all(18),
                    controller: TextEditingController(text: textFiledClass.borderWidth != null ? textFiledClass.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                    ],
                    onChanged: (value) {
                      textFiledClass.borderWidth = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_BORDER_WIDTH;
                      appStore.updateData(textFiledClass);
                    }),
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.maxLine,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: (textFiledClass.obscureText ?? false) ? '1' : (textFiledClass.maxLines != null ? textFiledClass.maxLines.toString() : '1')),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (s) {
                  textFiledClass.maxLines = int.tryParse(s);
                  appStore.updateData(textFiledClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(language!.textFieldType, context, <Widget>[
          checkBoxView(
            textFiledClass.obscureText ?? false,
            language!.passwordFiled,
            onChanged: (value) {
              textFiledClass.obscureText = value;
              appStore.updateData(textFiledClass);
              setState(() {});
            },
          ),
        ]),
        ExpansionTileView(
          language!.dense,
          context,
          <Widget>[
            checkBoxView(
              textFiledClass.isDense ?? false,
              language!.dense,
              onChanged: (value) {
                textFiledClass.isDense = value;
                appStore.updateData(textFiledClass);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.prefixIcon,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.icon,
              widget: iconPickerView(
                  isShowRemoved: true,
                  iconDataJson: textFiledClass.prefixIconDataJson,
                  onChanged: (value) {
                    var prefixIconDataJson = jsonDecode(value);
                    textFiledClass.prefixIconDataJson = prefixIconDataJson;
                    setState(() {});
                    appStore.updateData(textFiledClass);
                  },
                  onRemoved: () {
                    textFiledClass.prefixIconDataJson = null;
                    textFiledClass.prefixIconColor = null;
                    textFiledClass.prefixIconSize = null;
                    setState(() {});
                    appStore.updateData(textFiledClass);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: textFiledClass.prefixIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      textFiledClass.prefixIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(textFiledClass);
                    },
                    pickColor: () {
                      showColorPicker(context, textFiledClass.prefixIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        textFiledClass.prefixIconColor = color;
                        appStore.updateData(textFiledClass);
                        setState(() {});
                      });
                    },
                  ),
                ),
                getSubPropertyWidget(
                  title: language!.size,
                  widget: Container(
                    width: widthPropertySize,
                    child: getTextField(
                      controller: TextEditingController(text: textFiledClass.prefixIconSize != null ? textFiledClass.prefixIconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        textFiledClass.prefixIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(textFiledClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(textFiledClass.prefixIconDataJson != null),
          ],
        ),
        ExpansionTileView(
          language!.suffixIcon,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.icon,
              widget: iconPickerView(
                  isShowRemoved: true,
                  iconDataJson: textFiledClass.suffixIconDataJson,
                  onChanged: (value) {
                    var suffixIconDataJson = jsonDecode(value);
                    textFiledClass.suffixIconDataJson = suffixIconDataJson;
                    setState(() {});
                    appStore.updateData(textFiledClass);
                  },
                  onRemoved: () {
                    textFiledClass.suffixIconDataJson = null;
                    textFiledClass.suffixIconColor = null;
                    textFiledClass.suffixIconSize = null;
                    setState(() {});
                    appStore.updateData(textFiledClass);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: textFiledClass.suffixIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      textFiledClass.suffixIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(textFiledClass);
                    },
                    pickColor: () {
                      showColorPicker(context, textFiledClass.suffixIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        textFiledClass.suffixIconColor = color;
                        appStore.updateData(textFiledClass);
                        setState(() {});
                      });
                    },
                  ),
                ),
                getSubPropertyWidget(
                  title: language!.size,
                  widget: Container(
                    width: 120,
                    child: getTextField(
                      controller: TextEditingController(text: textFiledClass.suffixIconSize != null ? textFiledClass.suffixIconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        textFiledClass.suffixIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(textFiledClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(textFiledClass.suffixIconDataJson != null),
          ],
        ),
      ],
    );
  }
}
