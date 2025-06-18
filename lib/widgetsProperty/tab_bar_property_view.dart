import 'package:flutter_viz/widgetsClass/tab_bar_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TabBarPropertyView extends StatefulWidget {
  static String tag = '/TabBarPropertyView';

  @override
  TabBarPropertyViewState createState() => TabBarPropertyViewState();
}

class TabBarPropertyViewState extends State<TabBarPropertyView> {
  var tabBarClass;

  init() async {
    tabBarClass = appStore.currentSelectedWidget!.widgetViewModel as TabBarClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.labelColor,
          context,
          <Widget>[
            ColorView(
              color: tabBarClass.labelColor ?? DEFAULT_TAB_BAR_LABEL_COLOR,
              applyColor: () {
                tabBarClass.labelColor = appStore.color;
                setState(() {});
                appStore.updateData(tabBarClass);
              },
              pickColor: () {
                showColorPicker(context, tabBarClass.labelColor ?? DEFAULT_TAB_BAR_LABEL_COLOR, applyOnWidget: (color) {
                  tabBarClass.labelColor = color;
                  setState(() {});
                  appStore.updateData(tabBarClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.labelPadding,
          context,
          <Widget>[
            paddingView(
              padding: tabBarClass.labelPadding,
              onPaddingChanged: (l, t, r, b) {
                tabBarClass.labelPadding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(tabBarClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.indicatorColor,
          context,
          <Widget>[
            ColorView(
              color: tabBarClass.indicatorColor ?? DEFAULT_TAB_BAR_INDICATOR_COLOR,
              applyColor: () {
                tabBarClass.indicatorColor = appStore.color;
                setState(() {});
                appStore.updateData(tabBarClass);
              },
              pickColor: () {
                showColorPicker(context, tabBarClass.indicatorColor ?? DEFAULT_TAB_BAR_INDICATOR_COLOR, applyOnWidget: (color) {
                  tabBarClass.indicatorColor = color;
                  setState(() {});
                  appStore.updateData(tabBarClass);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
