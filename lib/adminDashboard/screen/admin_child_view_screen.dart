import 'package:flutter_viz/adminDashboard/components/admin_project_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_tutorials_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_categories_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_dashBoard_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_feedBack_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_preDefine_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_templates_component.dart';
import 'package:flutter_viz/adminDashboard/components/admin_users_component.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AdminChildViewScreen extends StatelessWidget {
  Widget getChildView(BuildContext context) {
    /// Dashboard View
    if (appStore.selectedMenu == ADMIN_DASHBOARD_INDEX) {
      return Container(
        child: AdminDashboardComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == ADMIN_USERS_INDEX) {
      /// User View
      return Container(
        child: AdminUsersComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == ADMIN_CATEGORIES_INDEX) {
      /// Categories View
      return Container(
        child: AdminCategoriesComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == ADMIN_TEMPLATES_INDEX) {
      /// Templates View
      return Container(
        child: AdminTemplatesComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == ADMIN_COMPONENT_INDEX) {
      /// Component View
      return Container(
        child: AdminPreDefineComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == ADMIN_PROJECT_INDEX) {
      /// Component View
      return Container(
        child: AdminProjectComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == ADMIN_FEEDBACK_INDEX) {
      /// FeedBack View
      return Container(
        child: AdminFeedBackComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == ADMIN_TUTORIALS_INDEX) {
      return Container(
        child: AdminTutorialsComponent(),
        width: getChildWidgetsWidth(context),
        height: MediaQuery.of(context).size.height,
      );
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return getChildView(context);
    });
  }
}
