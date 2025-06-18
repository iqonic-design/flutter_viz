import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/column_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class ColumnPropertyView extends StatefulWidget {
  static String tag = '/columnPropertyView';

  @override
  ColumnPropertyViewState createState() => ColumnPropertyViewState();
}

class ColumnPropertyViewState extends State<ColumnPropertyView> {
  var columnClass;
  String? parentType;

  init() async {
    columnClass = appStore.currentSelectedWidget!.widgetViewModel as ColumnClass?;
    parentType = appStore.currentSelectedWidget!.parentWidgetType;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              padding: columnClass.padding,
              onPaddingChanged: (l, t, r, b) {
                columnClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(columnClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: columnClass.isAlignX,
              isAlignY: columnClass.isAlignY,
              alignX: columnClass.horizontalAlignment ?? 0,
              alignY: columnClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                columnClass.horizontalAlignment = h;
                columnClass.verticalAlignment = v;
                appStore.updateData(columnClass);
              },
              isAlignXChanged: (value) {
                columnClass.isAlignX = value;
                appStore.updateData(columnClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                columnClass.isAlignY = value;
                appStore.updateData(columnClass);
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
                  columnClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    bool isChildExpanded = false;
                    bool isChildFullWidth = false;
                    appStore.currentSelectedWidget!.subWidgetsList!.forEach((element) {
                      if (getWidgetCasting(element!).isExpanded ?? false) {
                        isChildExpanded = true;
                      }
                      if (fullWidthWidgetTypeList.contains(element.widgetSubType)) {
                        isChildFullWidth = true;
                      }
                    });
                    if (getIsExpanded(value).isExpanded!) {
                      if ((parentType == WidgetTypeColumn && isChildExpanded && !value) || (parentType == WidgetTypeRow && isChildFullWidth && !value)) {
                        getSnackBarWidget(/*language.columnExpandedMsg*/ parentType == WidgetTypeColumn
                            ? 'You cannot set Expanded to false because it is in a Column and it has an expanded child.'
                            : 'You cannot set Expanded to false because it is in a Row and it have child which is by default has an unConstrained width.');

                        /// You cannot set Expanded to false because it is in a Column and it has an expanded child
                        /// You cannot set Expanded to false because it is in a Row and it have child which is by default has an unConstrained width.
                      } else {
                        columnClass.isExpanded = value;
                        appStore.updateData(columnClass);
                        setState(() {});
                      }
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: columnClass.flex != null ? columnClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      columnClass.flex = int.tryParse(s);
                      appStore.updateData(columnClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(columnClass.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(parentType == WidgetTypeColumn || parentType == WidgetTypeRow),
        ExpansionTileView(
          language!.mainAxisSize,
          context,
          <Widget>[
            getDropDownField(mainAxisSize, defaultValue: columnClass.mainAxisSize ?? AxisMax, onChanged: (value) {
              columnClass.mainAxisSize = value;
              setState(() {});
              appStore.updateData(columnClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.mainAxisAlignment,
          context,
          <Widget>[
            getDropDownField(mainAxisAlignment, defaultValue: columnClass.mainAxisAlignment ?? AxisAlignmentStart, onChanged: (value) {
              columnClass.mainAxisAlignment = value;
              setState(() {});
              appStore.updateData(columnClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.crossAxisAlignment,
          context,
          <Widget>[
            getDropDownField(crossAxisAlignment, defaultValue: columnClass.crossAxisAlignment ?? AxisAlignmentCenter, onChanged: (value) {
              columnClass.crossAxisAlignment = value;
              setState(() {});
              appStore.updateData(columnClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.scrollable,
          context,
          <Widget>[
            checkBoxView(columnClass.isScrollable ?? false, language!.scrollable, onChanged: (value) {
              bool isDefaultScroll = true;
              appStore.currentSelectedWidget!.subWidgetsList!.forEach((element) {
                if (getWidgetCasting(element!).isExpanded) {
                  isDefaultScroll = false;
                }
              });
              if (isDefaultScroll) {
                columnClass.isScrollable = value;
                setState(() {});
                appStore.updateData(columnClass);
              } else {
                getSnackBarWidget('A Column cannot be set to Scrollable if it has an Expanded child.');

                /// A Column cannot be set to Scrollable if it has an Expanded child.
              }
            }),
          ],
        ),
      ],
    );
  }
}
