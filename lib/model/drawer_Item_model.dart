import 'package:flutter_viz/model/bottom_navigation_bar_item_model.dart';

class DrawerItemModel {
  IconResponse? icon;
  String? label;

  DrawerItemModel({this.icon, this.label});

  factory DrawerItemModel.fromJson(Map<String, dynamic> json) {
    return DrawerItemModel(
      icon: json['icon'] != null ? IconResponse.fromJson(json['icon']) : null,
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.icon != null) {
      data['icon'] = this.icon!.toJson();
    }
    return data;
  }
}
