import 'dart:ui';

import 'package:flutter_viz/adminDashboard/components/admin_add_template_dialog.dart';
import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import 'admin_dashboard_previewScreen.dart';

class AdminTemplatesComponent extends StatefulWidget {
  static String tag = '/AdminTemplatesComponent';

  @override
  AdminTemplatesComponentState createState() => AdminTemplatesComponentState();
}

class AdminTemplatesComponentState extends State<AdminTemplatesComponent> {
  final ScrollController controller = ScrollController();
  List<TemplateData> templateList = [];

  int? currentPage = 1;
  int? totalPage = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    templateListApi(currentPage);
  }

  ///template list api call
  Future<void> templateListApi(int? page) async {
    appStore.setLoading(true);

    await getTemplateList(page).then((value) async {
      appStore.setLoading(false);
      templateList.clear();
      templateList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;
      currentPage = value.pagination!.currentPage;
      if (templateList.isEmpty && currentPage != 1) {
        selectedIndex = 0;
        templateListApi(currentPage! - 1);
      }
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///delete template api call
  Future<void> deleteTemplateApi(id) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
    };
    await deleteTemplate(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  ///release template api call
  Future<void> releaseTemplateApi({int? id, int? status}) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
      "status": status,
    };
    await addTemplate(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
      templateListApi(currentPage);
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
        return Container(
          color: centerBackgroundColor,
          child: Stack(
            children: [
              templateList.isNotEmpty
                  ? ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                        },
                      ),
                      child: SingleChildScrollView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: context.width(),
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(16),
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: context.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                            boxShadow: [
                              commonCardBoxShadow(),
                            ],
                          ),
                          child: DataTable(
                            dataRowMinHeight: 45,
                            dataRowMaxHeight: 45,
                            headingRowHeight: 40,
                            horizontalMargin: 16,
                            columnSpacing: 8,
                            headingRowColor: WidgetStateColor.resolveWith((states) => centerBackgroundColor),
                            showCheckboxColumn: false,
                            dataTextStyle: primaryTextStyle(size: 14),
                            headingTextStyle: boldTextStyle(),
                            columns: [
                              DataColumn(label: Text('Template Id')),
                              DataColumn(label: Text('Template Name')),
                              DataColumn(label: Text('Category Name')),
                              DataColumn(label: Text("Created Date")),
                              DataColumn(label: Text("Updated Date")),
                              DataColumn(label: Text('Status')),
                              DataColumn(label: Text('Actions')),
                            ],
                            rows: templateList.map<DataRow>((TemplateData item) {
                              return DataRow(cells: [
                                DataCell(
                                  copyToClipBoardIcon(context, () {
                                    copyToClipboard(copyValue: item.id.toString(), message: "Template ID copied to clipboard");
                                  }),
                                ),
                                DataCell(Text(item.name.validate())),
                                DataCell(Text(item.categoryName.validate())),
                                DataCell(
                                  Text(getDateFormatted(DateTime.parse(item.createdAt!.validate()))),
                                ),
                                DataCell(
                                  Text(getDateFormatted(DateTime.parse(item.updatedAt!.validate()))),
                                ),
                                DataCell(
                                  item.status == 0
                                      ? TextButton(
                                          child: Text('Draft', style: secondaryTextStyle(color: Colors.red)),
                                          onPressed: () {
                                            releaseTemplateApi(id: item.id, status: 1);
                                          })
                                      : TextButton(
                                          child: Text('Release', style: secondaryTextStyle(color: btnBackgroundColor)),
                                          onPressed: () {
                                            releaseTemplateApi(id: item.id, status: 0);
                                          }),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: tooltipView(
                                          message: 'Preview',
                                          child: IconButton(
                                            icon: Icon(Icons.play_arrow, color: btnBackgroundColor),
                                            onPressed: () {
                                              appStore.screenTemplateData = item;
                                              appStore.selectedMenu = WIDGETS_INDEX;
                                              applyScreenJsonToView(item.screenData);
                                              appStore.isComponent = false;
                                              appStore.isProjectTemplate = false;
                                              AdminDashboardPreviewScreen().launch(context);
                                            },
                                            splashRadius: 22,
                                          ),
                                        ),
                                      ),
                                      8.width,
                                      tooltipView(
                                        child: editIcon(context, () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              content: AdminAddTemplateDialog(
                                                onUpdate: () {
                                                  templateListApi(currentPage);
                                                },
                                                isEdit: true,
                                                template: item,
                                              ),
                                            ),
                                          );
                                        }),
                                        message: 'Edit',
                                      ),
                                      8.width,
                                      tooltipView(
                                        child: deleteIcon(context).onTap(() {
                                          deleteConfirmationDialog(
                                            context: context,
                                            messageText: "Are you sure you want to delete Template? ",
                                            onAccept: () async {
                                              finish(context);
                                              await deleteTemplateApi(item.id.validate());
                                              templateList.remove(item);
                                              templateListApi(currentPage);
                                              setState(() {});
                                            },
                                          );
                                        }),
                                        message: 'Delete',
                                      ),
                                    ],
                                  ),
                                ),
                              ]);
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  : Text('No Data Found', style: boldTextStyle()).visible(!appStore.isLoading).center(),
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
                                borderRadius: BorderRadius.all(Radius.circular(COMMON_BUTTON_BORDER_RADIUS)),
                                backgroundColor: selectedIndex == index ? btnBackgroundColor : Colors.grey,
                              ),
                              child: Text("${index + 1}", style: boldTextStyle(color: Colors.white)),
                            ).paddingOnly(left: 8).onTap(() {
                              selectedIndex = index;
                              setState(() {});
                              templateListApi(index + 1);
                            });
                          }),
                    ).visible(templateList.isNotEmpty),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: btnBackgroundColor),
                    ).onTap(() {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: AdminAddTemplateDialog(onUpdate: () {
                            templateListApi(currentPage);
                          }),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              loadingAnimation().visible(appStore.isLoading).center(),
            ],
          ),
        );
      },
    );
  }
}
