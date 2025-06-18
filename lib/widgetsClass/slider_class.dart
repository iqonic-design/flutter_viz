import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';

class SliderClass {
  /// Initial Value
  double? initialValue;

  /// Maximum value
  double? max;

  /// Minimum value
  double? min;

  /// Step Size
  double? stepSize;

  /// Active Color
  Color? activeColor;

  /// InActive Color
  Color? inactiveColor;

  /// Show Value or not
  bool? isShowValue = false;

  /// Width
  double? width;

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

  SliderClass({
    this.initialValue,
    this.max,
    this.min,
    this.stepSize,
    this.activeColor,
    this.inactiveColor,
    this.isShowValue,
    this.width,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  SliderClass.fromJson(Map<String, dynamic> json) {
    initialValue = json['initialValue'] != null ? json['initialValue'] : (min ?? 0);
    max = json['max'] != null ? json['max'] : 10;
    min = json['min'] != null ? json['min'] : 0;
    stepSize = json['stepSize'] != null ? json['stepSize'] : null;
    activeColor = json['activeColor'] != null ? fromJsonColor(json['activeColor']) : COMMON_BG_COLOR;
    inactiveColor = json['inactiveColor'] != null ? fromJsonColor(json['inactiveColor']) : DEFAULT_SLIDER_INACTIVE_COLOR;
    isShowValue = json['isShowValue'] != null ? json['isShowValue'] : false;
    width = json['width'] != null ? json['width'] : null;
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
    if (this.initialValue != null) {
      data['initialValue'] = this.initialValue;
    }
    if (this.max != null) {
      data['max'] = this.max;
    }
    if (this.min != null) {
      data['min'] = this.min;
    }
    if (this.stepSize != null) {
      data['stepSize'] = this.stepSize;
    }
    if (this.activeColor != null) {
      data['activeColor'] = toJsonColor(this.activeColor!);
    }
    if (this.inactiveColor != null) {
      data['inactiveColor'] = toJsonColor(this.inactiveColor!);
    }
    if (this.isShowValue != null) {
      data['isShowValue'] = this.isShowValue;
    }
    if (this.width != null) {
      data['width'] = this.width;
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

  Widget getSliderDefaultWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: Container(
        width: width,
        child: Slider(
          onChanged: (value) {},
          value: initialValue ?? (min ?? 0),
          min: min ?? 0,
          max: max ?? 10,
          activeColor: activeColor ?? COMMON_BG_COLOR,
          inactiveColor: inactiveColor ?? DEFAULT_SLIDER_INACTIVE_COLOR,
          label: (isShowValue ?? false) ? initialValue.toString() : null,
          divisions: stepSize != null ? (((max ?? 10.0) - (min ?? 0.0)) ~/ stepSize!) : null,
        ),
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getSliderExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getSliderPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getSliderAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getSliderWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSliderExpanded(_getSliderPadding(_getSliderAlign(getSliderDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getSliderExpanded(_getSliderPadding(getSliderDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSliderExpanded(_getSliderAlign(getSliderDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSliderPadding(_getSliderAlign((getSliderDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getSliderPadding(getSliderDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSliderAlign(getSliderDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getSliderExpanded(getSliderDefaultWidget(widgetModel));
    } else {
      return getSliderDefaultWidget(widgetModel);
    }
  }

  /// For view code
  getSliderString() {
    String sliderString = "Slider(\n"
        "onChanged: (value) {},\n"
        "value:${initialValue ?? (min ?? 0)},\n"
        "min:${min ?? 0},\n"
        "max:${max ?? 10},\n"
        "activeColor:${activeColor ?? COMMON_BG_COLOR},\n"
        "inactiveColor:${inactiveColor ?? DEFAULT_SLIDER_INACTIVE_COLOR},\n"
        "${(isShowValue ?? false) ? 'label:\"${initialValue ?? (min ?? 0)}\",\n' : ''}"
        "${stepSize != null ? 'divisions:${(((max ?? 10.0) - (min ?? 0.0)) ~/ stepSize!)},\n' : ''}"
        ")";
    if (width != null) {
      return _getStringWidth(sliderString);
    } else {
      return sliderString;
    }
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
        "child:${getSliderString()},\n"
        ")";
  }

  _getStringPadding(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$child,\n"
        ")";
  }

  _getStringWidth(String child) {
    return "Container(\n"
        "width:$width,\n"
        "child:$child,\n"
        ")";
  }

  /// For view code
  getCodeAsString(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringPadding(_getStringAlign()));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getSliderString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getSliderString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getSliderString());
    } else {
      return getSliderString();
    }
  }
}
