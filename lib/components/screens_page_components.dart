import 'package:flutter_viz/components/add_screen_dialog.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreensPageComponents extends StatefulWidget {
  @override
  _ScreensPageComponentsState createState() => _ScreensPageComponentsState();
}

class _ScreensPageComponentsState extends State<ScreensPageComponents> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    getScreenListApi();

    LiveStream().on(getUpdatedData, (value) {
      if (value == true) {
        getScreenListApi();
      }
    });
  }

  Future<void> getScreenListApi() async {
    await getScreenList(
      projectId: appStore.projectId,
      userId: (IS_TESTING_MODE) ? DUMMY_USER_ID as int? : getIntAsync(USER_ID),
      page: -1,
    ).then((value) async {
      appStore.screenList.clear();
      appStore.screenList.addAll(value.data!);
    }).catchError((e) {
      getToast(e.toString());
    });
  }

  Future deleteScreenApi({int? screenId}) async {
    Map req = {
      'id': screenId,
    };

    await deleteScreen(req).then((value) {
      LiveStream().emit(getUpdatedData, true);
      getToast(value.message!);
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
      builder: (_) {
        return Container(
          color: appStore.isDarkMode ? darkModePrimaryColorBackground : Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: btnBackgroundColor),
                      Text(language!.newScreen, style: primaryTextStyle(color: btnBackgroundColor)),
                    ],
                  ).onTap(() async {
                    bool? res = await showInDialog(context, title: Text(language!.addScreen), builder: (context) {
                      return AddScreenDialog();
                    });
                    if (res ?? false) {
                      setState(() {});
                    }
                  }),
                  Icon(Icons.refresh).onTap(() {
                    getScreenListApi();
                  })
                ],
              ).paddingAll(8),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: appStore.screenList.length,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text("${appStore.screenList[position].name.validate()}", style: TextStyle()).expand(),
                            Icon(Icons.restore_from_trash, color: iconColor, size: 16).onTap(() async {
                              showConfirmDialog(
                                context,
                                language!.areYouSureDeleteScreen,
                                onAccept: () {
                                  deleteScreenApi(screenId: appStore.screenList[position].id.validate());
                                },
                                buttonColor: Colors.red,
                                positiveText: language!.delete,
                                negativeText: language!.cancel,
                              );
                            }),
                            8.width,
                            Icon(Icons.arrow_forward_ios_outlined, color: iconColor, size: 16),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(left: BorderSide(color: (appStore.selectedScreenId == appStore.screenList[position].id) ? btnBackgroundColor : Colors.grey, width: 5)),
                        ),
                      ),
                      onTap: () {
                        appStore.setScreenDetails(appStore.screenList[position]);
                        applyScreenJsonToView(appStore.screenList[position].screenJsonData);
                        // setState(() {});
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
