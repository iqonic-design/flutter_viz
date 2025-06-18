import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsClass/sized_box_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class SizedBoxPropertyView extends StatefulWidget {
  static String tag = '/SizedBoxPropertyView';

  @override
  SizedBoxPropertyViewState createState() => SizedBoxPropertyViewState();
}

class SizedBoxPropertyViewState extends State<SizedBoxPropertyView> {
  var sizedBoxClass;
  TextEditingController? widthController, heightController;

  init() async {
    sizedBoxClass = appStore.currentSelectedWidget!.widgetViewModel as SizedBoxClass?;
    widthController = TextEditingController(
      text: sizedBoxClass.width != null ? getWidthControllerValue(sizedBoxClass.width, sizedBoxClass.widthType) : DEFAULT_SIZED_BOX_WIDTH.toString(),
    );

    heightController = TextEditingController(
      text: sizedBoxClass.height != null ? getWidthControllerValue(sizedBoxClass.height, sizedBoxClass.heightType) : DEFAULT_SIZED_BOX_HEIGHT.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.expandedAndFlex,
          context,
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkBoxView(
                  sizedBoxClass.isExpanded ?? false,
                  language!.expanded,
                  onChanged: (value) {
                    if (getIsExpanded(value).isExpanded!) {
                      sizedBoxClass.isExpanded = value;
                      appStore.updateData(sizedBoxClass);
                      setState(() {});
                    } else {
                      getSnackBarWidget(getIsExpanded(value).message!);
                    }
                  },
                ),
                Container(
                  width: widthPropertySize,
                  child: getTextField(
                    controller: TextEditingController(text: sizedBoxClass.flex != null ? sizedBoxClass.flex.toString() : DEFAULT_FLEX.toString()),
                    textAlign: TextAlign.center,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (s) {
                      sizedBoxClass.flex = int.tryParse(s);
                      appStore.updateData(sizedBoxClass);
                    },
                    maxLength: commonMaxLength,
                  ),
                ).visible(sizedBoxClass.isExpanded),
              ],
            ),
          ],
        ).visible(appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeColumn || appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow),
        ExpansionTileView(
          language!.height,
          context,
          <Widget>[
            getImageWidthType(
              controller: heightController,
              title: language!.height,
              widthType1: 'PX',
              widthType2: '%',
              //isInfinite: false,
              type: sizedBoxClass.heightType,
              onTextChanged: (s) {
                if (s.isEmpty) {
                  sizedBoxClass.height = 0;
                  appStore.updateData(sizedBoxClass);
                } else {
                  if (s.isDigit()) {
                    sizedBoxClass.height = (s.toInt().toDouble() > 100 && sizedBoxClass.heightType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                    appStore.updateData(sizedBoxClass);
                  }
                }
              },
              onTapPer: () {
                sizedBoxClass.heightType = TypePercentage;
                setState(() {});
                sizedBoxClass.height = heightController!.text.toInt().toDouble();
                if (sizedBoxClass.height > 100) {
                  sizedBoxClass.height = DEFAULT_CONTAINER_PER;
                  appStore.updateData(sizedBoxClass);
                } else {
                  appStore.updateData(sizedBoxClass);
                }
              },
              onTapPX: () {
                sizedBoxClass.heightType = TypePX;
                setState(() {});
                sizedBoxClass.height = heightController!.text.toInt().toDouble();
                appStore.updateData(sizedBoxClass);
              },
            ),
          ],
        ),
        ExpansionTileView(
          language!.width,
          context,
          <Widget>[
            getImageWidthType(
              controller: widthController,
              title: language!.width,
              widthType1: 'PX',
              widthType2: '%',
              type: sizedBoxClass.widthType,
              //isInfinite: false,
              onTextChanged: (s) {
                if (s.isEmpty) {
                  sizedBoxClass.width = 0;
                  appStore.updateData(sizedBoxClass);
                } else {
                  if (s.isDigit()) {
                    sizedBoxClass.width = (s.toInt().toDouble() > 100 && sizedBoxClass.widthType == TypePercentage) ? DEFAULT_CONTAINER_PER : s.toInt().toDouble();
                    appStore.updateData(sizedBoxClass);
                  }
                }
              },
              onTapPer: () {
                sizedBoxClass.widthType = TypePercentage;
                setState(() {});
                sizedBoxClass.width = widthController!.text.toInt().toDouble();
                if (sizedBoxClass.width > 100) {
                  sizedBoxClass.width = DEFAULT_CONTAINER_PER;
                  appStore.updateData(sizedBoxClass);
                } else {
                  appStore.updateData(sizedBoxClass);
                }
              },
              onTapPX: () {
                sizedBoxClass.widthType = TypePX;
                setState(() {});
                sizedBoxClass.width = widthController!.text.toInt().toDouble();
                appStore.updateData(sizedBoxClass);
              },
            ),
          ],
        ),
      ],
    );
  }
}
