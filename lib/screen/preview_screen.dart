import 'dart:convert';

import 'package:flutter_viz/externalClasses/on_hover.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'mobile_view_screen.dart';

class PreviewScreen extends StatefulWidget {
  static String tag = '/PreviewScreen';

  @override
  PreviewScreenState createState() => PreviewScreenState();
}

class PreviewScreenState extends State<PreviewScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  ///delete screen api call
  Future deleteScreenApi({int? screenId}) async {
    appStore.setLoading(true);
    Map req = {
      'id': screenId,
    };
    await deleteScreen(req).then((value) {
      appStore.setLoading(false);
      if (value.status!) {
        appStore.removeScreen(screenId);
        getToast(value.message!);
      }
    }).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Observer(
        builder: (context) {
          return Scaffold(
            backgroundColor: context.cardColor,
            body: Responsive(
              mobile: MobileViewScreen(),
              web: Stack(
                children: [
                  Container(
                    width: context.width(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getHeaderLogoImage(),
                                16.width,
                                OnHover(
                                  builder: (isHovered) {
                                    return elevationButtonWithIcon(
                                      isHovered: isHovered,
                                      toolTipMessage: language!.back,
                                      title: language!.back,
                                      icon: Icons.arrow_back,
                                      onPressed: () {
                                        appStore.isPreviewCode = false;
                                        finish(context);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Image.asset(
                                    'images/flutterviz_bg.jpg',
                                    height: 140,
                                    width: context.width(),
                                    fit: BoxFit.cover,
                                  ).cornerRadiusWithClipRRectOnly(bottomLeft: COMMON_CARD_BORDER_RADIUS.toInt(), bottomRight: COMMON_CARD_BORDER_RADIUS.toInt()),
                                  Text(language!.screenPreview, style: primaryTextStyle(color: Colors.white, size: 34)).paddingAll(32),
                                ],
                              ),
                              Container(
                                  transform: Matrix4.translationValues(0, -36, 0),
                                  width: context.width(),
                                  height: appStore.screenList.length != 1 ? null : context.height() * 0.70,
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: context.scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                    boxShadow: [
                                      commonCardBoxShadow(),
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 32),
                                  padding: EdgeInsets.all(30),
                                  child: appStore.screenList.length != 1
                                      ? Wrap(
                                          runSpacing: 30,
                                          spacing: 30,
                                          children: appStore.screenList.map((screenData) {
                                            return screenData.id! > 0
                                                ? SizedBox(
                                                    width: screenPreviewWidth,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              '# ${screenData.name}',
                                                              style: primaryTextStyle(size: 18, color: btnBackgroundColor),
                                                              maxLines: 1,
                                                              softWrap: true,
                                                            ).expand(),
                                                            12.width,
                                                            editIcon(context, () {
                                                              savePreviousChanges(screenData);
                                                              appStore.setPreviewCode(false);
                                                              finish(context);
                                                            }),
                                                            12.width,
                                                            deleteIcon(context).onTap(() {
                                                              ifNotTester(() async {
                                                                deleteConfirmationDialog(
                                                                  context: context,
                                                                  messageText: language!.areYouSureDeleteScreen,
                                                                  onAccept: () {
                                                                    finish(context);
                                                                    deleteScreenApi(screenId: screenData.id.validate());
                                                                  },
                                                                );
                                                              });
                                                            }),
                                                          ],
                                                        ),
                                                        16.height,
                                                        Container(
                                                          height: screenPreviewHeight,
                                                          width: screenPreviewWidth,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: appStore.isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                                          ),
                                                          child: screenData.screenImage != null
                                                              ? Image.memory(
                                                                  base64Decode(screenData.screenImage!),
                                                                  width: screenPreviewWidth,
                                                                  height: screenPreviewHeight,
                                                                  fit: BoxFit.fill,
                                                                ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS)
                                                              : Container(
                                                                  width: screenPreviewWidth,
                                                                  height: screenPreviewHeight,
                                                                  color: Colors.white,
                                                                ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container();
                                          }).toList(),
                                        )
                                      : Text(language!.noDataFound, style: boldTextStyle()).visible(!appStore.isLoading).center()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  loadingAnimation().visible(appStore.isLoading).center(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
