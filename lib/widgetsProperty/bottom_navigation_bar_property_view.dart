import 'dart:convert';

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/bottom_navigation_bar_item_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/bottom_navigation_bar_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class BottomNavigationBarPropertyView extends StatefulWidget {
  @override
  BottomNavigationBarPropertyViewState createState() => BottomNavigationBarPropertyViewState();
}

class BottomNavigationBarPropertyViewState extends State<BottomNavigationBarPropertyView> {
  var bottomNavigationBarClass;

  init() async {
    appStore.setValueErrorMsg("");
    bottomNavigationBarClass = appStore.currentSelectedWidget!.widgetViewModel as BottomNavigationBarClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.items,
          context,
          <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(bottomNavigationBarClass.bottomNavigationBarItems.length, (index) {
                BottomNavigationBarItemModel item = bottomNavigationBarClass.bottomNavigationBarItems[index];
                return Row(
                  children: [
                    iconPickerView(
                      isShowIconName: false,
                      iconDataJson: {
                        'iconName': item.icon!.iconName,
                        'codePoint': item.icon!.codePoint,
                        'fontFamily': item.icon!.fontFamily,
                      },
                      onChanged: (value) {
                        var iconDataJson = jsonDecode(value);
                        item.icon = IconResponse(
                          iconName: iconDataJson['iconName'],
                          codePoint: iconDataJson['codePoint'],
                          fontFamily: iconDataJson['fontFamily'],
                        );
                        setState(() {});
                        appStore.updateData(bottomNavigationBarClass);
                      },
                    ),
                    16.width,
                    getTextField(
                      controller: TextEditingController(text: bottomNavigationBarClass.bottomNavigationBarItems[index].label),
                      hint: 'Label Text',
                      onChanged: (s) {
                        item.label = s;
                        appStore.updateData(bottomNavigationBarClass);
                      },
                    ).expand(),
                    16.width,
                    closeIcon().onTap(() {
                      bottomNavigationBarClass.bottomNavigationBarItems.removeAt(index);
                      setState(() {});
                      appStore.updateData(bottomNavigationBarClass);
                    }).visible(bottomNavigationBarClass.bottomNavigationBarItems.length > 2),
                  ],
                ).paddingBottom(16);
              }),
            ),
            Text(
              language!.addOptions,
              style: boldTextStyle(color: btnBackgroundColor),
            ).onTap(() {
              bottomNavigationBarClass.bottomNavigationBarItems.length += 1;
              bottomNavigationBarClass.bottomNavigationBarItems[bottomNavigationBarClass.bottomNavigationBarItems.length - 1] =
                  BottomNavigationBarItemModel(icon: IconResponse(codePoint: 58136, fontFamily: 'MaterialIcons', iconName: "home"), label: "Home");
              setState(() {});
              appStore.updateData(bottomNavigationBarClass);
            }).visible(bottomNavigationBarClass.bottomNavigationBarItems.length < 6),
          ],
        ),
        ExpansionTileView(
          language!.backgroundColor,
          context,
          <Widget>[
            ColorView(
              color: bottomNavigationBarClass.backgroundColor ?? BOTTOM_NAVIGATION_BG_COLOR,
              applyColor: () {
                bottomNavigationBarClass.backgroundColor = appStore.color;
                setState(() {});
                appStore.updateData(bottomNavigationBarClass);
              },
              pickColor: () {
                showColorPicker(context, bottomNavigationBarClass.backgroundColor ?? BOTTOM_NAVIGATION_BG_COLOR, applyOnWidget: (color) {
                  bottomNavigationBarClass.backgroundColor = color;
                  setState(() {});
                  appStore.updateData(bottomNavigationBarClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(language!.currentIndex, context, [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: widthPropertySize,
                child: getTextField(
                  controller: TextEditingController(text: bottomNavigationBarClass.currentIndex != null ? bottomNavigationBarClass.currentIndex.toString() : "0"),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  onChanged: (s) {
                    if (int.parse(s) >= bottomNavigationBarClass.bottomNavigationBarItems.length) {
                      appStore.setValueErrorMsg(language!.currentIndexValidation);
                    } else {
                      bottomNavigationBarClass.currentIndex = s.toString().isNotEmpty ? int.parse(s) : 0;
                      appStore.updateData(bottomNavigationBarClass);
                      appStore.setValueErrorMsg("");
                    }
                  },
                  maxLength: commonMaxLength,
                ),
              ),
              4.height,
              Observer(
                  builder: (context) => Text(
                        appStore.valueErrorMsg,
                        style: secondaryTextStyle(color: Colors.red),
                      ).visible(appStore.valueErrorMsg.isNotEmpty)),
            ],
          ),
        ]),
        ExpansionTileView(language!.elevation, context, [
          Container(
            width: widthPropertySize,
            child: getTextField(
              controller: TextEditingController(
                text: bottomNavigationBarClass.elevation != null ? bottomNavigationBarClass.elevation.toString() : BOTTOM_NAVIGATION_ELEVATION.toString(),
              ),
              textAlign: TextAlign.center,
              inputFormatter: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
              ],
              onChanged: (s) {
                bottomNavigationBarClass.elevation = s.isNotEmpty ? double.parse(s) : BOTTOM_NAVIGATION_ELEVATION;
                appStore.updateData(bottomNavigationBarClass);
              },
              maxLength: commonMaxLength,
            ),
          ),
        ]),
        ExpansionTileView(
          language!.iconSize,
          context,
          [
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: bottomNavigationBarClass.iconSize != null ? bottomNavigationBarClass.iconSize.toString() : DEFAULT_ICON_SIZE.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  if (double.parse(s) > 50) {
                    bottomNavigationBarClass.iconSize = 50;
                    setState(() {});
                    getToast(language!.maximumIconSizeFifty);
                    appStore.updateData(bottomNavigationBarClass);
                  } else {
                    bottomNavigationBarClass.iconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;
                    appStore.updateData(bottomNavigationBarClass);
                  }
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.selectedItemColor,
          context,
          <Widget>[
            ColorView(
              color: bottomNavigationBarClass.selectedItemColor ?? COMMON_BG_COLOR,
              applyColor: () {
                bottomNavigationBarClass.selectedItemColor = appStore.color;
                setState(() {});
                appStore.updateData(bottomNavigationBarClass);
              },
              pickColor: () {
                showColorPicker(context, bottomNavigationBarClass.selectedItemColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  bottomNavigationBarClass.selectedItemColor = color;
                  setState(() {});
                  appStore.updateData(bottomNavigationBarClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.unSelectedItemColor,
          context,
          <Widget>[
            ColorView(
              color: bottomNavigationBarClass.unselectedItemColor ?? UNSELECTED_ITEM_COLOR,
              applyColor: () {
                bottomNavigationBarClass.unselectedItemColor = appStore.color;
                setState(() {});
                appStore.updateData(bottomNavigationBarClass);
              },
              pickColor: () {
                showColorPicker(context, bottomNavigationBarClass.unselectedItemColor ?? UNSELECTED_ITEM_COLOR, applyOnWidget: (color) {
                  bottomNavigationBarClass.unselectedItemColor = color;
                  setState(() {});
                  appStore.updateData(bottomNavigationBarClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.selectedFontSize,
          context,
          [
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: bottomNavigationBarClass.selectedFontSize != null ? bottomNavigationBarClass.selectedFontSize.toString() : DEFAULT_FONT_SIZE.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  if (double.parse(s) > 30) {
                    bottomNavigationBarClass.selectedFontSize = 30;
                    setState(() {});
                    getToast(language!.maximumFontSizeThirty);
                    appStore.updateData(bottomNavigationBarClass);
                  } else {
                    bottomNavigationBarClass.selectedFontSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_FONT_SIZE;
                    appStore.updateData(bottomNavigationBarClass);
                  }
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.unSelectedFontSize,
          context,
          [
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: bottomNavigationBarClass.unselectedFontSize != null ? bottomNavigationBarClass.unselectedFontSize.toString() : DEFAULT_FONT_SIZE.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  if (double.parse(s) > 30) {
                    bottomNavigationBarClass.unselectedFontSize = 30;
                    setState(() {});
                    getToast(language!.maximumFontSizeThirty);
                    appStore.updateData(bottomNavigationBarClass);
                  } else {
                    bottomNavigationBarClass.unselectedFontSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_FONT_SIZE;
                    appStore.updateData(bottomNavigationBarClass);
                  }
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.showSelectedLabels,
          context,
          <Widget>[
            checkBoxView(
              bottomNavigationBarClass.showSelectedLabels ?? true,
              language!.showSelectedLabels,
              onChanged: (value) {
                bottomNavigationBarClass.showSelectedLabels = value;
                setState(() {});
                appStore.updateData(bottomNavigationBarClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.showUnSelectedLabels,
          context,
          <Widget>[
            checkBoxView(
              bottomNavigationBarClass.showUnselectedLabels ?? true,
              language!.showUnSelectedLabels,
              onChanged: (value) {
                bottomNavigationBarClass.showUnselectedLabels = value;
                setState(() {});
                appStore.updateData(bottomNavigationBarClass);
              },
            ),
          ],
        ),
      ],
    );
  }
}
