import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/chip_view_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class ChipViewProperty extends StatefulWidget {
  static String tag = '/ChipViewProperty';

  @override
  ChipViewPropertyState createState() => ChipViewPropertyState();
}

class ChipViewPropertyState extends State<ChipViewProperty> {
  var chipViewClass;

  init() async {
    chipViewClass = appStore.currentSelectedWidget!.widgetViewModel as ChipViewClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
                padding: chipViewClass.padding,
                onPaddingChanged: (l, t, r, b) {
                  chipViewClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(chipViewClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: chipViewClass.isAlignX,
              isAlignY: chipViewClass.isAlignY,
              alignX: chipViewClass.horizontalAlignment ?? 0,
              alignY: chipViewClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                chipViewClass.horizontalAlignment = h;
                chipViewClass.verticalAlignment = v;
                appStore.updateData(chipViewClass);
              },
              isAlignXChanged: (value) {
                chipViewClass.isAlignX = value;
                appStore.updateData(chipViewClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                chipViewClass.isAlignY = value;
                appStore.updateData(chipViewClass);
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
                  chipViewClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      chipViewClass.isExpanded = value;
                      appStore.updateData(chipViewClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: chipViewClass.flex != null ? chipViewClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      chipViewClass.flex = int.tryParse(s);
                      appStore.updateData(chipViewClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(chipViewClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.text,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: chipViewClass.text != null ? chipViewClass.text : "Chip View"),
              hint: chipViewClass.text ?? "Text Hint",
              onChanged: (s) {
                chipViewClass.text = s;
                appStore.updateData(chipViewClass);
              },
            )
          ],
        ),
        ExpansionTileView(
          language!.contentPadding,
          context,
          <Widget>[
            paddingView(
                padding: chipViewClass.labelPadding ?? EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                onPaddingChanged: (l, t, r, b) {
                  chipViewClass.labelPadding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(chipViewClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.color,
          context,
          <Widget>[
            ColorView(
              color: chipViewClass.bgColor ?? COMMON_BG_COLOR,
              applyColor: () {
                chipViewClass.bgColor = appStore.color;
                setState(() {});
                appStore.updateData(chipViewClass);
              },
              pickColor: () {
                showColorPicker(context, chipViewClass.bgColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  chipViewClass.bgColor = color;
                  setState(() {});
                  appStore.updateData(chipViewClass);
                });
              },
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
                controller: TextEditingController(text: chipViewClass.elevation != null ? chipViewClass.elevation.toString() : DEFAULT_CHIP_ELEVATION.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  chipViewClass.elevation = double.parse(value);
                  appStore.updateData(chipViewClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.shadowColor,
          context,
          <Widget>[
            ColorView(
              color: chipViewClass.shadowColor ?? DEFAULT_CHIP_SHADOW_COLOR,
              applyColor: () {
                chipViewClass.shadowColor = appStore.color;
                setState(() {});
                appStore.updateData(chipViewClass);
              },
              pickColor: () {
                showColorPicker(context, chipViewClass.shadowColor ?? DEFAULT_CHIP_SHADOW_COLOR, applyOnWidget: (color) {
                  chipViewClass.shadowColor = color;
                  setState(() {});
                  appStore.updateData(chipViewClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.fontProperties,
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
                    getDropDownField(fontWeight, defaultValue: chipViewClass.tFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      chipViewClass.tFontWeight = value;
                      setState(() {});
                      appStore.updateData(chipViewClass);
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
                      controller: TextEditingController(text: chipViewClass.tFontSize != null ? chipViewClass.tFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (dynamic value) {
                        chipViewClass.tFontSize = double.tryParse(value);
                        appStore.updateData(chipViewClass);
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
                color: chipViewClass.textColor ?? DEFAULT_CHIP_TEXT_COLOR,
                applyColor: () {
                  chipViewClass.textColor = appStore.color;
                  setState(() {});
                  appStore.updateData(chipViewClass);
                },
                pickColor: () {
                  showColorPicker(context, chipViewClass.textColor ?? DEFAULT_CHIP_TEXT_COLOR, applyOnWidget: (color) {
                    chipViewClass.textColor = color;
                    setState(() {});
                    appStore.updateData(chipViewClass);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontStyle,
              widget: checkBoxView(
                chipViewClass.tFontStyle == FontStyle.italic ? true : false,
                language!.italic,
                onChanged: (value) {
                  chipViewClass.tFontStyle = value ? FontStyle.italic : FontStyle.normal;
                  setState(() {});
                  appStore.updateData(chipViewClass);
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
              title: language!.radius,
              widget: radiusView(
                radius: chipViewClass.borderRadius ?? BorderRadius.circular(16),
                onRadiusChanged: (tl, tr, br, bt) {
                  chipViewClass.borderRadius = BorderRadius.only(
                    topLeft: Radius.circular(tl),
                    topRight: Radius.circular(tr),
                    bottomLeft: Radius.circular(br),
                    bottomRight: Radius.circular(bt),
                  );
                  appStore.updateData(chipViewClass);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: chipViewClass.borderColor ?? TRANSPARENT_COLOR,
                isRemoveColor: true,
                applyColor: () {
                  chipViewClass.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(chipViewClass);
                },
                pickColor: () {
                  showColorPicker(context, chipViewClass.borderColor ?? TRANSPARENT_COLOR, applyOnWidget: (color) {
                    chipViewClass.borderColor = color;
                    setState(() {});
                    appStore.updateData(chipViewClass);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: chipViewClass.borderWidth != null ? chipViewClass.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (value) {
                    chipViewClass.borderWidth = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_BORDER_WIDTH;
                    appStore.updateData(chipViewClass);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
