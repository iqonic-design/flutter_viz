import 'package:flutter_viz/components/faqs_component.dart';
import 'package:flutter_viz/components/media_component.dart';
import 'package:flutter_viz/components/predefine_list_component.dart';
import 'package:flutter_viz/components/profile_component.dart';
import 'package:flutter_viz/components/screen_list_component.dart';
import 'package:flutter_viz/components/reorder_screen_widget.dart';
import 'package:flutter_viz/components/screens_page_components.dart';
import 'package:flutter_viz/components/tree_view_components.dart';
import 'package:flutter_viz/components/widgets_information_component.dart';
import 'package:flutter_viz/components/centerView/center_body_component.dart';
import 'package:flutter_viz/components/leftView/left_component_list_component.dart';
import 'package:flutter_viz/components/leftView/left_widget_list_component.dart';
import 'package:flutter_viz/components/rightView/right_screen_component.dart';
import 'package:flutter_viz/components/tutorials_component.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';

class CenterChildViewScreen extends StatefulWidget {
  final bool isExpanded;

  CenterChildViewScreen({this.isExpanded = true});

  @override
  _CenterChildViewScreenState createState() => _CenterChildViewScreenState();
}

class _CenterChildViewScreenState extends State<CenterChildViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget getChildView(BuildContext context) {
    /// Widgets View
    if (appStore.selectedMenu == WIDGETS_INDEX) {

      return Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: getLeftWidgetsWidth(context),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: widget.isExpanded ? Curves.easeIn : Curves.easeOut,
              child: CenterBodyComponent(),
              width: getCenterScreenWidth(context, isExpanded: widget.isExpanded),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              child: RightScreenComponent(),
              width: getRightPropertyViewWidth(context),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              child: LeftWidgetListComponent(),
              width: getLeftWidgetsWidth(context),
            ),
          ),
        ],
      );
    }

    /// Widgets View
    if (appStore.selectedMenu == PRE_COMPONENTS_INDEX) {

      return Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: getLeftWidgetsWidth(context),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: widget.isExpanded ? Curves.easeIn : Curves.easeOut,
              child: CenterBodyComponent(),
              width: getCenterScreenWidth(context, isExpanded: widget.isExpanded),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              child: RightScreenComponent(),
              width: getRightPropertyViewWidth(context),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              child: LeftComponentListComponent(),
              width: getLeftWidgetsWidth(context),
            ),
          ),
        ],
      );
    } else if (appStore.selectedMenu == SCREEN_INDEX) {
      /// Screens or Pages View
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ScreensPageComponents(),
            width: getLeftWidgetsWidth(context),
          ),
          Container(
            child: CenterBodyComponent(),
            width: getCenterScreenWidth(context, isExpanded: widget.isExpanded),
          ),
          Container(
            child: RightScreenComponent(),
            width: getRightPropertyViewWidth(context),
          )
        ],
      );
    } else if (appStore.selectedMenu == TREE_INDEX) {
      /// Tree View

      return Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: getLeftWidgetsWidth(context),
            child: Container(
              child: CenterBodyComponent(),
              width: getCenterScreenWidth(context, isExpanded: widget.isExpanded),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: Container(
              child: TreeViewComponents(),
              width: getLeftWidgetsWidth(context),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              child: RightScreenComponent(),
              width: getRightPropertyViewWidth(context),
            ),
          )
        ],
      );
    } else if (appStore.selectedMenu == COMPONENT_INDEX) {
      /// Component View

      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: PredefineListComponent(),
            width: getLeftWidgetsWidth(context),
          ),
          Container(
            child: CenterBodyComponent(),
            width: getCenterScreenWidth(context),
          ),
          Container(
            child: ReorderScreenWidget(),
            width: getRightPropertyViewWidth(context),
          )
        ],
      );
    } else if (appStore.selectedMenu == PROFILE_INDEX) {
      /// Profile View
      return Container(
        child: ProfileComponent(),
        width: getChildWidgetsWidth(context, isExpanded: widget.isExpanded),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == TUTORIALS_INDEX) {
      /// Tutorials View
      return Container(
        child: TutorialsComponent(),
        width: getChildWidgetsWidth(context, isExpanded: widget.isExpanded),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == WIDGETS_INFO_INDEX) {
      /// Widgets Information View
      return Container(
        child: WidgetsInformationComponent(),
        width: getChildWidgetsWidth(context, isExpanded: widget.isExpanded),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == FAQS_INDEX) {
      /// FAQS View
      return Container(
        child: FaqsComponent(),
        width: getChildWidgetsWidth(context, isExpanded: widget.isExpanded),
        height: MediaQuery.of(context).size.height,
      );
    } else if (appStore.selectedMenu == SCREEN_LIST_INDEX) {
      /// Screen list View
      return Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: getLeftWidgetsWidth(context),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: widget.isExpanded ? Curves.easeIn : Curves.easeOut,
              child: CenterBodyComponent(),
              width: getCenterScreenWidth(context, isExpanded: widget.isExpanded),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              child: RightScreenComponent(),
              width: getRightPropertyViewWidth(context),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              child: ScreenListComponent(),
              width: getLeftWidgetsWidth(context),
            ),
          ),
        ],
      );
    } else if (appStore.selectedMenu == MEDIA_INDEX) {
      /// Media View
      return Container(
        child: MediaComponent(),
        width: getChildWidgetsWidth(context, isExpanded: widget.isExpanded),
        height: MediaQuery.of(context).size.height,
      );
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return getChildView(context);
    });
  }
}
