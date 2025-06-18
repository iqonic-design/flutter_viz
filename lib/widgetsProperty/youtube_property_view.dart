import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/youtube_player_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class YoutubePropertyView extends StatefulWidget {
  static String tag = '/YoutubePropertyView';

  @override
  YoutubePropertyViewState createState() => YoutubePropertyViewState();
}

class YoutubePropertyViewState extends State<YoutubePropertyView> {
  var youtubeClass;
  TextEditingController? widthController, heightController;

  init() async {
    youtubeClass = appStore.currentSelectedWidget!.widgetViewModel as YoutubePlayerClass?;
    heightController = TextEditingController(text: youtubeClass.height != null ? getWidthControllerValue(youtubeClass.height, youtubeClass.heightType) : '');
    widthController = TextEditingController(text: youtubeClass.width != null ? getWidthControllerValue(youtubeClass.width, youtubeClass.widthType) : '');
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
                padding: youtubeClass.padding,
                onPaddingChanged: (l, t, r, b) {
                  youtubeClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(youtubeClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: youtubeClass.isAlignX,
              isAlignY: youtubeClass.isAlignY,
              alignX: youtubeClass.horizontalAlignment ?? 0,
              alignY: youtubeClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                youtubeClass.horizontalAlignment = h;
                youtubeClass.verticalAlignment = v;
                appStore.updateData(youtubeClass);
              },
              isAlignXChanged: (value) {
                youtubeClass.isAlignX = value;
                appStore.updateData(youtubeClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                youtubeClass.isAlignY = value;
                appStore.updateData(youtubeClass);
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
                  youtubeClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      youtubeClass.isExpanded = value;
                      appStore.updateData(youtubeClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(text: youtubeClass.flex != null ? youtubeClass.flex.toString() : DEFAULT_FLEX.toString()),
                      textAlign: TextAlign.center,
                      maxLength: commonMaxLength,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (s) {
                        youtubeClass.flex = int.tryParse(s);
                        appStore.updateData(youtubeClass);
                      }),
                ).visible(youtubeClass.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.heightAndWidth,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getImageWidthType(
                  controller: widthController,
                  title: language!.width,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: youtubeClass.widthType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      youtubeClass.width = null;
                      appStore.updateData(youtubeClass);
                    } else {
                      if (s.isDigit()) {
                        youtubeClass.width = s.toInt().toDouble();
                        appStore.updateData(youtubeClass);
                      }
                    }
                  },
                  onTapPer: () {
                    youtubeClass.widthType = TypePercentage;
                    setState(() {});
                    youtubeClass.width = widthController!.text.toInt().toDouble();
                    appStore.updateData(youtubeClass);
                  },
                  onTapPX: () {
                    youtubeClass.widthType = TypePX;
                    setState(() {});
                    youtubeClass.width = widthController!.text.toInt().toDouble();
                    appStore.updateData(youtubeClass);
                  },
                ).expand(flex: 1),
                getImageWidthType(
                  controller: heightController,
                  title: language!.height,
                  widthType1: 'PX',
                  widthType2: '%',
                  type: youtubeClass.heightType,
                  onTextChanged: (s) {
                    if (s.isEmpty) {
                      youtubeClass.height = null;
                      appStore.updateData(youtubeClass);
                    } else {
                      if (s.isDigit()) {
                        youtubeClass.height = s.toInt().toDouble();
                        appStore.updateData(youtubeClass);
                      }
                    }
                  },
                  onTapPer: () {
                    youtubeClass.heightType = TypePercentage;
                    setState(() {});
                    youtubeClass.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(youtubeClass);
                  },
                  onTapPX: () {
                    youtubeClass.heightType = TypePX;
                    setState(() {});
                    youtubeClass.height = heightController!.text.toInt().toDouble();
                    appStore.updateData(youtubeClass);
                  },
                ),
              ],
            ),
          ],
        ),
        ExpansionTileView(
          language!.url,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: youtubeClass.url != null ? youtubeClass.url.toString() : "https://www.youtube.com/watch?v=$DEFAULT_YOUTUBE_ID"),
              hint: "Enter Url",
              onChanged: (s) {
                youtubeClass.url = s;
                bool validURL = Uri.parse(youtubeClass.url).isAbsolute;
                if (validURL) {
                  appStore.updateData(youtubeClass);
                  setState(() {});
                } else {
                  getToast(language!.enterValidUrl);
                }
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.autoPlay,
          context,
          <Widget>[
            checkBoxView(
              youtubeClass.autoPlay ?? false,
              language!.autoPlay,
              onChanged: (value) {
                youtubeClass.autoPlay = value;
                appStore.updateData(youtubeClass);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(language!.looping, context, <Widget>[
          checkBoxView(
            youtubeClass.loop ?? false,
            language!.looping,
            onChanged: (value) {
              youtubeClass.loop = value;
              appStore.updateData(youtubeClass);
              setState(() {});
            },
          ),
        ]),
        ExpansionTileView(
          language!.mute,
          context,
          <Widget>[
            checkBoxView(
              youtubeClass.mute ?? false,
              language!.mute,
              onChanged: (value) {
                youtubeClass.mute = value;
                appStore.updateData(youtubeClass);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.showControls,
          context,
          <Widget>[
            checkBoxView(
              youtubeClass.showControls ?? false,
              language!.showControls,
              onChanged: (value) {
                youtubeClass.showControls = value;
                appStore.updateData(youtubeClass);
                setState(() {});
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.showFullScreen,
          context,
          <Widget>[
            checkBoxView(
              youtubeClass.showFullscreenButton ?? false,
              language!.showFullScreen,
              onChanged: (value) {
                youtubeClass.showFullscreenButton = value;
                appStore.updateData(youtubeClass);
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
