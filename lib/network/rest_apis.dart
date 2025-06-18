import 'dart:convert';

import 'package:flutter_viz/adminDashboard/model/add_category_response.dart';
import 'package:flutter_viz/adminDashboard/model/categoryList_model.dart';
import 'package:flutter_viz/adminDashboard/model/dashBoard_model.dart';
import 'package:flutter_viz/adminDashboard/model/delete_category_response.dart';
import 'package:flutter_viz/adminDashboard/model/feed_back_model.dart';
import 'package:flutter_viz/adminDashboard/model/project_list_model.dart';
import 'package:flutter_viz/adminDashboard/model/project_template_list_model.dart';
import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/adminDashboard/model/tutorials_model.dart';
import 'package:flutter_viz/adminDashboard/model/user_list_model.dart';
import 'package:flutter_viz/model/add_screen_model.dart';
import 'package:flutter_viz/model/base_response.dart' as FB;
import 'package:flutter_viz/model/category_component_list_model.dart';
import 'package:flutter_viz/model/category_template_list_model.dart';
import 'package:flutter_viz/model/city_model.dart';
import 'package:flutter_viz/model/country_model.dart';
import 'package:flutter_viz/model/login_response.dart';
import 'package:flutter_viz/model/media_list_model.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/model/state_model.dart';
import 'package:flutter_viz/model/user_project_list_model.dart';
import 'package:flutter_viz/network/network_utils.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../model/verify_recaptcha_model.dart';

Future<LoginResponse> login(Map request) async {
  Response response = await buildHttpResponse('login', request: request, method: HttpMethod.POST);

  if (!response.statusCode.isSuccessful()) {
    if (response.body.isJson()) {
      var json = jsonDecode(response.body);

      if (json.containsKey('code') && json['code'].toString().contains('invalid_username')) {
        throw 'invalid_username';
      }
    }
  }

  return await handleResponse(response).then((json) async {
    var loginResponse = LoginResponse.fromJson(json);
    await setValue(USER_NAME, loginResponse.data!.name.validate());
    await setValue(USER_ID, loginResponse.data!.id.validate());
    await setValue(USER_EMAIL, loginResponse.data!.email.validate());
    await setValue(TOKEN, loginResponse.data!.apiToken.validate());
    await setValue(USER_TYPE, loginResponse.data!.userType.validate());
    await setValue(USER_CITY_NAME, loginResponse.data!.cityName.validate());
    await setValue(USER_CITY_ID, loginResponse.data!.cityId.validate());
    await setValue(USER_STATE_NAME, loginResponse.data!.stateName.validate());
    await setValue(USER_STATE_ID, loginResponse.data!.stateId.validate());
    await setValue(USER_COUNTRY_NAME, loginResponse.data!.countryName.validate());
    await setValue(USER_COUNTRY_ID, loginResponse.data!.countryId.validate());
    await setValue(USER_GENDER, loginResponse.data!.gender.validate());
    await setValue(USER_DETAILS, loginResponse.data!.description.validate());
    await setValue(USER_DATE_OF_BIRTH, loginResponse.data!.dob.validate());
    await setValue(USER_DETAILS, loginResponse.data!.description.validate());
    await setValue(USER_DESIGNATION, loginResponse.data!.designation.validate());
    await setValue(USER_PHONE_NUMBER, loginResponse.data!.contactNumber.validate());
    await setValue(FACEBOOK_URL, loginResponse.data!.facebookUrl.validate());
    await setValue(TWITTER_URL, loginResponse.data!.twitterUrl.validate());
    await setValue(GITHUB_URL, loginResponse.data!.githubUrl.validate());
    await setValue(LINKDIN_URL, loginResponse.data!.linkdinUrl.validate());
    await setValue(STACK_OVERFLOW_URL, loginResponse.data!.stackoverflowUrl.validate());
    await setValue(DRIBBBLE_URL, loginResponse.data!.dribbbleUrl.validate());
    await setValue(PINTEREST_URL, loginResponse.data!.pinterestUrl.validate());
    await setValue(UPLABS_URL, loginResponse.data!.uplabsUrl.validate());
    await setValue(INSTAGRAM_URL, loginResponse.data!.instagramUrl.validate());
    await setValue(LAST_LOGIN, loginResponse.data!.previous_login_at.validate());
    await setValue(SELECTED_LANGUAGE_CODE, loginResponse.data!.language_code.validate());
    await setValue(THEME_MODE_INDEX, loginResponse.data!.is_darkmode.validate());
    await setValue(NO_OF_PROJECT, loginResponse.data!.noOfProject ?? 3);
    await setValue(USER_PHOTO, loginResponse.data!.profileImage ?? 'images/user_place_holder.png');
    appStore.setProfileImage(loginResponse.data!.profileImage ?? 'images/user_place_holder.png');
    appStore.setUserEmail(loginResponse.data!.email);
    await appStore.setLoggedIn(true);
    return loginResponse;
  }).catchError((e) {
    throw e.toString();
  });
}

Future<LoginResponse> register(Map request) async {
  Response response = await buildHttpResponse('register', request: request, method: HttpMethod.POST);

  if (!response.statusCode.isSuccessful()) {
    if (response.body.isJson()) {
      var json = jsonDecode(response.body);

      if (json.containsKey('code') && json['code'].toString().contains('invalid_username')) {
        throw 'invalid_username';
      }
    }
  }

  return await handleResponse(response).then((json) async {
    var loginResponse = LoginResponse.fromJson(json);
    await setValue(USER_NAME, loginResponse.data!.name);
    await setValue(USER_ID, loginResponse.data!.id);
    await setValue(USER_EMAIL, loginResponse.data!.email);
    await setValue(TOKEN, loginResponse.data!.apiToken.validate());
    await setValue(USER_TYPE, loginResponse.data!.userType.validate());
    await setValue(NO_OF_PROJECT, loginResponse.data!.noOfProject ?? 3);
    await appStore.setLoggedIn(true);
    return loginResponse;
  }).catchError((e) {
    throw e.toString();
  });
}

Future<LoginResponse> googleLogin(Map request) async {
  Response response = await buildHttpResponse('google-register', request: request, method: HttpMethod.POST);

  if (!response.statusCode.isSuccessful()) {
    if (response.body.isJson()) {
      var json = jsonDecode(response.body);

      if (json.containsKey('code') && json['code'].toString().contains('invalid_username')) {
        throw 'invalid_username';
      }
    }
  }

  return await handleResponse(response).then((json) async {
    var loginResponse = LoginResponse.fromJson(json);
    await setValue(USER_ID, loginResponse.data!.id.validate());

    return loginResponse;
  }).catchError((e) {
    throw e.toString();
  });
}

Future<ScreenListResponse> getScreenList({int? projectId, int? userId, int? page}) async {
  return ScreenListResponse.fromJson(await (handleResponse(await buildHttpResponse('screen-list?project_id=$projectId&user_id=$userId&per_page=$page', method: HttpMethod.GET))));
}

Future<AddScreenModel> addScreen(Map request) async {
  return AddScreenModel.fromJson(await (handleResponse(await buildHttpResponse('screen-save', request: request, method: HttpMethod.POST))));
}

Future<LoginResponse> updateProfile(Map request) async {
  return LoginResponse.fromJson(await (handleResponse(await buildHttpResponse('update-profile', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> deleteScreen(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('screen-delete', request: request, method: HttpMethod.POST))));
}

Future<AddCategoryResponse> addCategory(Map request) async {
  return AddCategoryResponse.fromJson(await (handleResponse(await buildHttpResponse('category-save', request: request, method: HttpMethod.POST))));
}

Future<DeleteCategoryResponse> deleteCategory(Map request) async {
  return DeleteCategoryResponse.fromJson(await (handleResponse(await buildHttpResponse('category-delete', request: request, method: HttpMethod.POST))));
}

Future<CategoryListModel> getCategoryList(page, {bool isShowAllCategory = false}) async {
  if (isShowAllCategory == true) {
    return CategoryListModel.fromJson(await (handleResponse(await buildHttpResponse('category-list?per_page=$page', method: HttpMethod.GET))));
  } else {
    return CategoryListModel.fromJson(await (handleResponse(await buildHttpResponse('category-list?page=$page', method: HttpMethod.GET))));
  }
}

Future<AddCategoryResponse> addTemplate(Map request) async {
  return AddCategoryResponse.fromJson(await (handleResponse(await buildHttpResponse('template-save', request: request, method: HttpMethod.POST))));
}

Future<TemplateListModel> getTemplateList(page) async {
  return TemplateListModel.fromJson(await (handleResponse(await buildHttpResponse('template-list?page=$page', method: HttpMethod.GET))));
}

Future<UserListModel> getUserList(page, {int? perPage, String? startDate, String? endDate}) async {
  if (startDate != null && endDate != null) {
    return UserListModel.fromJson(await (handleResponse(await buildHttpResponse('user-list?to=$startDate&from=$endDate&page=$page&per_page=${perPage ?? perPageCount}', method: HttpMethod.GET))));
  } else {
    return UserListModel.fromJson(await (handleResponse(await buildHttpResponse('user-list?page=$page&per_page=${perPage ?? perPageCount}', method: HttpMethod.GET))));
  }
}

Future<FB.BaseResponse> deleteTemplate(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('template-delete', request: request, method: HttpMethod.POST))));
}

Future<FeedBackModel> getFeedbackList(page, {int isCompleted = 0}) async {
  return FeedBackModel.fromJson(await (handleResponse(await buildHttpResponse('feedback-list?page=$page&is_completed=$isCompleted', method: HttpMethod.GET))));
}

Future<AddCategoryResponse> addFeedback(Map request) async {
  return AddCategoryResponse.fromJson(await (handleResponse(await buildHttpResponse('feedback-save', request: request, method: HttpMethod.POST))));
}

Future<CategoryTemplateListModel> getCategoryTemplateList() async {
  return CategoryTemplateListModel.fromJson(await (handleResponse(await buildHttpResponse('category-template-list?per_page=-1', method: HttpMethod.GET))));
}

Future<DashBoardModel> getDashBoardList() async {
  return DashBoardModel.fromJson(await (handleResponse(await buildHttpResponse('dashboard-detail', method: HttpMethod.GET))));
}

Future<TutorialsModel> getTutorialsList(page) async {
  return TutorialsModel.fromJson(await (handleResponse(await buildHttpResponse('video-list?page=$page', method: HttpMethod.GET))));
}

Future<FB.BaseResponse> deleteTutorial(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('video-delete', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> addTutorial(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('video-save', request: request, method: HttpMethod.POST))));
}

Future<TemplateListModel> getComponentList(page) async {
  return TemplateListModel.fromJson(await (handleResponse(await buildHttpResponse('component-list?page=$page', method: HttpMethod.GET))));
}

Future<FB.BaseResponse> addComponent(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('component-save', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> deleteComponent(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('component-delete', request: request, method: HttpMethod.POST))));
}

Future<CategoryComponentListModel> getCategoryComponentList() async {
  return CategoryComponentListModel.fromJson(await (handleResponse(await buildHttpResponse('category-component-list?per_page=-1', method: HttpMethod.GET))));
}

Future<List<CountryModel>> getCountryList() async {
  Iterable res = await (handleResponse(await buildHttpResponse('country-list', method: HttpMethod.POST)));
  return res.map((e) => CountryModel.fromJson(e)).toList();
}

Future<List<StateModel>> getStateList(Map request) async {
  Iterable res = await (handleResponse(await buildHttpResponse('state-list', method: HttpMethod.POST, request: request)));
  return res.map((e) => StateModel.fromJson(e)).toList();
}

Future<List<CityModel>> getCityList(Map request) async {
  Iterable res = await (handleResponse(await buildHttpResponse('city-list', method: HttpMethod.POST, request: request)));
  return res.map((e) => CityModel.fromJson(e)).toList();
}

Future<FB.BaseResponse> changePassword(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('change-password', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> forgotPassword(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('forgot-password', request: request, method: HttpMethod.POST))));
}

Future<UserProjectListModel> getUserProjectList({int? userId}) async {
  return UserProjectListModel.fromJson(await (handleResponse(await buildHttpResponse('project-list?per_page=-1&user_id=$userId', method: HttpMethod.GET))));
}

Future<FB.BaseResponse> deleteUserProjectList(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-delete', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> addUserProject(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-save', request: request, method: HttpMethod.POST))));
}

Future<ProjectListModel> getProjectList({int? page, int? status}) async {
  if (getStringAsync(USER_TYPE) == ADMIN) {
    return ProjectListModel.fromJson(await (handleResponse(await buildHttpResponse('project-template-list?page=$page', method: HttpMethod.GET))));
  } else {
    return ProjectListModel.fromJson(await (handleResponse(await buildHttpResponse('project-template-list?page=$page&status=$status', method: HttpMethod.GET))));
  }
}

Future<FB.BaseResponse> deleteProject(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-template-delete', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> addProject(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-template-save', request: request, method: HttpMethod.POST))));
}

Future<ProjectTemplateListModel> getProjectTemplateList(int? projectId, page) async {
  return ProjectTemplateListModel.fromJson(await (handleResponse(await buildHttpResponse('project-template-screen-list?project_template_id=$projectId&page=$page', method: HttpMethod.GET))));
}

Future<FB.BaseResponse> addTemplateSaveAsProject(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-template-save-as-project', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> addProjectTemplate(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-template-screen-save', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> deleteProjectTemplate(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-template-screen-delete', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> projectClone(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('project-clone', request: request, method: HttpMethod.POST))));
}

Future<FB.BaseResponse> downloadProject(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('save-user-file', request: request, method: HttpMethod.POST))));
}

///latest download code api
Future<FB.BaseResponse> downloadProjectLatestApi(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('download-user-project', request: request, method: HttpMethod.POST))));
}

Future<MediaListModel> getMediaList({int? page}) async {
  if (page != null) {
    return MediaListModel.fromJson(await (handleResponse(await buildHttpResponse('usermedia-list?page=$page', method: HttpMethod.GET))));
  } else {
    return MediaListModel.fromJson(await (handleResponse(await buildHttpResponse('usermedia-list?per_page=-1', method: HttpMethod.GET))));
  }
}

Future<FB.BaseResponse> deleteMedia(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('usermedia-delete', request: request, method: HttpMethod.POST))));
}

Future<MultipartRequest> getMultiPartRequest(String endPoint, {String? baseUrl}) async {
  String url = '${baseUrl ?? buildBaseUrl(endPoint).toString()}';
  return MultipartRequest('POST', Uri.parse(url));
}

Future<void> sendMultiPartRequest(MultipartRequest multiPartRequest, {Function(dynamic)? onSuccess, Function(dynamic)? onError}) async {
  http.Response response = await http.Response.fromStream(await multiPartRequest.send());

  if (response.statusCode.isSuccessful()) {
    onSuccess?.call(response.body);
  } else {
    onError?.call(errorSomethingWentWrong);
  }
}

Future<FB.BaseResponse> updateProjectTime(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('update-project-time', request: request, method: HttpMethod.POST))));
}

///verify google token
Future<VerifyRecaptchaModel> recaptchaApi(Map request) async {
  return VerifyRecaptchaModel.fromJson(await (handleResponse(await buildHttpResponse('siteverify', request: request, method: HttpMethod.POST, isRecaptcha: true))));
}

Future<FB.BaseResponse> updateFeedBackStatus(Map request) async {
  return FB.BaseResponse.fromJson(await (handleResponse(await buildHttpResponse('update-feedback-status', request: request, method: HttpMethod.POST))));
}
