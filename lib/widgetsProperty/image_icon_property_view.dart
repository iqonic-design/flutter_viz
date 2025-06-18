import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/image_icon_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import 'comman_property_view.dart';
import 'package:nb_utils/nb_utils.dart';

class ImageIconPropertyView extends StatefulWidget {
  static String tag = '/ImageIconPropertyView';

  @override
  ImageIconPropertyViewState createState() => ImageIconPropertyViewState();
}

class ImageIconPropertyViewState extends State<ImageIconPropertyView> {
  var imageIconClass;
  String? selectedImage;

  init() async {
    imageIconClass = appStore.currentSelectedWidget!.widgetViewModel as ImageIconClass?;

    bool isExist = false;
    appStore.mediaList.map((media) {
      if (media.userAttachment == imageIconClass!.path) {
        isExist = true;
      }
    }).toList();
    if (imageIconClass!.imageType == ImageTypeAsset && isExist) {
      selectedImage = imageIconClass!.path;
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
              padding: imageIconClass.padding,
              onPaddingChanged: (l, t, r, b) {
                imageIconClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(imageIconClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: imageIconClass.isAlignX,
              isAlignY: imageIconClass.isAlignY,
              alignX: imageIconClass.horizontalAlignment ?? 0,
              alignY: imageIconClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                imageIconClass.horizontalAlignment = h;
                imageIconClass.verticalAlignment = v;
                appStore.updateData(imageIconClass);
              },
              isAlignXChanged: (value) {
                imageIconClass.isAlignX = value;
                appStore.updateData(imageIconClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                imageIconClass.isAlignY = value;
                appStore.updateData(imageIconClass);
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
                  imageIconClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      imageIconClass.isExpanded = value;
                      appStore.updateData(imageIconClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: imageIconClass.flex != null ? imageIconClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      imageIconClass.flex = int.tryParse(s);
                      appStore.updateData(imageIconClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(imageIconClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.imageType,
          context,
          <Widget>[
            getDropDownField(imageType, defaultValue: imageIconClass!.imageType ?? ImageTypeNetwork, onChanged: (value) {
              imageIconClass!.imageType = value;
              imageIconClass!.path = imageIconClass!.imageType == ImageTypeNetwork ? DEFAULT_NETWORK_IMAGE_ICON : DEFAULT_ASSET_IMAGE_ICON;
              setState(() {});
              appStore.updateData(imageIconClass);
            }),
            16.height,
            getTextField(
              controller: TextEditingController(text: imageIconClass!.path ?? (imageIconClass!.imageType == ImageTypeNetwork ? DEFAULT_NETWORK_IMAGE_ICON : DEFAULT_ASSET_IMAGE_ICON)),
              hint: "Enter Path",
              onChanged: (s) {
                imageIconClass!.path = s;
                appStore.updateData(imageIconClass);
              },
            ).visible(imageIconClass!.imageType == ImageTypeNetwork),
            commonAssetImageWidget(
              context,
              selectedImage: selectedImage,
              onChanged: (value) {
                selectedImage = value;
                imageIconClass!.path = value;
                appStore.updateData(imageIconClass);
                setState(() {});
              },
            ).visible(imageIconClass!.imageType == ImageTypeAsset),
          ],
        ),
        ExpansionTileView(
          language!.iconColor,
          context,
          <Widget>[
            ColorView(
              color: imageIconClass.color ?? DEFAULT_ICON_COLOR,
              applyColor: () {
                imageIconClass.color = appStore.color;
                setState(() {});
                appStore.updateData(imageIconClass);
              },
              pickColor: () {
                showColorPicker(context, imageIconClass.color ?? DEFAULT_ICON_COLOR, applyOnWidget: (color) {
                  imageIconClass.color = color;
                  setState(() {});
                  appStore.updateData(imageIconClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.iconSize,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: imageIconClass.size != null ? imageIconClass.size.toString() : DEFAULT_ICON_SIZE.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  imageIconClass.size = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_ICON_SIZE;
                  appStore.updateData(imageIconClass);
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
