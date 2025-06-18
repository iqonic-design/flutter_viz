import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import '../model/tutorials_model.dart';

class AdminTutorialsDialog extends StatefulWidget {
  static String tag = '/AdminTutorialsDialog';
  final Function()? onUpdate;

  AdminTutorialsDialog({this.onUpdate});

  @override
  AdminTutorialsDialogState createState() => AdminTutorialsDialogState();
}

class AdminTutorialsDialogState extends State<AdminTutorialsDialog> {
  TextEditingController tutorialNameController = TextEditingController();
  TextEditingController tutorialDescriptionController = TextEditingController();
  TextEditingController tutorialUrlController = TextEditingController();
  TextEditingController thumbnailController = TextEditingController();

  FocusNode tutorialNameNode = FocusNode();
  FocusNode tutorialDescriptionNode = FocusNode();
  FocusNode tutorialsUrlNode = FocusNode();
  FocusNode thumbnailNode = FocusNode();

  List<TutorialsData> tutorialsList = [];

  int page = 1;
  int totalPage = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  Future<void> addTutorialsApi() async {
    if (tutorialNameController.text.isEmptyOrNull)
      return getToast("Name field is required");
    else if (tutorialDescriptionController.text.trim().isEmptyOrNull)
      return getToast("Description field is required");
    else if (tutorialUrlController.text.trim().isEmptyOrNull) {
      return getToast("UrL field is required");
    } else if (thumbnailController.text.trim().isEmptyOrNull) {
      return getToast("Thumbnail field is required");
    } else if (!Uri.parse(tutorialUrlController.text).isAbsolute) {
      return getToast("Please enter valid url");
    }
    hideKeyboard(context);

    appStore.setLoading(true);
    Map req = {"title": tutorialNameController.text.trim(), "description": tutorialDescriptionController.text.trim(), "url": tutorialUrlController.text.trim(), "thumbnail": thumbnailController.text.trim()};
    await addTutorial(req).then((value) {
      appStore.setLoading(false);
      finish(context);
      widget.onUpdate!.call();
      getToast(value.message!);
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
    return Container(
      width: context.width() * 0.40,
      height: 430,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add Tutorials", style: boldTextStyle(size: 20)),
                    CloseButton(),
                  ],
                ),
                16.height,
                Text("Name", style: boldTextStyle()),
                16.height,
                AppTextField(
                  controller: tutorialNameController,
                  textFieldType: TextFieldType.NAME,
                  decoration: commonInputDecoration(hintName: "Tutorial Name"),
                  textStyle: primaryTextStyle(),
                  autoFocus: false,
                  maxLines: 1,
                ),
                16.height,
                Text("Description", style: boldTextStyle()),
                16.height,
                AppTextField(
                  controller: tutorialDescriptionController,
                  textFieldType: TextFieldType.NAME,
                  decoration: commonInputDecoration(hintName: "Tutorial Description"),
                  textStyle: primaryTextStyle(),
                  autoFocus: false,
                  maxLines: 1,
                ),
                16.height,
                Text("Url", style: boldTextStyle()),
                16.height,
                AppTextField(
                  controller: tutorialUrlController,
                  textFieldType: TextFieldType.NAME,
                  decoration: commonInputDecoration(hintName: "Tutorial URL"),
                  textStyle: primaryTextStyle(),
                  autoFocus: false,
                  maxLines: 1,
                ),
                16.height,
                Text("Thumbnail", style: boldTextStyle()),
                16.height,
                AppTextField(
                  controller: thumbnailController,
                  textFieldType: TextFieldType.NAME,
                  decoration: commonInputDecoration(hintName: "Tutorial Thumbnail"),
                  textStyle: primaryTextStyle(),
                  autoFocus: false,
                  maxLines: 1,
                ),
                30.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    dialogGrayBorderButton(
                      text: "Cancel",
                      onTap: () {
                        finish(context);
                      },
                    ),
                    16.width,
                    dialogPrimaryColorButton(
                      text: "Save",
                      onTap: () async {
                        addTutorialsApi();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
        ],
      ),
    );
  }
}
