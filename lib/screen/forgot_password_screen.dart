import 'package:flutter_viz/components/forgot_password_component.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String tag = '/ForgotPasswordScreen';

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  bool isShowConfirmWidget = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  ///Forgot Password api
  Future<void> forgotPasswordApi() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      appStore.setLoading(true);
      hideKeyboard(context);
      Map req = {"email": emailController.text.trim()};

      await forgotPassword(req).then((value) async {
        appStore.setLoading(false);
        isShowConfirmWidget = true;
        setState(() {});
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
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          !isShowConfirmWidget
              ? Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(alignment: Alignment.topRight, child: CloseButton()),
                      16.height,
                      Text(language!.forgotPassword, style: boldTextStyle(size: 24, color: btnBackgroundColor)),
                      8.height,
                      Text(language!.enterYourRegisteredEmail, style: secondaryTextStyle()),
                      32.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language!.email, style: secondaryTextStyle()),
                          8.height,
                          AppTextField(
                            controller: emailController,
                            textFieldType: TextFieldType.EMAIL,
                            decoration: commonInputDecoration(),
                            textStyle: primaryTextStyle(),
                            autoFocus: false,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      32.height,
                      Observer(
                        builder: (context) {
                          return dialogPrimaryColorButton(
                            text: language!.submit,
                            onTap: () {
                              forgotPasswordApi();
                            },
                            child: appStore.isLoading ? loadingAnimation(widgetHeight: 30, widgetWidth: 120, isWhite: true) : null,
                          );
                        },
                      )
                    ],
                  ),
                )
              : ForgotPasswordComponent(),
        ],
      ),
    );
  }
}
