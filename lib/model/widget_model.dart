import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WidgetModel {
  String? id;
  String? title;
  String? widgetType;
  List<String>? headerImport = <String>[];
  List<String>? yamlLibName = <String>[];
  String? widgetSubType;
  List<WidgetModel?>? subWidgetsList = <WidgetModel?>[];
  Widget? displayWidget;

  /// Use to get parent widgets data
  String? parentWidgetId;
  String? parentWidgetType;

  dynamic widgetViewModel;

  WidgetModel({
    this.id,
    this.title,
    this.widgetSubType,
    this.displayWidget,
    this.subWidgetsList,
    this.parentWidgetType,
    this.parentWidgetId,
    this.headerImport,
    this.yamlLibName,
    this.widgetViewModel,
    this.widgetType,
  });

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    return WidgetModel(
      widgetSubType: json['subType'],
      title: json['title'],
      id: json['id'] != null ? json['id'] : getWidgetId(),
      widgetViewModel: json['viewModel'],
      yamlLibName: json['yamlLibName'],
      parentWidgetId: json['parentWidgetId'],
      parentWidgetType: json['parentWidgetType'],
      headerImport: json['headerImport'],
      displayWidget: json['widget'],
      widgetType: json['type'],
      subWidgetsList: json['widgetList'] != null ? (json['widgetList'] as List).map((i) => WidgetModel.fromJson(i)).toList() : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subType'] = this.widgetSubType;
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['headerImport'] = this.headerImport;
    data['yamlLibName'] = this.yamlLibName;
    data['parentWidgetId'] = this.parentWidgetId;
    data['title'] = this.title;
    data['parentWidgetType'] = this.parentWidgetType;
    data['widget'] = this.displayWidget;
    data['viewModel'] = this.widgetViewModel;
    data['type'] = this.widgetType;
    if (this.subWidgetsList != null) {
      data['widgetList'] = this.subWidgetsList!.map((v) => v!.toJson()).toList();
    }

    return data;
  }

  /// Copy widgets
  WidgetModel copyWith({bool isClearChild = false}) {
    return WidgetModel(
      id: getWidgetId(),
      widgetSubType: this.widgetSubType,
      headerImport: this.headerImport,
      yamlLibName: this.yamlLibName,
      title: this.title,
      parentWidgetId: this.parentWidgetId,
      parentWidgetType: this.parentWidgetType,
      displayWidget: this.displayWidget,
      widgetViewModel: this.widgetViewModel,
      widgetType: this.widgetType,
      subWidgetsList: (isClearChild) ? <WidgetModel>[] : this.subWidgetsList,
    );
  }
}
