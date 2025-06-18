import 'package:flutter/widgets.dart';

class MenuWidgetsModel {
  IconData? menuIcons;
  String? menuName;
  String? svgFileName;
  int? index = 0;
  bool? isOnHover = false;

  dynamic widgetViewModel;

  MenuWidgetsModel({this.menuIcons, this.menuName, this.isOnHover, this.index, this.svgFileName});

  factory MenuWidgetsModel.fromJson(Map<String, dynamic> json) {
    return MenuWidgetsModel(
      menuIcons: json['menuIcons'],
      menuName: json['menuName'],
      svgFileName: json['svgFileName'],
      isOnHover: json['isOnHover'] != null ? json['isOnHover'] : false,
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuIcons'] = this.menuIcons;
    data['menuName'] = this.menuName;
    data['svgFileName'] = this.svgFileName;
    data['isOnHover'] = this.isOnHover;
    data['index'] = this.index;
    return data;
  }
}
