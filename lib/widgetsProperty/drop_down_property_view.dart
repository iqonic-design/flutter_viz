import 'dart:convert';

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/drop_down_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class DropDownPropertyView extends StatefulWidget {
  static String tag = '/DropDownPropertyView';

  @override
  DropDownPropertyViewState createState() => DropDownPropertyViewState();
}

class DropDownPropertyViewState extends State<DropDownPropertyView> {
  var dropDownClass;
  TextEditingController? widthController, heightController;

  init() async {
    dropDownClass = appStore.currentSelectedWidget!.widgetViewModel as DropDownClass?;
    if (dropDownClass.isWidthClear) {
      widthController = TextEditingController(text: "");
    } else {
      widthController = TextEditingController(
        text: dropDownClass.width != null ? getWidthControllerValue(dropDownClass.width, dropDownClass.widthType) : DEFAULT_DROPDOWN_WIDTH.toInt().toString(),
      );
    }
    if (dropDownClass.isHeightClear) {
      heightController = TextEditingController(text: "");
    } else {
      heightController = TextEditingController(
        text: dropDownClass.height != null ? getWidthControllerValue(dropDownClass.height, dropDownClass.heightType) : DEFAULT_DROPDOWN_HEIGHT.toInt().toString(),
      );
    }
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
              padding: dropDownClass.padding,
              onPaddingChanged: (l, t, r, b) {
                dropDownClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(dropDownClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: dropDownClass.isAlignX,
              isAlignY: dropDownClass.isAlignY,
              alignX: dropDownClass.horizontalAlignment ?? 0,
              alignY: dropDownClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                dropDownClass.horizontalAlignment = h;
                dropDownClass.verticalAlignment = v;
                appStore.updateData(dropDownClass);
              },
              isAlignXChanged: (value) {
                dropDownClass.isAlignX = value;
                appStore.updateData(dropDownClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                dropDownClass.isAlignY = value;
                appStore.updateData(dropDownClass);
                appStore.setIsAlignY(value);
              },
            ),
          ],
          isInitiallyExpanded: false,
        ),
        ExpansionTileView(
          language!.expandedAndFlex,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkBoxView(
                  dropDownClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      dropDownClass.isExpanded = value;
                      appStore.updateData(dropDownClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(
                      text: dropDownClass.flex != null ? dropDownClass.flex.toString() : DEFAULT_FLEX.toString(),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      dropDownClass.flex = int.tryParse(s);
                      appStore.updateData(dropDownClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(dropDownClass.isExpanded),
              ],
            ),
          ],
        ).visible(
          appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow,
        ),
        ExpansionTileView(
          language!.items,
          context,
          <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(dropDownClass.itemsList.length, (index) {
                return Stack(
                  children: [
                    getTextField(
                      controller: TextEditingController(text: dropDownClass.itemsList[index]),
                      hint: 'Option ${index + 1} Text',
                      onChanged: (s) {
                        dropDownClass.itemsList[index] = s;
                      },
                    ).paddingBottom(16),
                    Positioned(
                      right: 8,
                      child: CloseButton(
                        onPressed: () {
                          if (dropDownClass.itemsList.length != 1) {
                            dropDownClass.itemsList.removeAt(index);
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
            Text(
              language!.addOptions,
              style: boldTextStyle(color: btnBackgroundColor),
            ).onTap(() {
              dropDownClass.itemsList.length += 1;
              int index = dropDownClass.itemsList.length - 1;
              dropDownClass.itemsList[index] = "Option ${index + 1}";
              setState(() {});
            }),
          ],
        ),
        ExpansionTileView(
          language!.dropdownValue,
          context,
          <Widget>[
            getTextField(
                controller: TextEditingController(text: dropDownClass.value ?? dropDownClass.itemsList[0]),
                hint: language!.value,
                onChanged: (s) {
                  if (s.isNotEmpty) {
                    if (dropDownClass.itemsList.contains(s)) {
                      dropDownClass.value = s;
                      appStore.updateData(dropDownClass);
                    } else {
                      dropDownClass.value = null;
                      appStore.updateData(dropDownClass);
                    }
                  }
                }),
          ],
        ),
        ExpansionTileView(
          language!.fillColor,
          context,
          <Widget>[
            ColorView(
              color: dropDownClass.fillColor ?? DEFAULT_DROPDOWN_FILL_COLOR,
              applyColor: () {
                dropDownClass.fillColor = appStore.color;
                setState(() {});
                appStore.updateData(dropDownClass);
              },
              pickColor: () {
                showColorPicker(context, dropDownClass.fillColor ?? DEFAULT_DROPDOWN_FILL_COLOR, applyOnWidget: (c) {
                  dropDownClass.fillColor = c;
                  setState(() {});
                  appStore.updateData(dropDownClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.contentPadding,
          context,
          <Widget>[
            paddingView(
              padding: dropDownClass.contentPadding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              onPaddingChanged: (l, t, r, b) {
                dropDownClass.contentPadding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(dropDownClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.heightAndWidth,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getImageWidthType(
                  controller: widthController,
                  widthType1: "PX",
                  widthType2: "%",
                  title: language!.width,
                  type: dropDownClass.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      dropDownClass.width = null;
                      dropDownClass.isWidthClear = true;
                      appStore.updateData(dropDownClass);
                    } else {
                      dropDownClass.width = (double.tryParse(s)! > 100 && dropDownClass.widthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                      dropDownClass.isWidthClear = false;
                      appStore.updateData(dropDownClass);
                    }
                  },
                  onTapPer: () {
                    dropDownClass.widthType = TypePercentage;
                    setState(() {});
                    dropDownClass.width = widthController!.text.toInt().toDouble();
                    if (dropDownClass.width > 100) {
                      dropDownClass.width = DEFAULT_CONTAINER_PER;
                      appStore.updateData(dropDownClass);
                    } else {
                      appStore.updateData(dropDownClass);
                    }
                  },
                  onTapPX: () {
                    dropDownClass.widthType = TypePX;
                    setState(() {});
                    dropDownClass.width = widthController!.text.toInt().toDouble();
                    appStore.updateData(dropDownClass);
                  },
                ),
                getImageWidthType(
                  controller: heightController,
                  widthType1: "PX",
                  widthType2: "%",
                  title: language!.height,
                  type: dropDownClass.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      dropDownClass.height = null;
                      dropDownClass.isHeightClear = true;
                      appStore.updateData(dropDownClass);
                    } else {
                      dropDownClass.height = (double.tryParse(s)! > 100 && dropDownClass.heightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                      dropDownClass.isHeightClear = false;
                      appStore.updateData(dropDownClass);
                    }
                  },
                  onTapPer: () {
                    dropDownClass.heightType = TypePercentage;
                    setState(() {});
                    dropDownClass.height = heightController!.text.toInt().toDouble();
                    if (dropDownClass.height > 100) {
                      dropDownClass.height = DEFAULT_CONTAINER_PER;
                      appStore.updateData(dropDownClass);
                    } else {
                      appStore.updateData(dropDownClass);
                    }
                  },
                  onTapPX: () {
                    dropDownClass.heightType = TypePX;
                    setState(() {});
                    dropDownClass.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(dropDownClass);
                  },
                ),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.dropDownTextStyle,
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
                    getDropDownField(fontWeight, defaultValue: dropDownClass.fWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      dropDownClass.fWeight = value;
                      setState(() {});
                      appStore.updateData(dropDownClass);
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
                      controller: TextEditingController(
                        text: dropDownClass.fontSize != null ? dropDownClass.fontSize.toString() : DEFAULT_DROPDOWN_FONT_SIZE.toString(),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        dropDownClass.fontSize = double.tryParse(value);
                        appStore.updateData(dropDownClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ],
                ).expand(),
              ],
            ),
            8.height,
            getSubPropertyWidget(
              title: language!.fontColor,
              widget: ColorView(
                color: dropDownClass.fontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  dropDownClass.fontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(dropDownClass);
                },
                pickColor: () {
                  showColorPicker(context, dropDownClass.fontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (c) {
                    dropDownClass.fontColor = c;
                    setState(() {});
                    appStore.updateData(dropDownClass);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontStyle,
              widget: checkBoxView(dropDownClass.fStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
                dropDownClass.fStyle = value ? FontStyle.italic : FontStyle.normal;
                setState(() {});
                appStore.updateData(dropDownClass);
              }),
            ),
          ],
        ),
        ExpansionTileView(
          language!.border,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                isRemoveColor: true,
                color: dropDownClass.borderColor ?? DEFAULT_DROPDOWN_BORDER_COLOR,
                applyColor: () {
                  dropDownClass.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(dropDownClass);
                },
                pickColor: () {
                  showColorPicker(context, dropDownClass.borderColor ?? DEFAULT_DROPDOWN_BORDER_COLOR, applyOnWidget: (c) {
                    dropDownClass.borderColor = c;
                    setState(() {});
                    appStore.updateData(dropDownClass);
                  });
                },
              ),
            ),
            Row(
              children: [
                getSubPropertyWidget(
                  title: language!.width,
                  widget: Container(
                    width: widthPropertySize,
                    child: getTextField(
                      controller: TextEditingController(
                        text: dropDownClass.borderWidth != null ? dropDownClass.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString(),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        dropDownClass.borderWidth = double.tryParse(value);
                        appStore.updateData(dropDownClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
                8.width,
                getSubPropertyWidget(
                  title: language!.radius,
                  widget: Container(
                    width: widthPropertySize,
                    child: getTextField(
                      controller: TextEditingController(
                        text: dropDownClass.borderRadius != null ? dropDownClass.borderRadius.toString() : DEFAULT_DROPDOWN_BORDER_RADIUS.toString(),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        dropDownClass.borderRadius = double.tryParse(value);
                        appStore.updateData(dropDownClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ExpansionTileView(language!.removeUnderLine, context, <Widget>[
          checkBoxView(
            dropDownClass.isRemoveUnderLine ?? false,
            language!.removeUnderLine,
            onChanged: (value) {
              dropDownClass.isRemoveUnderLine = value;
              appStore.updateData(dropDownClass);
              setState(() {});
            },
          ),
        ]),
        ExpansionTileView(
          language!.elevation,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: dropDownClass.elevation != null ? dropDownClass.elevation.toString() : DEFAULT_DROPDOWN_ELEVATION.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  dropDownClass.elevation = int.tryParse(value);
                  appStore.updateData(dropDownClass);
                },
                maxLength: commonMaxLength,
              ),
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
                  isShowRemoved: true,
                  iconDataJson: dropDownClass.iconDataJson,
                  onChanged: (value) {
                    var iconDataJson = jsonDecode(value);
                    dropDownClass.iconDataJson = iconDataJson;
                    setState(() {});
                    appStore.updateData(dropDownClass);
                  },
                  onRemoved: () {
                    dropDownClass.iconDataJson = null;
                    dropDownClass.iconColor = null;
                    dropDownClass.iconSize = null;
                    setState(() {});
                    appStore.updateData(dropDownClass);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSubPropertyWidget(
                  title: language!.color,
                  widget: ColorView(
                    color: dropDownClass.iconColor ?? DEFAULT_ICON_COLOR,
                    applyColor: () {
                      dropDownClass.iconColor = appStore.color;
                      setState(() {});
                      appStore.updateData(dropDownClass);
                    },
                    pickColor: () {
                      showColorPicker(context, dropDownClass.iconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (c) {
                        dropDownClass.iconColor = c;
                        setState(() {});
                        appStore.updateData(dropDownClass);
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
                        text: dropDownClass.iconSize != null ? dropDownClass.iconSize.toString() : DEFAULT_DROPDOWN_ICON_SIZE.toString(),
                      ),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        dropDownClass.iconSize = double.tryParse(s);
                        appStore.updateData(dropDownClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ).visible(dropDownClass.iconDataJson != null),
          ],
        ),
      ],
    );
  }
}
