import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgetsClass/clip_rrect_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class ClipRRectPropertyView extends StatefulWidget {
  static String tag = '/ClipRRectPropertyView';

  @override
  ClipRRectPropertyViewState createState() => ClipRRectPropertyViewState();
}

class ClipRRectPropertyViewState extends State<ClipRRectPropertyView> {
  var clipRRectClass;

  init() async {
    clipRRectClass = appStore.currentSelectedWidget!.widgetViewModel as ClipRRectClass?;
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
                padding: clipRRectClass.padding,
                onPaddingChanged: (l, t, r, b) {
                  clipRRectClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(clipRRectClass);
                }),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: clipRRectClass.isAlignX,
              isAlignY: clipRRectClass.isAlignY,
              alignX: clipRRectClass.horizontalAlignment ?? 0,
              alignY: clipRRectClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                clipRRectClass.horizontalAlignment = h;
                clipRRectClass.verticalAlignment = v;
                appStore.updateData(clipRRectClass);
              },
              isAlignXChanged: (value) {
                clipRRectClass.isAlignX = value;
                appStore.updateData(clipRRectClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                clipRRectClass.isAlignY = value;
                appStore.updateData(clipRRectClass);
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
                  clipRRectClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    clipRRectClass.isExpanded = value;
                    appStore.updateData(clipRRectClass);
                    setState(() {});
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: clipRRectClass.flex != null ? clipRRectClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      clipRRectClass.flex = int.tryParse(s);
                      appStore.updateData(clipRRectClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(clipRRectClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.borderRadius,
          context,
          <Widget>[
            radiusView(
                radius: clipRRectClass.borderRadius,
                onRadiusChanged: (tl, tr, br, bt) {
                  clipRRectClass.borderRadius = BorderRadius.only(
                    topLeft: Radius.circular(tl),
                    topRight: Radius.circular(tr),
                    bottomLeft: Radius.circular(br),
                    bottomRight: Radius.circular(bt),
                  );
                  appStore.updateData(clipRRectClass);
                }),
          ],
        ),
      ],
    );
  }
}
