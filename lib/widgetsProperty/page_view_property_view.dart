import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/page_view_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class PageViewPropertyView extends StatefulWidget {
  static String tag = '/PageViewPropertyView';

  @override
  PageViewPropertyViewState createState() => PageViewPropertyViewState();
}

class PageViewPropertyViewState extends State<PageViewPropertyView> {
  var pageViewClass;
  String? parentType;
  TextEditingController? widthController, heightController, imageHeightController, imageWidthController;
  String? selectedImage;

  init() async {
    pageViewClass = appStore.currentSelectedWidget!.widgetViewModel as PageViewClass?;
    parentType = appStore.currentSelectedWidget!.parentWidgetType;
    if (pageViewClass.isHeightClear) {
      heightController = TextEditingController(text: "");
    } else {
      heightController = TextEditingController(
        text: pageViewClass.height != null ? getWidthControllerValue(pageViewClass.height, pageViewClass.heightType) : DEFAULT_PAGE_VIEW_HEIGHT.toInt().toString(),
      );
    }
    if (pageViewClass.isWidthClear) {
      widthController = TextEditingController(text: "");
    } else {
      widthController = TextEditingController(
        text: pageViewClass.width != null ? getWidthControllerValue(pageViewClass.width, pageViewClass.widthType) : DEFAULT_PAGE_VIEW_WIDTH.toInt().toString(),
      );
    }
    if (pageViewClass.isImageWidthClear) {
      imageWidthController = TextEditingController(text: "");
    } else {
      imageWidthController = TextEditingController(
        text: pageViewClass.imageWidth != null ? getWidthControllerValue(pageViewClass.imageWidth, pageViewClass.imageWidthType) : DEFAULT_PAGE_VIEW_IMAGE_WIDTH.toInt().toString(),
      );
    }
    if (pageViewClass.isImageHeightClear) {
      imageHeightController = TextEditingController(text: "");
    } else {
      imageHeightController = TextEditingController(
        text: pageViewClass.imageHeight != null ? getWidthControllerValue(pageViewClass.imageHeight, pageViewClass.imageHeightType) : DEFAULT_PAGE_VIEW_IMAGE_HEIGHT.toInt().toString(),
      );
    }

    bool isExist = false;
    appStore.mediaList.map((media) {
      if (media.userAttachment == pageViewClass!.image) {
        isExist = true;
      }
    }).toList();
    if (pageViewClass!.imageType == ImageTypeAsset && isExist) {
      selectedImage = pageViewClass!.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.expandedAndFlex,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkBoxView(
                  pageViewClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      if ((parentType == WidgetTypeRow && pageViewClass.isWidthClear && !value) || (parentType == WidgetTypeColumn && pageViewClass.isHeightClear && !value)) {
                        getSnackBarWidget(
                          '${parentType == WidgetTypeColumn
                              ? 'You cannot set it expanded to false if it is inside the Column and it has an infinite height.set height of the PageView widget.'
                              : 'You cannot set it expanded to false if it is inside the Row and it has an infinite width.set width of the PageView widget.'}',
                        );

                        /// You cannot set it expanded to false if it is inside the Row and it has an infinite width.set width of the PageView widget.
                        /// You cannot set it expanded to false if it is inside the Coumn and it has an infinite height.set height of the PageView widget.
                      } else {
                        pageViewClass.isExpanded = value;
                        appStore.updateData(pageViewClass);
                        setState(() {});
                      }
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: pageViewClass.flex != null ? pageViewClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      pageViewClass.flex = int.tryParse(s);
                      appStore.updateData(pageViewClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(pageViewClass.isExpanded ?? true),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
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
                  type: pageViewClass.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      if ((parentType == WidgetTypeRow && !pageViewClass.isExpanded) || (parentType == WidgetTypeList && getWidgetCasting(appStore.currentParentWidget!).axis == AxisHorizontal)) {
                        pageViewClass.isWidthClear = false;
                      } else {
                        pageViewClass.width = null;
                        pageViewClass.isWidthClear = true;
                      }
                    } else {
                      if (s.isDigit()) {
                        pageViewClass.width = s.toInt().toDouble();
                        pageViewClass.isWidthClear = false;
                      }
                    }
                    appStore.updateData(pageViewClass);
                  },
                  onTapPer: () {
                    pageViewClass.widthType = TypePercentage;
                    setState(() {});
                    pageViewClass.width = widthController!.text.toInt().toDouble();
                    if (pageViewClass.width > 100) {
                      pageViewClass.width = DEFAULT_CONTAINER_PER;
                      appStore.updateData(pageViewClass);
                    } else {
                      appStore.updateData(pageViewClass);
                    }
                  },
                  onTapPX: () {
                    pageViewClass.widthType = TypePX;
                    setState(() {});
                    pageViewClass.width = widthController!.text.toInt().toDouble();
                    appStore.updateData(pageViewClass);
                  },
                ).expand(flex: 1),
                8.width,
                getImageWidthType(
                  controller: heightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: pageViewClass.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      if ((parentType == WidgetTypeColumn && !pageViewClass.isExpanded) || (parentType == WidgetTypeList && getWidgetCasting(appStore.currentParentWidget!).axis == AxisVertical)) {
                        pageViewClass.isHeightClear = false;
                      } else {
                        pageViewClass.height = null;
                        pageViewClass.isHeightClear = true;
                      }
                    } else {
                      if (s.isDigit()) {
                        pageViewClass.height = s.toInt().toDouble();
                        pageViewClass.isHeightClear = false;
                      }
                    }
                    appStore.updateData(pageViewClass);
                  },
                  onTapPer: () {
                    pageViewClass.heightType = TypePercentage;
                    setState(() {});
                    pageViewClass.height = heightController!.text.toInt().toDouble();

                    if (pageViewClass.height > 100) {
                      pageViewClass.height = DEFAULT_CONTAINER_PER;
                      appStore.updateData(pageViewClass);
                    } else {
                      appStore.updateData(pageViewClass);
                    }
                  },
                  onTapPX: () {
                    pageViewClass.heightType = TypePX;
                    setState(() {});
                    pageViewClass.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(pageViewClass);
                  },
                ),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.count,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: pageViewClass.count != null ? pageViewClass.count.toString() : DEFAULT_PAGE_VIEW_COUNT.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (s) {
                  pageViewClass.count = int.tryParse(s);
                  appStore.updateData(pageViewClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.axis,
          context,
          <Widget>[
            getDropDownField(axis, defaultValue: pageViewClass.axis ?? AxisHorizontal, onChanged: (value) {
              pageViewClass.axis = value;
              setState(() {});
              appStore.updateData(pageViewClass);
            }),
          ],
        ),
        ExpansionTileView(language!.imageProperties, context, <Widget>[
          alignView(
            isAlignX: pageViewClass.isPageViewAlignX,
            isAlignY: pageViewClass.isPageViewAlignY,
            alignX: pageViewClass.pageViewHorizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT,
            alignY: pageViewClass.pageViewVerticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT,
            onAlignChanged: (h, v) {
              pageViewClass.pageViewHorizontalAlignment = h;
              pageViewClass.pageViewVerticalAlignment = v;
              appStore.updateData(pageViewClass);
            },
            isAlignXChanged: (value) {
              pageViewClass.isPageViewAlignX = value;
              appStore.updateData(pageViewClass);
              appStore.setIsAlignX(value);
            },
            isAlignYChanged: (value) {
              pageViewClass.isPageViewAlignY = value;
              appStore.updateData(pageViewClass);
              appStore.setIsAlignY(value);
            },
          ),
          getSubPropertyWidget(
            title: language!.imageType,
            widget: getDropDownField(imageType, defaultValue: pageViewClass!.imageType ?? ImageTypeNetwork, onChanged: (value) {
              pageViewClass!.imageType = value;
              pageViewClass!.image = pageViewClass!.imageType == ImageTypeNetwork ? DEFAULT_PAGE_VIEW_NETWORK_IMAGE : DEFAULT_PAGE_VIEW_ASSET_IMAGE;
              setState(() {});
              appStore.updateData(pageViewClass);
            }),
          ),
          pageViewClass!.imageType == ImageTypeNetwork
              ? getSubPropertyWidget(
                  title: language!.path,
                  widget: getTextField(
                    controller: TextEditingController(text: pageViewClass!.image ?? (pageViewClass!.imageType == ImageTypeNetwork ? DEFAULT_PAGE_VIEW_NETWORK_IMAGE : DEFAULT_PAGE_VIEW_ASSET_IMAGE)),
                    hint: "Enter Path",
                    onChanged: (s) {
                      pageViewClass!.image = s;
                      appStore.updateData(pageViewClass);
                    },
                  ),
                )
              : commonAssetImageWidget(
                  context,
                  selectedImage: selectedImage,
                  onChanged: (value) {
                    selectedImage = value;
                    setState(() {});
                    pageViewClass!.image = value;
                    appStore.updateData(pageViewClass);
                  },
                ),
          getSubPropertyWidget(
              title: language!.boxFit,
              widget: getDropDownField(boxFit, defaultValue: pageViewClass.fit ?? boxFitCover, onChanged: (value) {
                pageViewClass.fit = value;
                setState(() {});
                appStore.updateData(pageViewClass);
              })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getImageWidthType(
                controller: imageWidthController,
                title: language!.width,
                widthType1: 'PX',
                widthType2: '%',
                type: pageViewClass.imageWidthType,
                onTextChanged: (s) {
                  if (s.isEmpty) {
                    pageViewClass.imageWidth = null;
                    pageViewClass.isImageWidthClear = true;
                    appStore.updateData(pageViewClass);
                  } else {
                    if (s.isDigit()) {
                      pageViewClass.imageWidth = s.toInt().toDouble();
                      pageViewClass.isImageWidthClear = false;
                      appStore.updateData(pageViewClass);
                    }
                  }
                },
                onTapPer: () {
                  pageViewClass.imageWidthType = TypePercentage;
                  setState(() {});
                  pageViewClass.imageWidth = imageWidthController!.text.toInt().toDouble();
                  if (pageViewClass.imageWidth > 100) {
                    pageViewClass.imageWidth = DEFAULT_CONTAINER_PER;
                    appStore.updateData(pageViewClass);
                  } else {
                    appStore.updateData(pageViewClass);
                  }
                },
                onTapPX: () {
                  pageViewClass.imageWidthType = TypePX;
                  setState(() {});
                  pageViewClass.imageWidth = imageWidthController!.text.toInt().toDouble();
                  appStore.updateData(pageViewClass);
                },
              ).expand(flex: 1),
              getImageWidthType(
                controller: imageHeightController,
                title: language!.height,
                widthType1: 'PX',
                widthType2: '%',
                type: pageViewClass.imageHeightType,
                onTextChanged: (s) {
                  if (s.isEmpty) {
                    pageViewClass.imageHeight = null;
                    pageViewClass.isImageHeightClear = true;
                    appStore.updateData(pageViewClass);
                  } else {
                    if (s.isDigit()) {
                      pageViewClass.imageHeight = s.toInt().toDouble();
                      pageViewClass.isImageHeightClear = false;
                      appStore.updateData(pageViewClass);
                    }
                  }
                },
                onTapPer: () {
                  pageViewClass.imageHeightType = TypePercentage;
                  setState(() {});
                  pageViewClass.imageHeight = imageHeightController!.text.toInt().toDouble();
                  if (pageViewClass.imageHeight > 100) {
                    pageViewClass.imageHeight = DEFAULT_CONTAINER_PER;
                    appStore.updateData(pageViewClass);
                  } else {
                    appStore.updateData(pageViewClass);
                  }
                },
                onTapPX: () {
                  pageViewClass.imageHeightType = TypePX;
                  setState(() {});
                  pageViewClass.imageHeight = imageHeightController!.text.toInt().toDouble();
                  appStore.updateData(pageViewClass);
                },
              ),
            ],
          ),
          10.height,
          getSubPropertyWidget(
            title: "Padding",
            widget: paddingView(
              padding: pageViewClass.padding,
              onPaddingChanged: (l, t, r, b) {
                pageViewClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(pageViewClass);
              },
            ),
          ),
          getSubPropertyWidget(
            title: "Border radius",
            widget: radiusView(
                radius: pageViewClass.imageBorderRadius,
                onRadiusChanged: (tl, tr, br, bt) {
                  pageViewClass.imageBorderRadius = BorderRadius.only(
                    topLeft: Radius.circular(tl),
                    topRight: Radius.circular(tr),
                    bottomLeft: Radius.circular(br),
                    bottomRight: Radius.circular(bt),
                  );
                  appStore.updateData(pageViewClass);
                }),
          ),
        ]),
        ExpansionTileView(
          language!.indicatorProperties,
          context,
          <Widget>[
            getSubPropertyWidget(
              title: language!.axis,
              widget: getDropDownField(axis, defaultValue: pageViewClass.indicatorAxis ?? AxisHorizontal, onChanged: (value) {
                pageViewClass.indicatorAxis = value;
                setState(() {});
                appStore.updateData(pageViewClass);
              }),
            ),
            pageViewIndicatorAlignView(
              isPaginationAlignX: pageViewClass.isIndicatorAlignX,
              isPaginationAlignY: pageViewClass.isIndicatorAlignY,
              paginationAlignX: pageViewClass.indicatorHorizontalAlignment ?? DEFAULT_INDICATOR_HORIZONTAL_ALIGNMENT,
              paginationAlignY: pageViewClass.indicatorVerticalAlignment ?? DEFAULT_INDICATOR_VERTICAL_ALIGNMENT,
              onAlignChanged: (h, v) {
                pageViewClass.indicatorHorizontalAlignment = h;
                pageViewClass.indicatorVerticalAlignment = v;
                appStore.updateData(pageViewClass);
              },
              setIsPaginationAlignX: (value) {
                pageViewClass.isIndicatorAlignX = value;
                appStore.updateData(pageViewClass);
                appStore.setIsPaginationIndicatorAlignX(value);
              },
              setIsPaginationAlignY: (value) {
                pageViewClass.isIndicatorAlignY = value;
                appStore.updateData(pageViewClass);
                appStore.setIsPaginationIndicatorAlignY(value);
              },
            ),
            getSubPropertyWidget(
              title: language!.indicatorPadding,
              widget: paddingView(
                padding: pageViewClass.indicatorPadding ?? EdgeInsets.only(bottom: 15),
                onPaddingChanged: (l, t, r, b) {
                  pageViewClass.indicatorPadding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(pageViewClass);
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.dotEffect,
              widget: getDropDownField(indicatorEffectType, defaultValue: pageViewClass.dotEffect ?? IndicatorWormEffect, onChanged: (value) {
                pageViewClass.dotEffect = value;
                setState(() {});
                appStore.updateData(pageViewClass);
              }),
            ),
            getSubPropertyWidget(
              title: language!.color,
              widget: ColorView(
                color: pageViewClass.dotColor ?? Colors.grey,
                applyColor: () {
                  pageViewClass.dotColor = appStore.color;
                  setState(() {});
                  appStore.updateData(pageViewClass);
                },
                pickColor: () {
                  showColorPicker(context, pageViewClass.dotColor ?? Colors.grey, applyOnWidget: (color) {
                    pageViewClass.dotColor = color;
                    appStore.updateData(pageViewClass);
                    setState(() {});
                  });
                },
              ),
            ),
            getSubPropertyWidget(
              title: language!.activeColor,
              widget: ColorView(
                color: pageViewClass.activeDotColor ?? COMMON_BG_COLOR,
                applyColor: () {
                  pageViewClass.activeDotColor = appStore.color;
                  setState(() {});
                  appStore.updateData(pageViewClass);
                },
                pickColor: () {
                  showColorPicker(context, pageViewClass.activeDotColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                    pageViewClass.activeDotColor = color;
                    appStore.updateData(pageViewClass);
                    setState(() {});
                  });
                },
              ),
            ),
            Row(
              children: [
                getSubPropertyWidget(
                  title: language!.dotHeight,
                  widget: Container(
                    width: widthPropertySize,
                    child: getTextField(
                      controller: TextEditingController(text: pageViewClass.dotHeight != null ? pageViewClass.dotHeight.toString() : DEFAULT_DOT_HEIGHT.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        pageViewClass.dotHeight = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_DOT_HEIGHT;
                        appStore.updateData(pageViewClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
                16.width,
                getSubPropertyWidget(
                  title: language!.dotWidth,
                  widget: Container(
                    width: 120,
                    child: getTextField(
                      controller: TextEditingController(text: pageViewClass.dotWidth != null ? pageViewClass.dotWidth.toString() : DEFAULT_DOT_WIDTH.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        pageViewClass.dotWidth = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_DOT_WIDTH;
                        appStore.updateData(pageViewClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                getSubPropertyWidget(
                  title: language!.spacing,
                  widget: Container(
                    width: widthPropertySize,
                    child: getTextField(
                      controller: TextEditingController(text: pageViewClass.spacing != null ? pageViewClass.spacing.toString() : DEFAULT_DOT_SPACING.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        pageViewClass.spacing = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_DOT_SPACING;
                        appStore.updateData(pageViewClass);
                      },
                      maxLength: commonMaxLength,
                    ),
                  ),
                ),
                16.width,
                getSubPropertyWidget(
                  title: language!.borderRadius,
                  widget: Container(
                    width: widthPropertySize,
                    child: getTextField(
                        controller: TextEditingController(text: pageViewClass.radius != null ? pageViewClass.radius.toString() : DEFAULT_DOT_RADIUS.toString()),
                        textAlign: TextAlign.center,
                        inputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                        ],
                        onChanged: (value) {
                          pageViewClass.radius = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_DOT_RADIUS;
                          appStore.updateData(pageViewClass);
                        }),
                  ),
                ),
              ],
            ),
            10.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language!.expansionFactor,
                  style: secondaryTextStyle(),
                ),
                8.height,
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(text: pageViewClass.expansionFactor != null ? pageViewClass.expansionFactor.toString() : DEFAULT_DOT_EXPANSION_FACTOR.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        if (double.parse(value) > 1) {
                          pageViewClass.expansionFactor = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_DOT_EXPANSION_FACTOR;
                          appStore.updateData(pageViewClass);
                        } else {
                          getToast(language!.expansionFactorMsg);
                          pageViewClass.expansionFactor = DEFAULT_DOT_EXPANSION_FACTOR;
                          appStore.updateData(pageViewClass);
                        }
                      },
                      maxLength: commonMaxLength),
                ),
              ],
            ).visible(pageViewClass.dotEffect == IndicatorExpandingDotsEffect),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language!.scale,
                  style: secondaryTextStyle(),
                ),
                8.height,
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(text: pageViewClass.scale != null ? pageViewClass.scale.toString() : DEFAULT_DOT_SCALE.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                      ],
                      onChanged: (value) {
                        pageViewClass.scale = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_DOT_SCALE;
                        appStore.updateData(pageViewClass);
                      },
                      maxLength: commonMaxLength),
                ),
              ],
            ).visible(pageViewClass.dotEffect == IndicatorScaleEffect),
          ],
        ),
      ],
    );
  }
}
