class ScreenListResponse {
  bool? status;
  String? message;
  List<ScreenListData>? data;

  ScreenListResponse({this.status, this.message, this.data});

  ScreenListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new ScreenListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScreenListData {
  int? id;
  int? userId;
  String? name;
  String? screenJsonData;
  String? screenImage;
  String? createdAt;
  String? updatedAt;

  ScreenListData({this.id, this.userId, this.name, this.screenJsonData, this.createdAt, this.updatedAt, this.screenImage});

  ScreenListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    screenJsonData = json['data'];
    screenImage = json['screen_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['data'] = this.screenJsonData;
    data['screen_image'] = this.screenImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
