import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/checkbox_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class CheckBoxPropertyView extends StatefulWidget {
  static String tag = '/CheckBoxPropertyView';

  @override
  CheckBoxPropertyViewState createState() => CheckBoxPropertyViewState();
}

class CheckBoxPropertyViewState extends State<CheckBoxPropertyView> {
  var checkboxModel;

  init() async {
    checkboxModel = appStore.currentSelectedWidget!.widgetViewModel as CheckboxClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              onPaddingChanged: (l, t, r, b) {
                checkboxModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(checkboxModel);
              },
              padding: checkboxModel.padding,
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: checkboxModel.isAlignX,
              isAlignY: checkboxModel.isAlignY,
              alignX: checkboxModel.horizontalAlignment ?? 0,
              alignY: checkboxModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                checkboxModel.horizontalAlignment = h;
                checkboxModel.verticalAlignment = v;
                appStore.updateData(checkboxModel);
              },
              isAlignXChanged: (value) {
                checkboxModel.isAlignX = value;
                appStore.updateData(checkboxModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                checkboxModel.isAlignY = value;
                appStore.updateData(checkboxModel);
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
                  checkboxModel.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      checkboxModel.isExpanded = value;
                      appStore.updateData(checkboxModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: checkboxModel.flex != null ? checkboxModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      checkboxModel.flex = int.tryParse(s);
                      appStore.updateData(checkboxModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(checkboxModel.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.value,
          context,
          <Widget>[
            checkBoxView(checkboxModel.value ?? true, language!.value, onChanged: (val) {
              checkboxModel.value = val;
              setState(() {});
              appStore.updateData(checkboxModel);
            }),
          ],
        ),
        ExpansionTileView(
          language!.activeColor,
          context,
          <Widget>[
            ColorView(
              color: checkboxModel.activeColor ?? COMMON_BG_COLOR,
              applyColor: () {
                checkboxModel.activeColor = appStore.color;
                setState(() {});
                appStore.updateData(checkboxModel);
              },
              pickColor: () {
                showColorPicker(context, checkboxModel.activeColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  checkboxModel.activeColor = color;
                  setState(() {});
                  appStore.updateData(checkboxModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.checkColor,
          context,
          <Widget>[
            ColorView(
              color: checkboxModel.checkColor ?? DEFAULT_CHECK_COLOR,
              applyColor: () {
                checkboxModel.checkColor = appStore.color;
                setState(() {});
                appStore.updateData(checkboxModel);
              },
              pickColor: () {
                showColorPicker(context, checkboxModel.checkColor ?? DEFAULT_CHECK_COLOR, applyOnWidget: (color) {
                  checkboxModel.checkColor = color;
                  setState(() {});
                  appStore.updateData(checkboxModel);
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
              checkboxModel.autoFocus ?? false,
              language!.autoFocus,
              onChanged: (value) {
                checkboxModel.autoFocus = value;
                setState(() {});
                appStore.updateData(checkboxModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.focusColor,
          context,
          <Widget>[
            ColorView(
              color: checkboxModel.focusColor ?? DEFAULT_FOCUS_COLOR,
              applyColor: () {
                checkboxModel.focusColor = appStore.color;
                setState(() {});
                appStore.updateData(checkboxModel);
              },
              pickColor: () {
                showColorPicker(context, checkboxModel.focusColor ?? DEFAULT_FOCUS_COLOR, applyOnWidget: (color) {
                  checkboxModel.focusColor = color;
                  setState(() {});
                  appStore.updateData(checkboxModel);
                });
              },
            ),
          ],
        ).visible(checkboxModel.autoFocus ?? false),
        ExpansionTileView(
          language!.hoverColor,
          context,
          <Widget>[
            ColorView(
              color: checkboxModel.hoverColor ?? DEFAULT_HOVER_COLOR,
              applyColor: () {
                checkboxModel.hoverColor = appStore.color;
                setState(() {});
                appStore.updateData(checkboxModel);
              },
              pickColor: () {
                showColorPicker(context, checkboxModel.hoverColor ?? DEFAULT_HOVER_COLOR, applyOnWidget: (color) {
                  checkboxModel.hoverColor = color;
                  setState(() {});
                  appStore.updateData(checkboxModel);
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
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: checkboxModel.splashRadius != null ? checkboxModel.splashRadius.toString() : DEFAULT_SPREAD_RADIUS.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  checkboxModel.splashRadius = double.tryParse(s);
                  appStore.updateData(checkboxModel);
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
