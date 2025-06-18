import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/row_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'comman_property_view.dart';
import 'package:nb_utils/nb_utils.dart';

class RowPropertyView extends StatefulWidget {
  static String tag = '/RowPropertyView';

  @override
  RowPropertyViewState createState() => RowPropertyViewState();
}

class RowPropertyViewState extends State<RowPropertyView> {
  var rowClass;
  String? parentType;

  init() async {
    rowClass = appStore.currentSelectedWidget!.widgetViewModel as RowClass?;
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
              padding: rowClass.padding,
              onPaddingChanged: (l, t, r, b) {
                rowClass.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(rowClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: rowClass.isAlignX,
              isAlignY: rowClass.isAlignY,
              alignX: rowClass.horizontalAlignment ?? 0,
              alignY: rowClass.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                rowClass.horizontalAlignment = h;
                rowClass.verticalAlignment = v;
                appStore.updateData(rowClass);
              },
              isAlignXChanged: (value) {
                rowClass.isAlignX = value;
                appStore.updateData(rowClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                rowClass.isAlignY = value;
                appStore.updateData(rowClass);
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
                  rowClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    bool isChildExpanded = false;
                    bool isChildFullHeight = false;
                    appStore.currentSelectedWidget!.subWidgetsList!.forEach((element) {
                      if (getWidgetCasting(element!).isExpanded ?? false) {
                        isChildExpanded = true;
                      }
                      if (fullHeightWidgetTypeList.contains(element.widgetSubType)) {
                        isChildFullHeight = true;
                      }
                    });
                    if (getIsExpanded(value).isExpanded!) {
                      if ((parentType == WidgetTypeRow && isChildExpanded && !value) || (parentType == WidgetTypeColumn && isChildFullHeight && !value)) {
                        getSnackBarWidget(parentType == WidgetTypeRow
                            ? 'You cannot set Expanded to false because it is in a Row and it an expanded child'
                            : 'You cannot set Expanded to false because it is in a Column and it have child which is by default has an unbounded height.');

                        /// You cannot set Expanded to false because it is in a Row and it an expanded child
                        /// You cannot set Expanded to false because it is in a Column and it have child which is by default has an unConstrained height.
                      } else {
                        rowClass.isExpanded = value;
                        appStore.updateData(rowClass);
                        setState(() {});
                      }
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: 70,
                  child: getTextField(
                    controller: TextEditingController(text: rowClass.flex != null ? rowClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      rowClass.flex = int.tryParse(s);
                      appStore.updateData(rowClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(rowClass.isExpanded ?? false),
              ],
            ),
          ],
        ).visible(parentType == WidgetTypeColumn || parentType == WidgetTypeRow),
        ExpansionTileView(
          language!.mainAxisSize,
          context,
          <Widget>[
            getDropDownField(mainAxisSize, defaultValue: rowClass.mainAxisSize ?? AxisMax, onChanged: (value) {
              rowClass.mainAxisSize = value;
              setState(() {});
              appStore.updateData(rowClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.mainAxisAlignment,
          context,
          <Widget>[
            getDropDownField(mainAxisAlignment, defaultValue: rowClass.mainAxisAlignment ?? AxisAlignmentStart, onChanged: (value) {
              rowClass.mainAxisAlignment = value;
              setState(() {});
              appStore.updateData(rowClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.crossAxisAlignment,
          context,
          <Widget>[
            getDropDownField(crossAxisAlignment, defaultValue: rowClass.crossAxisAlignment ?? AxisAlignmentCenter, onChanged: (value) {
              rowClass.crossAxisAlignment = value;
              setState(() {});
              appStore.updateData(rowClass);
            }),
          ],
        ),
        ExpansionTileView(
          language!.scrollable,
          context,
          <Widget>[
            checkBoxView(
              rowClass.isScrollable ?? false,
              language!.scrollable,
              onChanged: (value) {
                bool isDefaultScroll = true;
                appStore.currentSelectedWidget!.subWidgetsList!.forEach((element) {
                  if (getWidgetCasting(element!).isExpanded) {
                    isDefaultScroll = false;
                  }
                });
                if (isDefaultScroll) {
                  rowClass.isScrollable = value;
                  setState(() {});
                  appStore.updateData(rowClass);
                } else {
                  getSnackBarWidget('A Row cannot be set to Scrollable if it has an Expanded child.');

                  /// A Row cannot be set to Scrollable if it has an Expanded child.
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
