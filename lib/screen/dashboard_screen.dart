import 'dart:async';
import 'dart:convert';

import 'package:flutter_viz/components/header_component.dart';
import 'package:flutter_viz/components/menu_component.dart';
import 'package:flutter_viz/components/user_guide_dialog.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppCommonApiCall.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/centerView/center_child_view_screen.dart';
import 'mobile_view_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  late Timer timer;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    trackScreenView(HOME_SCREEN);
    init();
  }

  /// Auto Save data after 60 seconds
  void autoSaveData() async {
    ifNotTester(() {
      if (appStore.selectedMenu == WIDGETS_INDEX || appStore.selectedMenu == TREE_INDEX) {
        if (appStore.selectedScreenId! > 0) {
          String? screenImage;
          screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
            Map<String, dynamic> rootScreenDataJson = await widgetClassToJsonData();
            if (rootScreenDataJson['widgetsData'].isNotEmpty ||
                rootScreenDataJson['appBarData'].isNotEmpty ||
                rootScreenDataJson['bottomBarNavigationData'].isNotEmpty ||
                rootScreenDataJson['drawerData'].isNotEmpty) {
              screenImage = base64.encode(capturedImage!);
            }
            Map req = {
              'user_id': (IS_TESTING_MODE) ? DUMMY_USER_ID : getIntAsync(USER_ID),
              'id': appStore.selectedScreenId,
              'data': json.encode(rootScreenDataJson),
              'project_id': appStore.projectId,
              'screen_image': screenImage,
            };

            addScreen(req).then((value) {
              appStore.updateScreenNewData(json.encode(rootScreenDataJson), appStore.selectedScreenId);
              appStore.updateScreenImage(screenImage, appStore.selectedScreenId);
              appStore.updateSyncTime(DateTime.now().toString());
              LiveStream().emit(LIVESTREAM_UPDATE_LAST_SYNC_TIME);
            }).catchError((e) {
              getToast(e.toString());
            });
          }).catchError((onError) {
            print(onError);
          });
        }
      }
    }, false);
  }

  void init() async {
    timer = Timer.periodic(Duration(seconds: 30), (timer) {
      autoSaveData();
    });

    if (getBoolAsync(IS_FIRST_TIME_LOGIN)) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showInDialog(
          context,
          builder: (context) => UserGuideDialog(),
          backgroundColor: context.scaffoldBackgroundColor,
          contentPadding: EdgeInsets.symmetric(vertical: 30),
          barrierDismissible: false,
        );
      });
      setValue(IS_FIRST_TIME_LOGIN, false);
    }
    appStore.isPreviewCode = false;
    appStore.selectedWidgetList.clear();

    /// Add default Screen
    appStore.screenList.add(ScreenListData(
      name: "New Screen",
      id: -1,
    ));
    appStore.addRootView();
    await getAllScreenListApi();
    await allMediaListApi();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      body: Responsive(
        mobile: MobileViewScreen(),
        web: Container(
          width: context.width(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  HeaderComponent(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : menuShadowColor,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: isExpanded ? Curves.easeIn : Curves.easeOut,
                          child: Stack(
                            children: [
                              MenuComponent(isExpanded: isExpanded),

                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: EdgeInsets.all(isExpanded ? 8 : 4),
                                  decoration: BoxDecoration(color: btnBackgroundColor, shape: BoxShape.circle),
                                  child: Icon(isExpanded ? Icons.navigate_before_outlined : Icons.navigate_next_outlined, color: Colors.white).onTap(() {
                                    isExpanded = !isExpanded;
                                    setState(() {});
                                  }),
                                ),
                              ),
                            ],
                          ),
                          width: getMenuWidth(context, isExpanded: isExpanded),
                        ),
                      ),
                      Positioned(
                        left: getMenuWidth(context, isExpanded: isExpanded),
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: isExpanded ? Curves.easeIn : Curves.easeOut,
                          child: CenterChildViewScreen(isExpanded: isExpanded),
                          width: getChildWidgetsWidth(context, isExpanded: isExpanded),
                        ),
                      ),
                    ],
                  ).expand(),
                ],
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
