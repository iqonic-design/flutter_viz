import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/slider_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class SliderPropertyView extends StatefulWidget {
  static String tag = '/SliderPropertyView';

  @override
  SliderPropertyViewState createState() => SliderPropertyViewState();
}

class SliderPropertyViewState extends State<SliderPropertyView> {
  var sliderClass;
  TextEditingController? valueController;
  TextEditingController? widthController;
  TextEditingController? minController;
  TextEditingController? maxController;

  init() async {
    appStore.setValueErrorMsg("");
    sliderClass = appStore.currentSelectedWidget!.widgetViewModel as SliderClass?;
    valueController = TextEditingController(text: sliderClass.initialValue != null ? sliderClass.initialValue.toString() : '0');
    widthController = TextEditingController(text: sliderClass.width != null ? sliderClass.width.toString() : "");
    minController = TextEditingController(text: sliderClass.min != null ? sliderClass.min.toString() : "0");
    maxController = TextEditingController(text: sliderClass.max != null ? sliderClass.max.toString() : "10");
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
              padding: sliderClass.padding,
              onPaddingChanged: (l, t, r, b) {
                sliderClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(sliderClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: sliderClass.isAlignX,
              isAlignY: sliderClass.isAlignY,
              alignX: sliderClass.horizontalAlignment ?? 0,
              alignY: sliderClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                sliderClass.horizontalAlignment = h;
                sliderClass.verticalAlignment = v;
                appStore.updateData(sliderClass);
              },
              isAlignXChanged: (value) {
                sliderClass.isAlignX = value;
                appStore.updateData(sliderClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                sliderClass.isAlignY = value;
                appStore.updateData(sliderClass);
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
                  sliderClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      sliderClass.isExpanded = value;
                      appStore.updateData(sliderClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: sliderClass.flex != null ? sliderClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      sliderClass.flex = int.tryParse(s);
                      appStore.updateData(sliderClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(sliderClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.sliderInitialValue,
          context,
          <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: valueController,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                    ],
                    onChanged: (initialValue) {
                      if (double.parse(initialValue) >= (sliderClass.min ?? 0) && double.parse(initialValue) <= (sliderClass.max ?? 10)) {
                        sliderClass.initialValue = double.parse(initialValue);
                        appStore.updateData(sliderClass);
                        appStore.setValueErrorMsg("");
                      } else {
                        appStore.setValueErrorMsg('${language!.notWithinRange}!');
                      }
                    },
                    maxLength: commonMaxLength,
                  ),
                ),
                Observer(builder: (context) => Text(appStore.valueErrorMsg, style: secondaryTextStyle(color: Colors.red)).visible(appStore.valueErrorMsg.isNotEmpty)),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.minAndMax,
          context,
          <Widget>[
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(language!.minimum, style: secondaryTextStyle()),
                    8.height,
                    Container(
                      width: widthPropertySize,
                      child: getTextField(
                        controller: minController,
                        inputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                        ],
                        onChanged: (value) {
                          if (double.parse(value) <= (sliderClass.max ?? 10)) {
                            if (double.parse(value) <= (sliderClass.initialValue ?? 0)) {
                              sliderClass.min = double.parse(value);
                              appStore.updateData(sliderClass);
                            } else {
                              sliderClass.min = double.parse(value);
                              sliderClass.initialValue = double.parse(value);
                              appStore.setValueErrorMsg("");
                              valueController!.text = value;
                              appStore.updateData(sliderClass);
                            }
                          } else {
                            getToast(language!.minimumValueMsg);
                          }
                        },
                        maxLength: commonMaxLength,
                      ),
                    ),
                  ],
                ),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(language!.maximum, style: secondaryTextStyle()),
                    8.height,
                    Container(
                      width: widthPropertySize,
                      child: getTextField(
                        controller: maxController,
                        inputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                        ],
                        onChanged: (value) {
                          if (double.parse(value) >= (sliderClass.min ?? 0)) {
                            if (double.parse(value) >= (sliderClass.initialValue ?? 0)) {
                              sliderClass.max = double.parse(value);
                              appStore.updateData(sliderClass);
                            } else {
                              sliderClass.max = double.parse(value);
                              sliderClass.initialValue = double.parse(value);
                              valueController!.text = value;
                              appStore.setValueErrorMsg("");
                              appStore.updateData(sliderClass);
                            }
                          } else {
                            getToast(language!.maximumValueMsg);
                          }
                        },
                        maxLength: commonMaxLength,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.stepSize,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: sliderClass.stepSize != null ? sliderClass.stepSize.toString() : ""),
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  if (double.parse(value) <= (sliderClass.max ?? 10)) {
                    sliderClass.stepSize = (value.isNotEmpty && double.parse(value) != 0) ? double.parse(value) : null;
                    appStore.updateData(sliderClass);
                  } else {
                    getToast('${language!.notWithinRange}!');
                  }
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.width,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: widthController,
                textAlign: TextAlign.start,
                maxLength: commonMaxLength,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  sliderClass.width = s.isNotEmpty ? double.parse(s) : null;
                  appStore.updateData(sliderClass);
                },
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.sliderActiveColor,
          context,
          <Widget>[
            ColorView(
              color: sliderClass.activeColor ?? COMMON_BG_COLOR,
              applyColor: () {
                sliderClass.activeColor = appStore.color;
                setState(() {});
                appStore.updateData(sliderClass);
              },
              pickColor: () {
                showColorPicker(context, sliderClass.activeColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  sliderClass.activeColor = color;
                  setState(() {});
                  appStore.updateData(sliderClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.sliderInactiveColor,
          context,
          <Widget>[
            ColorView(
              color: sliderClass.inactiveColor ?? Colors.grey,
              applyColor: () {
                sliderClass.inactiveColor = appStore.color;
                setState(() {});
                appStore.updateData(sliderClass);
              },
              pickColor: () {
                showColorPicker(context, sliderClass.inactiveColor ?? Colors.grey, applyOnWidget: (color) {
                  sliderClass.inactiveColor = color;
                  setState(() {});
                  appStore.updateData(sliderClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.showValue,
          context,
          <Widget>[
            checkBoxView(
              sliderClass.isShowValue ?? false,
              language!.showValue,
              onChanged: (value) {
                sliderClass.isShowValue = value;
                appStore.updateData(sliderClass);
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
