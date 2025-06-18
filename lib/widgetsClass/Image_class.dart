import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class ImageClass {
  /// Image height
  double? height;

  /// Image width
  double? width;

  /// Set Image
  String? fit;

  /// Image Path
  String? path;

  /// Image Type
  String? imageType;

  ///Padding
  EdgeInsets? padding;

  /// Width Type
  String? widthType;

  /// Height Type
  String? heightType;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  /// Height isClear or not
  bool? isHeightClear;

  /// Width isClear or not
  bool? isWidthClear;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  ImageClass({
    this.height,
    this.width,
    this.fit,
    this.path,
    this.imageType = ImageTypeNetwork,
    this.padding,
    this.widthType = TypePX,
    this.heightType = TypePX,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isHeightClear = false,
    this.isWidthClear = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  ImageClass.fromJson(Map<String, dynamic> json) {
    height = json['height'] != null ? fromJsonHeight(json['height'], heightType ?? TypePX) : DEFAULT_IMAGE_HEIGHT as double?;
    width = json['width'] != null ? fromJsonWidth(json['width'], widthType ?? TypePX) : DEFAULT_IMAGE_WIDTH as double?;
    fit = json['fit'] != null ? json['fit'] : boxFitCover;
    path = json['path'] != null ? json['path'] : (imageType == json['imageType'] ? DEFAULT_ASSET_IMAGE : DEFAULT_NETWORK_IMAGE);
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    widthType = json['widthType'] != null ? json['widthType'] : TypePX;
    heightType = json['heightType'] != null ? json['heightType'] : TypePX;
    imageType = json['imageType'] != null ? json['imageType'] : ImageTypeNetwork;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : 0;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : 0;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isHeightClear = json['isHeightClear'] != null ? json['isHeightClear'] : false;
    isWidthClear = json['isWidthClear'] != null ? json['isWidthClear'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.width != null) {
      data['width'] = this.width;
    }
    if (this.fit != null) {
      data['fit'] = this.fit;
    }
    if (this.path != null) {
      data['path'] = this.path;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.widthType != null) {
      data['widthType'] = this.widthType;
    }
    if (this.heightType != null) {
      data['heightType'] = this.heightType;
    }
    if (this.imageType != null) {
      data['imageType'] = this.imageType;
    }
    if (this.horizontalAlignment != null && this.verticalAlignment != null) {
      data['horizontalAlignment'] = this.horizontalAlignment;
      data['verticalAlignment'] = this.verticalAlignment;
    } else if (this.horizontalAlignment != null) {
      data['horizontalAlignment'] = this.horizontalAlignment;
    } else if (this.verticalAlignment != null) {
      data['verticalAlignment'] = this.verticalAlignment;
    }
    if (this.isAlignX != null) {
      data['isAlignX'] = this.isAlignX;
    }
    if (this.isAlignY != null) {
      data['isAlignY'] = this.isAlignY;
    }
    if (this.isHeightClear != null) {
      data['isHeightClear'] = this.isHeightClear;
    }
    if (this.isWidthClear != null) {
      data['isWidthClear'] = this.isWidthClear;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getImageDefaultWidget(WidgetModel widgetModel) {
    Widget childData = Image(
      image: (imageType == ImageTypeAsset ? NetworkImage(path ?? DEFAULT_ASSET_IMAGE) : NetworkImage(path ?? DEFAULT_NETWORK_IMAGE)) /* as ImageProvider<Object>*/,
      height: isHeightClear! ? null : fromJsonHeight(height ?? DEFAULT_IMAGE_HEIGHT as double?, heightType),
      width: isWidthClear! ? null : fromJsonWidth(width ?? DEFAULT_IMAGE_WIDTH as double?, widthType),
      fit: fit != null ? getBoxFit(fit) : BoxFit.cover,
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getImageExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getImagePadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getImageAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getImageWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImageExpanded(_getImagePadding(_getImageAlign(getImageDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getImageExpanded(_getImagePadding(getImageDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImageExpanded(_getImageAlign(getImageDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImagePadding(_getImageAlign((getImageDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getImagePadding(getImageDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImageAlign(getImageDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getImageExpanded(getImageDefaultWidget(widgetModel));
    } else {
      return getImageDefaultWidget(widgetModel);
    }
  }

  getImageString() {
    return "///***If you have exported images you must have to copy those images in assets/images directory."
        "\nImage(\n"
        "image:${imageType == ImageTypeAsset ? "AssetImage(\"${path != null ? '$DEFAULT_ASSETS_IMAGE_PATH/${path!.split('/').last}' : DEFAULT_ASSET_IMAGE}\")" : "NetworkImage(\"${path ?? DEFAULT_NETWORK_IMAGE}\")"},\n"
        "${isHeightClear! ? '' : 'height:${getHeightString(height ?? DEFAULT_IMAGE_HEIGHT as double?, heightType)},\n'}"
        "${isWidthClear! ? '' : 'width:${getWidthString(width ?? DEFAULT_IMAGE_WIDTH as double?, widthType)},\n'}"
        "fit:${fit != null ? getBoxFit(fit) : BoxFit.cover},\n"
        ")";
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child,\n"
        ")";
  }

  _getStringAlign() {
    return "Align(\n"
        "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:${getImageString()},\n"
        ")";
  }

  _getStringPadding(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$child,\n"
        ")";
  }

  /// For view code
  getCodeAsString(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringPadding(_getStringAlign()));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getImageString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getImageString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getImageString());
    } else {
      return getImageString();
    }
  }
}
