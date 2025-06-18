import 'package:flutter_viz/components/add_page_dialog.dart';
import 'package:flutter_viz/components/screen_clone_dialog.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/screen/screen_preview.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import 'selected_widget_property.dart';

class RightScreenComponent extends StatefulWidget {
  @override
  _RightScreenComponentState createState() => _RightScreenComponentState();
}

class _RightScreenComponentState extends State<RightScreenComponent> {
  TextEditingController screenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    LiveStream().on(LIVESTREAM_UPDATE_LAST_SYNC_TIME, (a) {
      if (mounted) {
        setState(() {});
      }
    });
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
      }
      LiveStream().emit(getUpdatedData, true);
      LiveStream().emit(updateScreenList);
    }).catchError((e) {
      getToast(e.toString());
    });
  }

  _getView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        if (appStore.screenTemplateData == null)
          Observer(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: EdgeInsets.only(left: 16.0, right: 8.0),
                        margin: EdgeInsets.only(left: 16.0, right: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(COMMON_BUTTON_BORDER_RADIUS)),
                          border: Border.all(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR, width: 1),
                          color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                        ),
                        child: DropdownButtonFormField<ScreenListData>(
                          iconDisabledColor: btnBackgroundColor,
                          isDense: true,
                          isExpanded: true,
                          dropdownColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : dropDownColor,
                          decoration: InputDecoration(focusedBorder: InputBorder.none, enabledBorder: InputBorder.none),
                          value: appStore.selectedDropdownScreen,
                          items: appStore.screenList.map((ScreenListData screenData) {
                            return new DropdownMenuItem<ScreenListData>(
                              value: screenData,
                              child: screenData.id! > 0
                                  ? Text(screenData.name!, style: primaryTextStyle(), maxLines: 1)
                                  : Row(
                                      children: [
                                        Icon(Icons.add, size: btnIconSize),
                                        8.width,
                                        Text(screenData.name!, style: primaryTextStyle(), maxLines: 1),
                                      ],
                                    ),
                            );
                          }).toList(),
                          onChanged: (ScreenListData? newValue) async {
                            savePreviousChanges(newValue!);
                            setState(() {});
                            if (newValue.id! < 0) {
                              appStore.selectedDropdownScreen = newValue;
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
                        ),
                      ),
                    ).expand(),
                    GestureDetector(
                      child: tooltipView(
                        message: language!.preview,
                        child: outLineIconButton(context, runIcon()),
                      ),
                      onTap: () async {
                        appStore.setPreviewCode(true);
                        trackUserEvent(RUN_CODE);
                        ScreenPreview().launch(context);
                      },
                    ),
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: tooltipView(
                        message: language!.editScreenName,
                        child: outLineIconButton(
                          context,
                          editIcon(
                            context,
                            () async {
                              ifNotTester(() async {
                                await showInDialog(
                                  context,
                                  builder: (context) => ScreenCloneDialog(isEdit: true),
                                );
                                setState(() {});
                              });
                            },
                          ),
                        ),
                      ),
                    ).visible(appStore.selectedScreenId! > 0),
                    GestureDetector(
                      child: tooltipView(
                        message: language!.clone,
                        child: outLineIconButton(context, cloneIcon(context)),
                      ),
                      onTap: () async {
                        ifNotTester(() async {
                          bool? res = await showInDialog(
                            context,
                            builder: (context) {
                              return ScreenCloneDialog();
                            },
                          );
                          if (res ?? false) {
                            setState(() {});
                          }
                        });
                      },
                    ).visible(appStore.selectedScreenId! > 0),
                    GestureDetector(
                      child: tooltipView(
                        message: language!.viewSourceCode,
                        child: outLineIconButton(context, sourceCodeIcon(context)),
                      ),
                      onTap: () {
                        ifNotTester(() {
                          viewSourceCode(context);
                        });
                      },
                    ).visible(appStore.selectedScreenId! > 0),
                    GestureDetector(
                      child: tooltipView(
                        message: language!.clearCurrentScreenData,
                        child: outLineIconButton(context, clearIcon(context)),
                      ),
                      onTap: () {
                        ifNotTester(() async {
                          showInDialog(
                            context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(language!.areYouClearScreenData, style: primaryTextStyle()),
                                  30.height,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      dialogGrayBorderButton(
                                        text: language!.cancel,
                                        onTap: () {
                                          finish(context);
                                        },
                                      ),
                                      16.width,
                                      SizedBox(
                                        height: 36,
                                        width: 110,
                                        child: TextButton(
                                          child: Text(language!.clear, style: TextStyle(color: Colors.red, fontSize: btnTextSize)),
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.red.withValues(alpha: 0.1),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS), side: BorderSide(color: Colors.red, width: 0.5)),
                                          ),
                                          onPressed: () {
                                            trackUserEvent(CLEAR_DATA);
                                            finish(context);
                                            appStore.resetView();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      },
                    ).visible(appStore.selectedScreenId! > 0),
                    GestureDetector(
                      child: tooltipView(
                        message: language!.deleteScreen,
                        child: deleteIconOutline(context),
                      ),
                      onTap: () {
                        deleteConfirmationDialog(
                          context: context,
                          messageText: language!.areYouWantDeleteScreen,
                          onAccept: () {
                            finish(context);
                            trackUserEvent(DELETE_SCREEN);
                            deleteScreenApi(screenId: appStore.selectedDropdownScreen!.id);
                          },
                        );
                      },
                    ).visible(appStore.selectedScreenId! > 0),
                  ],
                ).paddingOnly(left: 16),
                16.height,
                Divider(color: COMMON_BORDER_COLOR),
              ],
            ),
          )
        else
          SizedBox(),
        Observer(builder: (_) {
          if (appStore.currentSelectedWidget != null) {
            return Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${getWidgetTitle(appStore.currentSelectedWidget!.widgetSubType)} (***${appStore.currentSelectedWidget!.id!.substring(appStore.currentSelectedWidget!.id!.length - 4, appStore.currentSelectedWidget!.id!.length)})",
                      style: primaryTextStyle(weight: FontWeight.bold, size: 18),
                    ),
                  ),
                  Observer(builder: (_) {
                    if (appStore.currentSelectedWidget!.widgetSubType != WidgetTypeRootView) {
                      return GestureDetector(
                        child: tooltipView(
                          message: "${language!.delete} ${appStore.currentSelectedWidget!.widgetSubType} ${language!.widget}",
                          child: deleteIcon(context),
                        ),
                        onTap: () {
                          deleteConfirmationDialog(
                            context: context,
                            messageText: language!.areYouSureWantToDeleteWidget,
                            onAccept: () {
                              finish(context);
                              appStore.removeSelectedWidget();
                            },
                          );
                        },
                      );
                    } else
                      return SizedBox();
                  })
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        }),
        Observer(builder: (_) {
          if (appStore.currentSelectedWidget != null) {
            return SelectedWidgetProperty().visible(appStore.currentSelectedWidget!.widgetType != null);
          } else
            return SizedBox();
        }),
        SizedBox(height: 40),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    LiveStream().dispose(LIVESTREAM_UPDATE_LAST_SYNC_TIME);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(),
      width: context.width(),
      padding: EdgeInsets.all(0),
      decoration: boxDecorationWithShadow(
        boxShadow: [
          appStore.isDarkMode
              ? commonCardBoxShadowDarkMode()
              : BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 8,
                  blurRadius: 8,
                  offset: Offset(0, 15),
                ),
        ],
        backgroundColor: context.scaffoldBackgroundColor,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(right: 0),
            child: Observer(builder: (_) => _getView()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.width(),
              color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : leftExpansionTileBackgroundColor,
              child: Text(
                "${language!.autoSaveAt} ${getDateFormatted(DateTime.now(), dateFormat: DATE_FORMAT_3)}",
                style: TextStyle(color: appStore.isDarkMode ? Colors.grey : btnBackgroundColor),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(10),
            ),
          ).visible(appStore.lastSyncTime!.isNotEmpty),
        ],
      ),
    );
  }
}
