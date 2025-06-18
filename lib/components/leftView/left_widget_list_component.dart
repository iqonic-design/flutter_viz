import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/utils/CustomExpansion.dart' as custom;
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

class LeftWidgetListComponent extends StatefulWidget {
  @override
  _LeftWidgetListComponentState createState() => _LeftWidgetListComponentState();
}

class _LeftWidgetListComponentState extends State<LeftWidgetListComponent> {
  TextEditingController searchController = TextEditingController();

  List<WidgetModel> tempPageWidgetsList = [];
  List<WidgetModel> tempBaseWidgetsList = [];
  List<WidgetModel> tempLayoutWidgetsList = [];

  bool isClick = false;
  String selectedText = "";
  int selectedIndex = 0;
  int _crossAxisCount = 3;
  double _crossAxisSpacing = 10;
  double _mainAxisSpacing = 10;
  double _childAspectRatio = 1;

  @override
  void initState() {
    super.initState();
    tempPageWidgetsList.addAll(pageWidgetsList);
    tempBaseWidgetsList.addAll(baseWidgetsList);
    tempLayoutWidgetsList.addAll(layoutWidgetsList);
  }

  void searchOperation(String searchText) {
    tempPageWidgetsList.clear();
    tempBaseWidgetsList.clear();
    tempLayoutWidgetsList.clear();
    pageWidgetsList.forEachIndexed((element, index) {
      if (element.title!.trim().toLowerCase().contains(searchText.trim().toLowerCase())) {
        tempPageWidgetsList.add(element);
      }
    });
    baseWidgetsList.forEachIndexed((element, index) {
      if (element.title!.trim().toLowerCase().contains(searchText.trim().toLowerCase())) {
        tempBaseWidgetsList.add(element);
      }
    });
    layoutWidgetsList.forEachIndexed((element, index) {
      if (element.title!.trim().toLowerCase().contains(searchText.trim().toLowerCase())) {
        tempLayoutWidgetsList.add(element);
      }
    });
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget feedbackView(WidgetModel widgetModel) {
      return Container(
        margin: EdgeInsets.all(5),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(4),
          backgroundColor: menuMouseHoverColor,
          boxShadow: [
            BoxShadow(offset: Offset(1, 3), color: appShadowColorDark, blurRadius: 4.0),
          ],
          border: Border.all(color: colorPrimary, width: 2),
        ),
        height: 100,
        width: 100,
        child: SvgPicture.asset(
          "${getWidgetsIcon(widgetModel.widgetSubType)}",
        ),
      );
    }

    Widget widgetExpansionTileView(String title, BuildContext context, List<WidgetModel> widgetList, {isInitiallyExpanded = false}) {
      return custom.ExpansionTile(
        title: Text(
          title,
          style: TextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        iconColor: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor,
        initiallyExpanded: isInitiallyExpanded,
        headerBackgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : leftExpansionTileBackgroundColor,
        children: <Widget>[
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            itemCount: widgetList.length,
            itemBuilder: (context, index) {
              WidgetModel item = widgetList[index];
              return Draggable<WidgetModel>(
                data: item,
                dragAnchorStrategy: pointerDragAnchorStrategy,
                child: item.displayWidget!,
                childWhenDragging: getDisplayWidget(
                  getWidgetsIcon(item.widgetSubType),
                  getWidgetTitle(item.widgetSubType),
                  isDragging: true,
                ),
                feedback: feedbackView(item),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              crossAxisSpacing: _crossAxisSpacing,
              mainAxisSpacing: _mainAxisSpacing,
              childAspectRatio: _childAspectRatio,
            ),
          ),
        ],
      );
    }

    return Container(
      decoration: boxDecorationWithShadow(
        backgroundColor: context.scaffoldBackgroundColor,
        boxShadow: [
          appStore.isDarkMode
              ? commonCardBoxShadowDarkMode()
              : BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(6, 6),
                ),
        ],
      ),
      child: Column(
        children: [
          TextFormField(
            controller: searchController,
            style: primaryTextStyle(),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, size: btnIconSize, color: context.iconColor),
              suffixIcon: searchController.text.isNotEmpty
                  ? Icon(Icons.close, size: btnIconSize, color: context.iconColor).onTap(() {
                      searchController.clear();
                      searchOperation(searchController.text);
                    })
                  : SizedBox(),
              filled: true,
              fillColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
              hintText: language!.searchForWidget,
              hintStyle: secondaryTextStyle(),
              contentPadding: EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor),
                borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR),
                borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
              ),
            ),
            onChanged: searchOperation,
          ).paddingAll(10),
          ListView(
            shrinkWrap: true,
            children: [
              tempPageWidgetsList.isNotEmpty ? widgetExpansionTileView(language!.pageWidget, context, tempPageWidgetsList, isInitiallyExpanded: true) : SizedBox(),
              tempLayoutWidgetsList.isNotEmpty ? widgetExpansionTileView(language!.layoutWidget, context, tempLayoutWidgetsList, isInitiallyExpanded: true) : SizedBox(),
              tempBaseWidgetsList.isNotEmpty ? widgetExpansionTileView(language!.baseWidget, context, tempBaseWidgetsList, isInitiallyExpanded: true) : SizedBox(),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
