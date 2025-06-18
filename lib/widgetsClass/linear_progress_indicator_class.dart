import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LinearProgressIndicatorClass {
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

  ///Background Color
  Color? backgroundColor;

  ///Value Color
  Color? valueColor;

  ///Progress Value
  double? progressValue;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  /// Height
  double? height;

  LinearProgressIndicatorClass({
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.backgroundColor,
    this.valueColor,
    this.progressValue,
    this.isExpanded,
    this.flex = 1,
    this.height,
  });

  LinearProgressIndicatorClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    backgroundColor = json['backgroundColor'] != null ? fromJsonColor(json['backgroundColor']) : DEFAULT_PROGRESSBAR_BACKGROUND_COLOR;
    valueColor = json['valueColor'] != null ? fromJsonColor(json['valueColor']) : COMMON_BG_COLOR;
    progressValue = json['progressValue'] != null ? json['progressValue'] : DEFAULT_PROGRESS_VALUE;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false);
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
    height = json['height'] != null ? json['height'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.valueColor != null) {
      data['valueColor'] = toJsonColor(this.valueColor!);
    }
    if (this.backgroundColor != null) {
      data['backgroundColor'] = toJsonColor(this.backgroundColor!);
    }
    if (this.progressValue != null) {
      data['progressValue'] = this.progressValue;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    if (this.height != null) {
      data['height'] = this.height;
    }
    return data;
  }

  Widget getLinearProgressIndicatorDefaultWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: LinearProgressIndicator(
        minHeight: height ?? DEFAULT_PROGRESS_HEIGHT as double?,
        backgroundColor: backgroundColor ?? DEFAULT_PROGRESSBAR_BACKGROUND_COLOR,
        valueColor: new AlwaysStoppedAnimation<Color>(valueColor ?? COMMON_BG_COLOR),
        value: progressValue ?? DEFAULT_PROGRESS_VALUE,
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getTextFieldExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getTextFieldPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getTextFieldAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getLinearProgressIndicatorWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldExpanded(_getTextFieldPadding(_getTextFieldAlign(getLinearProgressIndicatorDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getTextFieldExpanded(_getTextFieldPadding(getLinearProgressIndicatorDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldExpanded(_getTextFieldAlign(getLinearProgressIndicatorDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldPadding(_getTextFieldAlign((getLinearProgressIndicatorDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getTextFieldPadding(getLinearProgressIndicatorDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getTextFieldAlign(getLinearProgressIndicatorDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getTextFieldExpanded(getLinearProgressIndicatorDefaultWidget(widgetModel));
    } else {
      return getLinearProgressIndicatorDefaultWidget(widgetModel);
    }
  }

  getLinearProgressIndicatorString() {
    return "LinearProgressIndicator(\n"
        "backgroundColor: ${backgroundColor ?? DEFAULT_PROGRESSBAR_BACKGROUND_COLOR},\n"
        "valueColor: new AlwaysStoppedAnimation<Color>(${valueColor ?? COMMON_BG_COLOR}),\n"
        "value: ${progressValue ?? DEFAULT_PROGRESS_VALUE},\n"
        "minHeight: ${height ?? DEFAULT_PROGRESS_HEIGHT}\n"
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
        "child:${getLinearProgressIndicatorString()},\n"
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
      return _getStringExpanded(_getStringPadding(getLinearProgressIndicatorString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getLinearProgressIndicatorString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getLinearProgressIndicatorString());
    } else {
      return getLinearProgressIndicatorString();
    }
  }
}
