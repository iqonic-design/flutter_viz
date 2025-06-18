class DeleteCategoryResponse {
  String? message;
  bool? status;

  DeleteCategoryResponse({this.message, this.status});

  factory DeleteCategoryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCategoryResponse(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
