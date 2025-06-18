import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/grid_view_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class GridViewPropertyView extends StatefulWidget {
  static String tag = '/GridViewPropertyView';

  @override
  GridViewPropertyViewState createState() => GridViewPropertyViewState();
}

class GridViewPropertyViewState extends State<GridViewPropertyView> {
  GridViewClass? gridViewClass;
  String? parentWidgetType = appStore.currentSelectedWidget!.parentWidgetType;

  init() async {
    gridViewClass = appStore.currentSelectedWidget!.widgetViewModel as GridViewClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.padding,
          context,
          <Widget>[
            paddingView(
              onPaddingChanged: (l, t, r, b) {
                gridViewClass!.padding = EdgeInsets.fromLTRB(l, t, r, b);
                appStore.updateData(gridViewClass);
              },
              padding: gridViewClass!.padding,
            ),
          ],
        ),
        ExpansionTileView(
            language!.alignment,
            context,
            <Widget>[
              alignView(
                isAlignX: gridViewClass!.isAlignX,
                isAlignY: gridViewClass!.isAlignY,
                alignX: gridViewClass!.horizontalAlignment ?? 0,
                alignY: gridViewClass!.verticalAlignment ?? 0,
                onAlignChanged: (h, v) {
                  gridViewClass!.horizontalAlignment = h;
                  gridViewClass!.verticalAlignment = v;
                  appStore.updateData(gridViewClass);
                },
                isAlignXChanged: (value) {
                  gridViewClass!.isAlignX = value;
                  appStore.updateData(gridViewClass);
                  appStore.setIsAlignX(value);
                },
                isAlignYChanged: (value) {
                  gridViewClass!.isAlignY = value;
                  appStore.updateData(gridViewClass);
                  appStore.setIsAlignY(value);
                },
              ),
            ],
            isInitiallyExpanded: false),
        ExpansionTileView(
          language!.expandedAndFlex,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkBoxView(
                  gridViewClass!.isExpanded ?? true,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      if ((parentWidgetType == WidgetTypeColumn && gridViewClass!.axis == AxisVertical && (gridViewClass!.shrinkWrap ?? false)) ||
                          (parentWidgetType == WidgetTypeRow && gridViewClass!.axis == AxisHorizontal && (gridViewClass!.shrinkWrap ?? false))) {
                        gridViewClass!.isExpanded = value;
                        appStore.updateData(gridViewClass);
                        setState(() {});
                      } else {
                        getSnackBarWidget(
                            '${parentWidgetType == WidgetTypeColumn ? gridViewClass!.axis == AxisVertical ? 'Vertical GridView cannot set expanded to false if it is in Column and it has undefined height.set ShrinkWrap to true.' : 'Horizontal GridView cannot set expanded to false if its is in Column.' : gridViewClass!.axis == AxisVertical ? 'Vertical GridView cannot set expanded to false if it is in Row.' : 'Horizontal GridView cannot set expanded to false if it is in Row and it has undefined width.set ShrinkWrap to true.'}');

                        /// Vertical GridView cannot set expanded to false if it is in Column and it has undefined height.set ShrinkWrap to true.
                        /// Horizontal GridView cannot set expanded to false if it is in Row and it has undefined width.set ShrinkWrap to true.
                        /// Vertical GridView cannot set expanded to false if it is in Row.
                        /// Horizontal GridView cannot set expanded to false if its is in Column.
                      }
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: gridViewClass!.flex != null ? gridViewClass!.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      gridViewClass!.flex = int.tryParse(s);
                      appStore.updateData(gridViewClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(gridViewClass!.isExpanded ?? true),
              ],
            ),
          ],
        ).visible(parentWidgetType == WidgetTypeColumn || parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
            language!.axis,
            context,
            <Widget>[
              getDropDownField(axis, defaultValue: gridViewClass!.axis ?? AxisVertical, onChanged: (value) {
                if (parentWidgetType == WidgetTypeColumn && !gridViewClass!.isExpanded! && gridViewClass!.shrinkWrap! && value == AxisHorizontal) {
                  getSnackBarWidget('You cannot change axis to horizontal if it is in Column and it is not expanded.set expanded property to true.');

                  /// You cannot change axis to horizontal if it is in Column and it not expanded.set expanded to true
                } else if (parentWidgetType == WidgetTypeRow && !gridViewClass!.isExpanded! && gridViewClass!.shrinkWrap! && value == AxisVertical) {
                  getSnackBarWidget('You cannot change axis to vertical if it is in Row and it is not expanded.set expanded property to true.');

                  /// You cannot change axis to vertical if it is in Row and it not expanded.set expanded to true
                } else {
                  gridViewClass!.axis = value;
                  setState(() {});
                  appStore.updateData(gridViewClass);
                }
              })
            ],
            isInitiallyExpanded: true),
        ExpansionTileView(
          language!.crossAxisCount,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: gridViewClass!.crossAxisCount != null ? gridViewClass!.crossAxisCount.toString() : DEFAULT_CROSS_AXIS_COUNT.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  gridViewClass!.crossAxisCount = value.toString().isNotEmpty ? value.toInt() : DEFAULT_CROSS_AXIS_COUNT;
                  appStore.updateData(gridViewClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.crossAxisSpacing,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: gridViewClass!.crossAxisSpacing != null ? gridViewClass!.crossAxisSpacing.toString() : DEFAULT_CROSS_AXIS_SPACING.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  gridViewClass!.crossAxisSpacing = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_CROSS_AXIS_SPACING;
                  appStore.updateData(gridViewClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.mainAxisSpacing,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: gridViewClass!.mainAxisSpacing != null ? gridViewClass!.mainAxisSpacing.toString() : DEFAULT_MAIN_AXIS_SPACING.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  gridViewClass!.mainAxisSpacing = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_MAIN_AXIS_SPACING;
                  appStore.updateData(gridViewClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.childAspectRatio,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: gridViewClass!.childAspectRatio != null ? gridViewClass!.childAspectRatio.toString() : DEFAULT_CHILD_ASPECT_RATIO.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  gridViewClass!.childAspectRatio = value.toString().isNotEmpty ? double.parse(value) : DEFAULT_CHILD_ASPECT_RATIO;
                  appStore.updateData(gridViewClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.shrinkWrap,
          context,
          <Widget>[
            checkBoxView(
              gridViewClass!.shrinkWrap ?? false,
              language!.shrinkWrap,
              onChanged: (value) {
                if (!(gridViewClass!.isExpanded ?? false) && !value) {
                  getSnackBarWidget(
                      '${parentWidgetType == WidgetTypeColumn ? 'Vertical gridView cannot Set ShrinkWrap to false if it is in a Column and  it is not expanded.Set expanded to true.' : 'Horizontal gridView cannot Set ShrinkWrap to false if it is in a Row and  it is not expanded.Set expanded to true.'}');

                  /// Vertical gridView cannot Set ShrinkWrap to false if it is in a Column and  it is not expanded.Set expanded to true.
                  /// Horizontal gridView cannot Set ShrinkWrap to false if it is in a Row and  it is not expanded.Set expanded to true.
                } else if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow && appStore.currentParentWidget!.parentWidgetType == WidgetTypeList && !value) {
                  getSnackBarWidget('');
                } else {
                  gridViewClass!.shrinkWrap = value;
                  appStore.updateData(gridViewClass);
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
              getDropDownField(scrollPhysics, onChanged: (value) {
                gridViewClass!.scrollPhysics = value;
                setState(() {});
                appStore.updateData(gridViewClass);
              }, defaultValue: gridViewClass!.scrollPhysics ?? ScrollScrollPhysics)
            ],
            isInitiallyExpanded: true),
      ],
    );
  }
}
