import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class AddCloneProjectDialog extends StatefulWidget {
  static String tag = '/AddCloneProjectDialog';
  final Function()? onUpdate;
  final int? projectId;
  final String? projectName;
  final bool isEdit;

  AddCloneProjectDialog({this.onUpdate, this.projectId, this.projectName, this.isEdit = false});

  @override
  AddCloneProjectDialogState createState() => AddCloneProjectDialogState();
}

class AddCloneProjectDialogState extends State<AddCloneProjectDialog> {
  TextEditingController projectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (widget.isEdit) {
      projectController.text = widget.projectName!;
    }
  }

  /// project clone Api call
  Future<void> projectCloneApi() async {
    if (projectController.text.trim().isEmpty)
      return getToast(errorThisFieldRequired);
    else if (!projectController.text.startsWith(RegExp(r'^[0-9a-zA-Z]'))) return getToast(language!.projectNameValidationMsg);
    hideKeyboard(context);
    appStore.setLoading(true);

    Map req = {
      "project_id": widget.projectId.validate(),
      "name": projectController.text,
      "user_id": getIntAsync(USER_ID),
    };

    await projectClone(req).then((value) {
      trackUserEvent(PROJECT_CLONE);
      appStore.setProjectId(value.data!.id);
      appStore.setLoading(false);
      widget.onUpdate!.call();
      finish(context);
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  /// add UserProjectList Api call
  Future<void> editUserProjectApi() async {
    Map req = {
      "id": widget.isEdit ? widget.projectId : "",
      "name": projectController.text.trim(),
      "user_id": getIntAsync(USER_ID),
    };

    await addUserProject(req).then((value) {
      widget.onUpdate!.call();
      finish(context);
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
                  Text(widget.isEdit ? language!.editProjectName : language!.newProjectName, style: boldTextStyle(size: 20)),
                  CloseButton(),
                ],
              ),
              30.height,
              AppTextField(
                controller: projectController,
                maxLength: 15,
                textFieldType: TextFieldType.NAME,
                decoration: commonInputDecoration(hintName: language!.projectName),
                textStyle: primaryTextStyle(),
                autoFocus: false,
                maxLines: 1,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                ], // Only
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
                    onTap: () async {
                      if (widget.isEdit) {
                        editUserProjectApi();
                      } else {
                        projectCloneApi();
                      }
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
