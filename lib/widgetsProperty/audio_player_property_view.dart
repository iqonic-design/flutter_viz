import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/audio_player_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class AudioPlayerPropertyView extends StatefulWidget {
  static String tag = '/AudioPlayerPropertyView';

  @override
  AudioPlayerPropertyViewState createState() => AudioPlayerPropertyViewState();
}

class AudioPlayerPropertyViewState extends State<AudioPlayerPropertyView> {
  var audioPlayerClass;

  init() async {
    audioPlayerClass = appStore.currentSelectedWidget!.widgetViewModel as AudioPlayerClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
                padding: audioPlayerClass.padding,
                onPaddingChanged: (l, t, r, b) {
                  audioPlayerClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(audioPlayerClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: audioPlayerClass.isAlignX,
              isAlignY: audioPlayerClass.isAlignY,
              alignX: audioPlayerClass.horizontalAlignment ?? 0,
              alignY: audioPlayerClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                audioPlayerClass.horizontalAlignment = h;
                audioPlayerClass.verticalAlignment = v;
                appStore.updateData(audioPlayerClass);
              },
              isAlignXChanged: (value) {
                audioPlayerClass.isAlignX = value;
                appStore.updateData(audioPlayerClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                audioPlayerClass.isAlignY = value;
                appStore.updateData(audioPlayerClass);
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
                  audioPlayerClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      audioPlayerClass.isExpanded = value;
                      appStore.updateData(audioPlayerClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(
                      text: audioPlayerClass.flex != null ? audioPlayerClass.flex.toString() : DEFAULT_FLEX.toString(),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      audioPlayerClass.flex = int.tryParse(s);
                      appStore.updateData(audioPlayerClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(audioPlayerClass.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.url,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: audioPlayerClass.url != null ? audioPlayerClass.url.toString() : DEFAULT_AUDIO_PLAYER_URL),
              hint: "Enter Url",
              onChanged: (s) {
                audioPlayerClass.url = s;
                bool validURL = Uri.parse(audioPlayerClass.url).isAbsolute;
                if (validURL) {
                  appStore.updateData(audioPlayerClass);
                  setState(() {});
                } else {
                  toast(language!.enterValidUrl);
                }
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.iconColor,
          context,
          <Widget>[
            ColorView(
              color: audioPlayerClass.iconColor ?? COMMON_BG_COLOR,
              applyColor: () {
                audioPlayerClass.iconColor = appStore.color;
                setState(() {});
                appStore.updateData(audioPlayerClass);
              },
              pickColor: () {
                showColorPicker(context, audioPlayerClass.iconColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  audioPlayerClass.iconColor = color;
                  setState(() {});
                  appStore.updateData(audioPlayerClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.iconSize,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: audioPlayerClass.iconSize != null ? audioPlayerClass.iconSize.toString() : DEFAULT_AUDIO_PLAYER_ICON_SIZE.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  audioPlayerClass.iconSize = s.toString().isNotEmpty ? double.parse(s) : DEFAULT_AUDIO_PLAYER_ICON_SIZE;
                  appStore.updateData(audioPlayerClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.activeTrackColor,
          context,
          <Widget>[
            ColorView(
              color: audioPlayerClass.activeTrackColor ?? COMMON_BG_COLOR,
              applyColor: () {
                audioPlayerClass.activeTrackColor = appStore.color;
                setState(() {});
                appStore.updateData(audioPlayerClass);
              },
              pickColor: () {
                showColorPicker(context, audioPlayerClass.activeTrackColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  audioPlayerClass.activeTrackColor = color;
                  setState(() {});
                  appStore.updateData(audioPlayerClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.inactiveTrackColor,
          context,
          <Widget>[
            ColorView(
              color: audioPlayerClass.inactiveTrackColor ?? DEFAULT_AUDIO_PLAYER_INACTIVE_TRACKER_COLOR,
              applyColor: () {
                audioPlayerClass.inactiveTrackColor = appStore.color;
                setState(() {});
                appStore.updateData(audioPlayerClass);
              },
              pickColor: () {
                showColorPicker(context, audioPlayerClass.inactiveTrackColor ?? DEFAULT_AUDIO_PLAYER_INACTIVE_TRACKER_COLOR, applyOnWidget: (color) {
                  audioPlayerClass.inactiveTrackColor = color;
                  setState(() {});
                  appStore.updateData(audioPlayerClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.thumbColor,
          context,
          <Widget>[
            ColorView(
              color: audioPlayerClass.thumbColor ?? COMMON_BG_COLOR,
              applyColor: () {
                audioPlayerClass.thumbColor = appStore.color;

                setState(() {});
                appStore.updateData(audioPlayerClass);
              },
              pickColor: () {
                showColorPicker(context, audioPlayerClass.thumbColor ?? COMMON_BG_COLOR, applyOnWidget: (color) {
                  audioPlayerClass.thumbColor = color;
                  setState(() {});
                  appStore.updateData(audioPlayerClass);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
