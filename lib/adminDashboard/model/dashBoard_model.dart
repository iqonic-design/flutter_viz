import 'package:flutter_viz/model/login_response.dart';

import 'feed_back_model.dart';

class DashBoardModel {
  int? userCount;
  List<UserWeekReport>? userWeekReport;
  int? categoryCount;
  int? screenCount;
  List<UserData>? userList;
  List<FeedBackData>? feedbackList;
  int? feedbackCount;
  int? templateCount;
  bool? status;
  String? message;

  DashBoardModel({this.userCount, this.userWeekReport, this.categoryCount, this.screenCount, this.userList, this.feedbackList, this.feedbackCount, this.templateCount, this.status, this.message});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    userCount = json['user_count'];
    if (json['user_week_report'] != null) {
      userWeekReport = [];
      json['user_week_report'].forEach((v) {
        userWeekReport!.add(new UserWeekReport.fromJson(v));
      });
    }
    categoryCount = json['category_count'];
    screenCount = json['screen_count'];
    if (json['user_list'] != null) {
      userList = [];
      json['user_list'].forEach((v) {
        userList!.add(new UserData.fromJson(v));
      });
    }
    if (json['feedback_list'] != null) {
      feedbackList = [];
      json['feedback_list'].forEach((v) {
        feedbackList!.add(new FeedBackData.fromJson(v));
      });
    }
    feedbackCount = json['feedback_count'];
    templateCount = json['template_count'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_count'] = this.userCount;
    if (this.userWeekReport != null) {
      data['user_week_report'] = this.userWeekReport!.map((v) => v.toJson()).toList();
    }
    data['category_count'] = this.categoryCount;
    data['screen_count'] = this.screenCount;
    if (this.userList != null) {
      data['user_list'] = this.userList!.map((v) => v.toJson()).toList();
    }
    if (this.feedbackList != null) {
      data['feedback_list'] = this.feedbackList!.map((v) => v.toJson()).toList();
    }
    data['feedback_count'] = this.feedbackCount;
    data['template_count'] = this.templateCount;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class UserWeekReport {
  int? total;
  String? date;
  String? title;
  String? day;

  UserWeekReport({this.total, this.date, this.title, this.day});

  UserWeekReport.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    date = json['date'];
    title = json['title'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['date'] = this.date;
    data['title'] = this.title;
    data['day'] = this.day;
    return data;
  }
}
