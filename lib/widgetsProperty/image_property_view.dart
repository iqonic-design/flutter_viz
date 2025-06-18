import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/Image_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class ImagePropertyView extends StatefulWidget {
  @override
  ImagePropertyViewState createState() => ImagePropertyViewState();
}

class ImagePropertyViewState extends State<ImagePropertyView> {
  ImageClass? imageClass;
  bool isSelectedWidth = true;
  bool isSelectedHeight = true;
  TextEditingController? widthController, heightController;
  String? selectedImage;

  init() async {
    imageClass = appStore.currentSelectedWidget!.widgetViewModel as ImageClass?;
    if (imageClass!.isWidthClear!) {
      widthController = TextEditingController(text: "");
    } else {
      widthController = TextEditingController(text: imageClass!.width != null ? getWidthControllerValue(imageClass!.width, imageClass!.widthType) : DEFAULT_IMAGE_WIDTH.toInt().toString());
    }
    if (imageClass!.isHeightClear!) {
      heightController = TextEditingController(text: "");
    } else {
      heightController = TextEditingController(text: imageClass!.height != null ? getWidthControllerValue(imageClass!.height, imageClass!.heightType) : DEFAULT_IMAGE_HEIGHT.toInt().toString());
    }
    bool isExist = false;
    appStore.mediaList.map((media) {
      if (media.userAttachment == imageClass!.path) {
        isExist = true;
      }
    }).toList();
    if (imageClass!.imageType == ImageTypeAsset && isExist) {
      selectedImage = imageClass!.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Not Apply NetWork default Image
        ExpansionTileView(language!.padding, context, <Widget>[
          paddingView(
            padding: imageClass!.padding,
            onPaddingChanged: (l, t, r, b) {
              imageClass!.padding = EdgeInsets.fromLTRB(l, t, r, b);
              appStore.updateData(imageClass);
            },
          ),
        ]),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: imageClass!.isAlignX,
              isAlignY: imageClass!.isAlignY,
              alignX: imageClass!.horizontalAlignment ?? 0,
              alignY: imageClass!.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                imageClass!.horizontalAlignment = h;
                imageClass!.verticalAlignment = v;
                appStore.updateData(imageClass);
              },
              isAlignXChanged: (value) {
                imageClass!.isAlignX = value;
                appStore.updateData(imageClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                imageClass!.isAlignY = value;
                appStore.updateData(imageClass);
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
                  imageClass!.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      imageClass!.isExpanded = value;
                      appStore.updateData(imageClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(text: imageClass!.flex != null ? imageClass!.flex.toString() : DEFAULT_FLEX.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (s) {
                        imageClass!.flex = int.tryParse(s);
                        appStore.updateData(imageClass);
                      }),
                ).visible(imageClass!.isExpanded!),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.imageType,
          context,
          <Widget>[
            getDropDownField(imageType, defaultValue: imageClass!.imageType ?? ImageTypeNetwork, onChanged: (value) {
              imageClass!.imageType = value;
              imageClass!.path = imageClass!.imageType == ImageTypeNetwork ? DEFAULT_NETWORK_IMAGE : DEFAULT_ASSET_IMAGE;
              setState(() {});
              appStore.updateData(imageClass);
            }),
            16.height,
            getTextField(
              controller: TextEditingController(text: imageClass!.path ?? (imageClass!.imageType == ImageTypeNetwork ? DEFAULT_NETWORK_IMAGE : DEFAULT_ASSET_IMAGE)),
              hint: "Enter Path",
              onChanged: (s) {
                imageClass!.path = s;
                appStore.updateData(imageClass);
              },
            ).visible(imageClass!.imageType == ImageTypeNetwork),
            commonAssetImageWidget(
              context,
              selectedImage: selectedImage,
              onChanged: (value) {
                selectedImage = value;
                setState(() {});
                imageClass!.path = value;
                appStore.updateData(imageClass);
              },
            ).visible(imageClass!.imageType == ImageTypeAsset),
          ],
        ),
        ExpansionTileView(
          language!.boxFit,
          context,
          <Widget>[
            getDropDownField(boxFit, defaultValue: imageClass!.fit ?? boxFitCover, onChanged: (value) {
              imageClass!.fit = value;
              setState(() {});
              appStore.updateData(imageClass);
            }),
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
                  type: imageClass!.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      imageClass!.width = null;
                      imageClass!.isWidthClear = true;
                      appStore.updateData(imageClass);
                    } else {
                      if (s.isDigit()) {
                        imageClass!.width = (s.toInt().toDouble() > 100 && imageClass!.widthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        imageClass!.isWidthClear = false;
                        appStore.updateData(imageClass);
                      }
                    }
                  },
                  onTapPer: () {
                    imageClass!.widthType = TypePercentage;
                    setState(() {});
                    imageClass!.width = widthController!.text.toInt().toDouble();
                    if (imageClass!.width! > 100) {
                      imageClass!.width = DEFAULT_CONTAINER_PER;
                      appStore.updateData(imageClass);
                    } else {
                      appStore.updateData(imageClass);
                    }
                  },
                  onTapPX: () {
                    imageClass!.widthType = TypePX;
                    setState(() {});
                    imageClass!.width = widthController!.text.toInt().toDouble();
                    appStore.updateData(imageClass);
                  },
                ).expand(flex: 1),
                getImageWidthType(
                  controller: heightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: imageClass!.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      imageClass!.height = null;
                      imageClass!.isHeightClear = true;
                      appStore.updateData(imageClass);
                    } else {
                      if (s.isDigit()) {
                        imageClass!.height = (s.toInt().toDouble() > 100 && imageClass!.heightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        imageClass!.isHeightClear = false;
                        appStore.updateData(imageClass);
                      }
                    }
                  },
                  onTapPer: () {
                    imageClass!.heightType = TypePercentage;
                    setState(() {});
                    imageClass!.height = heightController!.text.toInt().toDouble();
                    if (imageClass!.height! > 100) {
                      imageClass!.height = DEFAULT_CONTAINER_PER;
                      appStore.updateData(imageClass);
                    } else {
                      appStore.updateData(imageClass);
                    }
                  },
                  onTapPX: () {
                    imageClass!.heightType = TypePX;
                    setState(() {});
                    imageClass!.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(imageClass);
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
