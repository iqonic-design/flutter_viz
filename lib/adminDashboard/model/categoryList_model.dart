class CategoryListModel {
  List<CategoryData>? data;
  String? message;
  Pagination? pagination;
  bool? status;

  CategoryListModel({this.data, this.message, this.pagination, this.status});

  factory CategoryListModel.fromJson(Map<String, dynamic> json) {
    return CategoryListModel(
      data: json['data'] != null ? (json['data'] as List).map((i) => CategoryData.fromJson(i)).toList() : null,
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
  int? perPage;
  int? to;
  int? totalPages;
  int? totalItems;

  Pagination({this.currentPage, this.from, this.perPage, this.to, this.totalPages, this.totalItems});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      from: json['from'],
      perPage: json['per_page'],
      to: json['to'],
      totalPages: json['totalPages'],
      totalItems: json['total_items'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['from'] = this.from;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['totalPages'] = this.totalPages;
    data['total_items'] = this.totalItems;
    return data;
  }
}

class CategoryData {
  String? createdAt;
  int? id;
  String? name;
  String? updatedAt;
  int? sequence;

  CategoryData({this.createdAt, this.id, this.name, this.updatedAt, this.sequence});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      createdAt: json['created_at'],
      id: json['id'],
      name: json['name'],
      updatedAt: json['updated_at'],
      sequence: json['sequence'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    data['sequence'] = this.sequence;
    return data;
  }
}
