import 'package:flutter_viz/adminDashboard/screen/admin_dashboard_screen.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/screen/forgot_password_screen.dart';
import 'package:flutter_viz/screen/register_screen.dart';
import 'package:flutter_viz/screen/welcome_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  static String tag = '/login';
  final bool isDemo;

  const LoginScreen({this.isDemo = false});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();

    afterBuildCreated(() {
      if (appStore.isLoggedIn) {
        if (getStringAsync(USER_TYPE) == ADMIN) {
          AdminDashboardScreen().launch(context, isNewTask: true);
        } else {
          WelcomeScreen().launch(context, isNewTask: true);
        }
      }
    });
  }

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      appStore.setLoading(true);
      hideKeyboard(context);

      Map req = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      await login(req).then((value) async {
        trackUserEvent(LOGIN);
        appStore.setLoading(false);
        appStore.isProjectDownloading = false;

        /// Clear Data
        appStore.clearData();

        if (value.data!.userType == ADMIN) {
          setValue(USER_TYPE, ADMIN);
          appStore.setDarkMode(false);
          appStore.setLanguage(defaultLanguage);
          AdminDashboardScreen().launch(context, isNewTask: true);
        } else {
          setValue(USER_TYPE, USER);
          setValue(IS_FIRST_TIME_LOGIN, true);
          if (value.data!.is_darkmode == ThemeModeLight) {
            appStore.setDarkMode(false);
          } else {
            appStore.setDarkMode(true);
          }
          if (value.data!.language_code != null) {
            appStore.setLanguage(value.data!.language_code);
          } else {
            appStore.setLanguage(defaultLanguage);
          }
          WelcomeScreen().launch(context, isNewTask: true);
        }
      }).catchError((e) {
        appStore.setLoading(false);
        getToast(e.toString());
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(
              'images/flutterviz_bg.jpg',
              height: context.height(),
              width: context.width(),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 4,
            child: Observer(
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: context.width() * 0.1, horizontal: context.width() * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(getAppLogo, width: 300),
                        versionNameWidget(),
                        28.height,
                        Text(language!.loginToStayConnected, style: secondaryTextStyle(size: 16)),
                        8.height,
                        AutofillGroup(
                          onDisposeAction: AutofillContextAction.commit,
                          child: Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            key: formKey,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(language!.email, style: secondaryTextStyle()),
                                    8.height,
                                    AppTextField(
                                      controller: emailController,
                                      textFieldType: TextFieldType.EMAIL,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return errorThisFieldRequired;
                                        } else if (!hasMatch(v, r"\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b")) {
                                          return "Invalid";
                                        }
                                        return null;
                                      },
                                      focus: emailNode,
                                      nextFocus: passwordNode,
                                      maxLines: 1,
                                      autoFocus: false,
                                      textAlign: TextAlign.start,
                                      decoration: commonInputDecoration(),
                                    ),
                                  ],
                                ),
                                16.height,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(language!.password, style: secondaryTextStyle()),
                                    8.height,
                                    AppTextField(
                                      controller: passwordController,
                                      textFieldType: TextFieldType.PASSWORD,
                                      focus: passwordNode,
                                      suffixIconColor: context.iconColor,
                                      maxLines: 1,
                                      autoFocus: false,
                                      textAlign: TextAlign.start,
                                      decoration: commonInputDecoration(),
                                      onFieldSubmitted: (e) {
                                        signIn();
                                      },
                                    ),
                                  ],
                                ),
                                16.height,
                                Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton(
                                    child: Text(
                                      language!.forgotPassword,
                                      style: primaryTextStyle(color: appStore.isDarkMode ? btnWhiteTextColor : btnBackgroundColor),
                                    ),
                                    onPressed: () async {
                                      await showInDialog(
                                        context,
                                        builder: (context) => ForgotPasswordScreen(),
                                      );
                                    },
                                    style: ButtonStyle(
                                      overlayColor: WidgetStateProperty.all(primaryButtonShadow),
                                    ),
                                  ),
                                ),
                                30.height,
                                dialogPrimaryColorButton(
                                  width: context.width(),
                                  text: language!.signIn,
                                  onTap: () {
                                    signIn();
                                  },
                                  child: appStore.isLoading ? loadingAnimation(widgetHeight: 30, widgetWidth: 120, isWhite: true) : null,
                                ),

                                if (widget.isDemo) ...[
                                  16.height,
                                  dialogGrayBorderButton(
                                    width: context.width(),
                                    text: "Try Demo",
                                    onTap: () {
                                      emailController.text = DEMO_EMAIL;
                                      passwordController.text = DEMO_PASSWORD;

                                      signIn();
                                    },
                                  ),
                                ],

                                ///TODO Temporary hide google login
                                ///start region
                                /*   16.height,
                                Text(language!.signInWithOtherAccount, style: secondaryTextStyle()),
                                16.height,
                                GoogleLogoWidget().paddingAll(16).onTap(() async {
                                  await signInWithGoogle().then((user) {
                                    trackUserEvent(LOGIN_GOOGLE);
                                    getToast('Welcome ${user!.data!.name}');
                                    setValue(USER_NAME, user.data!.name);
                                    setValue(USER_ID, user.data!.id);
                                    setValue(USER_EMAIL, user.data!.email);
                                    setValue(TOKEN, user.data!.apiToken.toString());
                                    setValue(USER_TYPE, user.data!.userType.validate());
                                    appStore.setLoggedIn(true);
                                    WelcomeScreen().launch(context, isNewTask: true);
                                  });
                                }, borderRadius: radius()),*/

                                ///end region
                                /* Image.asset('images/google.png', height: 22, width: 22).onTap(() async {
                                  await signInWithGoogle().then((user) {
                                    trackUserEvent(LOGIN_GOOGLE);
                                    getToast('Welcome ${user.data.name}');
                                    setValue(USER_NAME, user.data.name);
                                    setValue(USER_ID, wuser.data.id);
                                    setValue(USER_EMAIL, user.data.email);
                                    setValue(TOKEN, user.data.apiToken.validate());
                                    setValue(USER_TYPE, user.data.userType.validate());
                                    appStore.setLoggedIn(true);
                                    addScreenApi();
                                  });
                                }),*/

                                ///TODO Temporary hide register
                                ///start region
                                16.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(language!.dontHaveAnAccount, style: secondaryTextStyle()),
                                    6.width,
                                    TextButton(
                                      onPressed: () {
                                        RegisterScreen().launch(context);
                                      },
                                      child: Text(
                                        '${language!.clickHereToSignUp}',
                                        style: boldTextStyle(
                                          color: appStore.isDarkMode ? btnWhiteTextColor : btnBackgroundColor,
                                          weight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ButtonStyle(
                                        overlayColor: WidgetStateProperty.all(primaryButtonShadow),
                                      ),
                                    ).flexible(),
                                  ],
                                ),

                                ///end region
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
