import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/switch_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class SwitchPropertyView extends StatefulWidget {
  @override
  SwitchPropertyViewState createState() => SwitchPropertyViewState();
}

class SwitchPropertyViewState extends State<SwitchPropertyView> {
  var switchClass;

  init() async {
    switchClass = appStore.currentSelectedWidget!.widgetViewModel as SwitchClass?;
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
              padding: switchClass.padding,
              onPaddingChanged: (l, t, r, b) {
                switchClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(switchClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: switchClass.isAlignX,
              isAlignY: switchClass.isAlignY,
              alignX: switchClass.horizontalAlignment ?? 0,
              alignY: switchClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                switchClass.horizontalAlignment = h;
                switchClass.verticalAlignment = v;
                appStore.updateData(switchClass);
              },
              isAlignXChanged: (value) {
                switchClass.isAlignX = value;
                appStore.updateData(switchClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                switchClass.isAlignY = value;
                appStore.updateData(switchClass);
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
                  switchClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      switchClass.isExpanded = value;
                      appStore.updateData(switchClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: switchClass.flex != null ? switchClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      switchClass.flex = int.tryParse(s);
                      appStore.updateData(switchClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(switchClass.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.value,
          context,
          <Widget>[
            checkBoxView(
              switchClass.value ?? true,
              language!.switchInitialValue,
              onChanged: (value) {
                switchClass.value = value;
                setState(() {});
                appStore.updateData(switchClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.activeColor,
          context,
          <Widget>[
            ColorView(
              color: switchClass.activeColor ?? COMMON_BG_COLOR,
              applyColor: () {
                switchClass.activeColor = appStore.color;
                setState(() {});
                appStore.updateData(switchClass);
              },
              pickColor: () {
                showColorPicker(context, switchClass.activeColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  switchClass.activeColor = color;
                  setState(() {});
                  appStore.updateData(switchClass);
                });
              },
            ),
          ],
        ).visible(switchClass.value ?? true),
        ExpansionTileView(
          language!.activeTrackColor,
          context,
          <Widget>[
            ColorView(
              color: switchClass.activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR,
              applyColor: () {
                switchClass.activeTrackColor = appStore.color;
                setState(() {});
                appStore.updateData(switchClass);
              },
              pickColor: () {
                showColorPicker(context, switchClass.activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR, applyOnWidget: (color) {
                  switchClass.activeTrackColor = color;
                  setState(() {});
                  appStore.updateData(switchClass);
                });
              },
            ),
          ],
        ).visible(switchClass.value ?? true),
        ExpansionTileView(
          language!.inactiveThumbColor,
          context,
          <Widget>[
            ColorView(
              color: switchClass.inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR,
              applyColor: () {
                switchClass.inactiveThumbColor = appStore.color;
                setState(() {});
                appStore.updateData(switchClass);
              },
              pickColor: () {
                showColorPicker(context, switchClass.inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR, applyOnWidget: (color) {
                  switchClass.inactiveThumbColor = color;
                  setState(() {});
                  appStore.updateData(switchClass);
                });
              },
            ),
          ],
        ).visible(!(switchClass.value ?? true)),
        ExpansionTileView(
          language!.inactiveTrackColor,
          context,
          <Widget>[
            ColorView(
              color: switchClass.inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR,
              applyColor: () {
                switchClass.inactiveTrackColor = appStore.color;
                setState(() {});
                appStore.updateData(switchClass);
              },
              pickColor: () {
                showColorPicker(context, switchClass.inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR, applyOnWidget: (color) {
                  switchClass.inactiveTrackColor = color;
                  setState(() {});
                  appStore.updateData(switchClass);
                });
              },
            ),
          ],
        ).visible(!(switchClass.value ?? true)),
      ],
    );
  }
}
