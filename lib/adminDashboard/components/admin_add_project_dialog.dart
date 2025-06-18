import 'package:flutter_viz/adminDashboard/model/project_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class AdminAddProjectDialog extends StatefulWidget {
  static String tag = '/AdminAddProjectDialog';

  final Function()? onUpdate;
  final bool isEdit;
  final ProjectData? project;

  AdminAddProjectDialog({this.onUpdate, this.isEdit = false, this.project});

  @override
  AdminAddProjectDialogState createState() => AdminAddProjectDialogState();
}

class AdminAddProjectDialogState extends State<AdminAddProjectDialog> {
  TextEditingController projectController = TextEditingController();

  int page = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (widget.project != null && widget.isEdit) {
      projectController.text = widget.project!.name!;
    }
  }

  Future<void> addProjectApi() async {
    if (projectController.text.trim().isEmpty) return getToast("Project field is required");

    hideKeyboard(context);
    appStore.setLoading(true);
    Map req = {
      "id": widget.isEdit ? widget.project!.id : " ",
      "name": projectController.text.trim(),
      "status": widget.isEdit ? widget.project!.status : 0,
    };

    await addProject(req).then((value) {
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
                  Text('${widget.isEdit ? "Edit Project" : "Add Project"}', style: boldTextStyle(size: 20)),
                  CloseButton(),
                ],
              ),
              30.height,
              AppTextField(
                controller: projectController,
                textFieldType: TextFieldType.NAME,
                decoration: commonInputDecoration(hintName: "Project Name"),
                textStyle: primaryTextStyle(),
                autoFocus: false,
                maxLines: 1,
                maxLength: 15,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
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
                      addProjectApi();
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
