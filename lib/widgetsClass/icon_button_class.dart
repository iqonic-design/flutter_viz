import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class IconButtonClass {
  /// Icon
  dynamic iconDataJson;

  /// Icon Color
  Color? iconColor;

  /// Size of icon
  double? iconSize;

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

  IconButtonClass({
    this.iconColor,
    this.iconSize,
    this.iconDataJson,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  IconButtonClass.fromJson(Map<String, dynamic> json) {
    iconDataJson = json['iconDataJson'] != null ? json['iconDataJson'] : {'iconName': 'add', 'codePoint': 57415, 'fontFamily': 'MaterialIcons'};
    iconColor = json['iconColor'] != null ? fromJsonColor(json['iconColor']) : DEFAULT_ICON_COLOR;
    iconSize = json['iconSize'] != null ? json['iconSize'] : DEFAULT_ICON_SIZE;
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
    if (this.iconDataJson != null) {
      data['iconDataJson'] = this.iconDataJson;
    }
    if (this.iconColor != null) {
      data['iconColor'] = toJsonColor(this.iconColor!);
    }
    if (this.iconSize != null) {
      data['iconSize'] = this.iconSize;
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

  Widget getDefaultIconButtonWidget(WidgetModel widgetModel) {
    Widget _childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: IconButton(
        icon: Icon(
          iconDataJson != null ? IconData(iconDataJson['codePoint'], fontFamily: iconDataJson['fontFamily']) : Icons.add,
        ),
        onPressed: () {
          getToast("Button Press");
        },
        color: iconColor ?? DEFAULT_ICON_COLOR,
        iconSize: iconSize ?? DEFAULT_ICON_SIZE,
      ),
    );
    return getGestureDetector(widgetModel, _childData);
  }

  _getIconButtonExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getIconButtonPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getIconButtonAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getIconButtonWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getIconButtonExpanded(_getIconButtonPadding(_getIconButtonAlign(getDefaultIconButtonWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getIconButtonExpanded(_getIconButtonPadding(getDefaultIconButtonWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getIconButtonExpanded(_getIconButtonAlign(getDefaultIconButtonWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getIconButtonPadding(_getIconButtonAlign((getDefaultIconButtonWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getIconButtonPadding(getDefaultIconButtonWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getIconButtonAlign(getDefaultIconButtonWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getIconButtonExpanded(getDefaultIconButtonWidget(widgetModel));
    } else {
      return getDefaultIconButtonWidget(widgetModel);
    }
  }

  getIconButtonString() {
    return "IconButton(\n"
        "icon:Icon(\n"
        "${iconDataJson != null ? 'Icons.${iconDataJson['iconName']}' : 'Icons.add'}\n"
        "),\n"
        "onPressed:(){},\n"
        "color:${iconColor ?? DEFAULT_ICON_COLOR},\n"
        "iconSize:${iconSize ?? DEFAULT_ICON_SIZE},\n"
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
        "child:${getIconButtonString()},\n"
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
      return _getStringExpanded(_getStringPadding(getIconButtonString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getIconButtonString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getIconButtonString());
    } else {
      return getIconButtonString();
    }
  }
}
