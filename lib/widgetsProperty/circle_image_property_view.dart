import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/circle_image_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class CircleImagePropertyView extends StatefulWidget {
  static String tag = '/CircleImagePropertyView';

  @override
  CircleImagePropertyViewState createState() => CircleImagePropertyViewState();
}

class CircleImagePropertyViewState extends State<CircleImagePropertyView> {
  var circleImageClass;
  String? selectedImage;
  TextEditingController? radiusController;

  init() async {
    circleImageClass = appStore.currentSelectedWidget!.widgetViewModel as CircleImageClass?;
    if (circleImageClass.isRadiusClear) {
      radiusController = TextEditingController(text: "");
    } else {
      radiusController =
          TextEditingController(text: circleImageClass.radius != null ? getWidthControllerValue(circleImageClass.radius, circleImageClass.radiusType) : DEFAULT_CIRCLE_IMAGE_WIDTH.toInt().toString());
    }
    bool isExist = false;
    appStore.mediaList.map((media) {
      if (media.userAttachment == circleImageClass!.path) {
        isExist = true;
      }
    }).toList();
    if (circleImageClass!.imageType == ImageTypeAsset && isExist) {
      selectedImage = circleImageClass!.path;
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
              padding: circleImageClass.padding,
              onPaddingChanged: (l, t, r, b) {
                circleImageClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(circleImageClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: circleImageClass.isAlignX,
              isAlignY: circleImageClass.isAlignY,
              alignX: circleImageClass.horizontalAlignment ?? 0,
              alignY: circleImageClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                circleImageClass.horizontalAlignment = h;
                circleImageClass.verticalAlignment = v;
                appStore.updateData(circleImageClass);
              },
              isAlignXChanged: (value) {
                circleImageClass.isAlignX = value;
                appStore.updateData(circleImageClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                circleImageClass.isAlignY = value;
                appStore.updateData(circleImageClass);
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
                  circleImageClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      circleImageClass.isExpanded = value;
                      appStore.updateData(circleImageClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(text: circleImageClass.flex != null ? circleImageClass.flex.toString() : DEFAULT_FLEX.toString()),
                      textAlign: TextAlign.center,
                      maxLength: commonMaxLength,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (s) {
                        circleImageClass.flex = int.tryParse(s);
                        appStore.updateData(circleImageClass);
                      }),
                ).visible(circleImageClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.imageType,
          context,
          <Widget>[
            getDropDownField(imageType, defaultValue: circleImageClass!.imageType ?? ImageTypeNetwork, onChanged: (value) {
              circleImageClass!.imageType = value;
              circleImageClass!.path = circleImageClass!.imageType == ImageTypeNetwork ? DEFAULT_NETWORK_IMAGE : DEFAULT_ASSET_IMAGE;
              setState(() {});
              appStore.updateData(circleImageClass);
            }),
            16.height,
            getTextField(
              controller: TextEditingController(text: circleImageClass!.path ?? (circleImageClass!.imageType == ImageTypeNetwork ? DEFAULT_NETWORK_IMAGE : DEFAULT_ASSET_IMAGE)),
              hint: "Enter Path",
              onChanged: (s) {
                circleImageClass!.path = s;
                appStore.updateData(circleImageClass);
              },
            ).visible(circleImageClass!.imageType == ImageTypeNetwork),
            commonAssetImageWidget(
              context,
              selectedImage: selectedImage,
              onChanged: (value) {
                selectedImage = value;
                circleImageClass!.path = value;
                appStore.updateData(circleImageClass);
                setState(() {});
              },
            ).visible(circleImageClass!.imageType == ImageTypeAsset),
          ],
        ),
        ExpansionTileView(
          language!.radius,
          context,
          <Widget>[
            getImageWidthType(
              controller: radiusController,
              widthType1: "PX",
              widthType2: "%",
              title: language!.radius,
              type: circleImageClass.radiusType,
              onTapPer: () {
                circleImageClass.radiusType = TypePercentage;
                setState(() {});
                circleImageClass.radius = radiusController!.text.toInt().toDouble();
                if (circleImageClass.radius > 100) {
                  circleImageClass.radius = DEFAULT_CONTAINER_PER;
                  appStore.updateData(circleImageClass);
                } else {
                  appStore.updateData(circleImageClass);
                }
              },
              onTapPX: () {
                circleImageClass.radiusType = TypePX;
                setState(() {});
                circleImageClass.radius = radiusController!.text.toInt().toDouble();
                appStore.updateData(circleImageClass);
              },
              onTextChanged: (s) {
                if (s.isEmpty) {
                  circleImageClass.radius = null;
                  circleImageClass.isRadiusClear = true;
                  appStore.updateData(circleImageClass);
                } else {
                  circleImageClass.radius = (s.toInt().toDouble() > 100 && circleImageClass.radiusType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                  circleImageClass.isRadiusClear = false;
                  appStore.updateData(circleImageClass);
                }
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.boxFit,
          context,
          <Widget>[
            getDropDownField(
              boxFit,
              defaultValue: circleImageClass.boxFit ?? boxFitCover,
              onChanged: (s) {
                circleImageClass.boxFit = s;
                setState(() {});
                appStore.updateData(circleImageClass);
              },
            )
          ],
        ),
      ],
    );
  }
}
