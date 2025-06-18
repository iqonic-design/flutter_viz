import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/divider_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class DividerPropertyView extends StatefulWidget {
  static String tag = '/DividerPropertyView';

  @override
  DividerPropertyViewState createState() => DividerPropertyViewState();
}

class DividerPropertyViewState extends State<DividerPropertyView> {
  var dividerClass;

  init() async {
    dividerClass = appStore.currentSelectedWidget!.widgetViewModel as DividerClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      children: [
        ExpansionTileView(
          language!.expandedAndFlex,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkBoxView(
                  dividerClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      dividerClass.isExpanded = value;
                      appStore.updateData(dividerClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: dividerClass.flex != null ? dividerClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      dividerClass.flex = int.tryParse(s);
                      appStore.updateData(dividerClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(dividerClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.color,
          context,
          <Widget>[
            ColorView(
              color: dividerClass.dividerColor ?? DEFAULT_DIVIDER_COLOR,
              applyColor: () {
                dividerClass.dividerColor = appStore.color;
                setState(() {});
                appStore.updateData(dividerClass);
              },
              pickColor: () {
                showColorPicker(context, dividerClass.dividerColor ?? DEFAULT_DIVIDER_COLOR, applyOnWidget: (color) {
                  dividerClass.dividerColor = color;
                  appStore.updateData(dividerClass);
                  setState(() {});
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.thickness,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: dividerClass.dividerThickness != null ? dividerClass.dividerThickness.toString() : DEFAULT_DIVIDER_THICKNESS.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  dividerClass.dividerThickness = double.parse(value);
                  appStore.updateData(dividerClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.indent,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: dividerClass.dividerIndent != null ? dividerClass.dividerIndent.toString() : DEFAULT_DIVIDER_INDENT.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  dividerClass.dividerIndent = double.parse(value);
                  appStore.updateData(dividerClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        //
        ExpansionTileView(
          language!.endIndent,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: dividerClass.dividerEndIndent != null ? dividerClass.dividerEndIndent.toString() : DEFAULT_DIVIDER_END_INDENT.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  dividerClass.dividerEndIndent = double.parse(value);
                  appStore.updateData(dividerClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.height,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: dividerClass.height != null ? dividerClass.height.toString() : DEFAULT_DIVIDER_HEIGHT.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  dividerClass.height = double.parse(value);
                  appStore.updateData(dividerClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
