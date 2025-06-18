import 'package:flutter_viz/adminDashboard/components/admin_add_component_dialog.dart';
import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import 'admin_dashboard_previewScreen.dart';

class AdminPreDefineComponent extends StatefulWidget {
  static String tag = '/AdminPreDefineComponent';

  @override
  AdminPreDefineComponentState createState() => AdminPreDefineComponentState();
}

class AdminPreDefineComponentState extends State<AdminPreDefineComponent> {
  int? currentPage = 1;
  int? totalPage = 1;
  List<TemplateData> componentList = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    componentListApi(currentPage);
  }

  ///component list api call
  Future<void> componentListApi(int? page) async {
    appStore.setLoading(true);

    await getComponentList(page).then((value) async {
      appStore.setLoading(false);
      componentList.clear();
      componentList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;
      currentPage = value.pagination!.currentPage;
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///delete component api call
  Future<void> deleteComponentApi(id) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
    };
    await deleteComponent(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  ///release component api call
  Future<void> releaseComponentApi({int? id, int? status}) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
      "status": status,
    };
    await addComponent(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
      componentListApi(currentPage);
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
    return Observer(
      builder: (_) {
        return Stack(
          children: [
            componentList.isNotEmpty
                ? Container(
                    width: context.width(),
                    margin: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: DataTable(
                        dataRowMinHeight: 45,
                        dataRowMaxHeight: 45,
                        headingRowHeight: 40,
                        horizontalMargin: 16,
                        headingRowColor: WidgetStateColor.resolveWith((states) => Colors.grey.withValues(alpha: 0.2)),
                        showCheckboxColumn: false,
                        dataTextStyle: primaryTextStyle(size: 14),
                        decoration: boxDecorationWithShadow(),
                        headingTextStyle: boldTextStyle(color: Colors.black54),
                        columns: [
                          DataColumn(label: Text("Component Name")),
                          DataColumn(label: Text("Category Name")),
                          DataColumn(label: Text("Created Date")),
                          DataColumn(label: Text("Status")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows: componentList.map<DataRow>((TemplateData item) {
                          return DataRow(cells: [
                            DataCell(Text(item.name.validate())),
                            DataCell(Text(item.categoryName.validate())),
                            DataCell(
                              Text(getDateFormatted(DateTime.parse(item.createdAt!.validate()))),
                            ),
                            DataCell(
                              item.status == 0
                                  ? Text(
                                      "Draft",
                                      style: secondaryTextStyle(color: Colors.red),
                                    ).onTap(() {
                                      releaseComponentApi(id: item.id, status: 1);
                                    })
                                  : Text(
                                      "Release",
                                      style: secondaryTextStyle(color: btnBackgroundColor),
                                    ).onTap(() {
                                      releaseComponentApi(id: item.id, status: 0);
                                    }),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  GestureDetector(
                                    child: tooltipView(
                                      child: Icon(Icons.play_arrow, color: btnBackgroundColor),
                                      message: "Preview",
                                    ),
                                    onTap: () {
                                      appStore.screenTemplateData = item;
                                      appStore.selectedMenu = WIDGETS_INDEX;
                                      applyScreenJsonToView(item.screenData);
                                      appStore.isComponent = true;
                                      appStore.isProjectTemplate = false;
                                      AdminDashboardPreviewScreen().launch(context);
                                    },
                                  ),
                                  8.width,
                                  tooltipView(
                                    child: Icon(Icons.edit_outlined, color: Colors.green),
                                    message: "Edit",
                                  ).onTap(() {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Edit Component", style: boldTextStyle()).center(),
                                        content: AdminAddComponentDialog(
                                            onUpdate: () {
                                              componentListApi(currentPage);
                                            },
                                            isEdit: true,
                                            component: item),
                                      ),
                                    );
                                  }),
                                  8.width,
                                  tooltipView(
                                    child: Icon(Icons.delete_forever_outlined, color: Colors.red).onTap(() {
                                      showConfirmDialog(
                                        context,
                                        "Are you sure you want to delete Component? ",
                                        onAccept: () async {
                                          await deleteComponentApi(item.id.validate());
                                          componentList.remove(item);
                                          setState(() {});
                                        },
                                        buttonColor: Colors.red,
                                        positiveText: "Delete",
                                        negativeText: "Cancel",
                                      );
                                    }),
                                    message: "Delete",
                                  ),
                                ],
                              ),
                            ),
                          ]);
                        }).toList(),
                      ),
                    ),
                  )
                : Text("No Data Found", style: boldTextStyle()).visible(!appStore.isLoading).center(),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(right: 8),
                        itemCount: totalPage,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 30,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              backgroundColor: selectedIndex == index ? btnBackgroundColor : Colors.grey,
                            ),
                            child: Text("${index + 1}", style: boldTextStyle(color: Colors.white)),
                          ).paddingOnly(left: 8).onTap(() {
                            selectedIndex = index;
                            setState(() {});
                            componentListApi(index + 1);
                          });
                        }),
                  ).visible(componentList.isNotEmpty),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: btnBackgroundColor),
                  ).onTap(() {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Add Component", style: boldTextStyle()).center(),
                        content: AdminAddComponentDialog(onUpdate: () {
                          componentListApi(currentPage);
                        }),
                      ),
                    );
                  }),
                ],
              ),
            ),
            loadingAnimation().visible(appStore.isLoading).center(),
          ],
        );
      },
    );
  }
}
