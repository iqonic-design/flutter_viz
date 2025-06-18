import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/credit_card_view_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class CreditCardViewPropertyView extends StatefulWidget {
  static String tag = '/CreditCardViewPropertyView';

  @override
  CreditCardViewPropertyViewState createState() => CreditCardViewPropertyViewState();
}

class CreditCardViewPropertyViewState extends State<CreditCardViewPropertyView> {
  var creditCardViewModel;

  init() async {
    creditCardViewModel = appStore.currentSelectedWidget!.widgetViewModel as CreditCardViewClass?;
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
              padding: creditCardViewModel.padding,
              onPaddingChanged: (l, t, r, b) {
                creditCardViewModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(creditCardViewModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: creditCardViewModel.isAlignX,
              isAlignY: creditCardViewModel.isAlignY,
              alignX: creditCardViewModel.horizontalAlignment ?? 0,
              alignY: creditCardViewModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                creditCardViewModel.horizontalAlignment = h;
                creditCardViewModel.verticalAlignment = v;
                appStore.updateData(creditCardViewModel);
              },
              isAlignXChanged: (value) {
                creditCardViewModel.isAlignX = value;
                appStore.updateData(creditCardViewModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                creditCardViewModel.isAlignY = value;
                appStore.updateData(creditCardViewModel);
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
                  creditCardViewModel.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      creditCardViewModel.isExpanded = value;
                      appStore.updateData(creditCardViewModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: creditCardViewModel.flex != null ? creditCardViewModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    maxLength: commonMaxLength,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      creditCardViewModel.flex = int.tryParse(s);
                      appStore.updateData(creditCardViewModel);
                    },
                  ),
                ).visible(creditCardViewModel.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.obsureText,
          context,
          <Widget>[
            checkBoxView(
              creditCardViewModel.obscureCardNumber ?? true,
              language!.obscureCardNumber,
              onChanged: (value) {
                creditCardViewModel.obscureCardNumber = value;
                setState(() {});
                appStore.updateData(creditCardViewModel);
              },
            ),
            10.height,
            checkBoxView(
              creditCardViewModel.obscureCVV ?? false,
              language!.obscureCVV,
              onChanged: (value) {
                creditCardViewModel.obscureCVV = value;
                setState(() {});
                appStore.updateData(creditCardViewModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.spacing,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: creditCardViewModel.spacing != null ? creditCardViewModel.spacing.toString() : '16'),
                textAlign: TextAlign.center,
                maxLength: commonMaxLength,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  creditCardViewModel.spacing = s.toString().isNotEmpty ? double.parse(s) : 16;
                  appStore.updateData(creditCardViewModel);
                },
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.textStyle,
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
                      style: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : DEFAULT_TEXT_COLOR, fontSize: 14),
                    ),
                    8.height,
                    getDropDownField(fontWeight, defaultValue: creditCardViewModel.fontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      creditCardViewModel.fontWeight = value;
                      setState(() {});
                      appStore.updateData(creditCardViewModel);
                    }),
                  ],
                ).expand(flex: 2),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language!.fontSize,
                      style: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : DEFAULT_TEXT_COLOR, fontSize: 14),
                    ),
                    8.height,
                    getTextField(
                      controller: TextEditingController(text: creditCardViewModel.fontSize != null ? creditCardViewModel.fontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      maxLength: commonMaxLength,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (dynamic value) {
                        creditCardViewModel.fontSize = double.tryParse(value);
                        appStore.updateData(creditCardViewModel);
                      },
                    ),
                  ],
                ).expand(),
              ],
            ),
            8.height,
            getSubPropertyWidget(
              title: language!.textColor,
              widget: ColorView(
                color: creditCardViewModel.fontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  creditCardViewModel.fontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(creditCardViewModel);
                },
                pickColor: () {
                  showColorPicker(context, creditCardViewModel.fontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    creditCardViewModel.fontColor = color;
                    setState(() {});
                    appStore.updateData(creditCardViewModel);
                  });
                },
              ),
            ),
            8.height,
            checkBoxView(
              creditCardViewModel.fontStyle == FontStyle.italic ? true : false,
              language!.italic,
              onChanged: (value) {
                creditCardViewModel.fontStyle = value ? FontStyle.italic : FontStyle.normal;
                setState(() {});
                appStore.updateData(creditCardViewModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.inputDecorationProperties,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.inputBorderType,
              widget: getDropDownField(inputBorderType, defaultValue: creditCardViewModel.inputBorder ?? InputBorderTypeOutLine, onChanged: (value) {
                creditCardViewModel.inputBorder = value;
                setState(() {});
                appStore.updateData(creditCardViewModel);
              }),
            ),
            getSubPropertyWidget(
              title: language!.radius,
              widget: radiusView(
                radius: creditCardViewModel.borderRadius,
                onRadiusChanged: (tl, tr, br, bt) {
                  creditCardViewModel.borderRadius = BorderRadius.only(
                    topLeft: Radius.circular(tl),
                    topRight: Radius.circular(tr),
                    bottomLeft: Radius.circular(br),
                    bottomRight: Radius.circular(bt),
                  );
                  appStore.updateData(creditCardViewModel);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: creditCardViewModel.borderColor ?? DEFAULT_BORDER_COLOR,
                applyColor: () {
                  creditCardViewModel.borderColor = appStore.color;
                  setState(() {});
                  appStore.updateData(creditCardViewModel);
                },
                pickColor: () {
                  showColorPicker(context, creditCardViewModel.borderColor ?? DEFAULT_BORDER_COLOR, applyOnWidget: (color) {
                    creditCardViewModel.borderColor = color;
                    setState(() {});

                    appStore.updateData(creditCardViewModel);
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.width,
              widget: Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: creditCardViewModel.borderWidth != null ? creditCardViewModel.borderWidth.toString() : DEFAULT_BORDER_WIDTH.toString()),
                  textAlign: TextAlign.center,
                  maxLength: commonMaxLength,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (value) {
                    creditCardViewModel.borderWidth = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_BORDER_WIDTH;
                    appStore.updateData(creditCardViewModel);
                  },
                ),
              ),
            ),
            checkBoxView(
              creditCardViewModel.filled ?? false,
              language!.filled,
              onChanged: (value) {
                creditCardViewModel.filled = value;
                appStore.updateData(creditCardViewModel);
                setState(() {});
              },
            ),
            10.height,
            getSubPropertyWidget(
              title: language!.fillColor,
              widget: ColorView(
                color: creditCardViewModel.fillColor ?? DEFAULT_TEXT_FIELD_COLOR,
                applyColor: () {
                  creditCardViewModel.fillColor = appStore.color;
                  setState(() {});
                  appStore.updateData(creditCardViewModel);
                },
                pickColor: () {
                  showColorPicker(context, creditCardViewModel.fillColor ?? DEFAULT_TEXT_FIELD_COLOR, applyOnWidget: (color) {
                    if (creditCardViewModel.filled) {
                      creditCardViewModel.fillColor = color;
                      setState(() {});
                      appStore.updateData(creditCardViewModel);
                    }
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.contentPadding,
              widget: paddingView(
                onPaddingChanged: (l, t, r, b) {
                  creditCardViewModel.contentPadding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(creditCardViewModel);
                },
                padding: creditCardViewModel.contentPadding ?? EdgeInsets.fromLTRB(12, 8, 12, 8),
              ),
            ),
            checkBoxView(
              creditCardViewModel.isDense ?? false,
              language!.dense,
              onChanged: (value) {
                creditCardViewModel.isDense = value;
                appStore.updateData(creditCardViewModel);
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
