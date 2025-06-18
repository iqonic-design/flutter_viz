import 'package:flutter_viz/adminDashboard/model/dashBoard_card_model.dart';
import 'package:flutter_viz/adminDashboard/model/dashBoard_model.dart';
import 'package:flutter_viz/adminDashboard/model/feed_back_model.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/login_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'chart/bar_chart_graph.dart';

class AdminDashboardComponent extends StatefulWidget {
  static String tag = '/AdminDashboardComponent';

  @override
  AdminDashboardComponentState createState() => AdminDashboardComponentState();
}

class AdminDashboardComponentState extends State<AdminDashboardComponent> {
  DashBoardModel? dashBoardModel;
  List<DashBoardCardModel> dashBoardCardList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    dashboardApi();
  }

  ///dashboard List api call
  Future<void> dashboardApi() async {
    appStore.setLoading(true);
    await getDashBoardList().then((value) async {
      appStore.setLoading(false);
      dashBoardModel = value;
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
    return Container(
      color: centerBackgroundColor,
      width: context.width(),
      child: Stack(
        children: [
          if (dashBoardModel != null)
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Image.asset(
                            'images/flutterviz_bg.jpg',
                            height: 180,
                            width: context.width(),
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRectOnly(bottomLeft: COMMON_CARD_BORDER_RADIUS.toInt(), bottomRight: COMMON_CARD_BORDER_RADIUS.toInt()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello,", style: primaryTextStyle(color: Colors.white, size: 34)),
                              8.height,
                              Text(
                                "We are on a mission to help developers like you build successful projects for FREE.",
                                style: secondaryTextStyle(color: Colors.white),
                              ),
                            ],
                          ).paddingAll(32),
                        ],
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -36, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                },
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  child: Row(
                                    children: [
                                      32.width,
                                      getTotalCountWidget(
                                        context,
                                        icon: 'images/icon_user.png',
                                        title: "Total Users",
                                        total: dashBoardModel!.userCount.validate(),
                                      ),
                                      32.width,
                                      getTotalCountWidget(
                                        context,
                                        icon: 'images/icon_categories.png',
                                        title: "Total Categories",
                                        total: dashBoardModel!.categoryCount.validate(),
                                      ),
                                      32.width,
                                      getTotalCountWidget(
                                        context,
                                        icon: 'images/icon_page.png',
                                        title: "Total Screen",
                                        total: dashBoardModel!.screenCount.validate(),
                                      ),
                                      32.width,
                                      getTotalCountWidget(
                                        context,
                                        icon: 'images/feedback_icon.png',
                                        title: "Total Feedback",
                                        total: dashBoardModel!.feedbackCount.validate(),
                                      ),
                                      32.width,
                                      getTotalCountWidget(
                                        context,
                                        icon: 'images/icon_page.png',
                                        title: "Total Template",
                                        total: dashBoardModel!.feedbackCount.validate(),
                                      ),
                                      32.width,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: context.width(), child: BarChartGraph(data: dashBoardModel!.userWeekReport)),
                                32.height,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: context.scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                        boxShadow: [
                                          commonCardBoxShadow(),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text("Recent Users", style: boldTextStyle(size: 18)),
                                          16.height,
                                          ScrollConfiguration(
                                            behavior: ScrollConfiguration.of(context).copyWith(
                                              dragDevices: {
                                                PointerDeviceKind.mouse,
                                                PointerDeviceKind.touch,
                                              },
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: DataTable(
                                                dataRowMinHeight: 45,
                                                dataRowMaxHeight: 45,
                                                headingRowHeight: 40,
                                                horizontalMargin: 16,
                                                headingRowColor: WidgetStateColor.resolveWith((states) => centerBackgroundColor),
                                                showCheckboxColumn: false,
                                                headingTextStyle: boldTextStyle(),
                                                columns: [
                                                  DataColumn(label: Text("User Id")),
                                                  DataColumn(label: Text("User Name")),
                                                  DataColumn(label: Text("Registered")),
                                                ],
                                                rows: dashBoardModel!.userList!.map<DataRow>((UserData item) {
                                                  return DataRow(cells: [
                                                    DataCell(
                                                      copyToClipBoardIcon(context, () {
                                                        copyToClipboard(copyValue: item.id.toString(), message: "User ID copied to clipboard");
                                                      }),
                                                    ),
                                                    DataCell(
                                                      Container(
                                                        width: 100,
                                                        child: Text(item.name.validate()),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Container(
                                                        width: 140,
                                                        child: Text(
                                                          getDateFormatted(DateTime.parse(item.createdAt!)),
                                                        ),
                                                      ),
                                                    ),
                                                  ]);
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).expand(flex: 3),
                                    32.width,
                                    Container(
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: context.scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
                                        boxShadow: [
                                          commonCardBoxShadow(),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text("Recent Feedback", style: boldTextStyle(size: 18)),
                                          16.height,
                                          ScrollConfiguration(
                                            behavior: ScrollConfiguration.of(context).copyWith(
                                              dragDevices: {
                                                PointerDeviceKind.mouse,
                                                PointerDeviceKind.touch,
                                              },
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: DataTable(
                                                dataRowMinHeight: 45,
                                                dataRowMaxHeight: 45,
                                                headingRowHeight: 40,
                                                horizontalMargin: 16,
                                                headingRowColor: WidgetStateColor.resolveWith((states) => centerBackgroundColor),
                                                showCheckboxColumn: false,
                                                headingTextStyle: boldTextStyle(),
                                                columns: [
                                                  DataColumn(label: Text("User Name")),
                                                  DataColumn(label: Text("Feedback Type")),
                                                  DataColumn(label: Text("Description")),
                                                  DataColumn(label: Text("Date")),
                                                ],
                                                rows: dashBoardModel!.feedbackList!.map<DataRow>((FeedBackData item) {
                                                  return DataRow(
                                                    cells: [
                                                      DataCell(
                                                        Container(
                                                          width: 100,
                                                          child: Text(item.username.validate()),
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Container(
                                                          width: 130,
                                                          child: Text(item.type.validate()),
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Container(
                                                          width: 300,
                                                          child: Text(item.description.validate(), maxLines: 2),
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Container(
                                                          width: 140,
                                                          child: Text(getDateFormatted(DateTime.parse(item.createdAt!.validate()))),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).expand(flex: 5),
                                  ],
                                ),
                              ],
                            ).paddingAll(32)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Text("No Data Found", style: boldTextStyle()).visible(!appStore.isLoading).center(),
          loadingAnimation().visible(appStore.isLoading).center(),
        ],
      ),
    );
  }
}
