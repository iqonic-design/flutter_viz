class LoginResponse {
  bool? status;
  String? message;
  UserData? data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? userType;
  String? description;
  String? dob;
  String? gender;
  int? countryId;
  String? countryName;
  int? stateId;
  String? stateName;
  int? cityId;
  String? cityName;
  String? contactNumber;
  String? designation;
  String? linkdinUrl;
  String? twitterUrl;
  String? stackoverflowUrl;
  String? facebookUrl;
  String? dribbbleUrl;
  String? pinterestUrl;
  String? githubUrl;
  String? uplabsUrl;
  String? instagramUrl;
  String? createdAt;
  String? updatedAt;
  String? apiToken;
  String? previous_login_at;
  String? login_at;
  int? is_darkmode;
  String? language_code;
  int? noOfProject;
  String? profileImage;

  UserData({
    this.id,
    this.name,
    this.email,
    this.userType,
    this.description,
    this.dob,
    this.gender,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.contactNumber,
    this.designation,
    this.linkdinUrl,
    this.twitterUrl,
    this.stackoverflowUrl,
    this.facebookUrl,
    this.dribbbleUrl,
    this.pinterestUrl,
    this.githubUrl,
    this.uplabsUrl,
    this.instagramUrl,
    this.createdAt,
    this.updatedAt,
    this.apiToken,
    this.login_at,
    this.previous_login_at,
    this.is_darkmode,
    this.language_code,
    this.noOfProject,
    this.profileImage,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userType = json['user_type'];
    description = json['description'];
    dob = json['dob'];
    gender = json['gender'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    contactNumber = json['contact_number'];
    designation = json['designation'];
    linkdinUrl = json['linkdin_url'];
    twitterUrl = json['twitter_url'];
    stackoverflowUrl = json['stackoverflow_url'];
    facebookUrl = json['facebook_url'];
    dribbbleUrl = json['dribbble_url'];
    pinterestUrl = json['pinterest_url'];
    githubUrl = json['github_url'];
    uplabsUrl = json['uplabs_url'];
    instagramUrl = json['instagram_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    apiToken = json['api_token'];
    previous_login_at = json['previous_login_at'];
    login_at = json['login_at'];
    is_darkmode = json['is_darkmode'];
    language_code = json['language_code'];
    noOfProject = json['no_of_project'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['description'] = this.description;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['contact_number'] = this.contactNumber;
    data['designation'] = this.designation;
    data['linkdin_url'] = this.linkdinUrl;
    data['twitter_url'] = this.twitterUrl;
    data['stackoverflow_url'] = this.stackoverflowUrl;
    data['facebook_url'] = this.facebookUrl;
    data['dribbble_url'] = this.dribbbleUrl;
    data['pinterest_url'] = this.pinterestUrl;
    data['github_url'] = this.githubUrl;
    data['uplabs_url'] = this.uplabsUrl;
    data['instagram_url'] = this.instagramUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['api_token'] = this.apiToken;
    data['login_at'] = this.login_at;
    data['previous_login_at'] = this.previous_login_at;
    data['is_darkmode'] = this.is_darkmode;
    data['language_code'] = this.language_code;
    data['no_of_project'] = this.noOfProject;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
