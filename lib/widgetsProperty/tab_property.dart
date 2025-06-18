import 'dart:convert';

import 'package:flutter_viz/widgetsClass/tab_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TabProperty extends StatefulWidget {
  static String tag = '/TabProperty';

  @override
  TabPropertyState createState() => TabPropertyState();
}

class TabPropertyState extends State<TabProperty> {
  var tabModel;

  init() async {
    tabModel = appStore.currentSelectedWidget!.widgetViewModel as TabClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.text,
          context,
          <Widget>[
            getTextField(
              controller: TextEditingController(text: tabModel.tabText != null ? tabModel.tabText : DEFAULT_TAB_NAME),
              hint: tabModel.tabText ?? "Enter Tab name",
              onChanged: (s) {
                tabModel.tabText = s;
                appStore.updateData(tabModel);
              },
            )
          ],
        ),
        ExpansionTileView(
          language!.tabIcon,
          context,
          <Widget>[
            iconPickerView(
              iconDataJson: tabModel.tabIconDataJson ?? {'iconName': 'add', 'codePoint': 58727, 'fontFamily': 'MaterialIcons'},
              onChanged: (value) {
                var tabIconDataJson = jsonDecode(value);
                tabModel.tabIconDataJson = tabIconDataJson;
                setState(() {});
                appStore.updateData(tabModel);
              },
            ),
          ],
        ),
      ],
    );
  }
}
