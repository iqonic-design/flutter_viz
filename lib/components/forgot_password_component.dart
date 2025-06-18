import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/AppWidget.dart';

class ForgotPasswordComponent extends StatelessWidget {
  const ForgotPasswordComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset('images/forgot_password_confirmation.json', height: 180, width: 180, fit: BoxFit.cover),
        32.height,
        Text(language!.checkYourMail, style: boldTextStyle(size: 24, color: btnBackgroundColor)),
        16.height,
        Text(language!.weHaveSentPasswordRecover, style: secondaryTextStyle()),
        32.height,
        dialogPrimaryColorButton(
          text: language!.ok,
          onTap: () {
            finish(context);
          },
        )
      ],
    );
  }
}
