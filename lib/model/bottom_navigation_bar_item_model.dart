class BottomNavigationBarItemModel {
  IconResponse? icon;
  String? label;

  BottomNavigationBarItemModel({this.icon, this.label});

  factory BottomNavigationBarItemModel.fromJson(Map<String, dynamic> json) {
    return BottomNavigationBarItemModel(
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

class IconResponse {
  int? codePoint;
  String? fontFamily;
  String? iconName;

  IconResponse({this.codePoint, this.fontFamily, this.iconName});

  factory IconResponse.fromJson(Map<String, dynamic> json) {
    return IconResponse(
      codePoint: json['codePoint'],
      fontFamily: json['fontFamily'],
      iconName: json['iconName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codePoint'] = this.codePoint;
    data['fontFamily'] = this.fontFamily;
    data['iconName'] = this.iconName;
    return data;
  }
}
