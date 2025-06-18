import 'package:flutter_viz/model/login_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class EditNoOfProjectDialog extends StatefulWidget {
  static String tag = '/EditNoOfProjectDialog';
  final UserData? userData;
  final Function()? onUpdate;

  EditNoOfProjectDialog({this.userData, this.onUpdate});

  @override
  EditNoOfProjectDialogState createState() => EditNoOfProjectDialogState();
}

class EditNoOfProjectDialogState extends State<EditNoOfProjectDialog> {
  TextEditingController noOfProjectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    noOfProjectController.text = widget.userData!.noOfProject != null ? widget.userData!.noOfProject.toString() : "3";
  }

  /// edit profile api call
  Future editProfileApi() async {
    appStore.setLoading(true);
    hideKeyboard(context);
    Map req = {
      'id': widget.userData!.id,
      'email': widget.userData!.email,
      'no_of_project': noOfProjectController.text.toInt(),
    };
    await updateProfile(req).then((value) {
      appStore.setLoading(false);
      finish(context);
      widget.onUpdate!.call();
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.message);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width() * 0.30,
      height: 200,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("No. of Projects", style: boldTextStyle(size: 20)),
                  CloseButton(),
                ],
              ),
              30.height,
              AppTextField(
                controller: noOfProjectController,
                textFieldType: TextFieldType.OTHER,
                decoration: commonInputDecoration(hintName: "No. of Projects"),
                textStyle: primaryTextStyle(),
                autoFocus: false,
                maxLines: 1,
                maxLength: 15,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  dialogGrayBorderButton(
                      text: "Cancel",
                      onTap: () {
                        finish(context);
                      }),
                  16.width,
                  dialogPrimaryColorButton(
                    text: "Save",
                    onTap: () async {
                      await editProfileApi();
                    },
                  ),
                ],
              ),
            ],
          ),
          Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
        ],
      ),
    );
  }
}
