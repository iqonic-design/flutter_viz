import 'package:flutter_viz/adminDashboard/screen/admin_dashboard_screen.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/screen/login_screen.dart';
import 'package:flutter_viz/screen/welcome_screen.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    afterBuildCreated(() => init());
  }

  bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  init() async {
    checkFirstSeen();
    appStore.isInDebugMode = isInDebugMode;
  }

  Future checkFirstSeen() async {
    log(ModalRoute.of(context)!.settings.name);
    if (ModalRoute.of(context)!.settings.name == '/') {
      if (IS_TESTING_MODE) {
        WelcomeScreen().launch(context, isNewTask: true);
      } else {
        if (appStore.isLoggedIn) {
          if (getStringAsync(USER_TYPE) == ADMIN) {
            AdminDashboardScreen().launch(context, isNewTask: true);
          } else {
            WelcomeScreen().launch(context, isNewTask: true);
          }
        } else {
          LoginScreen().launch(context, isNewTask: true);
        }
      }
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: context.width(),
          child: Center(
            child: Image.asset(getAppLogo, width: 400),
          ),
        ),
      ),
    );
  }
}
