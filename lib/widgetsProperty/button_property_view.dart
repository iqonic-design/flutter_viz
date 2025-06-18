import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/text_button_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class ButtonPropertyView extends StatefulWidget {
  static String tag = '/ButtonPropertyView';

  @override
  ButtonPropertyViewState createState() => ButtonPropertyViewState();
}

class ButtonPropertyViewState extends State<ButtonPropertyView> {
  var textButtonClass;
  TextEditingController? widthController, heightController;

  init() async {
    textButtonClass = appStore.currentSelectedWidget!.widgetViewModel as TextButtonClass?;
    if (textButtonClass.isWidthClear) {
      widthController = TextEditingController(text: "");
    } else {
      widthController = TextEditingController(text: textButtonClass.minWidth != null ? getWidthControllerValue(textButtonClass.minWidth, textButtonClass.widthType) : DEFAULT_TEXT_BUTTON_WIDTH.toInt().toString());
    }
    if (textButtonClass.isHeightClear) {
      heightController = TextEditingController(text: "");
    } else {
      heightController = TextEditingController(text: textButtonClass.height != null ? getWidthControllerValue(textButtonClass.height, textButtonClass.heightType) : DEFAULT_TEXT_BUTTON_HEIGHT.toInt().toString());
    }
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
              onPaddingChanged: (l, t, r, b) {
                textButtonClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(textButtonClass);
              },
              padding: textButtonClass.padding,
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: textButtonClass.isAlignX,
              isAlignY: textButtonClass.isAlignY,
              alignX: textButtonClass.horizontalAlignment ?? 0,
              alignY: textButtonClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                textButtonClass.horizontalAlignment = h;
                textButtonClass.verticalAlignment = v;
                appStore.updateData(textButtonClass);
              },
              isAlignXChanged: (value) {
                textButtonClass.isAlignX = value;
                appStore.updateData(textButtonClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                textButtonClass.isAlignY = value;
                appStore.updateData(textButtonClass);
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
                  textButtonClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      textButtonClass.isExpanded = value;
                      appStore.updateData(textButtonClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(
                        text: textButtonClass.flex != null ? textButtonClass.flex.toString() : DEFAULT_FLEX.toString(),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (s) {
                        textButtonClass.flex = int.tryParse(s);
                        appStore.updateData(textButtonClass);
                      }),
                ).visible(textButtonClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.text,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: textButtonClass.text != null ? textButtonClass.text : "Button"),
              hint: "",
              onChanged: (value) {
                textButtonClass.text = value;
                appStore.updateData(textButtonClass);
              },
            )
          ],
        ),
        ExpansionTileView(
          language!.fillColor,
          context,
          <Widget>[
            ColorView(
              color: textButtonClass.backgroundColor ?? DEFAULT_TEXT_BUTTON_BG_COLOR,
              applyColor: () {
                textButtonClass.backgroundColor = appStore.color;
                setState(() {});
                appStore.updateData(textButtonClass);
              },
              pickColor: () {
                showColorPicker(context, textButtonClass.backgroundColor ?? DEFAULT_TEXT_BUTTON_BG_COLOR, applyOnWidget: (color) {
                  textButtonClass.backgroundColor = color;
                  appStore.updateData(textButtonClass);
                  setState(() {});
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
                textButtonClass.contentPadding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(textButtonClass);
              },
              padding: textButtonClass.contentPadding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ],
        ),
        ExpansionTileView(
          language!.elevation,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: textButtonClass.elevation != null ? textButtonClass.elevation.toString() : DEFAULT_TEXT_BUTTON_ELEVATION.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  textButtonClass.elevation = double.parse(value);
                  appStore.updateData(textButtonClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(language!.borderProperties, context, <Widget>[
          getSubPropertyWidget(
            title: language!.radius,
            widget: radiusView(
                radius: textButtonClass.borderRadius,
                onRadiusChanged: (tl, tr, br, bt) {
                  textButtonClass.borderRadius = BorderRadius.only(
                    topLeft: Radius.circular(tl),
                    topRight: Radius.circular(tr),
                    bottomLeft: Radius.circular(br),
                    bottomRight: Radius.circular(bt),
                  );
                  appStore.updateData(textButtonClass);
                }),
          ),
          getSubPropertyWidget(
            title: language!.color,
            widget: ColorView(
              color: textButtonClass.borderColor ?? DEFAULT_TEXT_BUTTON_BORDER_COLOR,
              isRemoveColor: true,
              applyColor: () {
                textButtonClass.borderColor = appStore.color;
                setState(() {});
                appStore.updateData(textButtonClass);
              },
              pickColor: () {
                showColorPicker(context, textButtonClass.borderColor ?? DEFAULT_TEXT_BUTTON_BORDER_COLOR, applyOnWidget: (color) {
                  textButtonClass.borderColor = color;
                  appStore.updateData(textButtonClass);
                  setState(() {});
                });
              },
            ),
          ),
          getSubPropertyWidget(
            title: language!.width,
            widget: Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: textButtonClass.borderWidth != null ? textButtonClass.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  textButtonClass.borderWidth = double.tryParse(value);
                  appStore.updateData(textButtonClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ),
        ]),
        ExpansionTileView(language!.fontProperties, context, <Widget>[
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
                  getDropDownField(fontWeight, defaultValue: textButtonClass.tFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                    textButtonClass.tFontWeight = value;
                    setState(() {});
                    appStore.updateData(textButtonClass);
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
                    controller: TextEditingController(
                      text: textButtonClass.tFontSize != null ? textButtonClass.tFontSize.toString() : DEFAULT_FONT_SIZE.toString(),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                    ],
                    onChanged: (dynamic value) {
                      textButtonClass.tFontSize = double.tryParse(value);
                      appStore.updateData(textButtonClass);
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
              color: textButtonClass.textColor ?? Colors.black,
              applyColor: () {
                textButtonClass.textColor = appStore.color;
                setState(() {});
                appStore.updateData(textButtonClass);
              },
              pickColor: () {
                showColorPicker(context, textButtonClass.textColor ?? Colors.black, applyOnWidget: (color) {
                  textButtonClass.textColor = color;
                  setState(() {});
                  appStore.updateData(textButtonClass);
                });
              },
            ),
          ),
          getSubPropertyWidget(
            title: language!.fontStyle,
            widget: checkBoxView(
              textButtonClass.tFontStyle == FontStyle.italic ? true : false,
              language!.italic,
              onChanged: (value) {
                textButtonClass.tFontStyle = value ? FontStyle.italic : FontStyle.normal;
                setState(() {});
                appStore.updateData(textButtonClass);
              },
            ),
          ),
        ]),
        ExpansionTileView(
          language!.heightAndMinWidth,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getImageWidthType(
                  controller: widthController,
                  title: language!.minWidth,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: textButtonClass.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      textButtonClass.minWidth = null;
                      textButtonClass.isWidthClear = true;
                      appStore.updateData(textButtonClass);
                    } else {
                      if (s.isDigit()) {
                        textButtonClass.minWidth = (s.toInt().toDouble() > 100 && textButtonClass.widthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        textButtonClass.isWidthClear = false;
                        appStore.updateData(textButtonClass);
                      }
                    }
                  },
                  onTapPer: () {
                    textButtonClass.widthType = TypePercentage;
                    setState(() {});
                    textButtonClass.minWidth = widthController!.text.toInt().toDouble();
                    if (textButtonClass.minWidth > 100) {
                      textButtonClass.minWidth = DEFAULT_CONTAINER_PER;
                      appStore.updateData(textButtonClass);
                    } else {
                      appStore.updateData(textButtonClass);
                    }
                  },
                  onTapPX: () {
                    textButtonClass.widthType = TypePX;
                    setState(() {});
                    textButtonClass.minWidth = widthController!.text.toInt().toDouble();
                    appStore.updateData(textButtonClass);
                  },
                ).expand(flex: 1),
                getImageWidthType(
                  controller: heightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: textButtonClass.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      textButtonClass.height = null;
                      textButtonClass.isHeightClear = true;
                      appStore.updateData(textButtonClass);
                    } else {
                      if (s.isDigit()) {
                        textButtonClass.height = (s.toInt().toDouble() > 100 && textButtonClass.heightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        textButtonClass.isHeightClear = false;
                        appStore.updateData(textButtonClass);
                      }
                    }
                  },
                  onTapPer: () {
                    textButtonClass.heightType = TypePercentage;
                    setState(() {});
                    textButtonClass.height = heightController!.text.toInt().toDouble();
                    if (textButtonClass.height > 100) {
                      textButtonClass.height = DEFAULT_CONTAINER_PER;
                      appStore.updateData(textButtonClass);
                    } else {
                      appStore.updateData(textButtonClass);
                    }
                  },
                  onTapPX: () {
                    textButtonClass.heightType = TypePX;
                    setState(() {});
                    textButtonClass.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(textButtonClass);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
