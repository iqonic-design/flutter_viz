import 'dart:convert';

import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/switch_list_tile_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class SwitchListTilePropertyView extends StatefulWidget {
  static String tag = '/SwitchListTilePropertyView';

  @override
  SwitchListTilePropertyViewState createState() => SwitchListTilePropertyViewState();
}

class SwitchListTilePropertyViewState extends State<SwitchListTilePropertyView> {
  var switchListTileModel;

  init() async {
    switchListTileModel = appStore.currentSelectedWidget!.widgetViewModel as SwitchListTileClass?;
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
              padding: switchListTileModel.padding,
              onPaddingChanged: (l, t, r, b) {
                switchListTileModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(switchListTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: switchListTileModel.isAlignX,
              isAlignY: switchListTileModel.isAlignY,
              alignX: switchListTileModel.horizontalAlignment ?? 0,
              alignY: switchListTileModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                switchListTileModel.horizontalAlignment = h;
                switchListTileModel.verticalAlignment = v;
                appStore.updateData(switchListTileModel);
              },
              isAlignXChanged: (value) {
                switchListTileModel.isAlignX = value;
                appStore.updateData(switchListTileModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                switchListTileModel.isAlignY = value;
                appStore.updateData(switchListTileModel);
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
                  switchListTileModel.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      switchListTileModel.isExpanded = value;
                      appStore.updateData(switchListTileModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: switchListTileModel.flex != null ? switchListTileModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      switchListTileModel.flex = int.tryParse(s);
                      appStore.updateData(switchListTileModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(switchListTileModel.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.value,
          context,
          <Widget>[
            checkBoxView(
              switchListTileModel.value ?? true,
              language!.switchInitialValue,
              onChanged: (value) {
                switchListTileModel.value = value;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.contentPadding,
          context,
          <Widget>[
            paddingView(
              padding: switchListTileModel.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.0),
              onPaddingChanged: (l, t, r, b) {
                switchListTileModel.contentPadding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(switchListTileModel);
              },
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
                  radius: switchListTileModel.borderRadius,
                  onRadiusChanged: (tl, tr, br, bt) {
                    switchListTileModel.borderRadius = BorderRadius.only(
                      topLeft: Radius.circular(tl),
                      topRight: Radius.circular(tr),
                      bottomLeft: Radius.circular(br),
                      bottomRight: Radius.circular(bt),
                    );
                    appStore.updateData(switchListTileModel);
                  }),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                isRemoveColor: true,
                color: switchListTileModel.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR,
                applyColor: () {
                  switchListTileModel.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                },
                pickColor: () {
                  showColorPicker(context, switchListTileModel.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, applyOnWidget: (color) {
                    switchListTileModel.borderColor = color;
                    setState(() {});
                    appStore.updateData(switchListTileModel);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: switchListTileModel.borderWidth != null ? switchListTileModel.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (String s) {
                    if (s.isDigit()) {
                      switchListTileModel.borderWidth = s.toInt().toDouble();
                    } else {
                      switchListTileModel.borderWidth = DEFAULT_BORDER_WIDTH;
                    }
                    appStore.updateData(switchListTileModel);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.tileColor,
          context,
          <Widget>[
            ColorView(
              color: switchListTileModel.tileColor ?? DEFAULT_LIST_TILE_COLOR,
              applyColor: () {
                switchListTileModel.tileColor = appStore.color;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
              pickColor: () {
                showColorPicker(context, switchListTileModel.tileColor ?? DEFAULT_LIST_TILE_COLOR, applyOnWidget: (color) {
                  switchListTileModel.tileColor = color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.activeColor,
          context,
          <Widget>[
            ColorView(
              color: switchListTileModel.activeColor ?? COMMON_BG_COLOR,
              applyColor: () {
                switchListTileModel.activeColor = appStore.color;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
              pickColor: () {
                showColorPicker(context, switchListTileModel.activeColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  switchListTileModel.activeColor = color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                });
              },
            ),
          ],
        ).visible(switchListTileModel.value ?? true),
        ExpansionTileView(
          language!.activeTrackColor,
          context,
          <Widget>[
            ColorView(
              color: switchListTileModel.activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR,
              applyColor: () {
                switchListTileModel.activeTrackColor = appStore.color;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
              pickColor: () {
                showColorPicker(context, switchListTileModel.activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR, applyOnWidget: (color) {
                  switchListTileModel.activeTrackColor = color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                });
              },
            ),
          ],
        ).visible(switchListTileModel.value ?? true),
        ExpansionTileView(
          language!.inactiveThumbColor,
          context,
          <Widget>[
            ColorView(
              color: switchListTileModel.inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR,
              applyColor: () {
                switchListTileModel.inactiveThumbColor = appStore.color;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
              pickColor: () {
                showColorPicker(context, switchListTileModel.inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR, applyOnWidget: (color) {
                  switchListTileModel.inactiveThumbColor = color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                });
              },
            ),
          ],
        ).visible(!(switchListTileModel.value ?? true)),
        ExpansionTileView(
          language!.inactiveTrackColor,
          context,
          <Widget>[
            ColorView(
              color: switchListTileModel.inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR,
              applyColor: () {
                switchListTileModel.inactiveTrackColor = appStore.color;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
              pickColor: () {
                showColorPicker(context, switchListTileModel.inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR, applyOnWidget: (color) {
                  switchListTileModel.inactiveTrackColor = color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                });
              },
            ),
          ],
        ).visible(!(switchListTileModel.value ?? true)),
        ExpansionTileView(
          language!.dense,
          context,
          <Widget>[
            checkBoxView(
              switchListTileModel.dense ?? false,
              language!.dense,
              onChanged: (value) {
                switchListTileModel.dense = value;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
            )
          ],
        ),
        ExpansionTileView(
          language!.controlAffinity,
          context,
          <Widget>[
            checkBoxView(
              switchListTileModel.isLeading,
              language!.leading,
              onChanged: (value) {
                switchListTileModel.isLeading = value;
                setState(() {});
                switchListTileModel.listTileControlAffinity = switchListTileModel.isLeading ? ListTileControlAffinity.leading : ListTileControlAffinity.trailing;
                appStore.updateData(switchListTileModel);
              },
            )
          ],
        ),
        ExpansionTileView(
          language!.title,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.text,
              widget: getTextField(
                controller: TextEditingController(text: switchListTileModel.title != null ? switchListTileModel.title.toString() : "Title"),
                hint: "Title",
                onChanged: (s) {
                  switchListTileModel.title = s;
                  appStore.updateData(switchListTileModel);
                },
              ),
            ),
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
                    getDropDownField(fontWeight, defaultValue: switchListTileModel.tFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      switchListTileModel.tFontWeight = value;
                      setState(() {});
                      appStore.updateData(switchListTileModel);
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
                      controller: TextEditingController(text: switchListTileModel.tFontSize != null ? switchListTileModel.tFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (dynamic value) {
                        switchListTileModel.tFontSize = double.tryParse(value);
                        appStore.updateData(switchListTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ],
                ).expand(),
              ],
            ),
            10.height,
            getSubPropertyWidget(
              title: language!.textAlign,
              widget: TextAlignView(
                tAlign: switchListTileModel.tTextAlign,
                onTextAlignChanged: (textAlign) {
                  switchListTileModel.tTextAlign = textAlign;
                  appStore.updateData(switchListTileModel);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.textColor,
              widget: ColorView(
                color: switchListTileModel.tFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  switchListTileModel.tFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                },
                pickColor: () {
                  showColorPicker(context, switchListTileModel.tFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    switchListTileModel.tFontColor = color;
                    setState(() {});
                    appStore.updateData(switchListTileModel);
                  });
                },
              ),
            ),
            checkBoxView(switchListTileModel.tFontStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
              switchListTileModel.tFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(switchListTileModel);
            }),
          ],
        ),
        ExpansionTileView(
          language!.subTitle,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.text,
              widget: getTextField(
                controller: TextEditingController(text: switchListTileModel.subtitle != null ? switchListTileModel.subtitle.toString() : "Sub Title"),
                hint: language!.subTitle,
                onChanged: (s) {
                  switchListTileModel.subtitle = s;
                  appStore.updateData(switchListTileModel);
                },
              ),
            ),
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
                    getDropDownField(fontWeight, defaultValue: switchListTileModel.stFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      switchListTileModel.stFontWeight = value;
                      setState(() {});
                      appStore.updateData(switchListTileModel);
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
                      controller: TextEditingController(text: switchListTileModel.stFontSize != null ? switchListTileModel.stFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (dynamic value) {
                        switchListTileModel.stFontSize = double.tryParse(value);
                        appStore.updateData(switchListTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ],
                ).expand(),
              ],
            ),
            10.height,
            getSubPropertyWidget(
              title: language!.textAlign,
              widget: TextAlignView(
                tAlign: switchListTileModel.stTextAlign,
                onTextAlignChanged: (textAlign) {
                  switchListTileModel.stTextAlign = textAlign;
                  appStore.updateData(switchListTileModel);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.textColor,
              widget: ColorView(
                color: switchListTileModel.stFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  switchListTileModel.stFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(switchListTileModel);
                },
                pickColor: () {
                  showColorPicker(context, switchListTileModel.stFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    switchListTileModel.stFontColor = color;
                    setState(() {});
                    appStore.updateData(switchListTileModel);
                  });
                },
              ),
            ),
            checkBoxView(switchListTileModel.stFontStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
              switchListTileModel.stFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(switchListTileModel);
            }),
          ],
        ),
        ExpansionTileView(
          language!.secondary,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.icon,
              widget: iconPickerView(
                  isShowRemoved: true,
                  iconDataJson: switchListTileModel.secondaryIconDataJson,
                  onChanged: (value) {
                    var secondaryIconDataJson = jsonDecode(value);
                    switchListTileModel.secondaryIconDataJson = secondaryIconDataJson;
                    setState(() {});
                    appStore.updateData(switchListTileModel);
                  },
                  onRemoved: () {
                    switchListTileModel.secondaryIconDataJson = null;
                    switchListTileModel.secondaryIconColor = null;
                    switchListTileModel.secondaryIconSize = null;
                    setState(() {});
                    appStore.updateData(switchListTileModel);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: switchListTileModel.secondaryIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      switchListTileModel.secondaryIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(switchListTileModel);
                    },
                    pickColor: () {
                      showColorPicker(context, switchListTileModel.secondaryIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        switchListTileModel.secondaryIconColor = color;
                        appStore.updateData(switchListTileModel);
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
                      controller: TextEditingController(text: switchListTileModel.secondaryIconSize != null ? switchListTileModel.secondaryIconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        switchListTileModel.secondaryIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(switchListTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(switchListTileModel.secondaryIconDataJson != null),
          ],
        ),
        ExpansionTileView(
          language!.selected,
          context,
          <Widget>[
            checkBoxView(
              switchListTileModel.selected ?? false,
              language!.selected,
              onChanged: (value) {
                switchListTileModel.selected = value;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.selectedTileColor,
          context,
          <Widget>[
            ColorView(
              color: switchListTileModel.selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR,
              applyColor: () {
                switchListTileModel.selectedTileColor = appStore.color;
                setState(() {});
                appStore.updateData(switchListTileModel);
              },
              pickColor: () {
                showColorPicker(context, switchListTileModel.selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR, applyOnWidget: (color) {
                  switchListTileModel.selectedTileColor = color;
                  appStore.updateData(switchListTileModel);
                  setState(() {});
                });
              },
            ),
          ],
        ).visible(switchListTileModel.selected ?? false),
      ],
    );
  }
}
