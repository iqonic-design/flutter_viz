import 'package:flutter_viz/adminDashboard/components/admin_add_project_dialog.dart';
import 'package:flutter_viz/adminDashboard/model/project_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/screen/admin_project_template_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class AdminProjectComponent extends StatefulWidget {
  static String tag = '/AdminProjectComponent';

  @override
  AdminProjectComponentState createState() => AdminProjectComponentState();
}

class AdminProjectComponentState extends State<AdminProjectComponent> {
  ScrollController scrollController = ScrollController();

  List<ProjectData> projectList = [];
  int? currentPage = 1;
  int? totalPage = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    projectListApi(currentPage);
  }

  ///project list api call
  Future<void> projectListApi(int? page) async {
    appStore.setLoading(true);

    await getProjectList(page: page, status: 0).then((value) async {
      appStore.setLoading(false);
      projectList.clear();
      projectList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;
      currentPage = value.pagination!.currentPage;
      if (projectList.isEmpty && currentPage != 1) {
        selectedIndex = 0;
        projectListApi(currentPage! - 1);
      }
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///delete project api call
  Future<void> deleteProjectApi(id) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
    };
    await deleteProject(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  ///release project api call
  Future<void> releaseProjectApi({int? id, int? status}) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
      "status": status,
    };
    await addProject(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
      projectListApi(currentPage);
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
              projectList.isNotEmpty
                  ? SingleChildScrollView(
                      controller: scrollController,
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
                          headingRowColor: WidgetStateColor.resolveWith((states) => centerBackgroundColor),
                          showCheckboxColumn: false,
                          dataTextStyle: primaryTextStyle(size: 14),
                          headingTextStyle: boldTextStyle(),
                          columns: [
                            DataColumn(label: Text('Project Id')),
                            DataColumn(label: Text('Project Name')),
                            DataColumn(label: Text("Created Date")),
                            DataColumn(label: Text("Updated Date")),
                            DataColumn(label: Text("Status")),
                            DataColumn(label: Text("Action")),
                          ],
                          rows: projectList.map<DataRow>((ProjectData item) {
                            return DataRow(cells: [
                              DataCell(
                                copyToClipBoardIcon(context, () {
                                  copyToClipboard(copyValue: item.id.toString(), message: "Project ID copied to clipboard");
                                }),
                              ),
                              DataCell(Text(item.name!)),
                              DataCell(
                                Text(getDateFormatted(DateTime.parse(item.createdAt!.validate()))),
                              ),
                              DataCell(
                                Text(getDateFormatted(DateTime.parse(item.updatedAt!.validate()))),
                              ),
                              DataCell(
                                item.status == 0
                                    ? Text('Draft', style: secondaryTextStyle(color: Colors.red)).onTap(() {
                                        releaseProjectApi(id: item.id, status: 1);
                                      })
                                    : Text('Release', style: secondaryTextStyle(color: btnBackgroundColor)).onTap(() {
                                        releaseProjectApi(id: item.id, status: 0);
                                      }),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    GestureDetector(
                                      child: tooltipView(
                                        child: Icon(Icons.play_arrow, color: btnBackgroundColor),
                                        message: 'Preview',
                                      ),
                                      onTap: () {
                                        appStore.setProjectId(item.id);
                                        AdminProjectTemplateScreen().launch(context);
                                      },
                                    ),
                                    8.width,
                                    tooltipView(
                                      child: editIcon(context, () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: AdminAddProjectDialog(
                                              onUpdate: () {
                                                projectListApi(currentPage);
                                              },
                                              isEdit: true,
                                              project: item,
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
                                          messageText: "Are you sure you want to delete Project? ",
                                          onAccept: () async {
                                            finish(context);
                                            await deleteProjectApi(item.id.validate());
                                            projectList.remove(item);
                                            projectListApi(currentPage);
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
                            return paginationWidget(index, selectedIndex).onTap(() {
                              selectedIndex = index;
                              setState(() {});
                              projectListApi(index + 1);
                            });
                          }),
                    ).visible(projectList.isNotEmpty),
                    addButtonRounded().onTap(
                      () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: AdminAddProjectDialog(
                              onUpdate: () {
                                projectListApi(currentPage);
                              },
                            ),
                          ),
                        );
                      },
                    ),
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
