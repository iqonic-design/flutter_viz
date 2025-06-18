import 'package:flutter_viz/adminDashboard/model/categoryList_model.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class AddCategoryDialog extends StatefulWidget {
  static String tag = '/AddCategoryDialog';

  final Function()? onUpdate;
  final bool isEdit;
  final CategoryData? category;

  AddCategoryDialog({this.onUpdate, this.isEdit = false, this.category});

  @override
  AddCategoryDialogState createState() => AddCategoryDialogState();
}

class AddCategoryDialogState extends State<AddCategoryDialog> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController sequenceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (widget.category != null) {
      categoryController.text = widget.category!.name!;
      sequenceController.text = widget.category!.sequence.toString();
    }
  }

  Future<void> addCategoryApi() async {
    if (categoryController.text.trim().isEmpty || sequenceController.text.trim().isEmpty) return getToast(errorThisFieldRequired);

    hideKeyboard(context);
    appStore.setLoading(true);
    Map req;

    if (widget.isEdit) {
      req = {
        "id": widget.category!.id,
        "name": categoryController.text,
        "sequence": sequenceController.text,
      };
    } else {
      req = {
        "name": categoryController.text,
        "sequence": sequenceController.text,
      };
    }
    await addCategory(req).then((value) {
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
      width: context.width() * 0.3,
      height: 260,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${widget.isEdit ? "Edit Category" : "Add Category"}', style: boldTextStyle(size: 20)),
                  CloseButton(),
                ],
              ),
              30.height,
              AppTextField(
                controller: categoryController,
                textFieldType: TextFieldType.NAME,
                decoration: commonInputDecoration(hintName: "Category Name"),
                textStyle: primaryTextStyle(),
                maxLines: 1,
              ),
              16.height,
              AppTextField(
                controller: sequenceController,
                textFieldType: TextFieldType.OTHER,
                decoration: commonInputDecoration(hintName: "Sequence"),
                textStyle: primaryTextStyle(),
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
                    onTap: () {
                      addCategoryApi();
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
