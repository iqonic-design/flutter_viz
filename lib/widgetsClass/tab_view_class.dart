import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class TabViewClass {
  /// length
  int? initialIndex;

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

  TabViewClass({
    this.initialIndex,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
  });

  TabViewClass.fromJson(Map<String, dynamic> json) {
    initialIndex = json['initialIndex'] != null ? json['initialIndex'] : 1;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.initialIndex != null) {
      data['initialIndex'] = this.initialIndex;
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

  Widget getTabViewDefaultWidget({Widget? widget}) {
    if (widget != null) {
      ///Add Align, padding Properties
      return DefaultTabController(
        length: 3,
        // Properties
        initialIndex: initialIndex ?? 1,
        child: widget,
      );
    }
    return DefaultTabController(
      length: 3,
      initialIndex: initialIndex ?? 1,
      child: Column(
        children: [],
      ),
    );
  }

  Widget getTabViewWidget({Widget? widget}) {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return Padding(
        padding: padding!,
        child: Align(
          alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
          child: getTabViewDefaultWidget(widget: widget),
        ),
      );
    } else if (getPadding(padding)) {
      return Padding(
        padding: padding!,
        child: getTabViewDefaultWidget(widget: widget),
      );
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return Align(
        alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
        child: getTabViewDefaultWidget(widget: widget),
      );
    } else {
      return getTabViewDefaultWidget(widget: widget);
    }
  }

  getTabViewString(isChild) {
    if (isChild) {
      return "\nDefaultTabController(\n"
          "length:3,\n"
          "initialIndex:${initialIndex ?? 1},\n"
          "child:\n";
    } else {
      return "\nDefaultTabController(\n"
          "length:3,\n"
          "initialIndex:${initialIndex ?? 1},\n"
          "child:\n"
          ")";
    }
  }

  /// For view code
  getCodeAsString(isChild) {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return "Padding(\n"
          "padding:${getPaddingString(padding)},\n"
          "child:Align(\n"
          "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
          "child:${getTabViewString(isChild)},\n"
          "),\n"
          ")";
    } else if (getPadding(padding)) {
      return "Padding(\n"
          "padding:${getPaddingString(padding)},\n"
          "child:${getTabViewString(isChild)},\n"
          ")";
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return "Align(\n"
          "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
          "child:${getTabViewString(isChild)},\n"
          ")";
    } else {
      return getTabViewString(isChild);
    }
  }
}
