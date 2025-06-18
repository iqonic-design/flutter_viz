import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/rating_bar_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import 'comman_property_view.dart';

class RatingBarPropertyView extends StatefulWidget {
  static String tag = '/RatingBarPropertyView';

  @override
  RatingBarPropertyViewState createState() => RatingBarPropertyViewState();
}

class RatingBarPropertyViewState extends State<RatingBarPropertyView> {
  RatingBarClass? ratingBarClass;

  init() async {
    ratingBarClass = appStore.currentSelectedWidget!.widgetViewModel as RatingBarClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(language!.padding, context, <Widget>[
          paddingView(
            padding: ratingBarClass!.padding,
            onPaddingChanged: (l, t, r, b) {
              ratingBarClass!.padding = EdgeInsets.fromLTRB(l, t, r, b);
              appStore.updateData(ratingBarClass);
            },
          ),
        ]),
        ExpansionTileView(
          language!.alignment,
          context,
          <Widget>[
            alignView(
              isAlignX: ratingBarClass!.isAlignX,
              isAlignY: ratingBarClass!.isAlignY,
              alignX: ratingBarClass!.horizontalAlignment ?? 0,
              alignY: ratingBarClass!.verticalAlignment ?? 0,
              onAlignChanged: (h, v) {
                ratingBarClass!.horizontalAlignment = h;
                ratingBarClass!.verticalAlignment = v;
                appStore.updateData(ratingBarClass);
              },
              isAlignXChanged: (value) {
                ratingBarClass!.isAlignX = value;
                appStore.updateData(ratingBarClass);
                appStore.setIsAlignX(value);
              },
              isAlignYChanged: (value) {
                ratingBarClass!.isAlignY = value;
                appStore.updateData(ratingBarClass);
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
                  ratingBarClass!.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      ratingBarClass!.isExpanded = value;
                      appStore.updateData(ratingBarClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: ratingBarClass!.flex != null ? ratingBarClass!.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      ratingBarClass!.flex = int.tryParse(s);
                      appStore.updateData(ratingBarClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(ratingBarClass!.isExpanded!),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.axis,
          context,
          <Widget>[
            getDropDownField(axis, defaultValue: ratingBarClass!.axis ?? AxisHorizontal, onChanged: (value) {
              ratingBarClass!.axis = value;
              setState(() {});
              appStore.updateData(ratingBarClass);
            })
          ],
        ),
        ExpansionTileView(
          language!.rating,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(text: ratingBarClass!.rating != null ? ratingBarClass!.rating.toString() : DEFAULT_RATING.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  ratingBarClass!.rating = double.parse(value);
                  appStore.updateData(ratingBarClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.itemCount,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: ratingBarClass!.ratingItemCount != null ? ratingBarClass!.ratingItemCount.toString() : DEFAULT_RATING_ITEM_COUNT.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  ratingBarClass!.ratingItemCount = int.tryParse(value);
                  appStore.updateData(ratingBarClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.ratingSize,
          context,
          <Widget>[
            Container(
              width: widthPropertySize,
              child: getTextField(
                controller: TextEditingController(
                  text: ratingBarClass!.ratingSize != null ? ratingBarClass!.ratingSize.toString() : DEFAULT_RATING_ITEM_SIZE.toString(),
                ),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (value) {
                  ratingBarClass!.ratingSize = double.parse(value);
                  appStore.updateData(ratingBarClass);
                },
                maxLength: commonMaxLength,
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.ratedColor,
          context,
          <Widget>[
            ColorView(
              color: ratingBarClass!.ratedColor ?? DEFAULT_RATED_COLOR,
              applyColor: () {
                ratingBarClass!.ratedColor = appStore.color;
                setState(() {});
                appStore.updateData(ratingBarClass);
              },
              pickColor: () {
                showColorPicker(context, ratingBarClass!.ratedColor ?? DEFAULT_RATED_COLOR, applyOnWidget: (color) {
                  ratingBarClass!.ratedColor = color;
                  setState(() {});
                  appStore.updateData(ratingBarClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.unRatedColor,
          context,
          <Widget>[
            ColorView(
              color: ratingBarClass!.unRatedColor ?? DEFAULT_UNRATED_COLOR,
              applyColor: () {
                ratingBarClass!.unRatedColor = appStore.color;
                setState(() {});
                appStore.updateData(ratingBarClass);
              },
              pickColor: () {
                showColorPicker(context, ratingBarClass!.unRatedColor ?? DEFAULT_UNRATED_COLOR, applyOnWidget: (color) {
                  ratingBarClass!.unRatedColor = color;
                  setState(() {});
                  appStore.updateData(ratingBarClass);
                });
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.allowHalfRating,
          context,
          <Widget>[
            checkBoxView(
              ratingBarClass!.allowHalfRating ?? false,
              language!.allowHalfRating,
              onChanged: (value) {
                ratingBarClass!.allowHalfRating = value;
                appStore.updateData(ratingBarClass);
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
