import 'package:flutter_viz/adminDashboard/model/categoryList_model.dart';
import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class AdminAddComponentDialog extends StatefulWidget {
  static String tag = '/AdminAddComponentDialog';
  final Function()? onUpdate;
  final bool isEdit;
  final TemplateData? component;

  AdminAddComponentDialog({this.onUpdate, this.isEdit = false, this.component});

  @override
  AdminAddComponentDialogState createState() => AdminAddComponentDialogState();
}

class AdminAddComponentDialogState extends State<AdminAddComponentDialog> {
  TextEditingController componentController = TextEditingController();
  List<CategoryData> categoryList = [];

  int page = -1;
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (widget.component != null && widget.isEdit) {
      selectedCategoryId = widget.component!.categoryId;
      componentController.text = widget.component!.name!;
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

  Future<void> addComponentApi() async {
    if (selectedCategoryId == null)
      return getToast("Category field is required");
    else if (componentController.text.trim().isEmpty) return getToast("Component field is required");

    hideKeyboard(context);
    appStore.setLoading(true);
    Map req = {
      "id": widget.isEdit ? widget.component!.id : " ",
      "name": componentController.text.trim(),
      "category_id": selectedCategoryId,
      "status": widget.isEdit ? widget.component!.status : 0,
    };

    await addComponent(req).then((value) {
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
      height: 300,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
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
                    child: Text(item.name!, style: primaryTextStyle()),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  selectedCategoryId = value;
                },
              ),
              30.height,
              Text("Component Name", style: boldTextStyle()),
              16.height,
              AppTextField(
                controller: componentController,
                textFieldType: TextFieldType.NAME,
                decoration: commonInputDecoration(hintName: "Component Name"),
                textStyle: primaryTextStyle(),
                autoFocus: true,
                maxLines: 1,
              ),
              30.height,
              Row(
                children: [
                  AppButton(
                    text: "Cancel",
                    color: btnBackgroundColor,
                    textStyle: boldTextStyle(color: white),
                    onTap: () {
                      finish(context);
                    },
                  ).expand(),
                  16.width,
                  AppButton(
                    text: "Save",
                    color: btnBackgroundColor,
                    textStyle: boldTextStyle(color: white),
                    onTap: () {
                      addComponentApi();
                    },
                  ).expand(),
                ],
              ),
            ],
          ),
          Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)),
        ],
      ),
    );
  }
}
