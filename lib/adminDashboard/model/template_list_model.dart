class TemplateListModel {
  bool? status;
  String? message;
  Pagination? pagination;
  List<TemplateData>? data;

  TemplateListModel({this.status, this.message, this.pagination, this.data});

  TemplateListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new TemplateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? totalItems;
  int? perPage;
  int? currentPage;
  int? totalPages;
  int? from;
  int? to;

  Pagination({this.totalItems, this.perPage, this.currentPage, this.totalPages, this.from, this.to});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    perPage = json['per_page'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_items'] = this.totalItems;
    data['per_page'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class TemplateData {
  int? id;
  String? name;
  int? categoryId;
  String? categoryName;
  String? screenData;
  int? projectTemplateId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? templateImage;

  TemplateData({
    this.id,
    this.name,
    this.categoryId,
    this.categoryName,
    this.screenData,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.projectTemplateId,
    this.templateImage,
  });

  TemplateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    screenData = json['screen_data'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    projectTemplateId = json['project_template_id'];
    templateImage = json['template_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['screen_data'] = this.screenData;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['project_template_id'] = this.projectTemplateId;
    data['template_image'] = this.templateImage;
    return data;
  }
}
