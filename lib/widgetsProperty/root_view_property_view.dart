import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/widgetsClass/root_view_class.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'comman_property_view.dart';

class RootViewProperty extends StatefulWidget {
  @override
  _RootViewPropertyState createState() => _RootViewPropertyState();
}

class _RootViewPropertyState extends State<RootViewProperty> {
  RootViewClass? rootViewClass;

  init() async {
    rootViewClass = appStore.currentSelectedWidget!.widgetViewModel as RootViewClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.backgroundColor,
          context,
          <Widget>[
            ColorView(
              color: rootViewClass?.bgColor ?? Colors.white,
              applyColor: () {
                rootViewClass!.bgColor = appStore.color;
                setState(() {});
                appStore.updateData(rootViewClass, isRootView: true);
              },
              pickColor: () {
                showColorPicker(context, rootViewClass!.bgColor ?? colorPrimary, applyOnWidget: (color) {
                  rootViewClass!.bgColor = color;
                  setState(() {});
                  appStore.updateData(rootViewClass, isRootView: true);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
