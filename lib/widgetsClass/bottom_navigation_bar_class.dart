import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/bottom_navigation_bar_item_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarClass {
  /// Selected Item Color
  Color? selectedItemColor;

  /// UnSelected Item Color
  Color? unselectedItemColor;

  /// Size of icon
  double? iconSize;

  /// Size of selectedFontSize
  double? selectedFontSize;

  /// Size of unselectedFontSize
  double? unselectedFontSize;

  /// The index into items for the current active BottomNavigationBarItem.
  int? currentIndex;

  ///  color of the BottomNavigationBar
  Color? backgroundColor;

  /// Elevation
  double? elevation;

  /// Whether the labels are shown for the unselected BottomNavigationBarItems.
  bool? showUnselectedLabels;

  /// Whether the labels are shown for the selected BottomNavigationBarItems.
  bool? showSelectedLabels;

  /// BottomNavigationBar items
  List<BottomNavigationBarItemModel?> bottomNavigationBarItems = [
    BottomNavigationBarItemModel(icon: IconResponse(codePoint: 58136, fontFamily: 'MaterialIcons', iconName: "home"), label: "Home"),
    BottomNavigationBarItemModel(icon: IconResponse(codePoint: 57411, fontFamily: 'MaterialIcons', iconName: "account_circle"), label: "Account"),
  ];

  BottomNavigationBarClass({
    this.selectedItemColor,
    this.unselectedItemColor,
    this.iconSize,
    this.selectedFontSize,
    this.unselectedFontSize,
    this.currentIndex,
    this.backgroundColor,
    this.elevation,
    this.showUnselectedLabels = true,
    this.showSelectedLabels = true,
  });

  BottomNavigationBarClass.fromJson(Map<String, dynamic> json) {
    selectedItemColor = json['selectedItemColor'] != null ? fromJsonColor(json['selectedItemColor']) : COMMON_BG_COLOR;
    unselectedItemColor = json['unselectedItemColor'] != null ? fromJsonColor(json['unselectedItemColor']) : UNSELECTED_ITEM_COLOR;
    iconSize = json['iconSize'] != null ? json['iconSize'] : DEFAULT_ICON_SIZE;
    selectedFontSize = json['selectedFontSize'] != null ? json['selectedFontSize'] : DEFAULT_FONT_SIZE;
    unselectedFontSize = json['unselectedFontSize'] != null ? json['unselectedFontSize'] : DEFAULT_FONT_SIZE;
    currentIndex = json['currentIndex'] != null ? json['currentIndex'] : 0;
    backgroundColor = json['backgroundColor'] != null ? fromJsonColor(json['backgroundColor']) : BOTTOM_NAVIGATION_BG_COLOR;
    elevation = json['elevation'] != null ? json['elevation'] : BOTTOM_NAVIGATION_ELEVATION;
    showUnselectedLabels = json['showUnselectedLabels'] != null ? json['showUnselectedLabels'] : true;
    showSelectedLabels = json['showSelectedLabels'] != null ? json['showSelectedLabels'] : true;
    if (json['bottomNavigationBarItems'] != null) {
      bottomNavigationBarItems = [];
      json['bottomNavigationBarItems'].forEach((v) {
        bottomNavigationBarItems.add(new BottomNavigationBarItemModel.fromJson(v));
      });
    } else {
      bottomNavigationBarItems = [
        BottomNavigationBarItemModel(icon: IconResponse(codePoint: 58136, fontFamily: 'MaterialIcons', iconName: "home"), label: "Home"),
        BottomNavigationBarItemModel(icon: IconResponse(codePoint: 57411, fontFamily: 'MaterialIcons', iconName: "account_circle"), label: "Account"),
      ];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.selectedItemColor != null) {
      data['selectedItemColor'] = toJsonColor(this.selectedItemColor!);
    }
    if (this.unselectedItemColor != null) {
      data['unselectedItemColor'] = toJsonColor(this.unselectedItemColor!);
    }
    if (this.iconSize != null) {
      data['iconSize'] = this.iconSize;
    }
    if (this.selectedFontSize != null) {
      data['selectedFontSize'] = this.selectedFontSize;
    }
    if (this.unselectedFontSize != null) {
      data['unselectedFontSize'] = this.unselectedFontSize;
    }
    if (this.bottomNavigationBarItems.isNotEmpty) {
      data['bottomNavigationBarItems'] = this.bottomNavigationBarItems;
    }
    if (this.currentIndex != null) {
      data['currentIndex'] = this.currentIndex;
    }
    if (this.elevation != null) {
      data['elevation'] = this.elevation;
    }
    if (this.backgroundColor != null) {
      data['backgroundColor'] = toJsonColor(this.backgroundColor!);
    }
    if (this.showUnselectedLabels != null) {
      data['showUnselectedLabels'] = this.showUnselectedLabels;
    }
    if (this.showSelectedLabels != null) {
      data['showSelectedLabels'] = this.showSelectedLabels;
    }
    return data;
  }

  Widget getBottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: bottomNavigationBarItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(IconData(item!.icon!.codePoint!, fontFamily: item.icon!.fontFamily)),
          label: item.label,
        );
      }).toList(),
      backgroundColor: backgroundColor ?? BOTTOM_NAVIGATION_BG_COLOR,
      currentIndex: currentIndex ?? 0,
      elevation: elevation ?? BOTTOM_NAVIGATION_ELEVATION,
      iconSize: iconSize ?? DEFAULT_ICON_SIZE,
      selectedItemColor: selectedItemColor ?? COMMON_BG_COLOR,
      unselectedItemColor: unselectedItemColor ?? UNSELECTED_ITEM_COLOR,
      selectedFontSize: selectedFontSize ?? DEFAULT_FONT_SIZE,
      unselectedFontSize: unselectedFontSize ?? DEFAULT_FONT_SIZE,
      showSelectedLabels: showSelectedLabels ?? true,
      showUnselectedLabels: showUnselectedLabels ?? true,
      onTap: (value) {
        appStore.selectBottomNavigation();
      },
    );
  }

  getBottomNavigationBarString() {
    return "BottomNavigationBar(\n"
        "items: flutterVizBottomNavigationBarItems.map((FlutterVizBottomNavigationBarModel item) {\n"
        "return BottomNavigationBarItem(\n"
        "icon: Icon(item.icon),\n"
        "label: item.label\n,"
        " );\n"
        " }).toList(),\n"
        "backgroundColor: ${backgroundColor ?? BOTTOM_NAVIGATION_BG_COLOR},\n"
        "currentIndex: ${currentIndex ?? 0},\n"
        "elevation: ${elevation ?? BOTTOM_NAVIGATION_ELEVATION},\n"
        "iconSize: ${iconSize ?? DEFAULT_ICON_SIZE},\n"
        "selectedItemColor: ${selectedItemColor ?? COMMON_BG_COLOR},\n"
        "unselectedItemColor: ${unselectedItemColor ?? UNSELECTED_ITEM_COLOR},\n"
        "selectedFontSize: ${selectedFontSize ?? DEFAULT_FONT_SIZE},\n"
        "unselectedFontSize:${unselectedFontSize ?? DEFAULT_FONT_SIZE},\n"
        "showSelectedLabels: ${showSelectedLabels ?? true},\n"
        "showUnselectedLabels: ${showUnselectedLabels ?? true},\n"
        "onTap: (value){},\n"
        ")";
  }

  /// For view code
  getCodeAsString() {
    return getBottomNavigationBarString();
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'flutterViz_bottom_navigationBar_model.dart';"];
  }
}
