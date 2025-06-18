import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/opacity_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'comman_property_view.dart';

class OpacityPropertyView extends StatefulWidget {
  static String tag = '/OpacityPropertyView';

  @override
  OpacityPropertyViewState createState() => OpacityPropertyViewState();
}

class OpacityPropertyViewState extends State<OpacityPropertyView> {
  var opacityClass;

  init() async {
    opacityClass = appStore.currentSelectedWidget!.widgetViewModel as OpacityClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      children: [
        ExpansionTileView(
          language!.opacity,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                  controller: TextEditingController(text: opacityClass.opacity != null ? opacityClass.opacity.toString() : DEFAULT_OPACITY.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (value) {
                    if (value.isEmpty) {
                      opacityClass.opacity = DEFAULT_OPACITY;
                      appStore.updateData(opacityClass);
                    } else if (double.parse(value) >= 0.0 && double.parse(value) <= 1.0) {
                      opacityClass.opacity = double.parse(value);
                      appStore.updateData(opacityClass);
                    } else {
                      getToast(language!.opacityValueMsg);
                    }
                  }),
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
                  opacityClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      opacityClass.isExpanded = value;
                      appStore.updateData(opacityClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: opacityClass.flex != null ? opacityClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      opacityClass.flex = int.tryParse(s);
                      appStore.updateData(opacityClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(opacityClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
      ],
    );
  }
}
