 import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class MobileViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Image.asset(
              'images/flutterviz_bg.jpg',
              fit: BoxFit.fill,
              width: context.width(),
              height: context.height() * 0.3,
            ),
            Container(
              color: context.cardColor,
              width: context.width(),
              height: context.height() * 0.7,
            ),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/desktop.png', height: 250, width: 250),
              30.height,
              Text(language!.desktopOnly, style: boldTextStyle(size: 24)),
              30.height,
              Text(language!.youAreSignInButItSeemsInMobileDevice, style: primaryTextStyle(size: 14)).paddingOnly(left: 16),
              30.height,
              Image.asset(getAppLogo, width: 100),
              16.height,
            ],
          ),
        ),
      ],
    );
  }
}
