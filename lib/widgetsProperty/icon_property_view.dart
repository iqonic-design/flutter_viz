import 'dart:convert';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/Icon_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class IconPropertyView extends StatefulWidget {
  @override
  IconPropertyViewState createState() => IconPropertyViewState();
}

class IconPropertyViewState extends State<IconPropertyView> {
  var iconModel;

  init() async {
    iconModel = appStore.currentSelectedWidget!.widgetViewModel as IconClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getHeight(10),
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              padding: iconModel.padding,
              onPaddingChanged: (l, t, r, b) {
                iconModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(iconModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: iconModel.isAlignX,
              isAlignY: iconModel.isAlignY,
              alignX: iconModel.horizontalAlignment ?? 0,
              alignY: iconModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                iconModel.horizontalAlignment = h;
                iconModel.verticalAlignment = v;
                appStore.updateData(iconModel);
              },
              isAlignXChanged: (value) {
                iconModel.isAlignX = value;
                appStore.updateData(iconModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                iconModel.isAlignY = value;
                appStore.updateData(iconModel);
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
                  iconModel.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      iconModel.isExpanded = value;
                      appStore.updateData(iconModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: iconModel.flex != null ? iconModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      iconModel.flex = int.tryParse(s);
                      appStore.updateData(iconModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(iconModel.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.icon,
          context,
          <Widget>[
            iconPickerView(
              iconDataJson: iconModel.iconDataJson ?? {'iconName': 'add', 'codePoint': 57415, 'fontFamily': 'MaterialIcons'},
              onChanged: (value) {
                var iconDataJson = jsonDecode(value);
                printLogData(iconDataJson.toString());
                iconModel.iconDataJson = iconDataJson;
                setState(() {});
                appStore.updateData(iconModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.iconColor,
          context,
          <Widget>[
            ColorView(
              color: iconModel.iconColor ?? DEFAULT_ICON_COLOR,
              applyColor: () {
                iconModel.iconColor = appStore.color;
                setState(() {});
                appStore.updateData(iconModel);
              },
              pickColor: () {
                showColorPicker(context, iconModel.iconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                  iconModel.iconColor = color;
                  setState(() {});
                  appStore.updateData(iconModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.iconSize,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: iconModel.iconSize != null ? iconModel.iconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  iconModel.iconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                  appStore.updateData(iconModel);
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
