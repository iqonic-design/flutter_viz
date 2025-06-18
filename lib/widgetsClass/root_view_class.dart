import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter/material.dart';

class RootViewClass {
  /// BG Color
  Color? bgColor = Colors.white;

  ///Safe Area
  bool? safeArea;

  ///Is Scrollable
  bool? isScrollable;

  RootViewClass({
    this.bgColor,
    this.safeArea = false,
    this.isScrollable,
  });

  RootViewClass.fromJson(Map<String, dynamic> json) {
    bgColor = json['bgColor'] != null ? fromJsonColor(json['bgColor']) : Colors.white;
    safeArea = json['safeArea'] != null ? json['safeArea'] : false;
    isScrollable = json['isScrollable'] != null ? json['isScrollable'] : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bgColor != null) {
      data['bgColor'] = toJsonColor(this.bgColor!);
    }
    if (this.safeArea != null) {
      data['safeArea'] = this.safeArea;
    }
    if (this.isScrollable != null) {
      data['isScrollable'] = this.isScrollable;
    }
    return data;
  }

  getColor() {
    return bgColor;
  }

  getSafeArea() {
    return safeArea;
  }
}
