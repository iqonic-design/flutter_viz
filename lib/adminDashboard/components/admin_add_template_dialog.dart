import 'package:flutter_viz/adminDashboard/model/categoryList_model.dart';
import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class AdminAddTemplateDialog extends StatefulWidget {
  static String tag = '/AdminAddTemplateDialog';
  final Function()? onUpdate;
  final bool isEdit;
  final TemplateData? template;
  final bool isProjectTemplate;

  AdminAddTemplateDialog({this.onUpdate, this.isEdit = false, this.template, this.isProjectTemplate = false});

  @override
  AdminAddTemplateDialogState createState() => AdminAddTemplateDialogState();
}

class AdminAddTemplateDialogState extends State<AdminAddTemplateDialog> {
  TextEditingController templateController = TextEditingController();
  List<CategoryData> categoryList = [];

  int page = -1;
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (widget.template != null && widget.isEdit) {
      selectedCategoryId = widget.template!.categoryId;
      templateController.text = widget.template!.name!;
    }
    categoryListApi(page);
  }

  Future<void> categoryListApi(int page) async {
    await getCategoryList(page, isShowAllCategory: true).then((value) async {
      categoryList.clear();
      categoryList.addAll(value.data!);

      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
    });
  }

  Future<void> addTemplateApi() async {
    if (selectedCategoryId == null)
      return getToast("Category field is required");
    else if (templateController.text.trim().isEmpty) return getToast("Template field is required");

    hideKeyboard(context);
    appStore.setLoading(true);
    Map req = {
      "id": widget.isEdit ? widget.template!.id : " ",
      "name": templateController.text.trim(),
      "category_id": selectedCategoryId,
      "status": widget.isEdit ? widget.template!.status : 0,
    };

    await addTemplate(req).then((value) {
      appStore.setLoading(false);
      finish(context);
      widget.onUpdate!.call();
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  Future<void> addProjectTemplateApi() async {
    if (templateController.text.trim().isEmpty) return getToast("Template field is required");

    hideKeyboard(context);
    appStore.setLoading(true);
    Map req = {
      "id": widget.isEdit ? widget.template!.id : " ",
      "name": templateController.text.trim(),
      "status": widget.isEdit ? widget.template!.status : 0,
      "project_template_id": appStore.projectId,
    };

    await addProjectTemplate(req).then((value) {
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
      height: widget.isProjectTemplate ? 200 : 350,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${widget.isEdit ? "Edit Template" : "Add Template"}', style: boldTextStyle(size: 20)),
                  CloseButton(),
                ],
              ),
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Category", style: boldTextStyle()),
                  16.height,
                  DropdownButtonFormField(
                    hint: Text("Select Category", style: primaryTextStyle()),
                    isDense: true,
                    decoration: commonInputDecoration(),
                    value: selectedCategoryId,
                    items: categoryList.map((CategoryData item) {
                      return new DropdownMenuItem(
                        value: item.id,
                        child: Text(
                          item.name!,
                          style: primaryTextStyle(),
                        ),
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      selectedCategoryId = value;
                    },
                  ),
                  30.height,
                  Text("Template Name", style: boldTextStyle()),
                  16.height,
                ],
              ).visible(!widget.isProjectTemplate),
              AppTextField(
                controller: templateController,
                textFieldType: TextFieldType.NAME,
                decoration: commonInputDecoration(hintName: "Template Name"),
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
                      widget.isProjectTemplate ? addProjectTemplateApi() : addTemplateApi();
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
