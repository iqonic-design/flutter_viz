import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/stack_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class StackPropertyView extends StatefulWidget {
  static String tag = '/StackPropertyView';

  @override
  StackPropertyViewState createState() => StackPropertyViewState();
}

class StackPropertyViewState extends State<StackPropertyView> {
  var stackClass;
  bool isSelectedWidth = true;
  bool isSelectedHeight = true;
  TextEditingController? widthController, heightController;

  init() async {
    stackClass = appStore.currentSelectedWidget!.widgetViewModel as StackClass?;
    heightController = TextEditingController(text: stackClass.height != null ? getWidthControllerValue(stackClass.height, stackClass.heightType) : "");
    widthController = TextEditingController(text: stackClass.width != null ? getWidthControllerValue(stackClass.width, stackClass.widthType) : "");
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
              padding: stackClass.padding,
              onPaddingChanged: (l, t, r, b) {
                stackClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(stackClass);
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
                  stackClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      stackClass.isExpanded = value;
                      appStore.updateData(stackClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: stackClass.flex != null ? stackClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      stackClass.flex = int.tryParse(s);
                      appStore.updateData(stackClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(stackClass.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: stackClass.isAlignX,
              isAlignY: stackClass.isAlignY,
              alignX: stackClass.horizontalAlignment ?? 0,
              alignY: stackClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                stackClass.horizontalAlignment = h;
                stackClass.verticalAlignment = v;
                appStore.updateData(stackClass);
              },
              isAlignXChanged: (value) {
                stackClass.isAlignX = value;
                appStore.updateData(stackClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                stackClass.isAlignY = value;
                appStore.updateData(stackClass);
                appStore.setIsAlignY(value);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.heightAndWidth,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getImageWidthType(
                  controller: widthController,
                  title: language!.width,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: stackClass.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      stackClass.width = null;
                      appStore.updateData(stackClass);
                    } else {
                      if (s.isDigit()) {
                        stackClass.width = (s.toInt().toDouble() > 100 && stackClass.widthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        appStore.updateData(stackClass);
                      }
                    }
                  },
                  onTapPer: () {
                    stackClass.widthType = TypePercentage;
                    setState(() {});
                    stackClass.width = widthController!.text.toInt().toDouble();
                    if (stackClass.width > 100) {
                      stackClass.width = DEFAULT_CONTAINER_PER;
                      appStore.updateData(stackClass);
                    } else {
                      appStore.updateData(stackClass);
                    }
                  },
                  onTapPX: () {
                    stackClass.widthType = TypePX;
                    setState(() {});
                    stackClass.width = widthController!.text.toInt().toDouble();
                    appStore.updateData(stackClass);
                  },
                ).expand(flex: 1),
                8.width,
                getImageWidthType(
                  controller: heightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: stackClass.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      stackClass.height = null;
                      appStore.updateData(stackClass);
                    } else {
                      if (s.isDigit()) {
                        stackClass.height = (s.toInt().toDouble() > 100 && stackClass.heightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        appStore.updateData(stackClass);
                      }
                    }
                  },
                  onTapPer: () {
                    stackClass.heightType = TypePercentage;
                    setState(() {});
                    stackClass.height = heightController!.text.toInt().toDouble();
                    if (stackClass.height > 100) {
                      stackClass.height = DEFAULT_CONTAINER_PER;
                      appStore.updateData(stackClass);
                    } else {
                      appStore.updateData(stackClass);
                    }
                  },
                  onTapPX: () {
                    stackClass.heightType = TypePX;
                    setState(() {});
                    stackClass.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(stackClass);
                  },
                ),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignmentChild,
          context,
          <Widget>[
            getDropDownField(stackAlignment, defaultValue: stackClass.alignment ?? AlignmentTypeTopLeft, onChanged: (value) {
              stackClass.alignment = value;
              setState(() {});
              appStore.updateData(stackClass);
            }),
          ],
        ),
      ],
    );
  }
}
