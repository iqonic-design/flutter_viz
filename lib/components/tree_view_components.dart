import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/right_click_menu_items.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class TreeViewComponents extends StatefulWidget {
  @override
  _TreeViewComponentsState createState() => _TreeViewComponentsState();
}

class _TreeViewComponentsState extends State<TreeViewComponents> {
  late TreeViewController treeViewController;
  List<Node> nodeChildren = <Node>[];

  @override
  void initState() {
    super.initState();
    trackScreenView(TREE_VIEW_SCREEN);
    init();
    LiveStream().on("updateTreeViewComponents", (a) {
      if (mounted) {
        init();
        setState(() {});
      }
    });
  }

  Future<void> init() async {
    nodeChildren.clear();

    /// Root Node
    Node rootNode = Node(label: WidgetTypeRootView, key: ROOT_VIEW_ID, expanded: true, children: []);

    /// AppBar Nodes
    if (appStore.appBarClass != null) {
      Node appBarNode = Node(
        label: appStore.appBarClass!.widgetSubType!,
        key: appStore.appBarClass!.id!,
        expanded: true,
        children: [],
      );
      rootNode.children.add(appBarNode);
    }

    /// Add All widgets to node
    if (appStore.selectedWidgetList.length > 0) {
      Node defaultNode = Node(
        label: appStore.selectedWidgetList[0].widgetSubType!,
        key: appStore.selectedWidgetList[0].id!,
        expanded: true,
        children: [],
      );

      if (appStore.selectedWidgetList[0].subWidgetsList != null) {
        List<WidgetModel?> subWidgetsList = appStore.selectedWidgetList[0].subWidgetsList!;
        for (int index = 0; index < subWidgetsList.length; index++) {
          Node parentNode = Node(
            label: subWidgetsList[index]!.title!,
            key: (subWidgetsList[index]!.id!.startsWith(DUMMY_WIDGET_ID)) ? appStore.selectedWidgetList[0].id! : subWidgetsList[index]!.id!,
            children: [],
          );
          if (subWidgetsList[index]!.widgetType != WidgetTypeNormal) {
            getChildNodes(subWidgetsList[index]!.subWidgetsList, parentNode, subWidgetsList[index]);
          }
          defaultNode.children.add(parentNode);
        }
      }
      rootNode.children.add(defaultNode);
    }

    /// Drawer Nodes
    if (appStore.drawerClass != null) {
      Node drawerNode = Node(
        label: appStore.drawerClass!.widgetSubType!,
        key: appStore.drawerClass!.id!,
        expanded: true,
        children: [],
      );
      rootNode.children.add(drawerNode);
    }

    /// Bottom Navigation bar Nodes
    if (appStore.bottomNavigationBarClass != null) {
      Node bnBarNode = Node(
        label: appStore.bottomNavigationBarClass!.widgetSubType!,
        key: appStore.bottomNavigationBarClass!.id!,
        expanded: true,
        children: [],
      );
      rootNode.children.add(bnBarNode);
    }

    nodeChildren.add(rootNode);
    treeViewController = TreeViewController(children: nodeChildren);
  }

  void getChildNodes(aSelectedWidgetList, Node aParentNode, WidgetModel? widgetModel) {
    for (int index = 0; index < aSelectedWidgetList.length; index++) {
      Node childNode = Node(
        label: aSelectedWidgetList[index].title,
        key: (aSelectedWidgetList[index].id.startsWith(DUMMY_WIDGET_ID)) ? widgetModel!.id! : aSelectedWidgetList[index].id,
        children: [],
      );
      if (aSelectedWidgetList[index].widgetType != WidgetTypeNormal) {
        getChildNodes(aSelectedWidgetList[index].subWidgetsList, childNode, aSelectedWidgetList[index]);
      }
      aParentNode.children.add(childNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationWithShadow(
        backgroundColor: appStore.isDarkMode ? darkModePrimaryColorBackground : Colors.white,
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
      child: Listener(
        onPointerDown: (event) {
          onLayoutWidgetMenuItem(event, context);
        },
        child: TreeView(
          controller: treeViewController,
          allowParentSelect: true,
          onNodeTap: (key) {
            Node selectedNode = treeViewController.getNode(key)!;
            appStore.selectViewFromTree(selectedNode);
          },
          theme: TreeViewTheme(
            parentLabelStyle: secondaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor),
            labelStyle: secondaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : menuTextColor),
            expanderTheme: ExpanderThemeData(
              color: context.iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
