import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class RadioButtonClass {
  /// [value] and [groupValue] together determine whether the radio button is selected.

  String? value;

  String? groupValue;

  /// active color
  Color? activeColor;

  /// autoFocus
  bool? autoFocus;

  /// Focus color
  Color? focusColor;

  /// hover color
  Color? hoverColor;

  /// splash radius
  double? splashRadius;

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

  RadioButtonClass({
    this.value,
    this.groupValue,
    this.activeColor,
    this.autoFocus,
    this.focusColor,
    this.hoverColor,
    this.splashRadius,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  RadioButtonClass.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? json['value'] : '';
    groupValue = json['groupValue'] != null ? json['groupValue'] : '';
    activeColor = json['activeColor'] != null ? fromJsonColor(json['activeColor']) : COMMON_BG_COLOR;
    autoFocus = json['autoFocus'] != null ? json['autoFocus'] : false;
    focusColor = json['focusColor'] != null ? fromJsonColor(json['focusColor']) : DEFAULT_FOCUS_COLOR;
    hoverColor = json['hoverColor'] != null ? fromJsonColor(json['hoverColor']) : DEFAULT_HOVER_COLOR;
    splashRadius = json['splashRadius'] != null ? json['splashRadius'] : DEFAULT_SPREAD_RADIUS;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : 0;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : 0;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value;
    }
    if (this.groupValue != null) {
      data['groupValue'] = this.groupValue;
    }
    if (this.activeColor != null) {
      data['activeColor'] = toJsonColor(this.activeColor!);
    }
    if (this.autoFocus != null) {
      data['autoFocus'] = this.autoFocus;
    }
    if (this.focusColor != null) {
      data['focusColor'] = toJsonColor(this.focusColor!);
    }
    if (this.hoverColor != null) {
      data['hoverColor'] = toJsonColor(this.hoverColor!);
    }
    if (this.splashRadius != null) {
      data['splashRadius'] = this.splashRadius;
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

  Widget getRadioButtonDefaultWidget(WidgetModel widgetModel) {
    Widget _childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: Radio(
        value: value ?? " ",
        groupValue: groupValue ?? " ",
        onChanged: (dynamic value) {},
        activeColor: activeColor ?? COMMON_BG_COLOR,
        autofocus: autoFocus ?? false,
        focusColor: focusColor ?? DEFAULT_FOCUS_COLOR,
        splashRadius: splashRadius ?? DEFAULT_SPREAD_RADIUS,
        hoverColor: hoverColor ?? DEFAULT_HOVER_COLOR,
      ),
    );
    return getGestureDetector(widgetModel, _childData);
  }

  _getRadioExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getRadioPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getRadioAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getRadioButtonWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRadioExpanded(_getRadioPadding(_getRadioAlign(getRadioButtonDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getRadioExpanded(_getRadioPadding(getRadioButtonDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRadioExpanded(_getRadioAlign(getRadioButtonDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRadioPadding(_getRadioAlign((getRadioButtonDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getRadioPadding(getRadioButtonDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRadioAlign(getRadioButtonDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getRadioExpanded(getRadioButtonDefaultWidget(widgetModel));
    } else {
      return getRadioButtonDefaultWidget(widgetModel);
    }
  }

  getRadioButtonString() {
    return "Radio(\n"
        "value:\"${getDollarString(value ?? " ")}\",\n"
        "groupValue:\"${getDollarString(groupValue ?? " ")}\",\n"
        "onChanged:(value){},\n"
        "activeColor:${activeColor ?? COMMON_BG_COLOR},\n"
        "autofocus:${autoFocus ?? false},\n"
        "${(autoFocus ?? false) ? 'focusColor:${focusColor ?? DEFAULT_FOCUS_COLOR},\n' : ''}"
        "splashRadius:${splashRadius ?? DEFAULT_SPREAD_RADIUS},\n"
        "hoverColor:${hoverColor ?? DEFAULT_HOVER_COLOR},\n"
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
        "child:${getRadioButtonString()},\n"
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
      return _getStringExpanded(_getStringPadding(getRadioButtonString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getRadioButtonString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getRadioButtonString());
    } else {
      return getRadioButtonString();
    }
  }
}
