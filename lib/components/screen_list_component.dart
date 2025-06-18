import 'package:flutter_viz/components/add_page_dialog.dart';
import 'package:flutter_viz/components/screen_clone_dialog.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/screen/preview_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreenListComponent extends StatefulWidget {
  @override
  _ScreenListComponentState createState() => _ScreenListComponentState();
}

class _ScreenListComponentState extends State<ScreenListComponent> {
  TextEditingController searchController = TextEditingController();
  List<ScreenListData> tempScreenList = [];

  @override
  void initState() {
    super.initState();
    tempScreenList.addAll(appStore.screenList);
    LiveStream().on("updateScreenId", (a) {
      if (mounted) {
        setState(() {});
      }
    });
    LiveStream().on(updateScreenList, (a) {
      searchOperation(searchController.text);
      if (mounted) {
        setState(() {});
      }
    });
  }

  void searchOperation(String searchText) {
    if (searchText.isNotEmpty) {
      tempScreenList.clear();
      appStore.screenList.forEachIndexed((element, index) {
        if (element.name!.trim().toLowerCase().contains(searchText.trim().toLowerCase())) {
          tempScreenList.add(element);
        }
      });
    } else {
      tempScreenList.clear();
      tempScreenList.addAll(appStore.screenList);
    }
  }

  ///delete screen api call
  Future deleteScreenApi({int? screenId}) async {
    Map req = {
      'id': screenId,
    };
    await deleteScreen(req).then((value) {
      if (value.status!) {
        appStore.removeScreen(screenId);
        getToast(value.message!);
        searchOperation(searchController.text);
      }
      LiveStream().emit(getUpdatedData, true);
    }).catchError((e) {
      getToast(e.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    LiveStream().dispose(getUpdatedData);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          decoration: boxDecorationWithShadow(
            backgroundColor: context.scaffoldBackgroundColor,
            boxShadow: [
              appStore.isDarkMode
                  ? commonCardBoxShadowDarkMode()
                  : BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(6, 6),
                    ),
            ],
          ),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: btnIconSize, color: context.iconColor),
                  suffixIcon: searchController.text.isNotEmpty
                      ? Icon(Icons.close, size: btnIconSize, color: context.iconColor).onTap(() {
                          searchController.clear();
                          searchOperation(searchController.text);
                          setState(() {});
                        })
                      : SizedBox(),
                  filled: true,
                  fillColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                  hintText: language!.searchForScreen,
                  hintStyle: secondaryTextStyle(),
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor),
                    borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR),
                    borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
                  ),
                ),
                onChanged: (value) {
                  searchOperation(value);
                  setState(() {});
                },
              ).paddingAll(10),
              ListView(
                shrinkWrap: true,
                children: (searchController.text.isNotEmpty ? tempScreenList : appStore.screenList).map((item) {
                  return GestureDetector(
                    child: item.id! > 0
                        ? Container(
                            height: 45,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: (appStore.selectedScreenId == item.id) ? (appStore.isDarkMode ? darkModeSecondaryBackgroundDark : leftExpansionTileBackgroundColor) : Colors.transparent,
                              borderRadius: BorderRadius.circular((appStore.selectedScreenId == item.id) ? COMMON_BORDER_RADIUS : 0),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.fiber_manual_record, size: 10),
                                8.width,
                                Text(
                                  "${item.name.validate()}",
                                  style: primaryTextStyle(
                                    size: 16,
                                    color: (appStore.selectedScreenId == item.id) ? (appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor) : (appStore.isDarkMode ? darkModeSubTextColor : DEFAULT_TEXT_COLOR),
                                  ),
                                ).expand(),
                                cloneIcon(context).onTap(() async {
                                  bool? res = await showInDialog(
                                    context,
                                    builder: (context) {
                                      return ScreenCloneDialog();
                                    },
                                  );
                                  if (res ?? false) {
                                    setState(() {});
                                  }
                                }).visible(appStore.selectedScreenId == item.id),
                                8.width,
                                deleteIcon(context).onTap(() async {
                                  deleteConfirmationDialog(
                                    context: context,
                                    messageText: language!.areYouSureDeleteScreen,
                                    onAccept: () {
                                      finish(context);
                                      deleteScreenApi(screenId: item.id.validate());
                                    },
                                  );
                                }).visible(appStore.selectedScreenId == item.id),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(left: 8, right: 8),
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  children: [
                                    Icon(Icons.add, size: btnIconSize),
                                    8.width,
                                    Text("${item.name.validate()}", style: boldTextStyle()).expand(),
                                    TextButton(
                                      child: Text(language!.previewAll, style: primaryTextStyle(color: btnBackgroundColor, size: 14)),
                                      onPressed: () {
                                        appStore.setPreviewCode(true);
                                        PreviewScreen().launch(context);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Divider(color: COMMON_BORDER_COLOR),
                            ],
                          ),
                    onTap: () async {
                      savePreviousChanges(item);
                      setState(() {});
                      if (item.id! < 0) {
                        appStore.selectedDropdownScreen = item;
                        await showInDialog(
                          context,
                          contentPadding: EdgeInsets.all(30),
                          backgroundColor: context.scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                          ),
                          builder: (context) => AddPageDialog(),
                        );
                      }
                    },
                  );
                }).toList(),
              ).expand(),
            ],
          ),
        );
      },
    );
  }
}
