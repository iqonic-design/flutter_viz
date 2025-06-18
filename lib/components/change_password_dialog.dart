import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class ChangePasswordDialog extends StatefulWidget {
  static String tag = '/ChangePasswordDialog';

  @override
  ChangePasswordDialogState createState() => ChangePasswordDialogState();
}

class ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final formKey = GlobalKey<FormState>();

  TextEditingController passController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  ///Change Password api call
  Future<void> changePasswordApi() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      appStore.setLoading(true);

      Map req = {
        "old_password": passController.text.trim(),
        "new_password": newPassController.text.trim(),
      };

      await changePassword(req).then((value) async {
        appStore.setLoading(false);
        finish(context);
        getToast(value.message!);
      }).catchError((e) {
        appStore.setLoading(false);
        getToast(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width() * 0.3,
        child: Stack(
          children: [
            AutofillGroup(
              onDisposeAction: AutofillContextAction.commit,
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(language!.changePassword, style: boldTextStyle(size: 20)),
                        CloseButton(),
                      ],
                    ),
                    16.height,
                    Text(language!.password, style: primaryTextStyle(size: 12)),
                    8.height,
                    AppTextField(
                      controller: passController,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: commonInputDecoration(),
                      textStyle: primaryTextStyle(),
                      autoFocus: false,
                      isPassword: true,
                      maxLines: 1,
                    ),
                    16.height,
                    Text(language!.newPassword, style: primaryTextStyle(size: 12)),
                    8.height,
                    AppTextField(
                      controller: newPassController,
                      textFieldType: TextFieldType.PASSWORD,
                      isPassword: true,
                      decoration: commonInputDecoration(),
                      textStyle: primaryTextStyle(),
                      autoFocus: false,
                      maxLines: 1,
                    ),
                    16.height,
                    Text(language!.confirmPassword, style: primaryTextStyle(size: 12)),
                    8.height,
                    AppTextField(
                      controller: confirmPassController,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: commonInputDecoration(),
                      textStyle: primaryTextStyle(),
                      autoFocus: false,
                      isPassword: true,
                      maxLines: 1,
                      validator: (String? value) {
                        if (value!.isEmpty) return errorThisFieldRequired;
                        if (value.length < passwordLengthGlobal) return '${language!.passwordLengthValidation}$passwordLengthGlobal';
                        if (value.trim() != newPassController.text.trim()) return language!.bothPasswordShouldBeMatched;
                        return null;
                      },
                      onFieldSubmitted: (s) {
                        changePasswordApi();
                      },
                    ),
                    30.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        dialogGrayBorderButton(
                          text: language!.cancel,
                          onTap: () {
                            finish(context);
                          },
                        ),
                        16.width,
                        dialogPrimaryColorButton(
                          text: language!.save,
                          onTap: () {
                            changePasswordApi();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
          ],
        ),
      ),
    );
  }
}
