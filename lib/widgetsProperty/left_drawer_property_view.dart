import 'dart:convert';

import 'package:flutter_viz/model/bottom_navigation_bar_item_model.dart';
import 'package:flutter_viz/model/drawer_Item_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/left_drawer_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class LeftDrawerPropertyView extends StatefulWidget {
  static String tag = '/LeftDrawerPropertyView';

  @override
  LeftDrawerPropertyViewState createState() => LeftDrawerPropertyViewState();
}

class LeftDrawerPropertyViewState extends State<LeftDrawerPropertyView> {
  var leftDrawerClass;
  String? selectedImage;

  init() async {
    leftDrawerClass = appStore.currentSelectedWidget!.widgetViewModel as LeftDrawerClass?;
    bool isExist = false;
    appStore.mediaList.map((media) {
      if (media.userAttachment == leftDrawerClass!.profileImagePath) {
        isExist = true;
      }
    }).toList();
    if (leftDrawerClass!.profileImageType == ImageTypeAsset && isExist) {
      selectedImage = leftDrawerClass!.profileImagePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.elevation,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: leftDrawerClass.elevation != null ? leftDrawerClass.elevation.toString() : DEFAULT_DRAWER_ELEVATION.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  if (s.isNotEmpty) {
                    leftDrawerClass.elevation = double.parse(s);
                    appStore.updateData(leftDrawerClass);
                  }
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.headerColor,
          context,
          <Widget>[
            ColorView(
              color: leftDrawerClass.headerColor ?? COMMON_BG_COLOR,
              applyColor: () {
                leftDrawerClass.headerColor = appStore.color;
                setState(() {});
                appStore.updateData(leftDrawerClass);
              },
              pickColor: () {
                showColorPicker(context, leftDrawerClass.headerColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  leftDrawerClass.headerColor = color;
                  setState(() {});
                  appStore.updateData(leftDrawerClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          "Profile Image",
          context,
          <Widget>[
            getDropDownField(imageType, defaultValue: leftDrawerClass.profileImageType ?? ImageTypeNetwork, onChanged: (value) {
              leftDrawerClass.profileImageType = value;
              leftDrawerClass.profileImagePath = leftDrawerClass.profileImageType == ImageTypeNetwork ? DEFAULT_DRAWER_NETWORK_IMAGE : DEFAULT_DRAWER_ASSET_IMAGE;
              setState(() {});
              appStore.updateData(leftDrawerClass);
            }),
            16.height,
            getTextField(
              controller: TextEditingController(text: leftDrawerClass.profileImagePath ?? (leftDrawerClass.profileImageType == ImageTypeNetwork ? DEFAULT_DRAWER_NETWORK_IMAGE : DEFAULT_DRAWER_ASSET_IMAGE)),
              hint: "Enter Path",
              onChanged: (s) {
                leftDrawerClass.profileImagePath = s;
                appStore.updateData(leftDrawerClass);
              },
            ).visible(leftDrawerClass.profileImageType == ImageTypeNetwork),
            commonAssetImageWidget(
              context,
              selectedImage: selectedImage,
              onChanged: (value) {
                selectedImage = value;
                leftDrawerClass.profileImagePath = value;
                appStore.updateData(leftDrawerClass);
                setState(() {});
              },
            ).visible(leftDrawerClass.profileImageType == ImageTypeAsset),
          ],
        ),
        ExpansionTileView(
          language!.title,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.text,
              widget: getTextField(
                controller: TextEditingController(text: leftDrawerClass.name != null ? leftDrawerClass.name.toString() : DUMMY_USER_NAME),
                hint: "title",
                onChanged: (s) {
                  leftDrawerClass.name = s;
                  appStore.updateData(leftDrawerClass);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontWeight,
              widget: getDropDownField(fontWeight, defaultValue: leftDrawerClass.nameFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                leftDrawerClass.nameFontWeight = value;
                setState(() {});
                appStore.updateData(leftDrawerClass);
              }),
            ),
            getSubPropertyWidget(
              title: language!.fontColor,
              widget: ColorView(
                color: leftDrawerClass.nameFontColor ?? DEFAULT_DRAWER_FONT_COLOR,
                applyColor: () {
                  leftDrawerClass.nameFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(leftDrawerClass);
                },
                pickColor: () {
                  showColorPicker(context, leftDrawerClass.nameFontColor ?? DEFAULT_DRAWER_FONT_COLOR, applyOnWidget: (color) {
                    leftDrawerClass.nameFontColor = color;
                    setState(() {});
                    appStore.updateData(leftDrawerClass);
                  });
                },
              ),
            ),
            checkBoxView(leftDrawerClass.nameFontStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
              leftDrawerClass.nameFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(leftDrawerClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.subTitle,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.text,
              widget: getTextField(
                controller: TextEditingController(text: leftDrawerClass.email != null ? leftDrawerClass.email.toString() : DUMMY_USER_EMAIL),
                hint: "subtitle",
                onChanged: (s) {
                  leftDrawerClass.email = s;
                  appStore.updateData(leftDrawerClass);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.fontWeight,
              widget: getDropDownField(fontWeight, defaultValue: leftDrawerClass.emailFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                leftDrawerClass.emailFontWeight = value;
                setState(() {});
                appStore.updateData(leftDrawerClass);
              }),
            ),
            getSubPropertyWidget(
              title: language!.fontColor,
              widget: ColorView(
                color: leftDrawerClass.emailFontColor ?? DEFAULT_DRAWER_FONT_COLOR,
                applyColor: () {
                  leftDrawerClass.emailFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(leftDrawerClass);
                },
                pickColor: () {
                  showColorPicker(context, leftDrawerClass.emailFontColor ?? DEFAULT_DRAWER_FONT_COLOR, applyOnWidget: (color) {
                    leftDrawerClass.emailFontColor = color;
                    setState(() {});
                    appStore.updateData(leftDrawerClass);
                  });
                },
              ),
            ),
            checkBoxView(leftDrawerClass.emailFontStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
              leftDrawerClass.emailFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(leftDrawerClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.items,
          context,
          <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(leftDrawerClass.drawerItems.length, (index) {
                DrawerItemModel item = leftDrawerClass.drawerItems[index];
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
                        appStore.updateData(leftDrawerClass);
                      },
                    ),
                    16.width,
                    getTextField(
                      controller: TextEditingController(text: leftDrawerClass.drawerItems[index].label),
                      hint: 'Label Text',
                      onChanged: (s) {
                        item.label = s;
                        appStore.updateData(leftDrawerClass);
                      },
                    ).expand(),
                    16.width,
                    closeIcon().onTap(() {
                      leftDrawerClass.drawerItems.removeAt(index);
                      setState(() {});
                      appStore.updateData(leftDrawerClass);
                    }),
                  ],
                ).paddingBottom(16);
              }),
            ),
            Text(
              language!.addItems,
              style: boldTextStyle(color: btnBackgroundColor),
            ).onTap(() {
              leftDrawerClass.drawerItems.length += 1;
              leftDrawerClass.drawerItems[leftDrawerClass.drawerItems.length - 1] = DrawerItemModel(icon: IconResponse(codePoint: 58136, fontFamily: 'MaterialIcons', iconName: "home"), label: "Home");
              setState(() {});
              appStore.updateData(leftDrawerClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.itemStyle,
          context,
          <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language!.iconColor,
                      style: secondaryTextStyle(),
                    ),
                    8.height,
                    ColorView(
                      color: leftDrawerClass.iconColor ?? DEFAULT_ICON_COLOR,
                      applyColor: () {
                        leftDrawerClass.iconColor = appStore.color;
                        setState(() {});
                        appStore.updateData(leftDrawerClass);
                      },
                      pickColor: () {
                        showColorPicker(context, leftDrawerClass.iconColor ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                          leftDrawerClass.iconColor = color;
                          setState(() {});
                          appStore.updateData(leftDrawerClass);
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language!.iconSize,
                      style: secondaryTextStyle(),
                    ),
                    8.height,
                    Container(
                      width: 100,
                      child: getTextField(
                        controller: TextEditingController(text: leftDrawerClass.iconSize != null ? leftDrawerClass.iconSize.toString() : DEFAULT_ICON_SIZE.toString()),
                        textAlign: TextAlign.center,
                        inputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                        ],
                        onChanged: (s) {
                          if (double.parse(s) > 50) {
                            leftDrawerClass.iconSize = 50;
                            setState(() {});
                            getToast(language!.maximumIconSizeFifty);
                            appStore.updateData(leftDrawerClass);
                          } else {
                            leftDrawerClass.iconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;
                            appStore.updateData(leftDrawerClass);
                          }
                        },
                        maxLength: commonMaxLength,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            10.height,
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
                    getDropDownField(fontWeight, defaultValue: leftDrawerClass.labelFontWeight ?? FontWeightTypeNormal, onChanged: (value) {
                      leftDrawerClass.labelFontWeight = value;
                      setState(() {});
                      appStore.updateData(leftDrawerClass);
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
                      controller: TextEditingController(text: leftDrawerClass.labelFontSize != null ? leftDrawerClass.labelFontSize.toString() : DEFAULT_FONT_SIZE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (s) {
                        if (double.parse(s) > 30) {
                          leftDrawerClass.labelFontSize = 30;
                          setState(() {});
                          getToast(language!.maximumFontSizeThirty);
                          appStore.updateData(leftDrawerClass);
                        } else {
                          leftDrawerClass.labelFontSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_FONT_SIZE;
                          appStore.updateData(leftDrawerClass);
                        }
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
                color: leftDrawerClass.labelFontColor ?? DEFAULT_TEXT_COLOR,
                applyColor: () {
                  leftDrawerClass.labelFontColor = appStore.color;
                  setState(() {});
                  appStore.updateData(leftDrawerClass);
                },
                pickColor: () {
                  showColorPicker(context, leftDrawerClass.labelFontColor ?? DEFAULT_TEXT_COLOR, applyOnWidget: (color) {
                    leftDrawerClass.labelFontColor = color;
                    setState(() {});
                    appStore.updateData(leftDrawerClass);
                  });
                },
              ),
            ),
            checkBoxView(leftDrawerClass.labelFontStyle == FontStyle.italic ? true : false, language!.italic, onChanged: (value) {
              leftDrawerClass.labelFontStyle = value ? FontStyle.italic : FontStyle.normal;
              setState(() {});
              appStore.updateData(leftDrawerClass);
            }),
          ],
        ).visible(leftDrawerClass.drawerItems.length != 0),
      ],
    );
  }
}
