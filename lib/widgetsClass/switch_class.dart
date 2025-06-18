import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class SwitchClass {
  /// Whether this switch is checked.
  bool? value;

  /// The color to use when this switch is on.
  Color? activeColor;

  /// The color to use on the track when this switch is on.
  Color? activeTrackColor;

  /// The color to use on the thumb when this switch is off.
  Color? inactiveThumbColor;

  /// The color to use on the track when this switch is off.
  Color? inactiveTrackColor;

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

  SwitchClass({
    this.value,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  SwitchClass.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? json['value'] : true;
    activeColor = json['activeColor'] != null ? fromJsonColor(json['activeColor']) : COMMON_BG_COLOR;
    activeTrackColor = json['activeTrackColor'] != null ? fromJsonColor(json['activeTrackColor']) : DEFAULT_ACTIVE_TRACK_COLOR;
    inactiveThumbColor = json['inactiveThumbColor'] != null ? fromJsonColor(json['inactiveThumbColor']) : DEFAULT_INACTIVE_THUMB_COLOR;
    inactiveTrackColor = json['inactiveTrackColor'] != null ? fromJsonColor(json['inactiveTrackColor']) : DEFAULT_INACTIVE_TRACK_COLOR;
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
    if (this.value != null) {
      data['value'] = this.value;
    }
    if (this.activeColor != null) {
      data['activeColor'] = toJsonColor(this.activeColor!);
    }
    if (this.activeTrackColor != null) {
      data['activeTrackColor'] = toJsonColor(this.activeTrackColor!);
    }
    if (this.inactiveThumbColor != null) {
      data['inactiveThumbColor'] = toJsonColor(this.inactiveThumbColor!);
    }
    if (this.inactiveTrackColor != null) {
      data['inactiveTrackColor'] = toJsonColor(this.inactiveTrackColor!);
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

  Widget getSwitchDefaultWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: Switch(
        value: value ?? true,
        onChanged: (value) {},
        activeColor: activeColor ?? COMMON_BG_COLOR,
        activeTrackColor: activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR,
        inactiveThumbColor: inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR,
        inactiveTrackColor: inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR,
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getSwitchExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getSwitchPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getSwitchAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getSwitchWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchExpanded(_getSwitchPadding(_getSwitchAlign(getSwitchDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getSwitchExpanded(_getSwitchPadding(getSwitchDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchExpanded(_getSwitchAlign(getSwitchDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchPadding(_getSwitchAlign((getSwitchDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getSwitchPadding(getSwitchDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchAlign(getSwitchDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getSwitchExpanded(getSwitchDefaultWidget(widgetModel));
    } else {
      return getSwitchDefaultWidget(widgetModel);
    }
  }

  getSwitchString() {
    return "SwitchListTile(\n"
        "value:${value ?? true},\n"
        "onChanged:(value){},\n"
        "activeColor:${activeColor ?? COMMON_BG_COLOR},\n"
        "activeTrackColor:${activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR},\n"
        "inactiveThumbColor:${inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR},\n"
        "inactiveTrackColor:${inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR},\n"
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
        "child:${getSwitchString()},\n"
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
      return _getStringExpanded(_getStringPadding(getSwitchString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getSwitchString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getSwitchString());
    } else {
      return getSwitchString();
    }
  }
}
