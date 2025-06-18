import 'package:flutter_viz/adminDashboard/components/edit_no_of_project_dialog.dart';
import 'package:flutter_viz/adminDashboard/components/project_list_dialog.dart';
import 'package:flutter_viz/externalClasses/on_hover.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/login_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminUsersComponent extends StatefulWidget {
  static String tag = '/AdminUsersComponent';

  @override
  AdminUsersComponentState createState() => AdminUsersComponentState();
}

class AdminUsersComponentState extends State<AdminUsersComponent> {
  ScrollController controller = ScrollController();
  List<int> perPageUserList = [10, 50, 100, 500];
  List<UserData> userList = [];
  DateTimeRange? selectedDateRange;

  int page = 1;
  int perPage = 100;
  int totalPage = 1;
  int totalUser = 0;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    userListApi(page);
  }

  ///user list api call
  Future<void> userListApi(int page, {String? startDate, String? endDate}) async {
    appStore.setLoading(true);

    await getUserList(page, perPage: perPage, startDate: startDate, endDate: endDate).then((value) async {
      appStore.setLoading(false);
      userList = value.data.validate();

      totalPage = value.pagination!.totalPages.validate();
      totalUser = value.pagination!.totalItems.validate();

      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        color: centerBackgroundColor,
        child: Stack(
          children: [
            if (userList.isNotEmpty && !appStore.isLoading)
              Container(
                width: context.width(),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.fromLTRB(16, 60, 16, 60),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: context.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                  boxShadow: [
                    commonCardBoxShadow(),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: controller,
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
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Email")),
                      DataColumn(label: Text("First Seen")),
                      DataColumn(label: Text("Last Seen")),
                      DataColumn(label: Text("Projects Allowed")),
                      DataColumn(label: Text("Actions")),
                    ],
                    rows: userList.map<DataRow>((UserData item) {
                      return DataRow(cells: [
                        DataCell(
                          copyToClipBoardIcon(context, () {
                            copyToClipboard(copyValue: item.id.toString(), message: "User ID copied to clipboard");
                          }),
                        ),
                        DataCell(Text(item.name.validate())),
                        DataCell(SelectableText(item.email.validate())),
                        DataCell(Text(getDateFormatted(DateTime.parse(item.createdAt!.validate())))),
                        DataCell(Text(getDateFormatted(DateTime.parse(item.updatedAt!.validate())))),
                        DataCell(
                          Row(
                            children: [
                              Text('${item.noOfProject ?? DEFAULT_PROJECT_NO}'),
                              16.width,
                              editIcon(context, () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: EditNoOfProjectDialog(
                                      userData: item,
                                      onUpdate: () {
                                        userListApi(page);
                                      },
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                        DataCell(TextButton(
                          child: Text("View", style: primaryTextStyle(color: btnBackgroundColor)),
                          onPressed: () async {
                            appStore.setPreviewCode(true);
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: ProjectListDialog(userId: item.id),
                              ),
                            );
                          },
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            if (userList.isEmpty && !appStore.isLoading) Text("No User Found", style: boldTextStyle()).center(),
            if (appStore.isLoading) loadingAnimation().center(),
            if (userList.isNotEmpty && !appStore.isLoading)
              Positioned(
                top: 10,
                right: 16,
                left: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Users: $totalUser', style: primaryTextStyle()),
                    Row(
                      children: [
                        DropdownButton<int>(
                          items: perPageUserList.map((e) {
                            return DropdownMenuItem(
                              child: Text(e.toString(), style: primaryTextStyle()),
                              value: e,
                            );
                          }).toList(),
                          underline: Offstage(),
                          value: perPage,
                          onChanged: (val) {
                            perPage = val.validate(value: 100);
                            page = 1;

                            init();
                          },
                        ),
                        OnHover(builder: (isHovered) {
                          return Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isHovered ? primaryButtonHoverColor : btnBackgroundColor,
                                elevation: COMMON_BUTTON_ELEVATION,
                                padding: EdgeInsets.symmetric(horizontal: COMMON_HORIZONTAL_PADDING, vertical: COMMON_VERTICAL_PADDING),
                                shadowColor: primaryButtonShadow,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS)),
                              ),
                              child: Text("Filter", style: TextStyle(color: btnWhiteTextColor, fontSize: btnTextSize)),
                              onPressed: () async {
                                await dateTimeRangePicker(context, initialDateRange: selectedDateRange).then((value) async {
                                  if (value != null) {
                                    selectedDateRange = value;
                                    userListApi(
                                      page,
                                      startDate: getDateFormatted(selectedDateRange!.start, dateFormat: DATE_FORMAT_4),
                                      endDate: getDateFormatted(selectedDateRange!.end, dateFormat: DATE_FORMAT_4),
                                    );
                                    setState(() {});
                                  }
                                });
                              },
                            ),
                          ).paddingLeft(16);
                        }),
                        8.width,
                        if (selectedDateRange != null)
                          Row(
                            children: [
                              Text('From: ${getDateFormatted(selectedDateRange!.start, dateFormat: DATE_FORMAT_2)}', style: secondaryTextStyle()),
                              4.width,
                              Text('- To: ${getDateFormatted(selectedDateRange!.end, dateFormat: DATE_FORMAT_2)}', style: secondaryTextStyle()),
                              16.width,
                            ],
                          ),
                        if (selectedDateRange != null)
                          closeIcon().onTap(() {
                            selectedDateRange = null;
                            setState(() {
                              userListApi(page);
                            });
                          })
                      ],
                    ),
                  ],
                ),
              ),
            Positioned(
              left: 16,
              bottom: 16,
              child: SizedBox(
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
                        borderRadius: BorderRadius.all(Radius.circular(COMMON_BORDER_RADIUS)),
                        backgroundColor: selectedIndex == index ? btnBackgroundColor : Colors.grey,
                      ),
                      child: Text("${index + 1}", style: boldTextStyle(color: Colors.white)),
                    ).paddingOnly(left: 8).onTap(() {
                      selectedIndex = index;
                      setState(() {});
                      userListApi(index + 1);
                    });
                  },
                ),
              ),
            ).visible(userList.isNotEmpty),
          ],
        ),
      );
    });
  }
}