import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/radio_button_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class RadioPropertyView extends StatefulWidget {
  static String tag = '/RadioPropertyView';

  @override
  RadioPropertyViewState createState() => RadioPropertyViewState();
}

class RadioPropertyViewState extends State<RadioPropertyView> {
  var radioButtonModel;

  init() async {
    radioButtonModel = appStore.currentSelectedWidget!.widgetViewModel as RadioButtonClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              padding: radioButtonModel.padding,
              onPaddingChanged: (l, t, r, b) {
                radioButtonModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(radioButtonModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: radioButtonModel.isAlignX,
              isAlignY: radioButtonModel.isAlignY,
              alignX: radioButtonModel.horizontalAlignment ?? 0,
              alignY: radioButtonModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                radioButtonModel.horizontalAlignment = h;
                radioButtonModel.verticalAlignment = v;
                appStore.updateData(radioButtonModel);
              },
              isAlignXChanged: (value) {
                radioButtonModel.isAlignX = value;
                appStore.updateData(radioButtonModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                radioButtonModel.isAlignY = value;
                appStore.updateData(radioButtonModel);
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
                  radioButtonModel.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      radioButtonModel.isExpanded = value;
                      appStore.updateData(radioButtonModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: 70,
                  child: getTextField(
                    controller: TextEditingController(text: radioButtonModel.flex != null ? radioButtonModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      radioButtonModel.flex = int.tryParse(s);
                      appStore.updateData(radioButtonModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(radioButtonModel.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.value,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                  controller: TextEditingController(text: radioButtonModel.value != null ? radioButtonModel.value : ''),
                  textAlign: TextAlign.center,
                  onChanged: (s) {
                    radioButtonModel.value = s;
                    appStore.updateData(radioButtonModel);
                  }),
            ),
          ],
        ),
        ExpansionTileView(
          language!.groupValue,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                  controller: TextEditingController(text: radioButtonModel.groupValue != null ? radioButtonModel.groupValue : ''),
                  textAlign: TextAlign.center,
                  onChanged: (s) {
                    radioButtonModel.groupValue = s;
                    appStore.updateData(radioButtonModel);
                  },
                  maxLength: commonMaxLength),
            ),
          ],
        ),
        ExpansionTileView(
          language!.activeColor,
          context,
          <Widget>[
            ColorView(
              color: radioButtonModel.activeColor ?? COMMON_BG_COLOR,
              applyColor: () {
                radioButtonModel.activeColor = appStore.color;
                setState(() {});
                appStore.updateData(radioButtonModel);
              },
              pickColor: () {
                showColorPicker(context, radioButtonModel.activeColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  radioButtonModel.activeColor = color;
                  setState(() {});
                  appStore.updateData(radioButtonModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.autoFocus,
          context,
          <Widget>[
            checkBoxView(
              radioButtonModel.autoFocus ?? false,
              language!.autoFocus,
              onChanged: (value) {
                radioButtonModel.autoFocus = value;
                setState(() {});
                appStore.updateData(radioButtonModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.focusColor,
          context,
          <Widget>[
            ColorView(
              color: radioButtonModel.focusColor ?? DEFAULT_FOCUS_COLOR,
              applyColor: () {
                radioButtonModel.focusColor = appStore.color;
                setState(() {});
                appStore.updateData(radioButtonModel);
              },
              pickColor: () {
                showColorPicker(context, radioButtonModel.focusColor ?? DEFAULT_FOCUS_COLOR, applyOnWidget: (color) {
                  radioButtonModel.focusColor = color;
                  setState(() {});
                  appStore.updateData(radioButtonModel);
                });
              },
            ),
          ],
        ).visible(radioButtonModel.autoFocus ?? false),
        ExpansionTileView(
          language!.hoverColor,
          context,
          <Widget>[
            ColorView(
              color: radioButtonModel.hoverColor ?? DEFAULT_HOVER_COLOR,
              applyColor: () {
                radioButtonModel.hoverColor = appStore.color;
                setState(() {});
                appStore.updateData(radioButtonModel);
              },
              pickColor: () {
                showColorPicker(context, radioButtonModel.hoverColor ?? DEFAULT_HOVER_COLOR, applyOnWidget: (color) {
                  radioButtonModel.hoverColor = color;
                  setState(() {});
                  appStore.updateData(radioButtonModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.splashRadius,
          context,
          <Widget>[
            Container(
              width: 120,
              child: getTextField(
                controller: TextEditingController(text: radioButtonModel.splashRadius != null ? radioButtonModel.splashRadius.toString() : DEFAULT_SPREAD_RADIUS.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  radioButtonModel.splashRadius = s.toString().isNotEmpty ? double.parse(s) : '';
                  appStore.updateData(radioButtonModel);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
