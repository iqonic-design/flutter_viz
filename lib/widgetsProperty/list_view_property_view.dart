import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/list_view_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import 'comman_property_view.dart';

class ListViewPropertyView extends StatefulWidget {
  static String tag = '/ListViewPropertyView';

  @override
  ListViewPropertyViewState createState() => ListViewPropertyViewState();
}

class ListViewPropertyViewState extends State<ListViewPropertyView> {
  ListViewClass? listViewClass;
  String? parentWidgetType = appStore.currentSelectedWidget!.parentWidgetType;

  init() async {
    listViewClass = appStore.currentSelectedWidget!.widgetViewModel as ListViewClass?;
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
                onPaddingChanged: (l, t, r, b) {
                  listViewClass!.padding = EdgeInsets.fromLTRB(l, t, r, b);
                  appStore.updateData(listViewClass);
                },
                padding: listViewClass!.padding ?? EdgeInsets.zero),
          ],
        ),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: listViewClass!.isAlignX,
              isAlignY: listViewClass!.isAlignY,
              alignX: listViewClass!.horizontalAlignment ?? 0,
              alignY: listViewClass!.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                listViewClass!.horizontalAlignment = h;
                listViewClass!.verticalAlignment = v;
                appStore.updateData(listViewClass);
              },
              isAlignXChanged: (value) {
                listViewClass!.isAlignX = value;
                appStore.updateData(listViewClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                listViewClass!.isAlignY = value;
                appStore.updateData(listViewClass);
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
                  listViewClass!.isExpanded ?? true,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      if ((parentWidgetType == WidgetTypeColumn && listViewClass!.axis == AxisVertical && (listViewClass!.shrinkWrap ?? false)) ||
                          (parentWidgetType == WidgetTypeRow && listViewClass!.axis == AxisHorizontal && (listViewClass!.shrinkWrap ?? false))) {
                        listViewClass!.isExpanded = value;
                        appStore.updateData(listViewClass);
                        setState(() {});
                      } else {
                        getSnackBarWidget(parentWidgetType == WidgetTypeColumn
                            ? listViewClass!.axis == AxisVertical
                                ? 'Vertical ListView cannot set expanded to false if it is in Column and it has undefined height.set ShrinkWrap to true.'
                                : 'Horizontal ListView cannot set expanded to false if its is in Column.'
                            : listViewClass!.axis == AxisVertical
                                ? 'Vertical ListView cannot set expanded to false if it is in Row.'
                                : 'Horizontal ListView cannot set expanded to false if it is in Row and it has undefined width.set ShrinkWrap to true.');

                        /// Vertical ListView cannot set expanded to false if it is in Column and it has undefined height.set ShrinkWrap to true.
                        /// Horizontal ListView cannot set expanded to false if it is in Row and it has undefined width.set ShrinkWrap to true.
                        /// Vertical ListView cannot set expanded to false if it is in Row.
                        /// Horizontal ListView cannot set expanded to false if its is in Column.
                      }
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: listViewClass!.flex != null ? listViewClass!.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      listViewClass!.flex = int.tryParse(s);
                      appStore.updateData(listViewClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(listViewClass!.isExpanded ?? true),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.axis,
          context,
          <Widget>[
            getDropDownField(axis, defaultValue: listViewClass!.axis ?? AxisVertical, onChanged: (value) {
              bool isExpanded = false;
              bool isFullWidthChild = false;
              bool isFullHeightChild = false;
              if (appStore.currentSelectedWidget!.subWidgetsList != null) {
                appStore.currentSelectedWidget!.subWidgetsList!.map((item) {
                  if (item!.widgetSubType == WidgetTypeColumn) {
                    List<WidgetModel?> subChildList = item.subWidgetsList!;
                    subChildList.map((mData) {
                      if (getWidgetCasting(mData!).isExpanded && value == AxisVertical) {
                        isExpanded = true;
                      }
                      if (value == AxisHorizontal && fullWidthWidgetTypeList.contains(mData.widgetSubType)) {
                        isFullWidthChild = true;
                      }
                    }).toList();
                  } else if (item.widgetSubType == WidgetTypeRow) {
                    List<WidgetModel?> subChildList = item.subWidgetsList!;
                    subChildList.map((mData) {
                      if (getWidgetCasting(mData!).isExpanded && value == AxisHorizontal) {
                        isExpanded = true;
                      }
                      if (value == AxisVertical && fullHeightWidgetTypeList.contains(mData.widgetSubType)) {
                        isFullHeightChild = true;
                      }
                    }).toList();
                  } else if (fullWidthWidgetTypeList.contains(item.widgetSubType) && value == AxisHorizontal) {
                    isFullWidthChild = true;
                  }
                }).toList();
              }
              if (parentWidgetType == WidgetTypeColumn && !listViewClass!.isExpanded! && listViewClass!.shrinkWrap! && value == AxisHorizontal) {
                getSnackBarWidget('You cannot change axis to horizontal if it is in Column and it is not expanded.set Expanded to true.');

                /// You cannot change axis to horizontal if it is in Column and it is not expanded,set expanded to true
              } else if (parentWidgetType == WidgetTypeRow && !listViewClass!.isExpanded! && listViewClass!.shrinkWrap! && value == AxisVertical) {
                getSnackBarWidget(' You cannot change axis to vertical if it is in Row and it is not expanded.set Expanded to true.');

                /// You cannot change axis to vertical if it is in Row and it is not expanded,set expanded to true
              } else if (isExpanded || isFullWidthChild || isFullHeightChild) {
                getSnackBarWidget('');

                /// Not Permitted
              } else {
                listViewClass!.axis = value;
                setState(() {});
                appStore.updateData(listViewClass);
              }
            })
          ],
        ),
        ExpansionTileView(
          language!.shrinkWrap,
          context,
          <Widget>[
            checkBoxView(
              listViewClass!.shrinkWrap ?? false,
              language!.shrinkWrap,
              onChanged: (value) {
                if (!(listViewClass!.isExpanded ?? false) && !value) {
                  getSnackBarWidget(parentWidgetType == WidgetTypeColumn
                      ? 'Vertical listView cannot Set ShrinkWrap to false if it is in a Column and  it is not expanded.Set Expanded to true.'
                      : 'Horizontal listView cannot Set ShrinkWrap to false if it is in a Row and  it is not expanded.Set Expanded to true.');

                  /// Vertical listView cannot Set ShrinkWrap to false if it is in a Column and  it is not expanded.Set expanded to true.
                  /// Horizontal listView cannot Set ShrinkWrap to false if it is in a Row and  it is not expanded.Set expanded to true.
                } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow && appStore.currentParentWidget!.parentWidgetType == WidgetTypeList && !value) {
                  getSnackBarWidget('');
                } else {
                  listViewClass!.shrinkWrap = value;
                  appStore.updateData(listViewClass);
                  setState(() {});
                }
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.scrollPhysics,
          context,
          <Widget>[
            getDropDownField(scrollPhysics, defaultValue: listViewClass!.scrollPhysics ?? ScrollScrollPhysics, onChanged: (value) {
              listViewClass!.scrollPhysics = value;
              setState(() {});
              appStore.updateData(listViewClass);
            })
          ],
        ),
      ],
    );
  }
}
