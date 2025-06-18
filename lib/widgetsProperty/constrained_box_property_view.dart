import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/constrained_box_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'comman_property_view.dart';

class ConstrainedBoxPropertyView extends StatefulWidget {
  static String tag = '/ConstrainedBoxPropertyView';

  @override
  ConstrainedBoxPropertyViewState createState() => ConstrainedBoxPropertyViewState();
}

class ConstrainedBoxPropertyViewState extends State<ConstrainedBoxPropertyView> {
  ConstrainedBoxClass? constrainedBoxClass;
  TextEditingController? maxHeightController, maxWidthController;

  init() async {
    constrainedBoxClass = appStore.currentSelectedWidget!.widgetViewModel as ConstrainedBoxClass?;

    maxWidthController = TextEditingController(
      text: constrainedBoxClass!.maxWidth != null ? getWidthControllerValue(constrainedBoxClass!.maxWidth, constrainedBoxClass!.maxWidthType) : DEFAULT_CONSTRAINED_MAX_WIDTH.toInt().toString(),
    );
    maxHeightController = TextEditingController(
      text: constrainedBoxClass!.maxHeight != null ? getWidthControllerValue(constrainedBoxClass!.maxHeight, constrainedBoxClass!.maxHeightType) : DEFAULT_CONSTRAINED_MAX_HEIGHT.toInt().toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
                padding: constrainedBoxClass!.padding,
                onPaddingChanged: (l, t, r, b) {
                  constrainedBoxClass!.padding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(constrainedBoxClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: constrainedBoxClass!.isAlignX,
              isAlignY: constrainedBoxClass!.isAlignY,
              alignX: constrainedBoxClass!.horizontalAlignment ?? 0,
              alignY: constrainedBoxClass!.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                constrainedBoxClass!.horizontalAlignment = h;
                constrainedBoxClass!.verticalAlignment = v;
                appStore.updateData(constrainedBoxClass);
              },
              isAlignXChanged: (value) {
                constrainedBoxClass!.isAlignX = value;
                appStore.updateData(constrainedBoxClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                constrainedBoxClass!.isAlignY = value;
                appStore.updateData(constrainedBoxClass);
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
                  constrainedBoxClass!.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      constrainedBoxClass!.isExpanded = value;
                      appStore.updateData(constrainedBoxClass);
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
                      text: constrainedBoxClass!.flex != null ? constrainedBoxClass!.flex.toString() : DEFAULT_FLEX.toString(),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      constrainedBoxClass!.flex = int.tryParse(s);
                      appStore.updateData(constrainedBoxClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(constrainedBoxClass!.isExpanded!),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.maxHeightAndMaxWidth,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getImageWidthType(
                  controller: maxWidthController,
                  title: language!.width,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: constrainedBoxClass!.maxWidthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      constrainedBoxClass!.maxWidth = DEFAULT_CONSTRAINED_MAX_WIDTH.toDouble();
                      appStore.updateData(constrainedBoxClass);
                    } else {
                      if (s.isDigit()) {
                        constrainedBoxClass!.maxWidth = (s.toInt().toDouble() > 100 && constrainedBoxClass!.maxWidthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        appStore.updateData(constrainedBoxClass);
                      }
                    }
                  },
                  onTapPer: () {
                    constrainedBoxClass!.maxWidthType = TypePercentage;
                    setState(() {});
                    constrainedBoxClass!.maxWidth = maxWidthController!.text.toInt().toDouble();
                    if (constrainedBoxClass!.maxWidth! > 100) {
                      constrainedBoxClass!.maxWidth = DEFAULT_CONTAINER_PER;
                      appStore.updateData(constrainedBoxClass);
                    } else {
                      appStore.updateData(constrainedBoxClass);
                    }
                  },
                  onTapPX: () {
                    constrainedBoxClass!.maxWidthType = TypePX;
                    setState(() {});
                    constrainedBoxClass!.maxWidth = maxWidthController!.text.toInt().toDouble();
                    appStore.updateData(constrainedBoxClass);
                  },
                ).expand(flex: 1),
                getImageWidthType(
                  controller: maxHeightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: constrainedBoxClass!.maxHeightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      constrainedBoxClass!.maxHeight = DEFAULT_CONSTRAINED_MAX_HEIGHT.toDouble();
                      appStore.updateData(constrainedBoxClass);
                    } else {
                      if (s.isDigit()) {
                        constrainedBoxClass!.maxHeight = (s.toInt().toDouble() > 100 && constrainedBoxClass!.maxHeightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        appStore.updateData(constrainedBoxClass);
                      }
                    }
                  },
                  onTapPer: () {
                    constrainedBoxClass!.maxHeightType = TypePercentage;
                    setState(() {});
                    constrainedBoxClass!.maxHeight = maxHeightController!.text.toInt().toDouble();
                    if (constrainedBoxClass!.maxHeight! > 100) {
                      constrainedBoxClass!.maxHeight = DEFAULT_CONTAINER_PER;
                      appStore.updateData(constrainedBoxClass);
                    } else {
                      appStore.updateData(constrainedBoxClass);
                    }
                  },
                  onTapPX: () {
                    constrainedBoxClass!.maxHeightType = TypePX;
                    setState(() {});
                    constrainedBoxClass!.maxHeight = maxHeightController!.text.toInt().toDouble();
                    appStore.updateData(constrainedBoxClass);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
