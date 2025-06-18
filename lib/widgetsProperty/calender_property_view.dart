import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/calender_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class CalenderPropertyView extends StatefulWidget {
  static String tag = '/CalenderPropertyView';

  @override
  CalenderPropertyViewState createState() => CalenderPropertyViewState();
}

class CalenderPropertyViewState extends State<CalenderPropertyView> {
  var calenderClass;

  init() async {
    calenderClass = appStore.currentSelectedWidget!.widgetViewModel as CalenderClass?;
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
              padding: calenderClass.padding,
              onPaddingChanged: (l, t, r, b) {
                calenderClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(calenderClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: calenderClass.isAlignX,
              isAlignY: calenderClass.isAlignY,
              alignX: calenderClass.horizontalAlignment ?? 0,
              alignY: calenderClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                calenderClass.horizontalAlignment = h;
                calenderClass.verticalAlignment = v;
                appStore.updateData(calenderClass);
              },
              isAlignXChanged: (value) {
                calenderClass.isAlignX = value;
                appStore.updateData(calenderClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                calenderClass.isAlignY = value;
                appStore.updateData(calenderClass);
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
                  calenderClass.isExpanded ?? updateIsExpanded(),
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      calenderClass.isExpanded = value;
                      appStore.updateData(calenderClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: calenderClass.flex != null ? calenderClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      calenderClass.flex = int.tryParse(s);
                      appStore.updateData(calenderClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(calenderClass.isExpanded ?? (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false)),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
      ],
    );
  }
}
