import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AddScreenDialog extends StatefulWidget {
  static String tag = '/AddScreenDialog';

  @override
  AddScreenDialogState createState() => AddScreenDialogState();
}

class AddScreenDialogState extends State<AddScreenDialog> {
  TextEditingController? screenController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    screenController = TextEditingController(text: appStore.selectedDropdownScreen!.name.validate());
  }

  Future<void> addScreenApi() async {
    if (screenController!.text.trim().isEmpty)
      return getToast(errorThisFieldRequired);
    else if (!screenController!.text.startsWith(RegExp(r'[A-Za-z]'))) return getToast(language!.screenNameValidationMsg);
    hideKeyboard(context);
    appStore.setLoading(true);

    Map req = {
      'user_id': (IS_TESTING_MODE) ? DUMMY_USER_ID : getIntAsync(USER_ID),
      'name': screenController!.text,
      'id': appStore.selectedScreenId,
    };

    await addScreen(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
      finish(context);
      appStore.updateScreenName(screenController!.text, appStore.selectedScreenId);
      appStore.fileName = screenController!.text;
      LiveStream().emit(updateScreenList);
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
    return addScreenDialogWidget(context, title: language!.editScreen, hintName: language!.screenName, controller: screenController, onSave: () {
      addScreenApi();
    });
  }
}
