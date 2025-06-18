import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/linear_progress_indicator_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class LinearProgressIndicatorPropertyView extends StatefulWidget {
  static String tag = '/LinearProgressIndicatorPropertyView';

  @override
  LinearProgressIndicatorPropertyViewState createState() => LinearProgressIndicatorPropertyViewState();
}

class LinearProgressIndicatorPropertyViewState extends State<LinearProgressIndicatorPropertyView> {
  var linearProgressIndicatorClass;
  TextEditingController? heightController;

  init() async {
    linearProgressIndicatorClass = appStore.currentSelectedWidget!.widgetViewModel as LinearProgressIndicatorClass?;
    heightController = TextEditingController(text: linearProgressIndicatorClass.height != null ? linearProgressIndicatorClass.height.toString() : "");
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
              padding: linearProgressIndicatorClass.padding,
              onPaddingChanged: (l, t, r, b) {
                linearProgressIndicatorClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(linearProgressIndicatorClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: linearProgressIndicatorClass.isAlignX,
              isAlignY: linearProgressIndicatorClass.isAlignY,
              alignX: linearProgressIndicatorClass.horizontalAlignment ?? 0,
              alignY: linearProgressIndicatorClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                linearProgressIndicatorClass.horizontalAlignment = h;
                linearProgressIndicatorClass.verticalAlignment = v;
                appStore.updateData(linearProgressIndicatorClass);
              },
              isAlignXChanged: (value) {
                linearProgressIndicatorClass.isAlignX = value;
                appStore.updateData(linearProgressIndicatorClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                linearProgressIndicatorClass.isAlignY = value;
                appStore.updateData(linearProgressIndicatorClass);
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
                  linearProgressIndicatorClass.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      linearProgressIndicatorClass.isExpanded = value;
                      appStore.updateData(linearProgressIndicatorClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: linearProgressIndicatorClass.flex != null ? linearProgressIndicatorClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      linearProgressIndicatorClass.flex = int.tryParse(s);
                      appStore.updateData(linearProgressIndicatorClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(linearProgressIndicatorClass.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.value,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                  controller: TextEditingController(
                    text: linearProgressIndicatorClass.progressValue != null ? linearProgressIndicatorClass.progressValue.toString() : DEFAULT_PROGRESS_VALUE.toString(),
                  ),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (value) {
                    if (value.isEmpty) {
                      linearProgressIndicatorClass.progressValue = DEFAULT_PROGRESS_VALUE;
                      appStore.updateData(linearProgressIndicatorClass);
                    } else if (double.parse(value) >= 0.0 && double.parse(value) <= 1.0) {
                      linearProgressIndicatorClass.progressValue = double.parse(value);
                      appStore.updateData(linearProgressIndicatorClass);
                    } else {
                      getToast(language!.progressbarValueMsg);
                    }
                  }),
            ),
          ],
        ),
        ExpansionTileView(
          language!.height,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: heightController,
                textAlign: TextAlign.start,
                maxLength: commonMaxLength,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  if (value.isEmpty) {
                    linearProgressIndicatorClass.height = DEFAULT_PROGRESS_HEIGHT;
                    appStore.updateData(linearProgressIndicatorClass);
                  } else if (double.parse(value) > 0.0) {
                    linearProgressIndicatorClass.height = double.parse(value);
                    appStore.updateData(linearProgressIndicatorClass);
                  } else {
                    getToast(language!.progressbarHeightMsg);
                  }
                },
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.backgroundColor,
          context,
          <Widget>[
            ColorView(
              color: linearProgressIndicatorClass.backgroundColor ?? DEFAULT_PROGRESSBAR_BACKGROUND_COLOR,
              applyColor: () {
                linearProgressIndicatorClass.backgroundColor = appStore.color;
                setState(() {});
                appStore.updateData(linearProgressIndicatorClass);
              },
              pickColor: () {
                showColorPicker(context, linearProgressIndicatorClass.backgroundColor ?? DEFAULT_PROGRESSBAR_BACKGROUND_COLOR, applyOnWidget: (color) {
                  linearProgressIndicatorClass.backgroundColor = color;
                  setState(() {});
                  appStore.updateData(linearProgressIndicatorClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.valueColor,
          context,
          <Widget>[
            ColorView(
              color: linearProgressIndicatorClass.valueColor ?? COMMON_BG_COLOR,
              applyColor: () {
                linearProgressIndicatorClass.valueColor = appStore.color;
                setState(() {});
                appStore.updateData(linearProgressIndicatorClass);
              },
              pickColor: () {
                showColorPicker(context, linearProgressIndicatorClass.valueColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  linearProgressIndicatorClass.valueColor = color;
                  setState(() {});
                  appStore.updateData(linearProgressIndicatorClass);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
