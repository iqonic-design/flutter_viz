class VerifyRecaptchaModel {
  String? challengeTs;
  List<String>? errorCodes;
  String? hostname;
  String? success;

  VerifyRecaptchaModel({this.challengeTs, this.errorCodes, this.hostname, this.success});

  factory VerifyRecaptchaModel.fromJson(Map<String, dynamic> json) {
    return VerifyRecaptchaModel(
      challengeTs: json['challenge_ts'],
      errorCodes: json['error-codes'] != null ? new List<String>.from(json['error-codes']) : null,
      hostname: json['hostname'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['challenge_ts'] = this.challengeTs;
    data['hostname'] = this.hostname;
    data['success'] = this.success;
    if (this.errorCodes != null) {
      data['error-codes'] = this.errorCodes;
    }
    return data;
  }
}
