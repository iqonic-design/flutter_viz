import 'dart:convert';

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/model/user_project_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class ProjectListDialog extends StatefulWidget {
  static String tag = '/ScreenListDialog';

  int? userId;

  ProjectListDialog({this.userId});

  @override
  ProjectListDialogState createState() => ProjectListDialogState();
}

class ProjectListDialogState extends State<ProjectListDialog> {
  List<UserProjectData> userProjectList = [];
  List<ScreenListData> screenList = [];

  UserProjectData? selectedProject;
  ScreenListData? screenListModel;

  String? screenData;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      appStore.setLoading(true);
      init();
    });
  }

  init() async {
    await projectListApi();
    if (selectedProject != null) {
      getScreenListApi();
    }
  }

  ///User Project list api call
  Future<void> projectListApi() async {
    appStore.setLoading(true);

    await getUserProjectList(userId: widget.userId).then((value) async {
      appStore.setLoading(false);
      userProjectList.clear();
      userProjectList.addAll(value.data!);
      selectedProject = userProjectList.first;
      setState(() {});
    }).catchError((e) {
      log(e.toString());
      appStore.setLoading(false);
    });
  }

  /// User Screen list api
  Future<void> getScreenListApi() async {
    await getScreenList(projectId: selectedProject!.id, userId: widget.userId, page: -1).then((value) async {
      appStore.setLoading(false);
      screenList.clear();
      screenList.addAll(value.data!);
      setState(() {});
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        width: context.width() * 0.60,
        height: 700,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Project List", style: boldTextStyle(size: 22)),
                IconButton(
                  onPressed: () {
                    appStore.setPreviewCode(false);
                    finish(context);
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ).paddingAll(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16.0, right: 8.0),
                  margin: EdgeInsets.only(left: 16, right: 16),
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(COMMON_BUTTON_BORDER_RADIUS)),
                    border: Border.all(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR, width: 1),
                    color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                  ),
                  child: DropdownButtonFormField<UserProjectData>(
                    iconDisabledColor: btnBackgroundColor,
                    isDense: true,
                    isExpanded: true,
                    dropdownColor: dropDownColor,
                    decoration: InputDecoration(focusedBorder: InputBorder.none, enabledBorder: InputBorder.none),
                    value: selectedProject,
                    items: userProjectList.map((UserProjectData projectData) {
                      return new DropdownMenuItem<UserProjectData>(
                        value: projectData,
                        child: Text(projectData.name!, style: primaryTextStyle()),
                      );
                    }).toList(),
                    onChanged: (UserProjectData? newValue) {
                      selectedProject = newValue;
                      getScreenListApi();
                      setState(() {});
                    },
                  ),
                ),
                Divider(color: COMMON_BORDER_COLOR, height: 32),
                ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                    },
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: screenList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 16, bottom: 16),
                    itemBuilder: (context, index) {
                      return Container(
                        height: screenPreviewHeight,
                        width: screenPreviewWidth,
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: appStore.isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1), width: 1),
                          borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                        ),
                        child: screenList[index].screenImage != null
                            ? Image.memory(base64Decode(screenList[index].screenImage!), width: screenPreviewWidth, height: screenPreviewHeight, fit: BoxFit.fill).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS)
                            : Container(width: screenPreviewWidth, height: screenPreviewHeight, color: Colors.white).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS),
                      );
                    },
                  ).expand(),
                )
              ],
            ).paddingOnly(top: 70).visible(userProjectList.isNotEmpty),
            Observer(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Data Found", style: boldTextStyle()).visible(userProjectList.isEmpty && !appStore.isLoading),
                  loadingAnimation().visible(appStore.isLoading),
                ],
              ),
            ).center(),
          ],
        ),
      ),
    );
  }
}
