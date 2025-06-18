import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class ImageIconClass {
  /// Image Type
  String? imageType;

  /// Image Path
  String? path;

  /// Icon Color
  Color? color;

  /// Size of icon
  double? size;

  ///padding
  EdgeInsets? padding;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  ImageIconClass({
    this.imageType = ImageTypeNetwork,
    this.path,
    this.color,
    this.size,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  ImageIconClass.fromJson(Map<String, dynamic> json) {
    imageType = json['imageType'] != null ? json['imageType'] : ImageTypeNetwork;
    path = json['path'] != null ? json['path'] : (imageType == ImageTypeAsset ? DEFAULT_ASSET_IMAGE_ICON : DEFAULT_NETWORK_IMAGE_ICON);
    color = json['color'] != null ? fromJsonColor(json['color']) : DEFAULT_ICON_COLOR;
    size = json['size'] != null ? json['size'] : DEFAULT_ICON_SIZE;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imageType != null) {
      data['imageType'] = this.imageType;
    }
    if (this.path != null) {
      data['path'] = this.path;
    }
    if (this.color != null) {
      data['color'] = toJsonColor(this.color!);
    }
    if (this.size != null) {
      data['size'] = this.size;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
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
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getImageIconDefaultWidget(WidgetModel widgetModel) {
    Widget childData = ImageIcon(
      (imageType == ImageTypeAsset ? NetworkImage(path ?? DEFAULT_ASSET_IMAGE_ICON) : NetworkImage(path ?? DEFAULT_NETWORK_IMAGE_ICON)),
      size: size ?? DEFAULT_ICON_SIZE,
      color: color ?? DEFAULT_ICON_COLOR,
    );
    return getGestureDetector(widgetModel, childData);
  }

  Widget getImageIconWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImageIconExpanded(_getImageIconPadding(_getImageIconAlign(getImageIconDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getImageIconExpanded(_getImageIconPadding(getImageIconDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImageIconExpanded(_getImageIconAlign(getImageIconDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImageIconPadding(_getImageIconAlign((getImageIconDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getImageIconPadding(getImageIconDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getImageIconAlign(getImageIconDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getImageIconExpanded(getImageIconDefaultWidget(widgetModel));
    } else {
      return getImageIconDefaultWidget(widgetModel);
    }
  }

  _getImageIconExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getImageIconPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getImageIconAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  getImageIconString() {
    return "ImageIcon(\n"
        "${imageType == ImageTypeAsset ? 'AssetImage(\"${path != null ? 'images/${path!.split('/').last}' : DEFAULT_ASSET_IMAGE_ICON}\")' : 'NetworkImage(\"${path ?? DEFAULT_NETWORK_IMAGE_ICON}\")'},\n"
        "size:${size ?? DEFAULT_ICON_SIZE},\n"
        "color:${color ?? DEFAULT_ICON_COLOR},\n"
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
        "child:${getImageIconString()},\n"
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
      return _getStringExpanded(_getStringPadding(getImageIconString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getImageIconString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getImageIconString());
    } else {
      return getImageIconString();
    }
  }
}
