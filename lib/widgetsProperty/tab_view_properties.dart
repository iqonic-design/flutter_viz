import 'package:flutter_viz/widgetsClass/tab_view_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class TabViewProperties extends StatefulWidget {
  static String tag = '/TabViewProperties';

  @override
  TabViewPropertiesState createState() => TabViewPropertiesState();
}

class TabViewPropertiesState extends State<TabViewProperties> {
  var tabViewClass;

  init() async {
    tabViewClass = appStore.currentSelectedWidget!.widgetViewModel as TabViewClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              padding: tabViewClass.padding,
              onPaddingChanged: (l, t, r, b) {
                tabViewClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(tabViewClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: tabViewClass.isAlignX,
              isAlignY: tabViewClass.isAlignY,
              alignX: tabViewClass.horizontalAlignment ?? 0,
              alignY: tabViewClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                tabViewClass.horizontalAlignment = h;
                tabViewClass.verticalAlignment = v;
                appStore.updateData(tabViewClass);
              },
              isAlignXChanged: (value) {
                tabViewClass.isAlignX = value;
                appStore.updateData(tabViewClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                tabViewClass.isAlignY = value;
                appStore.updateData(tabViewClass);
                appStore.setIsAlignY(value);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.initialIndex,
          context,
          <Widget>[
            Container(
              width: 120,
              child: getTextField(
                  controller: TextEditingController(text: tabViewClass.initialIndex != null ? tabViewClass.initialIndex.toString() : "1"),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (s) {
                    tabViewClass.initialIndex = int.tryParse(s);
                    appStore.updateData(tabViewClass);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
