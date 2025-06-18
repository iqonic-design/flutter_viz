import 'dart:convert';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/icon_button_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class IconButtonPropertyView extends StatefulWidget {
  @override
  IconButtonPropertyViewState createState() => IconButtonPropertyViewState();
}

class IconButtonPropertyViewState extends State<IconButtonPropertyView> {
  var iconButtonModel;

  Icon icon = Icon(Icons.add);

  init() async {
    iconButtonModel = appStore.currentSelectedWidget!.widgetViewModel as IconButtonClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(language!.padding, context, <Widget>[
          paddingView(
            padding: iconButtonModel.padding,
            onPaddingChanged: (l, t, r, b) {
              iconButtonModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
              appStore.updateData(iconButtonModel);
            },
          ),
        ]),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: iconButtonModel.isAlignX,
              isAlignY: iconButtonModel.isAlignY,
              alignX: iconButtonModel.horizontalAlignment ?? 0,
              alignY: iconButtonModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                iconButtonModel.horizontalAlignment = h;
                iconButtonModel.verticalAlignment = v;
                appStore.updateData(iconButtonModel);
              },
              isAlignXChanged: (value) {
                iconButtonModel.isAlignX = value;
                appStore.updateData(iconButtonModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                iconButtonModel.isAlignY = value;
                appStore.updateData(iconButtonModel);
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
                  iconButtonModel.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      iconButtonModel.isExpanded = value;
                      appStore.updateData(iconButtonModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(text: iconButtonModel.flex != null ? iconButtonModel.flex.toString() : DEFAULT_FLEX.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (s) {
                        iconButtonModel.flex = int.tryParse(s);
                        appStore.updateData(iconButtonModel);
                      }),
                ).visible(iconButtonModel.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.icon,
          context,
          <Widget>[
            iconPickerView(
              iconDataJson: iconButtonModel.iconDataJson ?? {'iconName': 'add', 'codePoint': 57415, 'fontFamily': 'MaterialIcons'},
              onChanged: (value) {
                var iconDataJson = jsonDecode(value);
                iconButtonModel.iconDataJson = iconDataJson;
                setState(() {});
                appStore.updateData(iconButtonModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.iconColor,
          context,
          <Widget>[
            ColorView(
              color: iconButtonModel.iconColor ?? DEFAULT_ICON_COLOR,
              applyColor: () {
                iconButtonModel.iconColor = appStore.color;
                setState(() {});
                appStore.updateData(iconButtonModel);
              },
              pickColor: () {
                showColorPicker(context, iconButtonModel.iconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                  iconButtonModel.iconColor = color;
                  setState(() {});
                  appStore.updateData(iconButtonModel);
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
                controller: TextEditingController(text: iconButtonModel.iconSize != null ? iconButtonModel.iconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  iconButtonModel.iconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                  appStore.updateData(iconButtonModel);
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
