import 'package:flutter_viz/model/media_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommonApiCall.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class MediaComponent extends StatefulWidget {
  static String tag = '/MediaComponent';

  @override
  MediaComponentState createState() => MediaComponentState();
}

class MediaComponentState extends State<MediaComponent> {
  List<MediaData> mediaList = [];
  int currentPage = 1;
  int totalPage = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    mediaListApi(currentPage);
  }

  ///Media List api call
  Future<void> mediaListApi(int? page) async {
    appStore.setLoading(true);

    await getMediaList(page: page).then((value) async {
      appStore.setLoading(false);
      mediaList.clear();
      mediaList.addAll(value.data!);
      totalPage = value.pagination!.totalPages!;
      currentPage = value.pagination!.currentPage!;
      if (mediaList.isEmpty && currentPage != 1) {
        selectedIndex = 0;
        mediaListApi(currentPage - 1);
      }
      setState(() {});
      await allMediaListApi();
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  ///delete Media api call
  Future<void> deleteMediaApi(id) async {
    appStore.setLoading(true);
    Map req = {
      "id": id,
    };
    await deleteMedia(req).then((value) {
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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(
                    'images/flutterviz_bg.jpg',
                    height: 140,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRectOnly(bottomLeft: 16, bottomRight: 16),
                  Text("Project Media", style: primaryTextStyle(color: Colors.white, size: 34)).paddingAll(32),
                ],
              ),
              Container(
                transform: Matrix4.translationValues(0, -36, 0),
                width: context.width(),
                height: mediaList.isNotEmpty ? null : context.height() * 0.70,
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: appStore.isDarkMode ? darkModePrimaryColorBackground : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: defaultBoxShadow(),
                ),
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.all(30),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: btnBackgroundColor,
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.upload, color: Colors.white),
                            16.width,
                            Text(language!.uploadMedia, style: primaryTextStyle(color: Colors.white, size: 16)),
                          ],
                        ),
                      ).onTap(() async {
                        uploadMedia(
                          context,
                          onUpdate: () {
                            mediaListApi(currentPage);
                          },
                        );
                      }),
                    ),
                    mediaList.isNotEmpty
                        ? Wrap(
                            runSpacing: 24,
                            spacing: 24,
                            children: mediaList.map((MediaData mediaData) {
                              return Container(
                                width: context.width() * 0.15,
                                height: 250,
                                padding: EdgeInsets.all(16),
                                decoration: boxDecorationWithRoundedCorners(
                                  boxShadow: defaultBoxShadow(shadowColor: appStore.isDarkMode ? Colors.transparent : Colors.grey.withValues(alpha: 0.3)),
                                  backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    commonCachedNetworkImage(
                                      mediaData.userAttachment!,
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: context.width(),
                                    ).cornerRadiusWithClipRRect(COMMON_BUTTON_BORDER_RADIUS).onTap(() {
                                      launchUrl(Uri.parse(mediaData.userAttachment.validate()));
                                    }),
                                    16.height,
                                    Row(
                                      children: [
                                        Text(
                                          '${mediaData.userAttachment!.split('/').last}',
                                          style: primaryTextStyle(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ).expand(),
                                        16.width,
                                        deleteIcon(context).onTap(() {
                                          deleteConfirmationDialog(
                                            context: context,
                                            messageText: "Are you sure you want to delete this asset ?",
                                            onAccept: () async {
                                              finish(context);
                                              await deleteMediaApi(mediaData.id.validate());
                                              mediaList.remove(mediaData);
                                              await mediaListApi(currentPage);
                                            },
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ).paddingOnly(top: 70, bottom: 70)
                        : Text(language!.noDataFound, style: boldTextStyle()).visible(!appStore.isLoading).center(),
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
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      backgroundColor: selectedIndex == index ? btnBackgroundColor : Colors.grey,
                                    ),
                                    child: Text("${index + 1}", style: boldTextStyle(color: Colors.white)),
                                  ).paddingOnly(left: 8).onTap(() {
                                    selectedIndex = index;
                                    setState(() {});
                                    mediaListApi(index + 1);
                                  });
                                }),
                          ).visible(mediaList.isNotEmpty),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
      ],
    );
  }
}
