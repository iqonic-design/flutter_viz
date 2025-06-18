import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/text_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'comman_property_view.dart';

class TextPropertyView extends StatefulWidget {
  static String tag = '/TextPropertyView';

  @override
  TextPropertyViewState createState() => TextPropertyViewState();
}

class TextPropertyViewState extends State<TextPropertyView> {
  var textModel;

  init() async {
    textModel = appStore.currentSelectedWidget!.widgetViewModel as TextClass?;
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
              padding: textModel.padding,
              onPaddingChanged: (l, t, r, b) {
                textModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(textModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: textModel.isAlignX,
              isAlignY: textModel.isAlignY,
              alignX: textModel.horizontalAlignment ?? 0,
              alignY: textModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                textModel.horizontalAlignment = h;
                textModel.verticalAlignment = v;
                appStore.updateData(textModel);
              },
              isAlignXChanged: (value) {
                textModel.isAlignX = value;
                appStore.updateData(textModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                textModel.isAlignY = value;
                appStore.updateData(textModel);
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
                  textModel.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      textModel.isExpanded = value;
                      appStore.updateData(textModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: textModel.flex != null ? textModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      textModel.flex = int.tryParse(s);
                      appStore.updateData(textModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(textModel.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.text,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: textModel.text != null ? textModel.text : "Text"),
              hint: "Enter Text",
              onChanged: (s) {
                textModel.text = s;
                appStore.updateData(textModel);
              },
            )
          ],
        ),
        ExpansionTileView(
          language!.fontWeightAndSize,
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
                    getDropDownField(fontWeight, defaultValue: textModel.fWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      textModel.fWeight = value;
                      setState(() {});
                      appStore.updateData(textModel);
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
                      controller: TextEditingController(text: textModel.fontSize != null ? textModel.fontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        textModel.fontSize = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_FONT_SIZE;
                        appStore.updateData(textModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ],
                ).expand(),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.textColor,
          context,
          <Widget>[
            ColorView(
              color: textModel.textColor ?? DEFAULT_TEXT_COLOR,
              applyColor: () {
                textModel.textColor = appStore.color;
                setState(() {});
                appStore.updateData(textModel);
              },
              pickColor: () {
                showColorPicker(context, textModel.textColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                  textModel.textColor = color;
                  setState(() {});
                  appStore.updateData(textModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.textAlign,
          context,
          <Widget>[
            TextAlignView(
              tAlign: textModel.textAlign,
              onTextAlignChanged: (textAlign) {
                textModel.textAlign = textAlign;
                appStore.updateData(textModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.fontStyle,
          context,
          <Widget>[
            checkBoxView(
              textModel.fontStyle == FontStyle.italic ? true : false,
              language!.italic,
              onChanged: (value) {
                textModel.fontStyle = value ? FontStyle.italic : FontStyle.normal;
                setState(() {});
                appStore.updateData(textModel);
              },
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
                controller: TextEditingController(text: textModel.maxLines != null ? textModel.maxLines.toString() : ""),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (s) {
                  textModel.maxLines = int.tryParse(s);
                  appStore.updateData(textModel);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.overflow,
          context,
          <Widget>[
            getDropDownField(overflow, defaultValue: textModel.overflow ?? OverflowTypeClip, onChanged: (value) {
              textModel.overflow = value;
              setState(() {});
              appStore.updateData(textModel);
            }),
          ],
        ),
      ],
    );
  }
}
