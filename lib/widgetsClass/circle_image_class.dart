import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class CircleImageClass {
  ///padding
  EdgeInsets? padding;

  ///Image Type
  String? imageType;

  /// image path
  String? path;

  ///Radius
  double? radius;

  /// radius Type
  String? radiusType;

  ///BoxFit
  String? boxFit;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  /// Width isClear or not
  bool? isRadiusClear;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  CircleImageClass({
    this.padding,
    this.imageType = ImageTypeNetwork,
    this.path,
    this.radius,
    this.boxFit,
    this.radiusType = TypePX,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isRadiusClear = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  CircleImageClass.fromJson(Map<String, dynamic> json) {
    radius = json['radius'] != null ? fromJsonWidth(json['radius'], radiusType ?? TypePX) : DEFAULT_CIRCLE_IMAGE_WIDTH;
    path = json['path'] != null ? json['path'] : (imageType == ImageTypeAsset ? DEFAULT_ASSET_IMAGE : DEFAULT_NETWORK_IMAGE);
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    boxFit = json['boxFit'] != null ? json['boxFit'] : boxFitCover;
    radiusType = json['radiusType'] != null ? json['radiusType'] : TypePX;
    imageType = json['imageType'] != null ? json['imageType'] : ImageTypeNetwork;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isRadiusClear = json['isRadiusClear'] != null ? json['isRadiusClear'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.radius != null) {
      data['radius'] = this.radius;
    }
    if (this.path != null) {
      data['path'] = this.path;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.boxFit != null) {
      data['boxFit'] = this.boxFit;
    }
    if (this.radiusType != null) {
      data['radiusType'] = this.radiusType;
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
    if (this.isRadiusClear != null) {
      data['isRadiusClear'] = this.isRadiusClear;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getCircleImageDefaultWidget(WidgetModel widgetModel) {
    Widget childData = Container(
      height: isRadiusClear! ? null : fromJsonWidth(radius ?? DEFAULT_CIRCLE_IMAGE_WIDTH, radiusType),
      width: isRadiusClear! ? null : fromJsonWidth(radius ?? DEFAULT_CIRCLE_IMAGE_WIDTH, radiusType),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: imageType == ImageTypeNetwork
          ? Image.network(
              path ?? DEFAULT_NETWORK_IMAGE,
              fit: boxFit != null ? getBoxFit(boxFit) : BoxFit.cover,
            )
          : Image.network(
              path ?? DEFAULT_ASSET_IMAGE,
              fit: boxFit != null ? getBoxFit(boxFit) : BoxFit.cover,
            ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getCircleImageExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getCircleImagePadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getCircleImageAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getCircleImageWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCircleImageExpanded(_getCircleImagePadding(_getCircleImageAlign(getCircleImageDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getCircleImageExpanded(_getCircleImagePadding(getCircleImageDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCircleImageExpanded(_getCircleImageAlign(getCircleImageDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCircleImagePadding(_getCircleImageAlign((getCircleImageDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getCircleImagePadding(getCircleImageDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getCircleImageAlign(getCircleImageDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getCircleImageExpanded(getCircleImageDefaultWidget(widgetModel));
    } else {
      return getCircleImageDefaultWidget(widgetModel);
    }
  }

  String getCircleString() {
    return "Container(\n"
        "${isRadiusClear! ? "" : 'height:${getWidthString(radius ?? DEFAULT_CIRCLE_IMAGE_WIDTH, radiusType)},\n'}"
        "${isRadiusClear! ? "" : 'width:${getWidthString(radius ?? DEFAULT_CIRCLE_IMAGE_WIDTH, radiusType)},\n'}"
        "clipBehavior: Clip.antiAlias,\n"
        "decoration: BoxDecoration(\n"
        "shape: BoxShape.circle,\n"
        "),\n"
        "child:${imageType == ImageTypeNetwork ? 'Image.network(\n \"${path ?? DEFAULT_NETWORK_IMAGE}\",\nfit:${boxFit != null ? getBoxFit(boxFit) : BoxFit.cover}),' : 'Image.asset(\n \"${path != null ? 'images/${path!.split('/').last}' : DEFAULT_ASSET_IMAGE}\",\nfit:${boxFit != null ? getBoxFit(boxFit) : BoxFit.cover}),'}\n"
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
        "child:${getCircleString()},\n"
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
      return _getStringExpanded(_getStringPadding(getCircleString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getCircleString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getCircleString());
    } else {
      return getCircleString();
    }
  }
}
