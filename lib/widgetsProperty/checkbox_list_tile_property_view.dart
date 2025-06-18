import 'dart:convert';

import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/checkbox_list_tile_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class CheckboxListTilePropertyView extends StatefulWidget {
  static String tag = '/CheckboxListTilePropertyView';

  @override
  CheckboxListTilePropertyViewState createState() => CheckboxListTilePropertyViewState();
}

class CheckboxListTilePropertyViewState extends State<CheckboxListTilePropertyView> {
  var checkBoxListTileModel;

  init() async {
    checkBoxListTileModel = appStore.currentSelectedWidget!.widgetViewModel as CheckboxListTileClass?;
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
              padding: checkBoxListTileModel.padding,
              onPaddingChanged: (l, t, r, b) {
                checkBoxListTileModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(checkBoxListTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: checkBoxListTileModel.isAlignX,
              isAlignY: checkBoxListTileModel.isAlignY,
              alignX: checkBoxListTileModel.horizontalAlignment ?? 0,
              alignY: checkBoxListTileModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                checkBoxListTileModel.horizontalAlignment = h;
                checkBoxListTileModel.verticalAlignment = v;
                appStore.updateData(checkBoxListTileModel);
              },
              isAlignXChanged: (value) {
                checkBoxListTileModel.isAlignX = value;
                appStore.updateData(checkBoxListTileModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                checkBoxListTileModel.isAlignY = value;
                appStore.updateData(checkBoxListTileModel);
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
                  checkBoxListTileModel.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      checkBoxListTileModel.isExpanded = value;
                      appStore.updateData(checkBoxListTileModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: checkBoxListTileModel.flex != null ? checkBoxListTileModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      checkBoxListTileModel.flex = int.tryParse(s);
                      appStore.updateData(checkBoxListTileModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(checkBoxListTileModel.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.value,
          context,
          <Widget>[
            checkBoxView(checkBoxListTileModel.value ?? false, language!.checkBoxInitialValue, onChanged: (value) {
              checkBoxListTileModel.value = value;
              setState(() {});
              appStore.updateData(checkBoxListTileModel);
            })
          ],
        ),
        ExpansionTileView(
          language!.contentPadding,
          context,
          <Widget>[
            paddingView(
              padding: checkBoxListTileModel.contentPadding,
              onPaddingChanged: (l, t, r, b) {
                checkBoxListTileModel.contentPadding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(checkBoxListTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.tileColor,
          context,
          <Widget>[
            ColorView(
              color: checkBoxListTileModel.tileColor ?? DEFAULT_LIST_TILE_COLOR,
              applyColor: () {
                checkBoxListTileModel.tileColor = appStore.color;
                setState(() {});
                appStore.updateData(checkBoxListTileModel);
              },
              pickColor: () {
                showColorPicker(context, checkBoxListTileModel.tileColor ?? DEFAULT_LIST_TILE_COLOR, applyOnWidget: (color) {
                  checkBoxListTileModel.tileColor = color;
                  setState(() {});
                  appStore.updateData(checkBoxListTileModel);
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
              color: checkBoxListTileModel.activeColor ?? COMMON_BG_COLOR,
              applyColor: () {
                checkBoxListTileModel.activeColor = appStore.color;
                setState(() {});
                appStore.updateData(checkBoxListTileModel);
              },
              pickColor: () {
                showColorPicker(context, checkBoxListTileModel.activeColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  checkBoxListTileModel.activeColor = color;
                  setState(() {});
                  appStore.updateData(checkBoxListTileModel);
                });
              },
            ),
          ],
        ).visible(checkBoxListTileModel.value ?? true),
        ExpansionTileView(
          language!.checkColor,
          context,
          <Widget>[
            ColorView(
              color: checkBoxListTileModel.checkColor ?? DEFAULT_CHECK_COLOR,
              applyColor: () {
                checkBoxListTileModel.checkColor = appStore.color;
                setState(() {});
                appStore.updateData(checkBoxListTileModel);
              },
              pickColor: () {
                showColorPicker(context, checkBoxListTileModel.checkColor ?? DEFAULT_CHECK_COLOR, applyOnWidget: (color) {
                  checkBoxListTileModel.checkColor = color;
                  checkBoxListTileModel.value = checkBoxListTileModel.value;
                  setState(() {});
                  appStore.updateData(checkBoxListTileModel);
                });
              },
            ),
          ],
        ).visible(checkBoxListTileModel.value ?? true),
        ExpansionTileView(
          language!.dense,
          context,
          <Widget>[
            checkBoxView(checkBoxListTileModel.dense ?? false, language!.dense, onChanged: (value) {
              checkBoxListTileModel.dense = value;
              appStore.updateData(checkBoxListTileModel);
              setState(() {});
            })
          ],
        ),
        ExpansionTileView(
          language!.controlAffinity,
          context,
          <Widget>[
            checkBoxView(checkBoxListTileModel.listTileControlAffinity == ListTileControlAffinity.leading ? true : false, language!.leading, onChanged: (value) {
              checkBoxListTileModel.listTileControlAffinity = value ? ListTileControlAffinity.leading : ListTileControlAffinity.trailing;
              setState(() {});
              appStore.updateData(checkBoxListTileModel);
            })
          ],
        ),
        ExpansionTileView(
          language!.title,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.text,
              widget: getTextField(
                controller: TextEditingController(text: checkBoxListTileModel.title != null ? checkBoxListTileModel.title.toString() : "Title"),
                hint: "Text",
                onChanged: (s) {
                  checkBoxListTileModel.title = s;
                  appStore.updateData(checkBoxListTileModel);
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
                    getDropDownField(fontWeight, defaultValue: checkBoxListTileModel.tFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      checkBoxListTileModel.tFontWeight = value;
                      setState(() {});
                      appStore.updateData(checkBoxListTileModel);
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
                      controller: TextEditingController(text: checkBoxListTileModel.tFontSize != null ? checkBoxListTileModel.tFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        checkBoxListTileModel.tFontSize = double.tryParse(value);
                        appStore.updateData(checkBoxListTileModel);
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
                tAlign: checkBoxListTileModel.tTextAlign,
                onTextAlignChanged: (textAlign) {
                  checkBoxListTileModel.tTextAlign = textAlign;
                  appStore.updateData(checkBoxListTileModel);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.textColor,
              widget: ColorView(
                color: checkBoxListTileModel.tFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  checkBoxListTileModel.tFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(checkBoxListTileModel);
                },
                pickColor: () {
                  showColorPicker(context, checkBoxListTileModel.tFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    checkBoxListTileModel.tFontColor = color;
                    setState(() {});
                    appStore.updateData(checkBoxListTileModel);
                  });
                },
              ),
            ),
            checkBoxView(checkBoxListTileModel.tFontStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
              checkBoxListTileModel.tFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(checkBoxListTileModel);
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
                controller: TextEditingController(text: checkBoxListTileModel.subtitle != null ? checkBoxListTileModel.subtitle.toString() : "Sub Title"),
                hint: "Text",
                onChanged: (s) {
                  checkBoxListTileModel.subtitle = s;
                  appStore.updateData(checkBoxListTileModel);
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
                    getDropDownField(fontWeight, defaultValue: checkBoxListTileModel.stFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      checkBoxListTileModel.stFontWeight = value;
                      setState(() {});
                      appStore.updateData(checkBoxListTileModel);
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
                      controller: TextEditingController(text: checkBoxListTileModel.stFontSize != null ? checkBoxListTileModel.stFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (dynamic value) {
                        checkBoxListTileModel.stFontSize = double.tryParse(value);
                        appStore.updateData(checkBoxListTileModel);
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
                tAlign: checkBoxListTileModel.stTextAlign,
                onTextAlignChanged: (textAlign) {
                  checkBoxListTileModel.stTextAlign = textAlign;
                  appStore.updateData(checkBoxListTileModel);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.textColor,
              widget: ColorView(
                color: checkBoxListTileModel.stFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  checkBoxListTileModel.stFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(checkBoxListTileModel);
                },
                pickColor: () {
                  showColorPicker(context, checkBoxListTileModel.stFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    checkBoxListTileModel.stFontColor = color;
                    setState(() {});
                    appStore.updateData(checkBoxListTileModel);
                  });
                },
              ),
            ),
            checkBoxView(checkBoxListTileModel.stFontStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
              checkBoxListTileModel.stFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(checkBoxListTileModel);
            }),
          ],
        ),
        ExpansionTileView(
          language!.borderProperties,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.radius,
              widget: radiusView(
                  radius: checkBoxListTileModel.borderRadius,
                  onRadiusChanged: (tl, tr, br, bt) {
                    checkBoxListTileModel.borderRadius = BorderRadius.only(
                      topLeft: Radius.circular(tl),
                      topRight: Radius.circular(tr),
                      bottomLeft: Radius.circular(br),
                      bottomRight: Radius.circular(bt),
                    );
                    appStore.updateData(checkBoxListTileModel);
                  }),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                isRemoveColor: true,
                color: checkBoxListTileModel.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR,
                applyColor: () {
                  checkBoxListTileModel.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(checkBoxListTileModel);
                },
                pickColor: () {
                  showColorPicker(context, checkBoxListTileModel.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, applyOnWidget: (color) {
                    checkBoxListTileModel.borderColor = color;
                    setState(() {});
                    appStore.updateData(checkBoxListTileModel);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: checkBoxListTileModel.borderWidth != null ? checkBoxListTileModel.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (String s) {
                    if (s.isDigit()) {
                      checkBoxListTileModel.borderWidth = s.toInt().toDouble();
                    } else {
                      checkBoxListTileModel.borderWidth = DEFAULT_BORDER_WIDTH;
                    }
                    appStore.updateData(checkBoxListTileModel);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
            ),
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
                  iconDataJson: checkBoxListTileModel.secondaryIconDataJson,
                  onChanged: (value) {
                    var secondaryIconDataJson = jsonDecode(value);
                    checkBoxListTileModel.secondaryIconDataJson = secondaryIconDataJson;
                    setState(() {});
                    appStore.updateData(checkBoxListTileModel);
                  },
                  onRemoved: () {
                    checkBoxListTileModel.secondaryIconDataJson = null;
                    checkBoxListTileModel.secondaryIconColor = null;
                    checkBoxListTileModel.secondaryIconSize = null;
                    setState(() {});
                    appStore.updateData(checkBoxListTileModel);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: checkBoxListTileModel.secondaryIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      checkBoxListTileModel.secondaryIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(checkBoxListTileModel);
                    },
                    pickColor: () {
                      showColorPicker(context, checkBoxListTileModel.secondaryIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        checkBoxListTileModel.secondaryIconColor = color;
                        appStore.updateData(checkBoxListTileModel);
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
                      controller: TextEditingController(text: checkBoxListTileModel.secondaryIconSize != null ? checkBoxListTileModel.secondaryIconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        checkBoxListTileModel.secondaryIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(checkBoxListTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(checkBoxListTileModel.secondaryIconDataJson != null),
          ],
        ),
        ExpansionTileView(
          language!.selected,
          context,
          <Widget>[
            checkBoxView(
              checkBoxListTileModel.selected ?? false,
              language!.selected,
              onChanged: (value) {
                checkBoxListTileModel.selected = value;
                setState(() {});
                appStore.updateData(checkBoxListTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.selectedTileColor,
          context,
          <Widget>[
            ColorView(
              color: checkBoxListTileModel.selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR,
              applyColor: () {
                checkBoxListTileModel.selectedTileColor = appStore.color;
                setState(() {});
                appStore.updateData(checkBoxListTileModel);
              },
              pickColor: () {
                showColorPicker(context, checkBoxListTileModel.selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR, applyOnWidget: (color) {
                  checkBoxListTileModel.selectedTileColor = color;
                  appStore.updateData(checkBoxListTileModel);
                  setState(() {});
                });
              },
            ),
          ],
        ).visible(checkBoxListTileModel.selected ?? false),
      ],
    );
  }
}
