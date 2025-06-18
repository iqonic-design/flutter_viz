import 'package:flutter_viz/components/create_project_dialog.dart';
import 'package:flutter_viz/components/welcome_screen_component.dart';
import 'package:flutter_viz/externalClasses/on_hover.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/user_project_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/screen/mobile_view_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomeScreen extends StatefulWidget {
  static String tag = '/WelcomeScreen';

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  List<UserProjectData> userProjectList = [];

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
      userProjectList.clear();
      userProjectList.addAll(value.data!);
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
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Responsive(
          mobile: MobileViewScreen(),
          web: Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        getHeaderLogoImage(),
                        darkModeSwitchWidget(),
                        16.width,
                        OnHover(builder: (isHovered) {
                          return elevationButtonWithIcon(
                            isHovered: isHovered,
                            toolTipMessage: language!.logout,
                            title: language!.logout,
                            icon: Icons.logout,
                            onPressed: () {
                              logoutConfirmationDialog(context);
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  Container(
                    color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                    width: context.width(),
                    height: context.height() - 85,
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: FittedBox(
                            child: elevationButtonWithIcon(
                              toolTipMessage: language!.createNewProject,
                              title: language!.createNewProject,
                              icon: Icons.add,
                              onPressed: () async {
                                ifNotTester(() async {
                                  if (userProjectList.length >= getIntAsync(NO_OF_PROJECT, defaultValue: 3)) {
                                    createProjectMaxLimitDialog(context);
                                  } else {
                                    await showInDialog(
                                      context,
                                      barrierDismissible: false,
                                      backgroundColor: context.scaffoldBackgroundColor,
                                      contentPadding: EdgeInsets.symmetric(vertical: 30),
                                      builder: (context) => CreateProjectDialog(
                                        onUpdate: () {
                                          projectListApi();
                                        },
                                      ),
                                    );
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        30.height,
                        WelcomeScreenComponent(userProjectList: userProjectList).expand(),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                child: noProjectFoundWidget(),
                alignment: Alignment.center,
              ).visible(userProjectList.isEmpty && !appStore.isLoading),
              loadingAnimation().visible(appStore.isLoading).center(),
            ],
          ),
        ),
      );
    });
  }
}
