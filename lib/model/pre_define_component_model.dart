import 'package:flutter/material.dart';

class PreDefineComponentModel {
  String? id;
  String? title;
  String? widgetType;
  String? image;
  Widget? displayWidget;
  bool? isOnHover = false;

  dynamic widgetViewModel;

  PreDefineComponentModel({
    this.id,
    this.title,
    this.displayWidget,
    this.isOnHover,
    this.widgetViewModel,
    this.widgetType,
    this.image,
  });

  factory PreDefineComponentModel.fromJson(Map<String, dynamic> json) {
    return PreDefineComponentModel(
      title: json['title'],
      id: json['id'],
      widgetViewModel: json['viewModel'],
      displayWidget: json['widget'],
      isOnHover: json['isOnHover'] != null ? json['isOnHover'] : false,
      widgetType: json['type'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['widget'] = this.displayWidget;
    data['isOnHover'] = this.isOnHover;
    data['viewModel'] = this.widgetViewModel;
    data['type'] = this.widgetType;
    data['image'] = this.image;

    return data;
  }
}
