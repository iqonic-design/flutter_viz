import 'package:flutter_viz/adminDashboard/components/add_category_dialog.dart';
import 'package:flutter_viz/adminDashboard/model/categoryList_model.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminCategoriesComponent extends StatefulWidget {
  static String tag = '/AdminCategoriesComponent';

  @override
  AdminCategoriesComponentState createState() => AdminCategoriesComponentState();
}

class AdminCategoriesComponentState extends State<AdminCategoriesComponent> {
  ScrollController scrollController = ScrollController();

  List<CategoryData> categoryList = [];

  int? currentPage = 1;
  int? totalPage = 1;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    categoryListApi(currentPage);
  }

  ///category list api call
  Future<void> categoryListApi(int? page) async {
    appStore.setLoading(true);

    await getCategoryList(page).then((value) async {
      appStore.setLoading(false);
      categoryList.clear();
      categoryList.addAll(value.data!);
      totalPage = value.pagination!.totalPages;
      currentPage = value.pagination!.currentPage;
      if (categoryList.isEmpty && currentPage != 1) {
        pageIndex = 0;
        categoryListApi(currentPage! - 1);
      }
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///delete category api call
  Future<void> deleteCategoryApi(id) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
    };
    await deleteCategory(req).then((value) {
      appStore.setLoading(false);
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
    return Observer(
      builder: (_) {
        return Container(
          color: centerBackgroundColor,
          child: Stack(
            children: [
              categoryList.isNotEmpty
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
                            DataColumn(label: Text("Category Id")),
                            DataColumn(label: Text("Sequence")),
                            DataColumn(label: Text("Category Name")),
                            DataColumn(label: Text("Created Date")),
                            DataColumn(label: Text("Updated Date")),
                            DataColumn(label: Text("Actions")),
                          ],
                          rows: categoryList.map<DataRow>((CategoryData item) {
                            return DataRow(cells: [
                              DataCell(
                                copyToClipBoardIcon(context, () {
                                  copyToClipboard(copyValue: item.id.toString(), message: "Category ID copied to clipboard");
                                }),
                              ),
                              DataCell(Text('${item.sequence.validate()}')),
                              DataCell(Text('${item.name}')),
                              DataCell(
                                Text(getDateFormatted(DateTime.parse(item.createdAt!.validate()))),
                              ),
                              DataCell(
                                Text(getDateFormatted(DateTime.parse(item.updatedAt!.validate()))),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    tooltipView(
                                      child: editIcon(context, () async {
                                        await showInDialog(
                                          context,
                                          builder: (context) => AddCategoryDialog(
                                              category: item,
                                              isEdit: true,
                                              onUpdate: () {
                                                categoryListApi(currentPage);
                                                setState(() {});
                                              }),
                                        );
                                      }),
                                      message: "Edit",
                                    ),
                                    8.width,
                                    tooltipView(
                                      child: deleteIcon(context).onTap(() {
                                        deleteConfirmationDialog(
                                          context: context,
                                          messageText: "Are you sure you want to delete Category?",
                                          onAccept: () async {
                                            finish(context);
                                            await deleteCategoryApi(item.id.validate());
                                            categoryList.remove(item);
                                            categoryListApi(currentPage);
                                            setState(() {});
                                          },
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
                right: 16,
                left: 16,
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
                            return paginationWidget(index, pageIndex).onTap(() {
                              pageIndex = index;
                              setState(() {});
                              categoryListApi(index + 1);
                            });
                          }),
                    ).visible(categoryList.isNotEmpty),
                    addButtonRounded().onTap(
                      () async {
                        await showInDialog(
                          context,
                          builder: (context) => AddCategoryDialog(onUpdate: () {
                            categoryListApi(currentPage);
                            setState(() {});
                          }),
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
