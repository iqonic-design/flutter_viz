import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/card_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class CardPropertyView extends StatefulWidget {
  @override
  CardPropertyViewState createState() => CardPropertyViewState();
}

class CardPropertyViewState extends State<CardPropertyView> {
  var cardClass;

  init() async {
    cardClass = appStore.currentSelectedWidget!.widgetViewModel as CardClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: cardClass.isAlignX,
              isAlignY: cardClass.isAlignY,
              alignX: cardClass.horizontalAlignment ?? 0,
              alignY: cardClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                cardClass.horizontalAlignment = h;
                cardClass.verticalAlignment = v;
                appStore.updateData(cardClass);
              },
              isAlignXChanged: (value) {
                cardClass.isAlignX = value;
                appStore.updateData(cardClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                cardClass.isAlignY = value;
                appStore.updateData(cardClass);
                appStore.setIsAlignY(value);
              },
            ),
          ],
        ),
        ExpansionTileView(language!.expandedAndFlex, context, <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkBoxView(
                cardClass.isExpanded ?? false,
                language!.expanded,
                onChanged: (value) {
                  if (getIsExpanded(value).isExpanded!) {
                    cardClass.isExpanded = value;
                    appStore.updateData(cardClass);
                    setState(() {});
                  } else {
                    getSnackBarWidget(getIsExpanded(value).message!);
                  }
                },
              ),
              Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: cardClass.flex != null ? cardClass.flex.toString() : DEFAULT_FLEX.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (s) {
                    cardClass.flex = int.tryParse(s);
                    appStore.updateData(cardClass);
                  },
                  maxLength: commonMaxLength,
                ),
              ).visible(cardClass.isExpanded ?? false),
            ],
          ),
        ]).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.color,
          context,
          <Widget>[
            ColorView(
              color: cardClass.color ?? DEFAULT_CARD_COLOR,
              applyColor: () {
                cardClass.color = appStore.color;
                setState(() {});
                appStore.updateData(cardClass);
              },
              pickColor: () {
                showColorPicker(context, cardClass.color ?? DEFAULT_CARD_COLOR, applyOnWidget: (color) {
                  cardClass.color = color;
                  setState(() {});
                  appStore.updateData(cardClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.margin,
          context,
          <Widget>[
            paddingView(
                padding: cardClass.margin ?? EdgeInsets.all(4),
                onPaddingChanged: (l, t, r, b) {
                  cardClass.margin = EdgeInsets.fromLTRB(l, t, r, b);

                  appStore.updateData(cardClass);
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
                  radius: cardClass.borderRadius,
                  onRadiusChanged: (tl, tr, br, bt) {
                    cardClass.borderRadius = BorderRadius.only(
                      topLeft: Radius.circular(tl),
                      topRight: Radius.circular(tr),
                      bottomLeft: Radius.circular(br),
                      bottomRight: Radius.circular(bt),
                    );
                    appStore.updateData(cardClass);
                  }),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: cardClass.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR,
                isRemoveColor: true,
                applyColor: () {
                  cardClass.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(cardClass);
                },
                pickColor: () {
                  showColorPicker(context, cardClass.borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, applyOnWidget: (color) {
                    cardClass.borderColor = color;
                    setState(() {});
                    appStore.updateData(cardClass);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: cardClass.borderWidth != null ? cardClass.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (String s) {
                    if (s.isDigit()) {
                      cardClass.borderWidth = s.toInt().toDouble();
                    } else {
                      cardClass.borderWidth = DEFAULT_BORDER_WIDTH;
                    }
                    appStore.updateData(cardClass);
                  },
                  maxLength: commonMaxLength,
                ),
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.shadowColor,
          context,
          <Widget>[
            ColorView(
              color: cardClass.shadowColor ?? Colors.black,
              applyColor: () {
                cardClass.shadowColor = appStore.color;
                setState(() {});
                appStore.updateData(cardClass);
              },
              pickColor: () {
                showColorPicker(context, cardClass.shadowColor ?? Colors.black, applyOnWidget: (color) {
                  cardClass.shadowColor = color;
                  appStore.updateData(cardClass);
                  setState(() {});
                });
              },
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
                controller: TextEditingController(text: cardClass.elevation != null ? cardClass.elevation.toString() : DEFAULT_CARD_ELEVATION.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  cardClass.elevation = double.parse(s);
                  appStore.updateData(cardClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
