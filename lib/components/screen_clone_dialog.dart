import 'dart:convert';

import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class ScreenCloneDialog extends StatefulWidget {
  static String tag = '/ScreenCloneDialog';

  final bool isEdit;

  ScreenCloneDialog({this.isEdit = false});

  @override
  ScreenCloneDialogState createState() => ScreenCloneDialogState();
}

class ScreenCloneDialogState extends State<ScreenCloneDialog> {
  TextEditingController screenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (widget.isEdit) {
      screenController.text = appStore.selectedDropdownScreen!.name!;
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  ///add screen api call
  Future<void> addScreenApi() async {
    trackUserEvent(SAVE_SCREEN);
    if (screenController.text.trim().isEmpty)
      return getToast(errorThisFieldRequired);
    else if (!screenController.text.startsWith(RegExp(r'[A-Za-z]'))) return getToast(language!.screenNameValidationMsg);
    hideKeyboard(context);
    appStore.setLoading(true);

    String? screenImage;
    screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
      screenImage = base64.encode(capturedImage!);

      Map<String, dynamic> rootScreenDataJson = await widgetClassToJsonData();
      Map req;
      if (widget.isEdit) {
        req = {
          'user_id': (IS_TESTING_MODE) ? DUMMY_USER_ID : getIntAsync(USER_ID),
          'name': screenController.text,
          'id': appStore.selectedScreenId,
        };
      } else {
        trackUserEvent(SCREEN_CLONE);
        req = {
          'user_id': getIntAsync(USER_ID),
          'name': screenController.text,
          'data': json.encode(rootScreenDataJson),
          'project_id': appStore.projectId,
          'screen_image': screenImage,
        };
      }
      await addScreen(req).then((value) {
        appStore.setLoading(false);
        getToast(value.message!);
        if (widget.isEdit) {
          appStore.updateScreenName(screenController.text, appStore.selectedScreenId);
          appStore.fileName = screenController.text;
        } else {
          appStore.screenList.add(ScreenListData(id: value.data!.id, name: req['name'], screenJsonData: req['data'], screenImage: screenImage));

          /// Showing added screen data
          appStore.selectedDropdownScreen = appStore.screenList[appStore.screenList.length - 1];
          appStore.setScreenDetails(appStore.screenList[appStore.screenList.length - 1]);
          applyScreenJsonToView(appStore.screenList[appStore.screenList.length - 1].screenJsonData);
        }
        LiveStream().emit(updateScreenList);
        finish(context);
      }).catchError((e) {
        appStore.setLoading(false);
        finish(context);
        getToast(e.toString());
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width() * 0.3,
      height: 200,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(language!.newScreenName, style: boldTextStyle(size: 20)),
                  CloseButton(),
                ],
              ),
              30.height,
              AppTextField(
                controller: screenController,
                textFieldType: TextFieldType.NAME,
                decoration: commonInputDecoration(hintName: 'Screen name'),
                textStyle: primaryTextStyle(),
                autoFocus: false,
                maxLines: 1,
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
                      addScreenApi();
                    },
                  ),
                ],
              ),
            ],
          ),
          Observer(builder: (_) => loadingAnimation().visible(appStore.isLoading)).center(),
        ],
      ),
    );
  }
}
