import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/lottie_animation_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class LottieAnimationPropertyView extends StatefulWidget {
  static String tag = '/LottieAnimationPropertyView';

  @override
  LottieAnimationPropertyViewState createState() => LottieAnimationPropertyViewState();
}

class LottieAnimationPropertyViewState extends State<LottieAnimationPropertyView> {
  var lottieAnimationModel;
  bool isSelectedWidth = true;
  bool isSelectedHeight = true;
  var isAnimationChanged = false;
  TextEditingController? widthController, heightController;

  init() async {
    lottieAnimationModel = appStore.currentSelectedWidget!.widgetViewModel as LottieAnimationClass?;
    if (lottieAnimationModel.isWidthClear) {
      widthController = TextEditingController(text: "");
    } else {
      widthController = TextEditingController(
        text: lottieAnimationModel.width != null ? getWidthControllerValue(lottieAnimationModel.width, lottieAnimationModel.widthType) : DEFAULT_LOTTIE_ANIMATION_WIDTH.toInt().toString(),
      );
    }
    if (lottieAnimationModel.isHeightClear) {
      heightController = TextEditingController(text: "");
    } else {
      heightController = TextEditingController(
        text: lottieAnimationModel.height != null ? getWidthControllerValue(lottieAnimationModel.height, lottieAnimationModel.heightType) : DEFAULT_LOTTIE_ANIMATION_HEIGHT.toInt().toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Not Apply NetWork default Image
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              padding: lottieAnimationModel.padding,
              onPaddingChanged: (l, t, r, b) {
                lottieAnimationModel.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(lottieAnimationModel);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: lottieAnimationModel.isAlignX,
              isAlignY: lottieAnimationModel.isAlignY,
              alignX: lottieAnimationModel.horizontalAlignment ?? 0,
              alignY: lottieAnimationModel.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                lottieAnimationModel.horizontalAlignment = h;
                lottieAnimationModel.verticalAlignment = v;
                appStore.updateData(lottieAnimationModel);
              },
              isAlignXChanged: (value) {
                lottieAnimationModel.isAlignX = value;
                appStore.updateData(lottieAnimationModel);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                lottieAnimationModel.isAlignY = value;
                appStore.updateData(lottieAnimationModel);
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
                  lottieAnimationModel.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      lottieAnimationModel.isExpanded = value;
                      appStore.updateData(lottieAnimationModel);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: lottieAnimationModel.flex != null ? lottieAnimationModel.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      lottieAnimationModel.flex = int.tryParse(s);
                      appStore.updateData(lottieAnimationModel);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(lottieAnimationModel.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.animationSourceType,
          context,
          <Widget>[
            getDropDownField(imageType, defaultValue: lottieAnimationModel.imageType ?? ImageTypeNetwork, onChanged: (value) {
              lottieAnimationModel.imageType = value;
              lottieAnimationModel.path = lottieAnimationModel.imageType == ImageTypeNetwork ? "https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json" : "images/inCompatible.json";
              setState(() {});
              appStore.updateData(lottieAnimationModel);
            }),
          ],
        ),
        ExpansionTileView(
          language!.path,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(
                text: lottieAnimationModel.path ?? (lottieAnimationModel.imageType == ImageTypeNetwork ? 'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json' : 'images/inCompatible.json'),
              ),
              hint: "Enter Path",
              onChanged: (s) {
                final urlRegExp = new RegExp(r"(https:\/\/)[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?(.json)");
                final urlMatches = urlRegExp.allMatches(s);
                List<String> urls = urlMatches.map((urlMatch) {
                  return s.substring(urlMatch.start, urlMatch.end);
                }).toList();
                urls.forEach((x) {
                  lottieAnimationModel.path = x;
                  isAnimationChanged = true;
                });
                if (isAnimationChanged) {
                  setState(() {});
                  appStore.updateData(lottieAnimationModel);
                } else {
                  getToast(language!.enterValidUrl);
                }
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.boxFit,
          context,
          <Widget>[
            getDropDownField(boxFit, defaultValue: lottieAnimationModel.fit ?? boxFitCover, onChanged: (value) {
              lottieAnimationModel.fit = value;
              setState(() {});
              appStore.updateData(lottieAnimationModel);
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
                  type: lottieAnimationModel.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      lottieAnimationModel.width = null;
                      lottieAnimationModel.isWidthClear = true;
                      appStore.updateData(lottieAnimationModel);
                    } else {
                      if (s.isDigit()) {
                        lottieAnimationModel.width = (s.toInt().toDouble() > 100 && lottieAnimationModel.widthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        lottieAnimationModel.isWidthClear = false;
                        appStore.updateData(lottieAnimationModel);
                      }
                    }
                  },
                  onTapPer: () {
                    lottieAnimationModel.widthType = TypePercentage;
                    setState(() {});
                    lottieAnimationModel.width = widthController!.text.toInt().toDouble();
                    if (lottieAnimationModel.width > 100) {
                      lottieAnimationModel.width = DEFAULT_CONTAINER_PER;
                      appStore.updateData(lottieAnimationModel);
                    } else {
                      appStore.updateData(lottieAnimationModel);
                    }
                  },
                  onTapPX: () {
                    lottieAnimationModel.widthType = TypePX;
                    setState(() {});
                    lottieAnimationModel.width = widthController!.text.toInt().toDouble();
                    appStore.updateData(lottieAnimationModel);
                  },
                ).expand(flex: 1),
                getImageWidthType(
                  controller: heightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: lottieAnimationModel.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      lottieAnimationModel.height = null;
                      lottieAnimationModel.isHeightClear = true;
                      appStore.updateData(lottieAnimationModel);
                    } else {
                      if (s.isDigit()) {
                        lottieAnimationModel.height = (s.toInt().toDouble() > 100 && lottieAnimationModel.heightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                        lottieAnimationModel.isHeightClear = false;
                        appStore.updateData(lottieAnimationModel);
                      }
                    }
                  },
                  onTapPer: () {
                    lottieAnimationModel.heightType = TypePercentage;
                    setState(() {});
                    lottieAnimationModel.height = heightController!.text.toInt().toDouble();
                    if (lottieAnimationModel.height > 100) {
                      lottieAnimationModel.height = DEFAULT_CONTAINER_PER;
                      appStore.updateData(lottieAnimationModel);
                    } else {
                      appStore.updateData(lottieAnimationModel);
                    }
                  },
                  onTapPX: () {
                    lottieAnimationModel.heightType = TypePX;
                    setState(() {});
                    lottieAnimationModel.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(lottieAnimationModel);
                  },
                ),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.animate,
          context,
          <Widget>[
            checkBoxView(
              lottieAnimationModel.isAnimate ?? false,
              language!.animate,
              onChanged: (value) {
                lottieAnimationModel.isAnimate = value;
                appStore.updateData(lottieAnimationModel);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.repeat,
          context,
          <Widget>[
            checkBoxView(
              lottieAnimationModel.isRepeat ?? false,
              language!.repeat,
              onChanged: (value) {
                lottieAnimationModel.isRepeat = value;
                appStore.updateData(lottieAnimationModel);
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
