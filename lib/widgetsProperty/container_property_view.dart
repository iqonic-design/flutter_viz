import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/container_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class ContainerPropertyView extends StatefulWidget {
  static String tag = '/ContainerPropertyView';

  @override
  ContainerPropertyViewState createState() => ContainerPropertyViewState();
}

class ContainerPropertyViewState extends State<ContainerPropertyView> {
  var containerClass;
  TextEditingController? widthController, heightController;

  init() async {
    containerClass = appStore.currentSelectedWidget!.widgetViewModel as ContainerClass?;
    if (containerClass.isWidthClear) {
      widthController = TextEditingController(text: "");
    } else {
      widthController = TextEditingController(
        text: containerClass.width != null ? getWidthControllerValue(containerClass.width, containerClass.widthType) : DEFAULT_CONTAINER_WIDTH.toInt().toString(),
      );
    }
    if (containerClass.isHeightClear) {
      heightController = TextEditingController(text: "");
    } else {
      heightController = TextEditingController(
        text: containerClass.height != null ? getWidthControllerValue(containerClass.height, containerClass.heightType) : DEFAULT_CONTAINER_HEIGHT.toInt().toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      children: [
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: containerClass.isAlignX,
              isAlignY: containerClass.isAlignY,
              alignX: containerClass.horizontalAlignment ?? 0,
              alignY: containerClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                containerClass.horizontalAlignment = h;
                containerClass.verticalAlignment = v;
                appStore.updateData(containerClass);
              },
              isAlignXChanged: (value) {
                containerClass.isAlignX = value;
                appStore.updateData(containerClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                containerClass.isAlignY = value;
                appStore.updateData(containerClass);
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
                  containerClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      containerClass.isExpanded = value;
                      appStore.updateData(containerClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: containerClass.flex != null ? containerClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      containerClass.flex = int.tryParse(s);
                      appStore.updateData(containerClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(containerClass.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.fillColor,
          context,
          <Widget>[
            ColorView(
              color: containerClass.bgColor ?? DEFAULT_CONTAINER_BG_COLOR,
              applyColor: () {
                containerClass.bgColor = appStore.color;
                setState(() {});
                appStore.updateData(containerClass);
              },
              pickColor: () {
                showColorPicker(context, containerClass.bgColor ?? DEFAULT_CONTAINER_BG_COLOR, applyOnWidget: (color) {
                  containerClass.bgColor = color;
                  setState(() {});
                  appStore.updateData(containerClass);
                });
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
                  type: containerClass.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      containerClass.width = null;
                      containerClass.isWidthClear = true;
                      appStore.updateData(containerClass);
                    } else {
                      if (s.isDigit()) {
                        containerClass.width = (s.toInt().toDouble() > 100 && containerClass.widthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        containerClass.isWidthClear = false;
                        appStore.updateData(containerClass);
                      }
                    }
                  },
                  onTapPer: () {
                    containerClass.widthType = TypePercentage;
                    setState(() {});
                    containerClass.width = widthController!.text.toInt().toDouble();
                    if (containerClass.width > 100) {
                      containerClass.width = DEFAULT_CONTAINER_PER;
                      appStore.updateData(containerClass);
                    } else {
                      appStore.updateData(containerClass);
                    }
                  },
                  onTapPX: () {
                    containerClass.widthType = TypePX;
                    setState(() {});
                    containerClass.width = widthController!.text.toInt().toDouble();

                    appStore.updateData(containerClass);
                  },
                ).expand(flex: 1),
                8.width,
                getImageWidthType(
                  controller: heightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: containerClass.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      containerClass.height = null;
                      containerClass.isHeightClear = true;
                      appStore.updateData(containerClass);
                    } else {
                      if (s.isDigit()) {
                        containerClass.height = (s.toInt().toDouble() > 100 && containerClass.heightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        containerClass.isHeightClear = false;
                        appStore.updateData(containerClass);
                      }
                    }
                  },
                  onTapPer: () {
                    containerClass.heightType = TypePercentage;
                    setState(() {});
                    containerClass.height = heightController!.text.toInt().toDouble();
                    if (containerClass.height > 100) {
                      containerClass.height = DEFAULT_CONTAINER_PER;
                      appStore.updateData(containerClass);
                    } else {
                      appStore.updateData(containerClass);
                    }
                  },
                  onTapPX: () {
                    containerClass.heightType = TypePX;
                    setState(() {});
                    containerClass.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(containerClass);
                  },
                )
              ],
            )
          ],
        ),
        ExpansionTileView(
          language!.margin,
          context,
          <Widget>[
            paddingView(
                padding: containerClass.margin,
                onPaddingChanged: (l, t, r, b) {
                  containerClass.margin = EdgeInsets.fromLTRB(l, t, r, b);

                  appStore.updateData(containerClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.contentPadding,
          context,
          <Widget>[
            paddingView(
                padding: containerClass.padding,
                onPaddingChanged: (l, t, r, b) {
                  containerClass.padding = EdgeInsets.fromLTRB(l, t, r, b);

                  appStore.updateData(containerClass);
                }),
          ],
        ),
        ExpansionTileView(language!.alignmentChild, context, <Widget>[
          getDropDownField(alignment, defaultValue: containerClass.alignment ?? AlignmentTypeNone, onChanged: (value) {
            containerClass.alignment = value;
            setState(() {});
            appStore.updateData(containerClass);
          }),
        ]),
        ExpansionTileView(
          language!.borderProperties,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.radius,
              widget: radiusView(
                  radius: containerClass.borderRadius,
                  onRadiusChanged: (tl, tr, br, bt) {
                    containerClass.borderRadius = BorderRadius.only(
                      topLeft: Radius.circular(tl),
                      topRight: Radius.circular(tr),
                      bottomLeft: Radius.circular(br),
                      bottomRight: Radius.circular(bt),
                    );
                    appStore.updateData(containerClass);
                  }),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: containerClass.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR,
                isRemoveColor: true,
                applyColor: () {
                  containerClass.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(containerClass);
                },
                pickColor: () {
                  showColorPicker(context, containerClass.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, applyOnWidget: (color) {
                    containerClass.borderColor = color;
                    setState(() {});
                    appStore.updateData(containerClass);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: containerClass.borderWidth != null ? containerClass.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (String s) {
                    if (s.isDigit()) {
                      containerClass.borderWidth = s.toInt().toDouble();
                    } else {
                      containerClass.borderWidth = DEFAULT_BORDER_WIDTH;
                    }
                    appStore.updateData(containerClass);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.boxShape,
          context,
          <Widget>[
            getDropDownField(boxShape, defaultValue: containerClass.shape ?? BoxShapeTypeRectangle, onChanged: (value) {
              containerClass.shape = value;
              setState(() {});
              appStore.updateData(containerClass);
            }),
          ],
        ),
      ],
    );
  }
}
