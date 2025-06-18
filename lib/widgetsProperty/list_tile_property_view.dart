import 'dart:convert';

import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/list_tile_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class ListTilePropertyView extends StatefulWidget {
  static String tag = '/ListTilePropertyView';

  @override
  ListTilePropertyViewState createState() => ListTilePropertyViewState();
}

class ListTilePropertyViewState extends State<ListTilePropertyView> {
  var listTileModel;

  init() async {
    listTileModel = appStore.currentSelectedWidget!.widgetViewModel as ListTileClass?;
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
              padding: listTileModel.padding,
              onPaddingChanged: (l, t, r, b) {
                listTileModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(listTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: listTileModel.isAlignX,
              isAlignY: listTileModel.isAlignY,
              alignX: listTileModel.horizontalAlignment ?? 0,
              alignY: listTileModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                listTileModel.horizontalAlignment = h;
                listTileModel.verticalAlignment = v;
                appStore.updateData(listTileModel);
              },
              isAlignXChanged: (value) {
                listTileModel.isAlignX = value;
                appStore.updateData(listTileModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                listTileModel.isAlignY = value;
                appStore.updateData(listTileModel);
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
                  listTileModel.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      listTileModel.isExpanded = value;
                      appStore.updateData(listTileModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: 70,
                  child: getTextField(
                    controller: TextEditingController(text: listTileModel.flex != null ? listTileModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      listTileModel.flex = int.tryParse(s);
                      appStore.updateData(listTileModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(listTileModel.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.contentPadding,
          context,
          <Widget>[
            paddingView(
              padding: listTileModel.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.0),
              onPaddingChanged: (l, t, r, b) {
                listTileModel.contentPadding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(listTileModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.tileColor,
          context,
          <Widget>[
            ColorView(
              color: listTileModel.tileColor ?? DEFAULT_LIST_TILE_COLOR,
              applyColor: () {
                listTileModel.tileColor = appStore.color;
                setState(() {});
                appStore.updateData(listTileModel);
              },
              pickColor: () {
                showColorPicker(context, listTileModel.tileColor ?? DEFAULT_LIST_TILE_COLOR, applyOnWidget: (color) {
                  listTileModel.tileColor = color;
                  setState(() {});
                  appStore.updateData(listTileModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.dense,
          context,
          <Widget>[
            checkBoxView(
              listTileModel.dense ?? false,
              language!.dense,
              onChanged: (value) {
                listTileModel.dense = value;
                setState(() {});
                appStore.updateData(listTileModel);
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
                controller: TextEditingController(text: listTileModel.title != null ? listTileModel.title.toString() : "Title"),
                hint: "Title",
                onChanged: (s) {
                  listTileModel.title = s;
                  appStore.updateData(listTileModel);
                },
              ),
            ),
            8.height,
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
                    getDropDownField(fontWeight, defaultValue: listTileModel.tFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      listTileModel.tFontWeight = value;
                      setState(() {});
                      appStore.updateData(listTileModel);
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
                      controller: TextEditingController(text: listTileModel.tFontSize != null ? listTileModel.tFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (dynamic value) {
                        listTileModel.tFontSize = double.tryParse(value);
                        appStore.updateData(listTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ],
                ).expand(),
              ],
            ),
            8.height,
            getSubPropertyWidget(
              title: language!.textAlign,
              widget: TextAlignView(
                tAlign: listTileModel.tTextAlign,
                onTextAlignChanged: (textAlign) {
                  listTileModel.tTextAlign = textAlign;
                  appStore.updateData(listTileModel);
                },
              ),
            ),
            8.height,
            getSubPropertyWidget(
              title: language!.textColor,
              widget: ColorView(
                color: listTileModel.tFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  listTileModel.tFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(listTileModel);
                },
                pickColor: () {
                  showColorPicker(context, listTileModel.tFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    listTileModel.tFontColor = color;
                    setState(() {});
                    appStore.updateData(listTileModel);
                  });
                },
              ),
            ),
            8.height,
            checkBoxView(listTileModel.tFontStyle == FontStyle.italic ? true : false, "Italic", onChanged: (value) {
              listTileModel.tFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(listTileModel);
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
                controller: TextEditingController(text: listTileModel.subtitle != null ? listTileModel.subtitle.toString() : "Sub Title"),
                hint: "Subtitle",
                onChanged: (s) {
                  listTileModel.subtitle = s;
                  appStore.updateData(listTileModel);
                },
              ),
            ),
            8.height,
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
                    getDropDownField(fontWeight, defaultValue: listTileModel.stFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      listTileModel.stFontWeight = value;
                      setState(() {});
                      appStore.updateData(listTileModel);
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
                      controller: TextEditingController(text: listTileModel.stFontSize != null ? listTileModel.stFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (dynamic value) {
                        listTileModel.stFontSize = double.tryParse(value);
                        appStore.updateData(listTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ],
                ).expand(),
              ],
            ),
            8.height,
            getSubPropertyWidget(
              title: language!.textAlign,
              widget: TextAlignView(
                tAlign: listTileModel.stTextAlign,
                onTextAlignChanged: (textAlign) {
                  listTileModel.stTextAlign = textAlign;
                  appStore.updateData(listTileModel);
                },
              ),
            ),
            8.height,
            getSubPropertyWidget(
              title: language!.textColor,
              widget: ColorView(
                color: listTileModel.stFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  listTileModel.stFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(listTileModel);
                },
                pickColor: () {
                  showColorPicker(context, listTileModel.stFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    listTileModel.stFontColor = color;
                    setState(() {});
                    appStore.updateData(listTileModel);
                  });
                },
              ),
            ),
            8.height,
            checkBoxView(listTileModel.stFontStyle == FontStyle.italic ? true : false, "Italic", onChanged: (value) {
              listTileModel.stFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(listTileModel);
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
                  radius: listTileModel.borderRadius,
                  onRadiusChanged: (tl, tr, br, bt) {
                    listTileModel.borderRadius = BorderRadius.only(
                      topLeft: Radius.circular(tl),
                      topRight: Radius.circular(tr),
                      bottomLeft: Radius.circular(br),
                      bottomRight: Radius.circular(bt),
                    );
                    appStore.updateData(listTileModel);
                  }),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: listTileModel.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR,
                isRemoveColor: true,
                applyColor: () {
                  listTileModel.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(listTileModel);
                },
                pickColor: () {
                  showColorPicker(context, listTileModel.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, applyOnWidget: (color) {
                    listTileModel.borderColor = color;
                    setState(() {});
                    appStore.updateData(listTileModel);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: listTileModel.borderWidth != null ? listTileModel.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (String s) {
                    if (s.isDigit()) {
                      listTileModel.borderWidth = s.toInt().toDouble();
                    } else {
                      listTileModel.borderWidth = DEFAULT_BORDER_WIDTH;
                    }
                    appStore.updateData(listTileModel);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
            ),
          ],
        ),
        ExpansionTileView(language!.selected, context, <Widget>[
          checkBoxView(
            listTileModel.selected ?? false,
            language!.selected,
            onChanged: (value) {
              listTileModel.selected = value;
              setState(() {});
              appStore.updateData(listTileModel);
            },
          ),
        ]),
        ExpansionTileView(
          language!.selectedTileColor,
          context,
          <Widget>[
            ColorView(
              color: listTileModel.selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR,
              applyColor: () {
                listTileModel.selectedTileColor = appStore.color;
                setState(() {});
                appStore.updateData(listTileModel);
              },
              pickColor: () {
                showColorPicker(context, listTileModel.selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR, applyOnWidget: (color) {
                  listTileModel.selectedTileColor = color;
                  appStore.updateData(listTileModel);
                  setState(() {});
                });
              },
            ),
          ],
        ).visible(listTileModel.selected ?? false),
        ExpansionTileView(
          language!.leadingIcon,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.icon,
              widget: iconPickerView(
                  isShowRemoved: true,
                  iconDataJson: listTileModel.leadingIconDataJson,
                  onChanged: (value) {
                    var leadingIconDataJson = jsonDecode(value);
                    listTileModel.leadingIconDataJson = leadingIconDataJson;
                    setState(() {});
                    appStore.updateData(listTileModel);
                  },
                  onRemoved: () {
                    listTileModel.leadingIconDataJson = null;
                    listTileModel.leadingIconColor = null;
                    listTileModel.leadingIconSize = null;
                    setState(() {});
                    appStore.updateData(listTileModel);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: listTileModel.leadingIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      listTileModel.leadingIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(listTileModel);
                    },
                    pickColor: () {
                      showColorPicker(context, listTileModel.leadingIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        listTileModel.leadingIconColor = color;
                        appStore.updateData(listTileModel);
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
                      controller: TextEditingController(text: listTileModel.leadingIconSize != null ? listTileModel.leadingIconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        listTileModel.leadingIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(listTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(listTileModel.leadingIconDataJson != null),
          ],
        ),
        ExpansionTileView(
          language!.trailingIcon,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.icon,
              widget: iconPickerView(
                  isShowRemoved: true,
                  iconDataJson: listTileModel.trailingIconDataJson,
                  onChanged: (value) {
                    var trailingIconDataJson = jsonDecode(value);
                    listTileModel.trailingIconDataJson = trailingIconDataJson;
                    setState(() {});
                    appStore.updateData(listTileModel);
                  },
                  onRemoved: () {
                    listTileModel.trailingIconDataJson = null;
                    listTileModel.trailingIconColor = null;
                    listTileModel.trailingIconSize = null;
                    setState(() {});
                    appStore.updateData(listTileModel);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: listTileModel.trailingIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      listTileModel.trailingIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(listTileModel);
                    },
                    pickColor: () {
                      showColorPicker(context, listTileModel.trailingIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        listTileModel.trailingIconColor = color;
                        appStore.updateData(listTileModel);
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
                      controller: TextEditingController(text: listTileModel.trailingIconSize != null ? listTileModel.trailingIconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        listTileModel.trailingIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(listTileModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(listTileModel.trailingIconDataJson != null),
          ],
        ),
      ],
    );
  }
}
