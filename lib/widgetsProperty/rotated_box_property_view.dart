import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/rotated_box_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class RotatedBoxPropertyView extends StatefulWidget {
  static String tag = '/RotatedBoxPropertyView';

  @override
  RotatedBoxPropertyViewState createState() => RotatedBoxPropertyViewState();
}

class RotatedBoxPropertyViewState extends State<RotatedBoxPropertyView> {
  var rotatedBoxClass;

  init() async {
    rotatedBoxClass = appStore.currentSelectedWidget!.widgetViewModel as RotatedBoxClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      children: [
        getHeight(10),
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              padding: rotatedBoxClass.padding,
              onPaddingChanged: (l, t, r, b) {
                rotatedBoxClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(rotatedBoxClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: rotatedBoxClass.isAlignX,
              isAlignY: rotatedBoxClass.isAlignY,
              alignX: rotatedBoxClass.horizontalAlignment ?? 0,
              alignY: rotatedBoxClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                rotatedBoxClass.horizontalAlignment = h;
                rotatedBoxClass.verticalAlignment = v;
                appStore.updateData(rotatedBoxClass);
              },
              isAlignXChanged: (value) {
                rotatedBoxClass.isAlignX = value;
                appStore.updateData(rotatedBoxClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                rotatedBoxClass.isAlignY = value;
                appStore.updateData(rotatedBoxClass);
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
                  rotatedBoxClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      rotatedBoxClass.isExpanded = value;
                      appStore.updateData(rotatedBoxClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                      controller: TextEditingController(text: rotatedBoxClass.flex != null ? rotatedBoxClass.flex.toString() : DEFAULT_FLEX.toString()),
                      textAlign: TextAlign.center,
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (s) {
                        rotatedBoxClass.flex = int.tryParse(s);
                        appStore.updateData(rotatedBoxClass);
                      }),
                ).visible(rotatedBoxClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.quarterTurns,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                  textAlign: TextAlign.center,
                  controller: TextEditingController(text: rotatedBoxClass.quarterTurns != null ? rotatedBoxClass.quarterTurns.toString() : '0'),
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    rotatedBoxClass.quarterTurns = value.toString().isNotEmpty ? double.parse(value) : 0;
                    appStore.updateData(rotatedBoxClass);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
