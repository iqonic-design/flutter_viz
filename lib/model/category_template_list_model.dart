import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';

class CategoryTemplateListModel {
  List<CategoryTemplateData>? data;
  String? message;
  Pagination? pagination;
  bool? status;

  CategoryTemplateListModel({this.data, this.message, this.pagination, this.status});

  factory CategoryTemplateListModel.fromJson(Map<String, dynamic> json) {
    return CategoryTemplateListModel(
      data: json['data'] != null ? (json['data'] as List).map((i) => CategoryTemplateData.fromJson(i)).toList() : null,
      message: json['message'],
      pagination: json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? from;
  int? per_page;
  int? to;
  int? totalPages;
  int? total_items;

  Pagination({this.currentPage, this.from, this.per_page, this.to, this.totalPages, this.total_items});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      from: json['from'],
      per_page: json['per_page'],
      to: json['to'],
      totalPages: json['totalPages'],
      total_items: json['total_items'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['from'] = this.from;
    data['per_page'] = this.per_page;
    data['to'] = this.to;
    data['totalPages'] = this.totalPages;
    data['total_items'] = this.total_items;
    return data;
  }
}

class CategoryTemplateData {
  String? created_at;
  int? id;
  String? name;
  List<TemplateData>? template;
  String? updated_at;

  CategoryTemplateData({this.created_at, this.id, this.name, this.template, this.updated_at});

  factory CategoryTemplateData.fromJson(Map<String, dynamic> json) {
    return CategoryTemplateData(
      created_at: json['created_at'],
      id: json['id'],
      name: json['name'],
      template: json['template'] != null ? (json['template'] as List).map((i) => TemplateData.fromJson(i)).toList() : null,
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['id'] = this.id;
    data['name'] = this.name;
    data['updated_at'] = this.updated_at;
    if (this.template != null) {
      data['template'] = this.template!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
