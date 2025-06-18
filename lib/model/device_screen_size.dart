class DeviceScreenSize {
  int? screenId;
  String? name;
  double? deviceWidth;
  double? deviceHeight;

  DeviceScreenSize({
    this.screenId,
    this.name,
    this.deviceWidth,
    this.deviceHeight,
  });

  DeviceScreenSize.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    screenId = json['screenId'];
    deviceWidth = json['deviceWidth'];
    deviceHeight = json['deviceHeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['screenId'] = this.screenId;
    data['deviceHeight'] = this.deviceHeight;
    data['deviceWidth'] = this.deviceWidth;
    return data;
  }
}
