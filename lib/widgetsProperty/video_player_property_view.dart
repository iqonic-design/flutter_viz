import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/video_player_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class VideoPlayerPropertyView extends StatefulWidget {
  static String tag = '/VideoPlayerPropertyView';

  @override
  VideoPlayerPropertyViewState createState() => VideoPlayerPropertyViewState();
}

class VideoPlayerPropertyViewState extends State<VideoPlayerPropertyView> {
  var videoPlayerClass;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    videoPlayerClass = appStore.currentSelectedWidget!.widgetViewModel as VideoPlayerClass?;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
                padding: videoPlayerClass.padding,
                onPaddingChanged: (l, t, r, b) {
                  videoPlayerClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(videoPlayerClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: videoPlayerClass.isAlignX,
              isAlignY: videoPlayerClass.isAlignY,
              alignX: videoPlayerClass.horizontalAlignment ?? 0,
              alignY: videoPlayerClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                videoPlayerClass.horizontalAlignment = h;
                videoPlayerClass.verticalAlignment = v;
                appStore.updateData(videoPlayerClass);
              },
              isAlignXChanged: (value) {
                videoPlayerClass.isAlignX = value;
                appStore.updateData(videoPlayerClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                videoPlayerClass.isAlignY = value;
                appStore.updateData(videoPlayerClass);
                appStore.setIsAlignY(value);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.expandedAndFlex,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkBoxView(
                  videoPlayerClass.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      videoPlayerClass.isExpanded = value;
                      appStore.updateData(videoPlayerClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: videoPlayerClass.flex != null ? videoPlayerClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      videoPlayerClass.flex = int.tryParse(s);
                      appStore.updateData(videoPlayerClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(videoPlayerClass.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.url,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: videoPlayerClass.url != null ? videoPlayerClass.url.toString() : DEFAULT_VIDEO_PLAYER_URL),
              hint: "Enter Url",
              onChanged: (s) {
                videoPlayerClass.url = s;
                bool validURL = Uri.parse(videoPlayerClass.url).isAbsolute;
                if (validURL) {
                  appStore.updateData(videoPlayerClass);
                  setState(() {});
                } else {
                  getToast(language!.enterValidUrl);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
