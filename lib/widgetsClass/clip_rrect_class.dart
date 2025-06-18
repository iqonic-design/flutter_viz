import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class ClipRRectClass {
  /// Border Radius
  BorderRadius? borderRadius;

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

  ClipRRectClass({
    this.borderRadius,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  ClipRRectClass.fromJson(Map<String, dynamic> json) {
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.zero;
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
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
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

  Widget getClipRRectDefaultWidget(WidgetModel widgetModel, {Widget? widget}) {
    Widget childData;
    if (widget != null) {
      childData = ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: widget,
      );
    } else {
      childData = ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Container(
          child: Text('ClipRRect'),
          height: 100,
          width: 100,
          alignment: Alignment.center,
          color: scaffoldSecondaryDark,
        ),
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  LayoutExpanded isClipRRectExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  _getClipRRectPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getClipRRectAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getClipRRectWidget(WidgetModel widgetModel, {Widget? widget}) {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getClipRRectPadding(_getClipRRectAlign(getClipRRectDefaultWidget(widgetModel, widget: widget)));
    } else if (getPadding(padding)) {
      return _getClipRRectPadding(getClipRRectDefaultWidget(widgetModel, widget: widget));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getClipRRectAlign(getClipRRectDefaultWidget(widgetModel, widget: widget));
    } else {
      return getClipRRectDefaultWidget(widgetModel, widget: widget);
    }
  }

  /// For view code
  getClipRRectString(bool isChild) {
    if (isChild) {
      return "ClipRRect(\n"
          "borderRadius:${borderRadius ?? BorderRadius.zero},\n"
          "child:";
    } else {
      return "ClipRRect(\n"
          "borderRadius:${borderRadius ?? BorderRadius.zero},\n"
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
      return _getStringExpanded(_getStringAlign(_getStringPadding(getClipRRectString(isChild!))));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(getClipRRectString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getClipRRectString(isChild!)));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      return _getStringAlign(_getStringPadding(getClipRRectString(isChild!)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getClipRRectString(isChild!));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getClipRRectString(isChild!));
    } else if (getPadding(padding)) {
      return _getStringPadding(getClipRRectString(isChild!));
    } else {
      return getClipRRectString(isChild!);
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
