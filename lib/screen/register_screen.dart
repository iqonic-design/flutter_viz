import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/screen/login_screen.dart';
import 'package:flutter_viz/screen/welcome_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/UpperCaseTextFormatter.dart';

class RegisterScreen extends StatefulWidget {
  static String tag = '/register';

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController inviteCodeController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode inviteCodeNode = FocusNode();

  String? _token = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    trackScreenView(REGISTER_SCREEN);
    GRecaptchaV3.hideBadge();
  }

  Future<void> getToken() async {
    String token = await GRecaptchaV3.execute('submit') ?? 'null returned';
    setState(() {
      _token = token;
      getToast(_token.toString());
    });
    await recaptchaTokenApi();
  }

  Future<void> signUp() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      appStore.setLoading(true);

      Map req = {
        'email': emailController.text,
        'name': nameController.text,
        'password': passwordController.text,
      };
      await register(req).then((value) {
        trackUserEvent(REGISTER);
        appStore.setLoading(false);
        setValue(USER_TYPE, USER);
        setValue(IS_FIRST_TIME_LOGIN, true);
        appStore.setLanguage(defaultLanguage);
        appStore.setDarkMode(true);
        WelcomeScreen().launch(context, isNewTask: true);
      }).catchError((e) {
        appStore.setLoading(false);
        getToast(e.toString());
      });
    }
  }

  Future<void> recaptchaTokenApi() async {
    hideKeyboard(context);
    appStore.setLoading(true);
    Map req = {
      "secret": CAPTACHA_SECRET_KEY,
      "response": _token,
    };

    await recaptchaApi(req).then((value) {
      toast("value here$value");
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
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              'images/flutterviz_bg.jpg',
              height: context.height(),
              width: context.width(),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Observer(
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: context.width() * 0.1, horizontal: context.width() * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(getAppLogo, width: 300),
                        versionNameWidget(),
                        28.height,
                        Text(
                          language!.createYourFlutterVizAccount,
                          style: secondaryTextStyle(size: 16),
                        ),
                        8.height,
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(language!.name, style: secondaryTextStyle()),
                                  8.height,
                                  AppTextField(
                                      controller: nameController,
                                      textFieldType: TextFieldType.NAME,
                                      focus: nameNode,
                                      nextFocus: emailNode,
                                      maxLines: 1,
                                      autoFocus: false,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      decoration: commonInputDecoration()),
                                  8.height,
                                  Text(language!.email, style: secondaryTextStyle()),
                                  8.height,
                                  AppTextField(
                                    controller: emailController,
                                    textFieldType: TextFieldType.EMAIL,
                                    focus: emailNode,
                                    nextFocus: passwordNode,
                                    maxLines: 1,
                                    autoFocus: false,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: commonInputDecoration(),
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return errorThisFieldRequired;
                                      } else if (!hasMatch(v, r"\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b")) {
                                        return "Invalid";
                                      }
                                      return null;
                                    },
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
                                    nextFocus: inviteCodeNode,
                                    suffixIconColor: context.iconColor,
                                    maxLines: 1,
                                    autoFocus: false,
                                    textAlign: TextAlign.start,
                                    decoration: commonInputDecoration(),
                                    onFieldSubmitted: (s) {
                                      signUp();
                                    },
                                  ),
                                  16.height,
                                  Text(language!.inviteCode, style: secondaryTextStyle()),
                                  8.height,
                                  AppTextField(
                                    controller: inviteCodeController,
                                    textFieldType: TextFieldType.USERNAME,
                                    inputFormatters: [
                                      UpperCaseTextFormatter(),
                                    ],
                                    focus: inviteCodeNode,
                                    maxLines: 1,
                                    autoFocus: false,
                                    textAlign: TextAlign.start,
                                    textCapitalization: TextCapitalization.characters,
                                    decoration: commonInputDecoration(),
                                    validator: (s) {
                                      if (s!.isEmpty) return errorThisFieldRequired;
                                      if (s != INVITE_CODE) return 'Invalid Invite Code';

                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              30.height,
                              dialogPrimaryColorButton(
                                width: context.width(),
                                text: language!.signUp,
                                onTap: () {
                                  signUp();
                                },
                                child: appStore.isLoading ? loadingAnimation(widgetWidth: 45, widgetHeight: 45).center() : null,
                              ),
                              16.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(language!.alreadyAnAccount, style: secondaryTextStyle()),
                                  6.width,
                                  TextButton(
                                    onPressed: () {
                                      if (Navigator.canPop(context)) {
                                        finish(context);
                                      } else {
                                        LoginScreen().launch(context);
                                      }
                                    },
                                    child: Text(
                                      '${language!.signIn}',
                                      style: boldTextStyle(
                                        color: appStore.isDarkMode ? btnWhiteTextColor : btnBackgroundColor,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      overlayColor: WidgetStateProperty.all(primaryButtonShadow),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
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
