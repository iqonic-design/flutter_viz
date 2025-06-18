class CategoryComponentListModel {
  bool? status;
  String? message;
  Pagination? pagination;
  List<CategoryComponentData>? data;

  CategoryComponentListModel({this.status, this.message, this.pagination, this.data});

  CategoryComponentListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new CategoryComponentData.fromJson(v));
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
  String? nextPage;

  Pagination({this.totalItems, this.perPage, this.currentPage, this.totalPages, this.from, this.to, this.nextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    perPage = json['per_page'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    from = json['from'];
    to = json['to'];
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_items'] = this.totalItems;
    data['per_page'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['from'] = this.from;
    data['to'] = this.to;
    data['next_page'] = this.nextPage;
    return data;
  }
}

class CategoryComponentData {
  int? id;
  String? name;
  List<ComponentData>? component;
  String? createdAt;
  String? updatedAt;

  CategoryComponentData({this.id, this.name, this.component, this.createdAt, this.updatedAt});

  CategoryComponentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['component'] != null) {
      component = [];
      json['component'].forEach((v) {
        component!.add(new ComponentData.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.component != null) {
      data['component'] = this.component!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ComponentData {
  int? id;
  String? name;
  int? categoryId;
  String? screenData;
  int? status;
  String? createdAt;
  String? updatedAt;

  ComponentData({this.id, this.name, this.categoryId, this.screenData, this.status, this.createdAt, this.updatedAt});

  ComponentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    screenData = json['screen_data'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['screen_data'] = this.screenData;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
