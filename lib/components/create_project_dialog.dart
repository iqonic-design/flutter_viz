import 'dart:convert';
import 'dart:ui';

import 'package:flutter_viz/adminDashboard/model/project_list_model.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateProjectDialog extends StatefulWidget {
  static String tag = '/CreateProjectDialog';
  final Function()? onUpdate;

  CreateProjectDialog({this.onUpdate});

  @override
  CreateProjectDialogState createState() => CreateProjectDialogState();
}

class CreateProjectDialogState extends State<CreateProjectDialog> {
  final formKey = GlobalKey<FormState>();

  TextEditingController projectNameController = TextEditingController();

  List<ProjectData> projectList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await projectListApi();
  }

  /// add projectTemplateSaveAsProject Api call
  Future<void> addTemplateAsProjectApi({int? projectId}) async {
    if (formKey.currentState!.validate()) {
      hideKeyboard(context);

      formKey.currentState!.save();
      appStore.setLoading(true);

      Map req = {
        "name": projectNameController.text.trim(),
        "user_id": getIntAsync(USER_ID),
        "project_template_id": projectId,
      };

      await addTemplateSaveAsProject(req).then((value) {
        appStore.setProjectId(value.data!.id);
        appStore.setLoading(false);
        widget.onUpdate!.call();
        finish(context);
        getToast(value.message!);
      }).catchError((e) {
        appStore.setLoading(false);
        getToast(e.toString());
      });
    }
  }

  ///add screen api call
  Future<void> addScreenApi(int? projectId) async {
    hideKeyboard(context);

    Map req = {
      'user_id': (IS_TESTING_MODE) ? DUMMY_USER_ID : getIntAsync(USER_ID),
      'name': "Home Screen",
      'project_id': projectId,
    };

    await addScreen(req).then((value) {
      appStore.setLoading(false);
      widget.onUpdate!.call();
      getToast(value.message!);
      finish(context);
    }).catchError((e) {
      getToast(e.toString());
    });
  }

  /// add UserProject Api call
  Future<void> addUserProjectApi() async {
    if (formKey.currentState!.validate()) {
      hideKeyboard(context);

      formKey.currentState!.save();
      appStore.setLoading(true);

      Map req = {
        "name": projectNameController.text.trim(),
        "user_id": getIntAsync(USER_ID),
      };

      await addUserProject(req).then((value) {
        addScreenApi(value.data!.id);
      }).catchError((e) {
        appStore.setLoading(false);
        getToast(e.toString());
      });
    }
  }

  ///project list api call
  Future<void> projectListApi() async {
    appStore.setLoading(true);

    await getProjectList(status: 1).then((ProjectListModel? value) async {
      appStore.setLoading(false);
      projectList.clear();
      projectList.addAll(value!.data!);
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1070,
      height: 750,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(language!.createProject, style: boldTextStyle(size: 22)),
                    CloseButton(),
                  ],
                ).paddingSymmetric(horizontal: 30),
                8.height,
                Text(language!.enterProjectText, style: secondaryTextStyle()).paddingSymmetric(horizontal: 30),
                16.height,
                AppTextField(
                  controller: projectNameController,
                  textFieldType: TextFieldType.NAME,
                  decoration: commonInputDecoration(hintName: "Project Name"),
                  textStyle: primaryTextStyle(),
                  autoFocus: false,
                  maxLines: 1,
                  maxLength: 15,
                  validator: (String? value) {
                    if (value!.isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ], // Only
                ).paddingSymmetric(horizontal: 30),
                16.height,
                Divider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                16.height,
                SingleChildScrollView(
                  child: Container(
                    width: context.width(),
                    alignment: Alignment.topCenter,
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      children: List.generate(projectList.length + 1, (index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              Text("Blank App", style: secondaryTextStyle(size: 18)),
                              8.height,
                              SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: screenPreviewHeight,
                                  width: screenPreviewWidth,
                                  alignment: Alignment.center,
                                  decoration: boxDecorationWithRoundedCorners(
                                    border: Border.all(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR),
                                    borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                    backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Icon(Icons.add, color: context.iconColor),
                                        decoration: boxDecorationWithRoundedCorners(
                                          boxShape: BoxShape.circle,
                                          backgroundColor: context.scaffoldBackgroundColor,
                                        ),
                                        height: 50,
                                        width: 50,
                                      ),
                                      30.height,
                                      dialogPrimaryColorButton(
                                        text: language!.createNew,
                                        onTap: () {
                                          addUserProjectApi();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        ProjectData projectData = projectList[index - 1];
                        return GestureDetector(
                          child: Column(
                            children: [
                              Text(projectData.name.validate(), style: secondaryTextStyle(size: 18)),
                              8.height,
                              AnimatedContainer(
                                duration: commonAnimationDuration,
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: screenPreviewWidth,
                                    height: screenPreviewHeight,
                                    decoration: boxDecorationWithRoundedCorners(
                                      borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                      backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: screenPreviewHeight,
                                          width: screenPreviewWidth,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: appStore.isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                          ),
                                          child: projectData.projectTemplateScreen!.projectTemplateScreenImage != null
                                              ? Image.memory(
                                                  base64Decode(projectData.projectTemplateScreen!.projectTemplateScreenImage!),
                                                  width: screenPreviewWidth,
                                                  height: screenPreviewHeight,
                                                  fit: BoxFit.fill,
                                                ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS)
                                              : Container(
                                                  width: screenPreviewWidth,
                                                  height: screenPreviewHeight,
                                                  color: Colors.white,
                                                ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS),
                                        ),
                                        HoverWidget(
                                          builder: (context, isHovering) {
                                            return isHovering
                                                ? BackdropFilter(
                                                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      color: Colors.black.withValues(alpha: 0.5),
                                                      width: screenPreviewWidth,
                                                      height: screenPreviewHeight,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(projectData.name.validate(), style: boldTextStyle(color: Colors.white, size: 18)),
                                                          4.height,
                                                          Text("${projectData.projectTemplateScreenCount} Screens", style: primaryTextStyle(color: Colors.white, size: 12)),
                                                          16.height,
                                                          Container(
                                                            height: 30,
                                                            width: 140,
                                                            padding: EdgeInsets.all(0),
                                                            alignment: Alignment.center,
                                                            decoration: boxDecorationWithRoundedCorners(
                                                              borderRadius: radius(COMMON_BUTTON_BORDER_RADIUS),
                                                              backgroundColor: btnBackgroundColor,
                                                            ),
                                                            child: Text(
                                                              language!.tapToUseTemplate,
                                                              style: secondaryTextStyle(color: Colors.white, size: 12),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ).onTap(() {
                                                      addTemplateAsProjectApi(projectId: projectData.id);
                                                    }),
                                                  )
                                                : Container(
                                                    width: screenPreviewWidth,
                                                    height: screenPreviewHeight,
                                                    decoration: boxDecorationWithRoundedCorners(
                                                      border: Border.all(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR),
                                                      borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                                      backgroundColor: Colors.transparent,
                                                    ),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                  ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            applyScreenJsonToView(projectData.projectTemplateScreen!.screenData);
                            finish(context);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ).paddingSymmetric(horizontal: 30).expand(),
              ],
            ),
          ),
          Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
        ],
      ),
    );
  }
}
