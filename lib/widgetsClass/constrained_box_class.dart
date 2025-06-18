import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstrainedBoxClass {
  /// ConstrainedBox min height
  double? maxHeight;

  /// ConstrainedBox min width
  double? maxWidth;

  /// Min Width Type
  String? maxWidthType;

  ///Max Height Type
  String? maxHeightType;

  ///Padding
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

  ConstrainedBoxClass({
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.maxWidthType = TypePX,
    this.maxHeightType = TypePX,
    this.maxHeight,
    this.maxWidth,
    this.isExpanded = false,
    this.flex = 1,
  });

  ConstrainedBoxClass.fromJson(Map<String, dynamic> json) {
    maxHeight = json['maxHeight'] != null ? fromJsonHeight(json['maxHeight'], maxHeightType ?? TypePX) : DEFAULT_CONSTRAINED_MAX_HEIGHT as double?;
    maxWidth = json['maxWidth'] != null ? fromJsonWidth(json['maxWidth'], maxWidthType ?? TypePX) : DEFAULT_CONSTRAINED_MAX_WIDTH as double?;
    maxWidthType = json['maxWidthType'] != null ? json['maxWidthType'] : TypePX;
    maxHeightType = json['maxHeightType'] != null ? json['maxHeightType'] : TypePX;
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
    if (this.maxWidthType != null) {
      data['maxWidthType'] = this.maxWidthType;
    }
    if (this.maxHeightType != null) {
      data['maxHeightType'] = this.maxHeightType;
    }
    if (this.maxHeight != null) {
      data['maxHeight'] = this.maxHeight;
    }
    if (this.maxWidth != null) {
      data['maxWidth'] = this.maxWidth;
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

  Widget getConstrainedBoxDefaultWidget(WidgetModel widgetModel, {Widget? widget}) {
    Widget childData;

    if (widget != null) {
      childData = ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: fromJsonHeight(maxHeight ?? DEFAULT_CONSTRAINED_MAX_HEIGHT as double?, maxHeightType),
          maxWidth: fromJsonHeight(maxHeight ?? DEFAULT_CONSTRAINED_MAX_WIDTH as double?, maxHeightType),
        ),
        child: widget,
      );
    } else {
      childData = ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: fromJsonHeight(maxHeight ?? DEFAULT_CONSTRAINED_MAX_HEIGHT as double?, maxHeightType),
          maxWidth: fromJsonHeight(maxHeight ?? DEFAULT_CONSTRAINED_MAX_WIDTH as double?, maxHeightType),
        ),
        child: Text("Constrained Box"),
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isConstrainedExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  _getConstrainedBoxPadding(Widget _child) {
    return Padding(
      padding: padding!,
      child: _child,
    );
  }

  _getConstrainedBoxAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getConstrainedBoxWidget(WidgetModel widgetModel, {Widget? widget}) {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getConstrainedBoxPadding(_getConstrainedBoxAlign(getConstrainedBoxDefaultWidget(widgetModel, widget: widget)));
    } else if (getPadding(padding)) {
      return _getConstrainedBoxPadding(getConstrainedBoxDefaultWidget(widgetModel, widget: widget));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getConstrainedBoxAlign(getConstrainedBoxDefaultWidget(widgetModel, widget: widget));
    } else {
      return getConstrainedBoxDefaultWidget(widgetModel, widget: widget);
    }
  }

  getConstrainedBoxString(bool isChild) {
    if (isChild) {
      return "ConstrainedBox(\n"
          "constraints: BoxConstraints("
          "maxHeight: ${maxHeight != null ? getHeightString(maxHeight, maxHeightType) : DEFAULT_CONSTRAINED_MAX_HEIGHT},\n"
          "maxWidth: ${maxWidth != null ? getWidthString(maxWidth, maxWidthType) : DEFAULT_CONSTRAINED_MAX_WIDTH},\n"
          "),\n"
          "child:";
    } else {
      return "ConstrainedBox(\n"
          "constraints: BoxConstraints("
          "maxHeight: ${maxHeight != null ? getHeightString(maxHeight, maxHeightType) : DEFAULT_CONSTRAINED_MAX_HEIGHT},\n"
          "maxWidth: ${maxWidth != null ? getWidthString(maxWidth, maxWidthType) : DEFAULT_CONSTRAINED_MAX_WIDTH},\n"
          "),\n"
          ")";
    }
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child";
  }

  _getStringAlign(String _child) {
    return "Align(\n"
        "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:$_child";
  }

  _getStringPadding(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$child";
  }

  /// For view code
  getCodeAsString(bool? isChild, WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      return _getStringExpanded(_getStringAlign(_getStringPadding(getConstrainedBoxString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(getConstrainedBoxString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getConstrainedBoxString(isChild!)));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      return _getStringAlign(_getStringPadding(getConstrainedBoxString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getConstrainedBoxString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getConstrainedBoxString(isChild!));
    } else if (getPadding(padding)) {
      return _getStringPadding(getConstrainedBoxString(isChild!));
    } else {
      return getConstrainedBoxString(isChild!);
    }
  }

  /// End Code String
  getEndCodeAsString(bool isChild, WidgetModel widgetModel) {
    String finalString = "";
    if (isChild) {
      finalString = "),";
    }
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      if (isChild) {
        return finalString + "),),),";
      } else {
        return finalString + "),),)";
      }
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      if (isChild) {
        return finalString + "),),";
      } else {
        return finalString + "),)";
      }
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      if (isChild) {
        return finalString + "),),";
      } else {
        return finalString + "),)";
      }
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      if (isChild) {
        return finalString + "),),";
      } else {
        return finalString + "),)";
      }
    } else if (getExpanded(widgetModel, isExpanded)) {
      if (isChild) {
        return finalString + "),";
      } else {
        return finalString + ")";
      }
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      if (isChild) {
        return finalString + "),";
      } else {
        return finalString + ")";
      }
    } else if (getPadding(padding)) {
      if (isChild) {
        return finalString + "),";
      } else {
        return finalString + ")";
      }
    }
    return finalString;
  }
}
