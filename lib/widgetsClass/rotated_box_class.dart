import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotatedBoxClass {
  ///The number of clockwise quarter turns the child should be rotated
  int? quarterTurns;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  /// Padding
  EdgeInsets? padding;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  RotatedBoxClass({
    this.quarterTurns,
    this.isExpanded = false,
    this.flex = 1,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
  });

  RotatedBoxClass.fromJson(Map<String, dynamic> json) {
    quarterTurns = json['quarterTurns'] != null ? json['quarterTurns'] : 0;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quarterTurns != null) {
      data['quarterTurns'] = this.quarterTurns;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
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
    return data;
  }

  Widget getRotatedBoxDefaultWidget(WidgetModel widgetModel, {Widget? widget}) {
    Widget childData;
    if (widget != null) {
      childData = RotatedBox(
        quarterTurns: quarterTurns ?? 0,
        child: widget,
      );
    } else {
      childData = RotatedBox(
        quarterTurns: quarterTurns ?? 0,
        child: Text('RotatedBox'),
      );
    }
    return getGestureDetector(widgetModel, childData);
  }

  _getRotatedBoxPadding(Widget _child) {
    return Padding(
      padding: padding!,
      child: _child,
    );
  }

  _getRotatedBoxAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getRotatedBoxWidget(WidgetModel widgetModel, {Widget? widget}) {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRotatedBoxPadding(_getRotatedBoxAlign(getRotatedBoxDefaultWidget(widgetModel, widget: widget)));
    } else if (getPadding(padding)) {
      return _getRotatedBoxPadding(getRotatedBoxDefaultWidget(widgetModel, widget: widget));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRotatedBoxAlign(getRotatedBoxDefaultWidget(widgetModel, widget: widget));
    } else {
      return getRotatedBoxDefaultWidget(widgetModel, widget: widget);
    }
  }

  LayoutExpanded isRotatedExpanded(WidgetModel widgetModel) {
    LayoutExpanded layoutExpanded = LayoutExpanded(isExpanded: isExpanded, flex: flex);
    return layoutExpanded;
  }

  getRotatedBoxString(bool isChild) {
    if (isChild) {
      return "RotatedBox(\n"
          "quarterTurns:${quarterTurns ?? 0},\n"
          "child:";
    } else {
      return "RotatedBox(\n"
          "quarterTurns:${quarterTurns ?? 0},\n"
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
  getCodeAsString(isChild, WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      return _getStringExpanded(_getStringAlign(_getStringPadding(getRotatedBoxString(isChild))));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign(getRotatedBoxString(isChild)));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getRotatedBoxString(isChild)));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY) && getPadding(padding)) {
      return _getStringAlign(_getStringPadding(getRotatedBoxString(isChild)));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getRotatedBoxString(isChild));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign(getRotatedBoxString(isChild));
    } else if (getPadding(padding)) {
      return _getStringPadding(getRotatedBoxString(isChild));
    } else {
      return getRotatedBoxString(isChild);
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
