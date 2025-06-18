import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class AddWidgetDialog extends StatefulWidget {
  final bool isWidgetAddOnly;

  AddWidgetDialog({this.isWidgetAddOnly = false});

  @override
  _AddWidgetDialogState createState() => _AddWidgetDialogState();
}

class _AddWidgetDialogState extends State<AddWidgetDialog> {
  List<WidgetModel> wrapWidgets = [];
  List<WidgetModel> allWidgets = [];

  int _crossAxisCount = 6;

  double _crossAxisSpacing = 8;
  double _mainAxisSpacing = 8;
  double _childAspectRatio = 1;

  @override
  void initState() {
    super.initState();
    if (appStore.currentSelectedWidget!.widgetType != WidgetTypeNormal) {
      allWidgets.addAll(baseWidgetsList);
    }
    wrapWidgets.addAll(wrapLayoutWidgetsList);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (allWidgets.isNotEmpty) ? 600 : 160,
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${(widget.isWidgetAddOnly) ? language!.layout : language!.wrap} ${language!.widget}",
              style: TextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor, fontSize: 18),
            ).visible(allWidgets.isNotEmpty),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: wrapWidgets.length,
              itemBuilder: (context, index) {
                WidgetModel item = getWidgets(wrapWidgets[index].widgetSubType);
                return GestureDetector(
                  child: item.displayWidget,
                  onTap: () {
                    if (widget.isWidgetAddOnly) {
                      finish(context);
                      appStore.addChildWidget(item);
                    } else {
                      finish(context);
                      appStore.wrapWidget(item);
                    }
                  },
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _childAspectRatio,
              ),
            ),
            10.height,
            Text(
              "${(widget.isWidgetAddOnly) ? language!.child : language!.add} ${language!.widgets}",
              style: TextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor, fontSize: 18),
            ).visible(allWidgets.isNotEmpty),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: allWidgets.length,
              itemBuilder: (context, index) {
                WidgetModel item = getWidgets(allWidgets[index].widgetSubType);
                return GestureDetector(
                  child: item.displayWidget,
                  onTap: () {
                    finish(context);
                    appStore.addChildWidget(item);
                  },
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _childAspectRatio,
              ),
            ).visible(allWidgets.isNotEmpty),
          ],
        ),
      ),
    );
  }
}
