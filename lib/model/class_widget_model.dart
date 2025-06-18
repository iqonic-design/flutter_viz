class ClassWidgetModel {
  String? id;
  String? title;
  String? widgetType;
  String? widgetSubType;
  List<ClassWidgetModel>? subWidgetsList = <ClassWidgetModel>[];
  dynamic widgetViewModel;

  ClassWidgetModel({
    this.id,
    this.title,
    this.widgetSubType,
    this.subWidgetsList,
    this.widgetViewModel,
    this.widgetType,
  });

  factory ClassWidgetModel.fromJson(Map<String, dynamic> json) {
    return ClassWidgetModel(
      widgetSubType: json['subType'],
      title: json['title'],
      id: json['id'],
      widgetViewModel: json['viewModel'],
      widgetType: json['type'],
      subWidgetsList: json['widgetList'] != null ? (json['widgetList'] as List).map((i) => ClassWidgetModel.fromJson(i)).toList() : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subType'] = this.widgetSubType;
    data['id'] = this.id;
    data['title'] = this.title;
    data['viewModel'] = this.widgetViewModel;
    data['type'] = this.widgetType;
    if (this.subWidgetsList != null) {
      data['widgetList'] = this.subWidgetsList!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
