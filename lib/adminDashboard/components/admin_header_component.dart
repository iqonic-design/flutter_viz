import 'package:flutter_viz/externalClasses/on_hover.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/screen/login_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminHeaderComponent extends StatefulWidget {
  static String tag = '/AdminHeaderComponent';

  final Function()? onUpdate;

  AdminHeaderComponent({this.onUpdate});

  @override
  AdminHeaderComponentState createState() => AdminHeaderComponentState();
}

class AdminHeaderComponentState extends State<AdminHeaderComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: headerBackgroundColor,
      ),
      child: Row(
        children: [
          getHeaderLogoImage(),
          OnHover(
            builder: (isHovered) {
              return elevationButtonWithIcon(
                isHovered: isHovered,
                toolTipMessage: "Logout",
                icon: Icons.logout,
                title: "Logout",
                onPressed: () async {
                  await showConfirmDialog(
                    context,
                    "Are you sure you want to logout?",
                    onAccept: () async {
                      await removeKey(IS_LOGGED_IN);
                      await removeKey(USER_NAME);
                      await removeKey(USER_EMAIL);
                      await removeKey(USER_ID);
                      await removeKey(USER_TYPE);
                      await appStore.setLoggedIn(false);

                      LoginScreen().launch(context, isNewTask: true);
                    },
                    buttonColor: DEFAULT_TEXT_COLOR,
                    positiveText: "Yes",
                    negativeText: "No",
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
