import 'package:flutter_viz/adminDashboard/components/admin_add_template_dialog.dart';
import 'package:flutter_viz/adminDashboard/components/admin_dashboard_previewScreen.dart';
import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/externalClasses/on_hover.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'mobile_view_screen.dart';

class AdminProjectTemplateScreen extends StatefulWidget {
  static String tag = '/AdminProjectTemplateScreen';

  @override
  AdminProjectTemplateScreenState createState() => AdminProjectTemplateScreenState();
}

class AdminProjectTemplateScreenState extends State<AdminProjectTemplateScreen> {
  List<TemplateData> projectTemplateList = [];
  int? currentPage = 1;
  int? totalPage = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    projectTemplateListApi(currentPage);

    LiveStream().on(getUpdatedData, (value) {
      if (value == true) {
        projectTemplateListApi(currentPage);
      }
    });
  }

  ///project Template list api call
  Future<void> projectTemplateListApi(int? page) async {
    appStore.setLoading(true);
    await getProjectTemplateList(appStore.projectId, page).then((value) async {
      appStore.setLoading(false);
      projectTemplateList.clear();
      projectTemplateList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;
      currentPage = value.pagination!.currentPage;
      if (projectTemplateList.isEmpty && currentPage != 1) {
        selectedIndex = 0;
        projectTemplateListApi(currentPage! - 1);
      }
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///delete project Template api call
  Future<void> deleteProjectTemplateApi(id) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
    };
    await deleteProjectTemplate(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  ///release Project template api call
  Future<void> releaseProjectTemplateApi({int? id, int? status}) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
      "status": status,
    };
    await addProjectTemplate(req).then((value) {
      appStore.setLoading(false);
      getToast(value.message!);
      projectTemplateListApi(currentPage);
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
      builder: (context) {
        return Scaffold(
          backgroundColor: context.cardColor,
          body: Responsive(
            mobile: MobileViewScreen(),
            web: SizedBox(
              width: context.width(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getHeaderLogoImage(),
                            16.width,
                            OnHover(builder: (isHovered) {
                              final color = isHovered ? primaryButtonHoverColor : btnBackgroundColor;
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: color,
                                  padding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
                                  elevation: COMMON_ELEVATION,
                                ),
                                child: tooltipView(
                                  message: language!.back,
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_back, color: isHovered ? btnWhiteTextColor : Colors.white),
                                      6.width,
                                      Text(language!.back, style: primaryTextStyle(color: btnWhiteTextColor)),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  appStore.selectedMenu = ADMIN_PROJECT_INDEX;
                                  finish(context);
                                },
                              );
                            })
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : menuShadowColor,
                      ),
                      Container(
                        color: centerBackgroundColor,
                        child: Stack(
                          children: [
                            projectTemplateList.isNotEmpty
                                ? SingleChildScrollView(
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
                                        dataRowMaxHeight: 45,                                        headingRowHeight: 40,
                                        horizontalMargin: 16,
                                        headingRowColor: WidgetStateColor.resolveWith((states) => centerBackgroundColor),
                                        showCheckboxColumn: false,
                                        dataTextStyle: primaryTextStyle(size: 14),
                                        headingTextStyle: boldTextStyle(),
                                        columns: [
                                          DataColumn(label: Text('Screen Id')),
                                          DataColumn(label: Text('Screen Name')),
                                          DataColumn(label: Text("Created Date")),
                                          DataColumn(label: Text("Updated Date")),
                                          DataColumn(label: Text('Status')),
                                          DataColumn(label: Text('Actions')),
                                        ],
                                        rows: projectTemplateList.map((TemplateData item) {
                                          return DataRow(cells: [
                                            DataCell(Text(item.id.toString().validate())),
                                            DataCell(Text(item.name.validate())),
                                            DataCell(
                                              Text(DateFormat.yMd().add_jm().format(DateTime.parse(item.createdAt!))),
                                            ),
                                            DataCell(
                                              Text(DateFormat.yMd().add_jm().format(DateTime.parse(item.updatedAt!))),
                                            ),
                                            DataCell(
                                              item.status == 0
                                                  ? Text('Draft', style: secondaryTextStyle(color: Colors.red)).onTap(() {
                                                      releaseProjectTemplateApi(id: item.id, status: 1);
                                                    })
                                                  : Text('Release', style: secondaryTextStyle(color: btnBackgroundColor)).onTap(() {
                                                      releaseProjectTemplateApi(id: item.id, status: 0);
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
                                                      appStore.screenTemplateData = item;
                                                      appStore.selectedMenu = WIDGETS_INDEX;
                                                      applyScreenJsonToView(item.screenData);
                                                      appStore.isComponent = false;
                                                      appStore.isProjectTemplate = true;
                                                      AdminDashboardPreviewScreen().launch(context);
                                                    },
                                                  ),
                                                  8.width,
                                                  tooltipView(
                                                    child: editIcon(context, () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) => AlertDialog(
                                                          content: AdminAddTemplateDialog(
                                                              onUpdate: () {
                                                                projectTemplateListApi(currentPage);
                                                              },
                                                              isEdit: true,
                                                              isProjectTemplate: true,
                                                              template: item),
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
                                                          await deleteProjectTemplateApi(item.id.validate());
                                                          projectTemplateList.remove(item);
                                                          projectTemplateListApi(currentPage);
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
                                            projectTemplateListApi(index + 1);
                                          });
                                        }),
                                  ).visible(projectTemplateList.isNotEmpty),
                                  addButtonRounded().onTap(() {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: AdminAddTemplateDialog(
                                          onUpdate: () {
                                            projectTemplateListApi(currentPage);
                                          },
                                          isProjectTemplate: true,
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            loadingAnimation().visible(appStore.isLoading).center(),
                          ],
                        ),
                      ).expand(),
                    ],
                  ).expand(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}