import 'package:flutter_viz/model/user_project_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/screen/dashboard_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'add_clone_project_dialog.dart';

class WelcomeScreenComponent extends StatefulWidget {
  static String tag = '/WelcomeScreenComponent';
  final List<UserProjectData>? userProjectList;

  WelcomeScreenComponent({this.userProjectList});

  @override
  WelcomeScreenComponentState createState() => WelcomeScreenComponentState();
}

class WelcomeScreenComponentState extends State<WelcomeScreenComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    projectListApi();
  }

  ///project list api call
  Future<void> projectListApi() async {
    appStore.setLoading(true);

    await getUserProjectList(userId: getIntAsync(USER_ID)).then((value) async {
      appStore.setLoading(false);
      widget.userProjectList!.clear();
      widget.userProjectList!.addAll(value.data!);

      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///delete project list api call
  Future<void> deleteProjectList(id) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
    };
    await deleteUserProjectList(req).then((value) {
      trackUserEvent(DELETE_PROJECT);
      appStore.setLoading(false);
      setState(() {});
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  ///delete project list api call
  Future<void> updateProjectTimeApi(id) async {
    Map req = {
      "project_id": id,
    };
    await updateProjectTime(req).then((value) async {
      printLogData(value.message.toString());
    }).catchError((e) {
      printLogData(e.toString());
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int mainAxisCount = 4;
        if (constraints.maxWidth <= 1300) {
          mainAxisCount = 3;
        }
        return GridView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.userProjectList!.length,
          itemBuilder: (context, index) {
            UserProjectData mData = widget.userProjectList![index];
            return HoverWidget(
              builder: (context, isHovering) {
                return AnimatedContainer(
                  duration: commonAnimationDuration,
                  child: Container(
                    decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: (isHovering)
                            ? appStore.isDarkMode
                                ? darkModeSecondaryBackgroundDark
                                : menuMouseHoverColor
                            : appStore.isDarkMode
                                ? darkModePrimaryColorBackground
                                : Colors.white,
                        borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                        boxShadow: [
                          (isHovering || appStore.isDarkMode) ? BoxShadow(color: Colors.grey.withValues(alpha: 0.2)) : commonCardBoxShadow(),
                        ],
                        border: Border.all(color: (isHovering && appStore.isDarkMode) ? btnBackgroundColor : Colors.transparent)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(mData.name.validate(), style: primaryTextStyle(size: 18)).expand(),
                              8.width,
                              editIcon(context, () async {
                                ifNotTester(() async {
                                  await showInDialog(
                                    context,
                                    backgroundColor: context.scaffoldBackgroundColor,
                                    contentPadding: EdgeInsets.all(16),
                                    builder: (context) => AddCloneProjectDialog(
                                      projectId: mData.id,
                                      projectName: mData.name,
                                      isEdit: true,
                                      onUpdate: () {
                                        projectListApi();
                                      },
                                    ),
                                  );
                                });
                              }),
                              16.width,
                              cloneIcon(context).onTap(() async {
                                ifNotTester(() async {
                                  if (widget.userProjectList!.length >= getIntAsync(NO_OF_PROJECT, defaultValue: 3)) {
                                    createProjectMaxLimitDialog(context);
                                  } else {
                                    await showInDialog(
                                      context,
                                      backgroundColor: context.scaffoldBackgroundColor,
                                      contentPadding: EdgeInsets.all(16),
                                      builder: (context) => AddCloneProjectDialog(
                                        projectId: mData.id,
                                        onUpdate: () {
                                          projectListApi();
                                        },
                                      ),
                                    );
                                  }
                                });
                              }),
                              16.width,
                              deleteIcon(context).onTap(() async {
                                ifNotTester(() async {
                                  deleteConfirmationDialog(
                                    context: context,
                                    messageText: language!.areYouSureWantToDeleteProject,
                                    onAccept: () async {
                                      finish(context);
                                      await deleteProjectList(mData.id.validate());
                                      widget.userProjectList!.remove(mData);
                                    },
                                  );
                                });
                              }),
                            ],
                          ),
                          8.height,
                          Text('${language!.lastEdited} : ${getLastLogin(updateTimeString: mData.updatedAt!)}', style: secondaryTextStyle(size: 12)),
                        ],
                      ),
                    ),
                  ).onTap(() {
                    appStore.setProjectId(mData.id);
                    appStore.setProjectName(mData.name);
                    appStore.selectedMenu = WIDGETS_INDEX;
                    updateProjectTimeApi(mData.id);

                    DashboardScreen().launch(context, isNewTask: true);
                  }),
                );
              },
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: mainAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3.5,
          ),
        );
      },
    );
  }
}
