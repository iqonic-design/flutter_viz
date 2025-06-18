import 'dart:convert';

import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgetsClass/app_bar_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class AppBarPropertyView extends StatefulWidget {
  static String tag = '/AppBarPropertyView';

  @override
  AppBarPropertyViewState createState() => AppBarPropertyViewState();
}

class AppBarPropertyViewState extends State<AppBarPropertyView> {
  var appBarModel;

  init() async {
    appBarModel = appStore.currentSelectedWidget!.widgetViewModel as AppBarClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.title,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: appBarModel.text ?? "AppBar"),
              hint: appBarModel.text ?? "Title",
              onChanged: (s) {
                appBarModel.text = s;
                appStore.updateData(appBarModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.backgroundColor,
          context,
          <Widget>[
            ColorView(
              color: appBarModel.backgroundColor ?? COMMON_BG_COLOR,
              applyColor: () {
                appBarModel.backgroundColor = appStore.color;
                setState(() {});
                appStore.updateData(appBarModel);
              },
              pickColor: () {
                showColorPicker(context, appBarModel.backgroundColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  appBarModel.backgroundColor = color;
                  setState(() {});
                  appStore.updateData(appBarModel);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(language!.textProperty, context, <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language!.fontWeight, style: secondaryTextStyle()),
                  8.height,
                  getDropDownField(
                    fontWeight,
                    defaultValue: appBarModel.fWeight ?? FontWeightTypeNormal,
                    onChanged: (value) {
                      appBarModel.fWeight = value;
                      setState(() {});
                      appStore.updateData(appBarModel);
                    },
                  ),
                ],
              ).expand(flex: 2),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language!.fontSize, style: secondaryTextStyle()),
                  8.height,
                  getTextField(
                    controller: TextEditingController(
                      text: appBarModel.fontSize != null ? appBarModel.fontSize.toString() : DEFAULT_FONT_SIZE.toString(),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                    ],
                    onChanged: (value) {
                      appBarModel.fontSize = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_FONT_SIZE;
                      appStore.updateData(appBarModel);
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
              color: appBarModel.textColor ?? DEFAULT_TEXT_COLOR,
              applyColor: () {
                appBarModel.textColor = appStore.color;
                setState(() {});
                appStore.updateData(appBarModel);
              },
              pickColor: () {
                showColorPicker(context, appBarModel.textColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                  appBarModel.textColor = color;
                  setState(() {});
                  appStore.updateData(appBarModel);
                });
              },
            ),
          ),
          getSubPropertyWidget(
            title: language!.fontStyle,
            widget: checkBoxView(
              appBarModel.fontStyle == FontStyle.italic ? true : false,
              language!.italic,
              onChanged: (value) {
                appBarModel.fontStyle = value ? FontStyle.italic : FontStyle.normal;
                setState(() {});
                appStore.updateData(appBarModel);
              },
            ),
          ),
        ]),
        ExpansionTileView(
          language!.borderProperties,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.radius,
              widget: radiusView(
                  radius: appBarModel.borderRadius,
                  onRadiusChanged: (tl, tr, br, bt) {
                    appBarModel.borderRadius = BorderRadius.only(
                      topLeft: Radius.circular(tl),
                      topRight: Radius.circular(tr),
                      bottomLeft: Radius.circular(br),
                      bottomRight: Radius.circular(bt),
                    );
                    appStore.updateData(appBarModel);
                  }),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: appBarModel.borderColor ?? TRANSPARENT_COLOR,
                isRemoveColor: true,
                applyColor: () {
                  appBarModel.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(appBarModel);
                },
                pickColor: () {
                  showColorPicker(context, appBarModel.borderColor ?? TRANSPARENT_COLOR, applyOnWidget: (color) {
                    appBarModel.borderColor = color;
                    setState(() {});
                    appStore.updateData(appBarModel);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(
                    text: appBarModel.borderWidth != null ? appBarModel.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString(),
                  ),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (String s) {
                    if (s.isDigit()) {
                      appBarModel.borderWidth = s.toInt().toDouble();
                    } else {
                      appBarModel.borderWidth = DEFAULT_BORDER_WIDTH;
                    }
                    appStore.updateData(appBarModel);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
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
                controller: TextEditingController(
                  text: appBarModel.elevation != null ? appBarModel.elevation.toString() : DEFAULT_APPBAR_ELEVATION.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  appBarModel.elevation = double.parse(s);
                  appStore.updateData(appBarModel);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.centerTitle,
          context,
          <Widget>[
            checkBoxView(
              appBarModel.centerTitle ?? false,
              language!.centerTitle,
              onChanged: (value) {
                appBarModel.centerTitle = value;
                appStore.updateData(appBarModel);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.showDefaultIcon,
          context,
          <Widget>[
            checkBoxView(
              appBarModel.isShowIconDefault ?? true,
              language!.showDefaultIcon,
              onChanged: (value) {
                appBarModel.isShowIconDefault = value;
                if (appBarModel.isShowIconDefault) {
                  appBarModel.iconDataJson = {
                    "iconName": appStore.drawerClass != null ? "menu" : "arrow_back",
                    "codePoint": appStore.drawerClass != null ? 58332 : 57490,
                    "fontFamily": "MaterialIcons",
                  };
                  appBarModel.iconColor = DEFAULT_ICON_COLOR;
                  appBarModel.iconSize = DEFAULT_ICON_SIZE;
                }
                setState(() {});
                appStore.updateData(appBarModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.icon,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.icon,
              widget: iconPickerView(
                iconDataJson: appBarModel.iconDataJson ??
                    {
                      "iconName": appStore.drawerClass != null ? "menu" : "arrow_back",
                      "codePoint": appStore.drawerClass != null ? 58332 : 57490,
                      "fontFamily": "MaterialIcons",
                    },
                onChanged: (value) {
                  var iconDataJson = jsonDecode(value);
                  appBarModel.iconDataJson = iconDataJson;
                  setState(() {});
                  appStore.updateData(appBarModel);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.iconColor,
              widget: ColorView(
                color: appBarModel.iconColor ?? DEFAULT_ICON_COLOR,
                applyColor: () {
                  appBarModel.iconColor = appStore.color;
                  setState(() {});
                  appStore.updateData(appBarModel);
                },
                pickColor: () {
                  showColorPicker(context, appBarModel.iconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                    appBarModel.iconColor = color;
                    setState(() {});
                    appStore.updateData(appBarModel);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.iconSize,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(
                    text: appBarModel.iconSize != null ? appBarModel.iconSize.toString() : DEFAULT_ICON_SIZE.toString(),
                  ),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (s) {
                    appBarModel.iconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                    appStore.updateData(appBarModel);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
            ),
          ],
        ).visible(appBarModel.isShowIconDefault),
        ExpansionTileView(
          language!.actionIcon,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.icon1,
              widget: iconPickerView(
                  isShowRemoved: true,
                  iconDataJson: appBarModel.actionFirstIconDataJson,
                  onChanged: (value) {
                    var actionFirstIconDataJson = jsonDecode(value);
                    appBarModel.actionFirstIconDataJson = actionFirstIconDataJson;
                    setState(() {});
                    appStore.updateData(appBarModel);
                  },
                  onRemoved: () {
                    appBarModel.actionFirstIconDataJson = null;
                    appBarModel.actionFirstIconColor = null;
                    appBarModel.actionFirstIconSize = null;
                    appBarModel.actionFirstIconPadding = null;
                    setState(() {});
                    appStore.updateData(appBarModel);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.padding,
                  widget: paddingView(
                    padding: appBarModel.actionFirstIconPadding,
                    onPaddingChanged: (l, t, r, b) {
                      appBarModel.actionFirstIconPadding = EdgeInsets.fromLTRB(l, t, r, b);
                      appStore.updateData(appBarModel);
                    },
                  ),
                ),
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: appBarModel.actionFirstIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      appBarModel.actionFirstIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(appBarModel);
                    },
                    pickColor: () {
                      showColorPicker(context, appBarModel.actionFirstIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        appBarModel.actionFirstIconColor = color;
                        appStore.updateData(appBarModel);
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
                      controller: TextEditingController(
                        text: appBarModel.actionFirstIconSize != null ? appBarModel.actionFirstIconSize.toString() : DEFAULT_ICON_SIZE.toString(),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        appBarModel.actionFirstIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(appBarModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(appBarModel.actionFirstIconDataJson != null),
            getSubPropertyWidget(
              title: language!.icon2,
              widget: iconPickerView(
                  isShowRemoved: true,
                  iconDataJson: appBarModel.actionSecondIconDataJson,
                  onChanged: (value) {
                    var actionSecondIconDataJson = jsonDecode(value);
                    appBarModel.actionSecondIconDataJson = actionSecondIconDataJson;
                    setState(() {});
                    appStore.updateData(appBarModel);
                  },
                  onRemoved: () {
                    appBarModel.actionSecondIconDataJson = null;
                    appBarModel.actionSecondIconColor = null;
                    appBarModel.actionSecondIconSize = null;
                    appBarModel.actionSecondIconPadding = null;
                    setState(() {});
                    appStore.updateData(appBarModel);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.padding,
                  widget: paddingView(
                    padding: appBarModel.actionSecondIconPadding,
                    onPaddingChanged: (l, t, r, b) {
                      appBarModel.actionSecondIconPadding = EdgeInsets.fromLTRB(l, t, r, b);
                      appStore.updateData(appBarModel);
                    },
                  ),
                ),
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: appBarModel.actionSecondIconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      appBarModel.actionSecondIconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(appBarModel);
                    },
                    pickColor: () {
                      showColorPicker(context, appBarModel.actionSecondIconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                        appBarModel.actionSecondIconColor = color;
                        appStore.updateData(appBarModel);
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
                      controller: TextEditingController(
                        text: appBarModel.actionSecondIconSize != null ? appBarModel.actionSecondIconSize.toString() : DEFAULT_ICON_SIZE.toString(),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        appBarModel.actionSecondIconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;

                        appStore.updateData(appBarModel);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(appBarModel.actionSecondIconDataJson != null),
          ],
        ),
      ],
    );
  }
}
