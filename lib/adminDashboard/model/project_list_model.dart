class ProjectListModel {
  bool? status;
  String? message;
  Pagination? pagination;
  List<ProjectData>? data;

  ProjectListModel({this.status, this.message, this.pagination, this.data});

  ProjectListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new ProjectData.fromJson(v));
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

class ProjectData {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;
  ProjectTemplateScreen? projectTemplateScreen;
  int? projectTemplateScreenCount;

  ProjectData({this.id, this.name, this.status, this.createdAt, this.updatedAt, this.projectTemplateScreen, this.projectTemplateScreenCount});

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    projectTemplateScreen = json['project_template_screen'] != null ? new ProjectTemplateScreen.fromJson(json['project_template_screen']) : null;
    projectTemplateScreenCount = json['project_template_screen_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.projectTemplateScreen != null) {
      data['project_template_screen'] = this.projectTemplateScreen!.toJson();
    }
    data['project_template_screen_count'] = this.projectTemplateScreenCount;
    return data;
  }
}

class ProjectTemplateScreen {
  int? id;
  String? name;
  int? projectTemplateId;
  int? status;
  String? screenData;
  String? createdAt;
  String? updatedAt;
  String? projectTemplateScreenImage;

  ProjectTemplateScreen({this.id, this.name, this.projectTemplateId, this.status, this.screenData, this.createdAt, this.updatedAt, this.projectTemplateScreenImage});

  ProjectTemplateScreen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    projectTemplateId = json['project_template_id'];
    status = json['status'];
    screenData = json['screen_data'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    projectTemplateScreenImage = json['project_template_screen_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['project_template_id'] = this.projectTemplateId;
    data['status'] = this.status;
    data['screen_data'] = this.screenData;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['project_template_screen_image'] = this.projectTemplateScreenImage;
    return data;
  }
}
