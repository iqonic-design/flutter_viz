import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewClass {
  final pageController = PageController();

  ///Image
  String? image;

  /// Image height
  double? imageHeight;

  /// Image width
  double? imageWidth;

  ///  Image width type
  String? imageWidthType;

  /// Image height type
  String? imageHeightType;

  /// Image Type
  String? imageType;

  ///PageView and Indicator count
  int? count;

  /// PageView height
  double? height;

  /// PageView width
  double? width;

  ///  pageView width type
  String? widthType;

  /// pageView height type
  String? heightType;

  ///Padding
  EdgeInsets? padding;

  ///PageView Scroll Direction
  String? axis;

  ///PageView Horizontal Alignment
  double? pageViewHorizontalAlignment;

  ///PageView Vertical Alignment
  double? pageViewVerticalAlignment;

  /// PageView Is AlignX
  bool? isPageViewAlignX;

  /// PageView Is AlignY
  bool? isPageViewAlignY;

  ///Indicator Horizontal Alignment
  double? indicatorHorizontalAlignment;

  ///Indicator Vertical Alignment
  double? indicatorVerticalAlignment;

  /// Indicator Is AlignX
  bool? isIndicatorAlignX;

  /// Indicator Is AlignY
  bool? isIndicatorAlignY;

  ///Indicator Scroll Direction
  String? indicatorAxis;

  ///Padding
  EdgeInsets? indicatorPadding;

  ///Indicator Dot Effect
  String? dotEffect;

  ///Effect Properties
  ///Common
  Color? dotColor;
  Color? activeDotColor;
  double? dotHeight;
  double? dotWidth;
  double? radius;
  double? spacing;

  /// ExpandingDotsEffect
  double? expansionFactor;

  /// ScaleEffect
  double? scale;

  /// Height isClear or not
  bool? isHeightClear;

  /// Width isClear or not
  bool? isWidthClear;

  /// Height isClear or not
  bool? isImageHeightClear;

  /// Width isClear or not
  bool? isImageWidthClear;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  /// Set Image
  String? fit;

  /// Image Border Radius
  BorderRadius? imageBorderRadius;

  PageViewClass({
    this.image,
    this.imageType = ImageTypeNetwork,
    this.count,
    this.widthType = TypePX,
    this.heightType = TypePX,
    this.height,
    this.width,
    this.imageWidthType = TypePX,
    this.imageHeightType = TypePX,
    this.imageHeight,
    this.imageWidth,
    this.padding,
    this.pageViewHorizontalAlignment,
    this.pageViewVerticalAlignment,
    this.isPageViewAlignX = false,
    this.isPageViewAlignY = false,
    this.indicatorHorizontalAlignment = DEFAULT_INDICATOR_HORIZONTAL_ALIGNMENT,
    this.indicatorVerticalAlignment = DEFAULT_INDICATOR_VERTICAL_ALIGNMENT,
    this.isIndicatorAlignX = true,
    this.isIndicatorAlignY = true,
    this.indicatorAxis,
    this.indicatorPadding,
    this.dotEffect,
    this.dotColor,
    this.activeDotColor,
    this.dotHeight,
    this.dotWidth,
    this.radius,
    this.spacing,
    this.expansionFactor,
    this.scale,
    this.isHeightClear = false,
    this.isWidthClear = false,
    this.isImageHeightClear = false,
    this.isImageWidthClear = false,
    this.isExpanded = false,
    this.flex = 1,
    this.axis,
    this.fit,
    this.imageBorderRadius,
  });

  PageViewClass.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? json['image'] : (imageType == ImageTypeAsset ? DEFAULT_PAGE_VIEW_ASSET_IMAGE : DEFAULT_PAGE_VIEW_NETWORK_IMAGE);
    imageType = json['imageType'] != null ? json['imageType'] : ImageTypeNetwork;
    count = json['count'] != null ? json['count'] : DEFAULT_PAGE_VIEW_COUNT;
    height = json['height'] != null ? fromJsonHeight(json['height'], heightType ?? TypePX) : DEFAULT_PAGE_VIEW_HEIGHT as double?;
    width = json['width'] != null ? fromJsonWidth(json['width'], widthType ?? TypePX) : DEFAULT_PAGE_VIEW_WIDTH as double?;
    widthType = json['widthType'] != null ? json['widthType'] : TypePX;
    heightType = json['heightType'] != null ? json['heightType'] : TypePX;
    imageHeight = json['imageHeight'] != null ? fromJsonHeight(json['imageHeight'], imageHeightType ?? TypePX) : DEFAULT_PAGE_VIEW_IMAGE_HEIGHT as double?;
    imageWidth = json['imageWidth'] != null ? fromJsonWidth(json['imageWidth'], imageWidthType ?? TypePX) : DEFAULT_PAGE_VIEW_IMAGE_WIDTH as double?;
    imageWidthType = json['imageWidthType'] != null ? json['imageWidthType'] : TypePX;
    imageHeightType = json['imageHeightType'] != null ? json['imageHeightType'] : TypePX;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    pageViewHorizontalAlignment = json['pageViewHorizontalAlignment'] != null ? json['pageViewHorizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    pageViewVerticalAlignment = json['pageViewVerticalAlignment'] != null ? json['pageViewVerticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isPageViewAlignX = json['isPageViewAlignX'] != null ? json['isPageViewAlignX'] : false;
    isPageViewAlignY = json['isPageViewAlignY'] != null ? json['isPageViewAlignY'] : false;
    indicatorHorizontalAlignment = json['indicatorHorizontalAlignment'] != null ? json['indicatorHorizontalAlignment'] : DEFAULT_INDICATOR_HORIZONTAL_ALIGNMENT;
    indicatorVerticalAlignment = json['indicatorVerticalAlignment'] != null ? json['indicatorVerticalAlignment'] : DEFAULT_INDICATOR_VERTICAL_ALIGNMENT;
    isIndicatorAlignX = json['isIndicatorAlignX'] != null ? json['isIndicatorAlignX'] : true;
    isIndicatorAlignY = json['isIndicatorAlignY'] != null ? json['isIndicatorAlignY'] : true;
    axis = json['axis'] != null ? json['axis'] : AxisHorizontal;
    indicatorAxis = json['indicatorAxis'] != null ? json['indicatorAxis'] : indicatorAxis;
    indicatorPadding = json['indicatorPadding'] != null ? fromJsonPadding(json['indicatorPadding']) : EdgeInsets.only(bottom: 15);
    dotEffect = json['dotEffect'] != null ? json['dotEffect'] : IndicatorWormEffect;
    dotColor = json['dotColor'] != null ? fromJsonColor(json['dotColor']) : DEFAULT_DOT_COLOR;
    activeDotColor = json['activeDotColor'] != null ? fromJsonColor(json['activeDotColor']) : COMMON_BG_COLOR;
    dotHeight = json['dotHeight'] != null ? json['dotHeight'] : DEFAULT_DOT_HEIGHT;
    dotWidth = json['dotWidth'] != null ? json['dotWidth'] : DEFAULT_DOT_WIDTH;
    radius = json['radius'] != null ? json['radius'] : DEFAULT_DOT_RADIUS;
    spacing = json['spacing'] != null ? json['spacing'] : DEFAULT_DOT_SPACING;
    scale = json['scale'] != null ? json['scale'] : DEFAULT_DOT_SCALE;
    expansionFactor = json['expansionFactor'] != null ? json['expansionFactor'] : DEFAULT_DOT_EXPANSION_FACTOR;
    isHeightClear = json['isHeightClear'] != null ? json['isHeightClear'] : false;
    isWidthClear = json['isWidthClear'] != null ? json['isWidthClear'] : false;
    isImageHeightClear = json['isImageHeightClear'] != null ? json['isImageHeightClear'] : false;
    isImageWidthClear = json['isImageWidthClear'] != null ? json['isImageWidthClear'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
    fit = json['fit'] != null ? json['fit'] : boxFitCover;
    imageBorderRadius = json['imageBorderRadius'] != null ? fromJsonBorderRadius(json['imageBorderRadius']) : BorderRadius.zero;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image;
    }
    if (this.imageType != null) {
      data['imageType'] = this.imageType;
    }
    if (this.count != null) {
      data['count'] = this.count;
    }
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.width != null) {
      data['width'] = this.width;
    }
    if (this.widthType != null) {
      data['widthType'] = this.widthType;
    }
    if (this.heightType != null) {
      data['heightType'] = this.heightType;
    }
    if (this.imageHeight != null) {
      data['imageHeight'] = this.imageHeight;
    }
    if (this.imageWidth != null) {
      data['imageWidth'] = this.imageWidth;
    }
    if (this.imageWidthType != null) {
      data['imageWidthType'] = this.imageWidthType;
    }
    if (this.imageHeightType != null) {
      data['imageHeightType'] = this.imageHeightType;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.pageViewHorizontalAlignment != null && this.pageViewVerticalAlignment != null) {
      data['pageViewHorizontalAlignment'] = this.pageViewHorizontalAlignment;
      data['pageViewVerticalAlignment'] = this.pageViewVerticalAlignment;
    } else if (this.pageViewHorizontalAlignment != null) {
      data['pageViewHorizontalAlignment'] = this.pageViewHorizontalAlignment;
    } else if (this.pageViewVerticalAlignment != null) {
      data['pageViewVerticalAlignment'] = this.pageViewVerticalAlignment;
    }
    if (this.isPageViewAlignX != null) {
      data['isPageViewAlignX'] = this.isPageViewAlignX;
    }
    if (this.isPageViewAlignY != null) {
      data['isPageViewAlignY'] = this.isPageViewAlignY;
    }
    if (this.indicatorHorizontalAlignment != null && this.indicatorVerticalAlignment != null) {
      data['indicatorHorizontalAlignment'] = this.indicatorHorizontalAlignment;
      data['indicatorVerticalAlignment'] = this.indicatorVerticalAlignment;
    } else if (this.indicatorHorizontalAlignment != null) {
      data['indicatorHorizontalAlignment'] = this.indicatorHorizontalAlignment;
    } else if (this.indicatorVerticalAlignment != null) {
      data['indicatorVerticalAlignment'] = this.indicatorVerticalAlignment;
    }
    if (this.isIndicatorAlignX != null) {
      data['isIndicatorAlignX'] = this.isIndicatorAlignX;
    }
    if (this.isIndicatorAlignY != null) {
      data['isIndicatorAlignY'] = this.isIndicatorAlignY;
    }
    if (this.axis != null) {
      data['axis'] = this.axis;
    }
    if (this.indicatorAxis != null) {
      data['indicatorAxis'] = this.indicatorAxis;
    }
    if (this.indicatorPadding != null) {
      data['indicatorPadding'] = toJsonPadding(this.indicatorPadding!);
    }
    if (this.dotEffect != null) {
      data['dotEffect'] = this.dotEffect;
    }

    if (this.dotColor != null) {
      data['dotColor'] = toJsonColor(this.dotColor!);
    }
    if (this.activeDotColor != null) {
      data['activeDotColor'] = toJsonColor(this.activeDotColor!);
    }
    if (this.dotHeight != null) {
      data['dotHeight'] = this.dotHeight;
    }
    if (this.dotWidth != null) {
      data['dotWidth'] = this.dotWidth;
    }
    if (this.radius != null) {
      data['radius'] = this.radius;
    }
    if (this.spacing != null) {
      data['spacing'] = this.spacing;
    }
    if (this.scale != null) {
      data['scale'] = this.scale;
    }
    if (this.expansionFactor != null) {
      data['expansionFactor'] = this.expansionFactor;
    }
    if (this.isHeightClear != null) {
      data['isHeightClear'] = this.isHeightClear;
    }
    if (this.isWidthClear != null) {
      data['isWidthClear'] = this.isWidthClear;
    }
    if (this.isImageHeightClear != null) {
      data['isImageHeightClear'] = this.isImageHeightClear;
    }
    if (this.isImageWidthClear != null) {
      data['isImageWidthClear'] = this.isImageWidthClear;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    if (this.fit != null) {
      data['fit'] = this.fit;
    }
    if (this.imageBorderRadius != null) {
      data['imageBorderRadius'] = toJsonBorderRadius(this.imageBorderRadius!);
    }
    return data;
  }

  getIndicatorEffect() {
    if (dotEffect == IndicatorWormEffect) {
      return WormEffect(
        dotColor: dotColor ?? DEFAULT_DOT_COLOR,
        activeDotColor: activeDotColor ?? COMMON_BG_COLOR,
        dotHeight: dotHeight ?? DEFAULT_DOT_HEIGHT,
        dotWidth: dotWidth ?? DEFAULT_DOT_WIDTH,
        radius: radius ?? DEFAULT_DOT_RADIUS,
        spacing: spacing ?? DEFAULT_DOT_SPACING,
      );
    } else if (dotEffect == IndicatorExpandingDotsEffect) {
      return ExpandingDotsEffect(
          dotColor: dotColor ?? DEFAULT_DOT_COLOR,
          activeDotColor: activeDotColor ?? COMMON_BG_COLOR,
          dotHeight: dotHeight ?? DEFAULT_DOT_HEIGHT,
          dotWidth: dotWidth ?? DEFAULT_DOT_WIDTH,
          radius: radius ?? DEFAULT_DOT_RADIUS,
          spacing: spacing ?? DEFAULT_DOT_SPACING,
          expansionFactor: expansionFactor ?? DEFAULT_DOT_EXPANSION_FACTOR);
    } else if (dotEffect == IndicatorJumpingDotsEffect) {
      return JumpingDotEffect(
        dotColor: dotColor ?? DEFAULT_DOT_COLOR,
        activeDotColor: activeDotColor ?? COMMON_BG_COLOR,
        dotHeight: dotHeight ?? DEFAULT_DOT_HEIGHT,
        dotWidth: dotWidth ?? DEFAULT_DOT_WIDTH,
        radius: radius ?? DEFAULT_DOT_RADIUS,
        spacing: spacing ?? DEFAULT_DOT_SPACING,
      );
    } else if (dotEffect == IndicatorScrollingDotsEffect) {
      return ScrollingDotsEffect(
        dotColor: dotColor ?? DEFAULT_DOT_COLOR,
        activeDotColor: activeDotColor ?? COMMON_BG_COLOR,
        dotHeight: dotHeight ?? DEFAULT_DOT_HEIGHT,
        dotWidth: dotWidth ?? DEFAULT_DOT_WIDTH,
        radius: radius ?? DEFAULT_DOT_RADIUS,
        spacing: spacing ?? DEFAULT_DOT_SPACING,
      );
    } else if (dotEffect == IndicatorScaleEffect) {
      return ScaleEffect(
          dotColor: dotColor ?? DEFAULT_DOT_COLOR,
          activeDotColor: activeDotColor ?? COMMON_BG_COLOR,
          dotHeight: dotHeight ?? DEFAULT_DOT_HEIGHT,
          dotWidth: dotWidth ?? DEFAULT_DOT_WIDTH,
          radius: radius ?? DEFAULT_DOT_RADIUS,
          spacing: spacing ?? DEFAULT_DOT_SPACING,
          scale: scale ?? DEFAULT_DOT_SCALE);
    } else if (dotEffect == IndicatorSlideEffect) {
      return SlideEffect(
        dotColor: dotColor ?? DEFAULT_DOT_COLOR,
        activeDotColor: activeDotColor ?? COMMON_BG_COLOR,
        dotHeight: dotHeight ?? DEFAULT_DOT_HEIGHT,
        dotWidth: dotWidth ?? DEFAULT_DOT_WIDTH,
        radius: radius ?? DEFAULT_DOT_RADIUS,
        spacing: spacing ?? DEFAULT_DOT_SPACING,
      );
    } else {
      return WormEffect(
        dotColor: dotColor ?? DEFAULT_DOT_COLOR,
        activeDotColor: activeDotColor ?? COMMON_BG_COLOR,
        dotHeight: dotHeight ?? DEFAULT_DOT_HEIGHT,
        dotWidth: dotWidth ?? DEFAULT_DOT_WIDTH,
        radius: radius ?? DEFAULT_DOT_RADIUS,
        spacing: spacing ?? DEFAULT_DOT_SPACING,
      );
    }
  }

  Widget _getImageDefaultWidget() {
    return Image.network(
      image ?? (imageType == ImageTypeAsset ? DEFAULT_PAGE_VIEW_ASSET_IMAGE : DEFAULT_PAGE_VIEW_NETWORK_IMAGE),
      height: isImageHeightClear! ? null : fromJsonHeight(imageHeight, imageHeightType) ?? DEFAULT_PAGE_VIEW_IMAGE_HEIGHT as double?,
      width: isImageWidthClear! ? null : fromJsonWidth(imageWidth, imageWidthType) ?? DEFAULT_PAGE_VIEW_IMAGE_WIDTH as double?,
      fit: fit != null ? getBoxFit(fit) : BoxFit.cover,
    );
  }

  _getImageBorderRadius(Widget _child) {
    return ClipRRect(borderRadius: imageBorderRadius ?? BorderRadius.zero, child: _child);
  }

  _getImageAlign(Widget _child) {
    return Align(
      alignment: Alignment(pageViewHorizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, pageViewVerticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  _getImagePadding(Widget _child) {
    return Padding(
      padding: padding!,
      child: _child,
    );
  }

  Widget _getImageWidget() {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY) && getBorderRadius(imageBorderRadius)) {
      return _getImageAlign(_getImagePadding(_getImageBorderRadius(_getImageDefaultWidget())));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY)) {
      return _getImageAlign(_getImagePadding(_getImageDefaultWidget()));
    } else if (getPadding(padding) && getBorderRadius(imageBorderRadius)) {
      return _getImagePadding(_getImageBorderRadius(_getImageDefaultWidget()));
    } else if (getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY) && getBorderRadius(imageBorderRadius)) {
      return _getImageAlign(_getImageBorderRadius(_getImageDefaultWidget()));
    } else if (getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY)) {
      return _getImageAlign(_getImageDefaultWidget());
    } else if (getPadding(padding)) {
      return _getImagePadding(_getImageDefaultWidget());
    } else if (getBorderRadius(imageBorderRadius)) {
      return _getImageBorderRadius(_getImageDefaultWidget());
    } else {
      return _getImageDefaultWidget();
    }
  }

  Widget _getIndicatorDefaultWidget() {
    return SmoothPageIndicator(
      controller: pageController,
      count: count ?? DEFAULT_PAGE_VIEW_COUNT,
      // Properties
      axisDirection: indicatorAxis != null ? getAxis(axis: indicatorAxis) : Axis.horizontal,
      // Properties
      effect: getIndicatorEffect(),
    );
  }

  _getIndicatorPadding(Widget _child) {
    return Padding(padding: indicatorPadding ?? EdgeInsets.only(bottom: 15), child: _child);
  }

  _getIndicatorAlign(Widget _child) {
    return Align(
      alignment: Alignment(indicatorHorizontalAlignment ?? DEFAULT_INDICATOR_HORIZONTAL_ALIGNMENT, indicatorVerticalAlignment ?? DEFAULT_INDICATOR_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget _getIndicatorWidget() {
    if (getPadding(indicatorPadding ?? EdgeInsets.only(bottom: 15)) &&
        getHorizontalOrVerticalAlignment(indicatorHorizontalAlignment, indicatorVerticalAlignment, isIndicatorAlignX, isIndicatorAlignY)) {
      return _getIndicatorAlign(_getIndicatorPadding(_getIndicatorDefaultWidget()));
    } else if (getPadding(indicatorPadding ?? EdgeInsets.only(bottom: 15))) {
      return _getIndicatorPadding(_getIndicatorDefaultWidget());
    } else if (getHorizontalOrVerticalAlignment(indicatorHorizontalAlignment, indicatorVerticalAlignment, isIndicatorAlignX, isIndicatorAlignY)) {
      return _getIndicatorAlign(_getIndicatorDefaultWidget());
    } else {
      return _getIndicatorDefaultWidget();
    }
  }

  Widget getPageViewDefaultWidget(WidgetModel widgetModel) {
    Widget childData = Container(
      height: isHeightClear! ? null : (height != null ? fromJsonHeight(height, heightType) : DEFAULT_PAGE_VIEW_HEIGHT as double?),
      width: isWidthClear! ? null : (width != null ? fromJsonWidth(width, widthType) : DEFAULT_PAGE_VIEW_WIDTH as double?),
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            scrollDirection: axis != null ? getAxis(axis: axis) : Axis.horizontal,
            itemCount: count ?? DEFAULT_PAGE_VIEW_COUNT,
            itemBuilder: (context, position) {
              return _getImageWidget();
            },
          ),
          _getIndicatorWidget(),
        ],
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getPageViewExpanded(Widget _child) {
    return Expanded(
      child: _child,
      flex: flex ?? 1,
    );
  }

  Widget getPageViewWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded)) {
      return _getPageViewExpanded(getPageViewDefaultWidget(widgetModel));
    } else {
      return getPageViewDefaultWidget(widgetModel);
    }
  }

  String getEffectString() {
    return "${dotEffect ?? IndicatorWormEffect}(\n"
        "dotColor:${dotColor ?? DEFAULT_DOT_COLOR},\n"
        "activeDotColor:${activeDotColor ?? COMMON_BG_COLOR},\n"
        "dotHeight:${dotHeight ?? DEFAULT_DOT_HEIGHT},\n"
        "dotWidth:${dotWidth ?? DEFAULT_DOT_WIDTH},\n"
        "radius:${radius ?? DEFAULT_DOT_RADIUS},\n"
        "spacing:${spacing ?? DEFAULT_DOT_SPACING},\n"
        "${dotEffect == IndicatorScaleEffect ? "scale:${scale ?? DEFAULT_DOT_SCALE},\n" : ""}"
        "${dotEffect == IndicatorExpandingDotsEffect ? "expansionFactor:${expansionFactor ?? DEFAULT_DOT_EXPANSION_FACTOR},\n" : ""}"
        ")";
  }

  _getImageDefaultString() {
    return imageType == ImageTypeNetwork
        ? "Image.network(\"${image ?? DEFAULT_PAGE_VIEW_NETWORK_IMAGE}\",\n"
        "${isImageHeightClear! ? '' : 'height: ${getHeightString(imageHeight ?? DEFAULT_PAGE_VIEW_IMAGE_HEIGHT as double?, imageHeightType)},\n'}"
        "${isImageWidthClear! ? '' : 'width: ${getWidthString(imageWidth ?? DEFAULT_PAGE_VIEW_IMAGE_WIDTH as double?, imageWidthType)},\n'}"
        "fit:${fit != null ? getBoxFit(fit) : BoxFit.cover},\n"
        ")"
        : "Image.asset(\"${image != null ? 'images/${image!.split('/').last}' : DEFAULT_PAGE_VIEW_ASSET_IMAGE}\",\n"
        "${isImageHeightClear! ? '' : 'height: ${getHeightString(imageHeight ?? DEFAULT_PAGE_VIEW_IMAGE_HEIGHT as double?, imageHeightType)},\n'}"
        "${isImageWidthClear! ? '' : 'width: ${getWidthString(imageWidth ?? DEFAULT_PAGE_VIEW_IMAGE_WIDTH as double?, imageWidthType)},\n'}"
        "fit:${fit != null ? getBoxFit(fit) : BoxFit.cover},\n"
        ")";
  }

  _getImageAlignString(String child) {
    return "Align(\n"
        "alignment: ${Alignment(pageViewHorizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, pageViewVerticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:$child,\n"
        ")";
  }

  _getImagePaddingString(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$child,\n"
        ")";
  }

  _getImageBorderRadiusString(String child) {
    return "ClipRRect(\n"
        "borderRadius:$imageBorderRadius,\n"
        "child:$child,\n"
        ")";
  }

  _getImageString() {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY) && getBorderRadius(imageBorderRadius)) {
      return _getImageAlignString(_getImagePaddingString(_getImageBorderRadiusString(_getImageDefaultString())));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY)) {
      return _getImageAlignString(_getImagePaddingString(_getImageDefaultString()));
    } else if (getPadding(padding) && getBorderRadius(imageBorderRadius)) {
      return _getImagePaddingString(_getImageBorderRadiusString(_getImageDefaultString()));
    } else if (getBorderRadius(imageBorderRadius) && getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY)) {
      return _getImageAlignString(_getImageBorderRadiusString(_getImageDefaultString()));
    } else if (getHorizontalOrVerticalAlignment(pageViewHorizontalAlignment, pageViewVerticalAlignment, isPageViewAlignX, isPageViewAlignY)) {
      return _getImageAlignString(_getImageDefaultString());
    } else if (getPadding(padding)) {
      return _getImagePaddingString(_getImageDefaultString());
    } else if (getBorderRadius(imageBorderRadius)) {
      return _getImageBorderRadiusString(_getImageDefaultString());
    } else {
      return _getImageDefaultString();
    }
  }

  _getIndicatorDefaultString() {
    return "SmoothPageIndicator(\n"
        "controller: pageController,\n"
        "count: ${count ?? DEFAULT_PAGE_VIEW_COUNT},\n"
        "axisDirection: ${indicatorAxis != null ? getAxis(axis: indicatorAxis) : Axis.horizontal},\n"
        "effect: ${getEffectString()},\n"
        ")";
  }

  _getIndicatorAlignString(String child) {
    return "Align(\n"
        "alignment:${Alignment(indicatorHorizontalAlignment ?? DEFAULT_INDICATOR_HORIZONTAL_ALIGNMENT, indicatorVerticalAlignment ?? DEFAULT_INDICATOR_VERTICAL_ALIGNMENT)},\n"
        "child:$child,\n"
        ")";
  }

  _getIndicatorPaddingString(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(indicatorPadding) ?? 'EdgeInsets.only(bottom: 15)'},\n"
        "child:$child,\n"
        ")";
  }

  _getIndicatorString() {
    if (getPadding(indicatorPadding ?? EdgeInsets.only(bottom: 15)) &&
        getHorizontalOrVerticalAlignment(indicatorHorizontalAlignment, indicatorVerticalAlignment, isIndicatorAlignX, isIndicatorAlignY)) {
      return _getIndicatorAlignString(_getIndicatorPaddingString(_getIndicatorDefaultString()));
    } else if (getPadding(indicatorPadding ?? EdgeInsets.only(bottom: 15))) {
      return _getIndicatorPaddingString(_getIndicatorDefaultString());
    } else if (getHorizontalOrVerticalAlignment(indicatorHorizontalAlignment, indicatorVerticalAlignment, isIndicatorAlignX, isIndicatorAlignY)) {
      return _getIndicatorAlignString(_getIndicatorDefaultString());
    } else {
      return _getIndicatorDefaultString();
    }
  }

  /// For view code
  getPageViewString() {
    return "Stack(\n"
        "children: [\n"
        "PageView.builder(\n"
        "controller: pageController,\n"
        "scrollDirection: ${axis != null ? getAxis(axis: axis) : Axis.horizontal},\n"
        "itemCount:${count ?? DEFAULT_PAGE_VIEW_COUNT},\n"
        "itemBuilder: (context, position) {\n"
        "return ${_getImageString()};\n"
        "},\n"
        "),\n"
        "${_getIndicatorString()},\n"
        "],\n"
        ")";
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child,\n"
        ")";
  }

  _getStringSizedBox(String _child) {
    return "SizedBox(\n"
        "${isHeightClear! ? '' : 'height: ${getHeightString(height ?? DEFAULT_PAGE_VIEW_HEIGHT as double?, heightType)},\n'}"
        "${isWidthClear! ? '' : 'width: ${getWidthString(width ?? DEFAULT_PAGE_VIEW_WIDTH as double?, widthType)},\n'}"
        "child:$_child,\n"
        ")";
  }

  /// For view code
  getCodeAsString(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && (!isHeightClear! || !isWidthClear!)) {
      return _getStringExpanded(_getStringSizedBox(getPageViewString()));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getPageViewString());
    } else if (!isHeightClear! || !isWidthClear!) {
      return _getStringSizedBox(getPageViewString());
    } else {
      return getPageViewString();
    }
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'package:smooth_page_indicator/smooth_page_indicator.dart';"];
  }

  /// Import pubspec.yaml lib name
  getYamlLib() {
    return ["#PageView lib", "smooth_page_indicator: ^0.2.3 \n\n"];
  }
}