import 'dart:convert';

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/bottom_navigation_bar_item_model.dart';
import 'package:flutter_viz/model/download_model.dart';
import 'package:flutter_viz/model/drawer_Item_model.dart';
import 'package:flutter_viz/model/models.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/screen/login_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsClass/Icon_class.dart';
import 'package:flutter_viz/widgetsClass/Image_class.dart';
import 'package:flutter_viz/widgetsClass/app_bar_class.dart';
import 'package:flutter_viz/widgetsClass/audio_player_class.dart';
import 'package:flutter_viz/widgetsClass/bottom_navigation_bar_class.dart';
import 'package:flutter_viz/widgetsClass/calender_class.dart';
import 'package:flutter_viz/widgetsClass/card_class.dart';
import 'package:flutter_viz/widgetsClass/checkbox_class.dart';
import 'package:flutter_viz/widgetsClass/checkbox_list_tile_class.dart';
import 'package:flutter_viz/widgetsClass/chip_view_class.dart';
import 'package:flutter_viz/widgetsClass/circle_image_class.dart';
import 'package:flutter_viz/widgetsClass/clip_rrect_class.dart';
import 'package:flutter_viz/widgetsClass/column_class.dart';
import 'package:flutter_viz/widgetsClass/constrained_box_class.dart';
import 'package:flutter_viz/widgetsClass/container_class.dart';
import 'package:flutter_viz/widgetsClass/credit_card_view_class.dart';
import 'package:flutter_viz/widgetsClass/divider_class.dart';
import 'package:flutter_viz/widgetsClass/drop_down_class.dart';
import 'package:flutter_viz/widgetsClass/google_map_class.dart';
import 'package:flutter_viz/widgetsClass/grid_view_class.dart';
import 'package:flutter_viz/widgetsClass/icon_button_class.dart';
import 'package:flutter_viz/widgetsClass/image_icon_class.dart';
import 'package:flutter_viz/widgetsClass/left_drawer_class.dart';
import 'package:flutter_viz/widgetsClass/linear_progress_indicator_class.dart';
import 'package:flutter_viz/widgetsClass/list_tile_class.dart';
import 'package:flutter_viz/widgetsClass/list_view_class.dart';
import 'package:flutter_viz/widgetsClass/lottie_animation_class.dart';
import 'package:flutter_viz/widgetsClass/opacity_class.dart';
import 'package:flutter_viz/widgetsClass/otp_text_field_class.dart';
import 'package:flutter_viz/widgetsClass/page_view_class.dart';
import 'package:flutter_viz/widgetsClass/radio_button_class.dart';
import 'package:flutter_viz/widgetsClass/rating_bar_class.dart';
import 'package:flutter_viz/widgetsClass/root_view_class.dart';
import 'package:flutter_viz/widgetsClass/rotated_box_class.dart';
import 'package:flutter_viz/widgetsClass/row_class.dart';
import 'package:flutter_viz/widgetsClass/sized_box_class.dart';
import 'package:flutter_viz/widgetsClass/slider_class.dart';
import 'package:flutter_viz/widgetsClass/stack_class.dart';
import 'package:flutter_viz/widgetsClass/switch_class.dart';
import 'package:flutter_viz/widgetsClass/switch_list_tile_class.dart';
import 'package:flutter_viz/widgetsClass/text_button_class.dart';
import 'package:flutter_viz/widgetsClass/text_class.dart';
import 'package:flutter_viz/widgetsClass/text_field_class.dart';
import 'package:flutter_viz/widgetsClass/video_player_class.dart';
import 'package:flutter_viz/widgetsClass/web_view_class.dart';
import 'package:flutter_viz/widgetsClass/youtube_player_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AnalyticsService.dart';
import 'AppConstant.dart';
import 'AppWidget.dart';

void updateSubViewIndex(WidgetModel widgetModel, aFinalData) {
  for (int index = 0; index < widgetModel.subWidgetsList!.length; index++) {
    importAllHeaderAndLibFile(widgetModel.subWidgetsList![index]!);
    if (widgetModel.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
      parentWidgetStart(widgetModel.subWidgetsList![index]!, aFinalData);
      updateSubViewIndex(widgetModel.subWidgetsList![index]!, aFinalData);
      parentWidgetsEnd(widgetModel.subWidgetsList![index]!, aFinalData);
      if (!isHavingChild(widgetModel.subWidgetsList![index]!.subWidgetsList)!) {
        aFinalData.add(",");
      }
    } else {
      if (!widgetModel.subWidgetsList![index]!.id!.contains(DUMMY_WIDGET_ID)) {
        String codeString = getWidgetsClassData(widgetModel.subWidgetsList![index]!, isCodeAsString: true) + ",";
        codeString = codeString.replaceAll(language!.titleColumnChild, "").replaceAll(language!.titleRowChild, "").replaceAll(language!.titleStackChild, "");
        aFinalData.add(codeString);
      }
    }
  }
}

/// Get all Import lib and pubspec lib name
importAllHeaderAndLibFile(WidgetModel selectedWidgetModel) {
  /// Header import
  if (selectedWidgetModel.headerImport != null && selectedWidgetModel.headerImport!.length > 0) {
    selectedWidgetModel.headerImport!.map((headerImportData) {
      if (!appStore.headerImport.contains(headerImportData)) {
        appStore.headerImport.add(headerImportData);
      }
    }).toList();
  }

  /// pubspec.yaml lib
  if (selectedWidgetModel.yamlLibName != null && selectedWidgetModel.yamlLibName!.length > 0) {
    selectedWidgetModel.yamlLibName!.map((yamlLibData) {
      if (!appStore.yamlImportLib.contains(yamlLibData)) {
        appStore.yamlImportLib.add(yamlLibData);
      }
    }).toList();
  }
}

Future<List<String?>> generateWidgetCode(List<WidgetModel> selectedWidgetList) async {
  List<String?> finalData = [];
  if (selectedWidgetList.isNotEmpty) {
    WidgetModel _selectedWidgetModel = WidgetModel();
    _selectedWidgetModel = selectedWidgetList[0];
    if (_selectedWidgetModel.subWidgetsList != null && _selectedWidgetModel.subWidgetsList!.length > 0) {
      parentWidgetStart(_selectedWidgetModel, finalData);
      for (int index = 0; index < _selectedWidgetModel.subWidgetsList!.length; index++) {
        importAllHeaderAndLibFile(_selectedWidgetModel.subWidgetsList![index]!);
        if (_selectedWidgetModel.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          parentWidgetStart(_selectedWidgetModel.subWidgetsList![index]!, finalData);
          updateSubViewIndex(_selectedWidgetModel.subWidgetsList![index]!, finalData);
          parentWidgetsEnd(_selectedWidgetModel.subWidgetsList![index]!, finalData);
          if (!isHavingChild(_selectedWidgetModel.subWidgetsList![index]!.subWidgetsList)!) {
            finalData.add(",");
          }
        } else {
          if (!_selectedWidgetModel.subWidgetsList![index]!.id!.contains(DUMMY_WIDGET_ID)) {
            String? codeString = getWidgetsClassData(_selectedWidgetModel.subWidgetsList![index]!, isCodeAsString: true) + ",";
            finalData.add(codeString);
          }
        }
      }
      parentWidgetsEnd(_selectedWidgetModel, finalData);
    } else {
      importAllHeaderAndLibFile(_selectedWidgetModel);
      finalData.add(getWidgetsClassData(_selectedWidgetModel, isCodeAsString: true));
      parentWidgetsEnd(_selectedWidgetModel, finalData);
    }
  } else {
    printLogData("View Source Code: Blank Data");
  }

  if (appStore.bottomNavigationBarClass != null) {
    printLogData("bottomNavigationBarClass");
    importAllHeaderAndLibFile(appStore.bottomNavigationBarClass!);
  }

  if (appStore.drawerClass != null) {
    printLogData("DrawerClass");
    importAllHeaderAndLibFile(appStore.drawerClass!);
  }

  return finalData;
}

/// Add ParentView Widgets Stating code
parentWidgetStart(WidgetModel aWidgetModel, List<String?> aFinalData) {
  if (aWidgetModel.widgetSubType == WidgetTypeColumn ||
      aWidgetModel.widgetSubType == WidgetTypeRow ||
      aWidgetModel.widgetSubType == WidgetTypeCard ||
      aWidgetModel.widgetSubType == WidgetTypeList ||
      aWidgetModel.widgetSubType == WidgetTypeGrid ||
      aWidgetModel.widgetSubType == WidgetTypeContainer ||
      aWidgetModel.widgetSubType == WidgetTypeAppBar ||
      aWidgetModel.widgetSubType == WidgetTypeBottomNavigationBar ||
      aWidgetModel.widgetSubType == WidgetTypeLeftDrawer ||
      aWidgetModel.widgetSubType == WidgetTypeClipRRect ||
      aWidgetModel.widgetSubType == WidgetTypeConstrainedBox ||
      aWidgetModel.widgetSubType == WidgetTypeRotatedBox ||
      aWidgetModel.widgetSubType == WidgetTypeOpacity ||
      aWidgetModel.widgetSubType == WidgetTypeStack) {
    aFinalData.add(getWidgetsClassData(aWidgetModel, isCodeAsString: true, isChild: isHavingChild(aWidgetModel.subWidgetsList)));
  }
}

/// ignore Pointer of widgets
bool absorbPointer() {
  if (!appStore.isPreviewCode) {
    return true;
  } else {
    return false;
  }
}

parentWidgetsEnd(WidgetModel aWidgetModel, List<String?> aFinalData) {
  if (aWidgetModel.widgetSubType == WidgetTypeColumn ||
      aWidgetModel.widgetSubType == WidgetTypeRow ||
      aWidgetModel.widgetSubType == WidgetTypeCard ||
      aWidgetModel.widgetSubType == WidgetTypeList ||
      aWidgetModel.widgetSubType == WidgetTypeGrid ||
      aWidgetModel.widgetSubType == WidgetTypeContainer ||
      aWidgetModel.widgetSubType == WidgetTypeAppBar ||
      aWidgetModel.widgetSubType == WidgetTypeBottomNavigationBar ||
      aWidgetModel.widgetSubType == WidgetTypeLeftDrawer ||
      aWidgetModel.widgetSubType == WidgetTypeClipRRect ||
      aWidgetModel.widgetSubType == WidgetTypeConstrainedBox ||
      aWidgetModel.widgetSubType == WidgetTypeRotatedBox ||
      aWidgetModel.widgetSubType == WidgetTypeOpacity ||
      aWidgetModel.widgetSubType == WidgetTypeStack) {
    aFinalData.add(getWidgetsClassData(aWidgetModel, isEndCodeAsString: true, isChild: isHavingChild(aWidgetModel.subWidgetsList)));
  }
}

/// Check if layout widgets having child
bool? isHavingChild(subList) {
  return subList.length > 0;
}

Future<List<String>> viewFinalSourceData(List<WidgetModel> selectedWidgetList, {DownloadModel? downloadModel}) async {
  List<String?> data = await generateWidgetCode(selectedWidgetList);

  List<String> finalData = [];

  /// Copyright information
  finalData.add(language!.copyrightInformation);

  finalData.add("import 'package:flutter/material.dart';\n");

  /// TODO Change it from downloadModel
  await Future.forEach(appStore.headerImport, (dynamic element) {
    finalData.add("$element\n");
  });

  finalData.add("\n\n");
  if (downloadModel != null) {
    finalData.add("class ${getFileName(projectFileName: downloadModel.fileName)} extends StatelessWidget {\n");
  } else {
    finalData.add("class ${getFileName()} extends StatelessWidget {\n");
  }

  /// Add controller for View pager
  if (data.where((item) => item!.contains("PageView.builder")).length > 0) {
    finalData.add("final pageController = PageController();");
    finalData.add("\n");
  }

  /// BottomNavigationBar itemList
  if (appStore.bottomNavigationBarClass != null) {
    List<BottomNavigationBarItemModel?> items = (appStore.bottomNavigationBarClass!.widgetViewModel as BottomNavigationBarClass).bottomNavigationBarItems;
    finalData.add("List<FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems = "
        "${items.map((data) {
      return "FlutterVizBottomNavigationBarModel(icon:Icons.${data!.icon!.iconName},label:\"${data.label}\")";
    }).toList()}"
        ";");
    finalData.add("\n");
  }

  /// Drawer itemList
  if (appStore.drawerClass != null) {
    List<DrawerItemModel?> items = (appStore.drawerClass!.widgetViewModel as LeftDrawerClass).drawerItems;
    finalData.add("List<FlutterVizDrawerItemModel> flutterVizDrawerItems = "
        "${items.map((data) {
      return "FlutterVizDrawerItemModel(icon:Icons.${data!.icon!.iconName},label:\"${data.label}\")";
    }).toList()}"
        ";");
    finalData.add("\n");
  }

  finalData.add("\n@override\n");
  finalData.add("Widget build(BuildContext context) {\n");

  finalData.add("return Scaffold(\n");

  if (downloadModel != null) {
    /// Scaffold background color
    if (downloadModel.rootView != null) {
      finalData.add("backgroundColor: ${getBackgroundColor(downloadModel.rootView)},\n");
    }

    /// Appbar source code
    if (downloadModel.appBarClass != null) {
      finalData.add("appBar: ${(downloadModel.appBarClass!.widgetViewModel as AppBarClass).getCodeAsString()},\n");
    }

    /// bottomNavigationBar source code
    if (downloadModel.bottomNavigationBarClass != null) {
      finalData.add("bottomNavigationBar: ${(downloadModel.bottomNavigationBarClass!.widgetViewModel as BottomNavigationBarClass).getCodeAsString()},\n");
    }

    /// Left Drawer source code
    if (downloadModel.drawerClass != null) {
      finalData.add("drawer: ${(downloadModel.drawerClass!.widgetViewModel as LeftDrawerClass).getCodeAsString()},\n");
    }
  } else {
    /// Scaffold background color
    if (appStore.rootView != null) {
      finalData.add("backgroundColor: ${getBackgroundColor(appStore.rootView)},\n");
    }

    /// Appbar source code
    if (appStore.appBarClass != null) {
      finalData.add("appBar: ${(appStore.appBarClass!.widgetViewModel as AppBarClass).getCodeAsString()},\n");
    }

    /// bottomNavigationBar source code
    if (appStore.bottomNavigationBarClass != null) {
      finalData.add("bottomNavigationBar: ${(appStore.bottomNavigationBarClass!.widgetViewModel as BottomNavigationBarClass).getCodeAsString()},\n");
    }

    /// Left Drawer source code
    if (appStore.drawerClass != null) {
      finalData.add("drawer: ${(appStore.drawerClass!.widgetViewModel as LeftDrawerClass).getCodeAsString()},\n");
    }
  }

  if (data.length > 0) {
    finalData.add("body:");
    await Future.forEach(data, (dynamic element) {
      finalData.add("$element\n");
    });
  }

  finalData.add(")\n;}\n");
  finalData.add("}\n");
  return finalData;
}

getBackgroundColor(WidgetModel? rootView) {
  if (rootView != null && rootView.widgetViewModel != null) {
    if ((rootView.widgetViewModel as RootViewClass).bgColor != null)
      return (rootView.widgetViewModel as RootViewClass).getColor();
    else {
      return Colors.white;
    }
  } else {
    return Colors.white;
  }
}

/// get padding true or false
bool getPadding(EdgeInsets? padding) {
  if (padding != null && (padding.left != 0.0 || padding.right != 0.0 || padding.top != 0.0 || padding.bottom != 0.0)) {
    return true;
  } else {
    return false;
  }
}

/// get padding true or false
bool getBorderRadius(BorderRadius? borderRadius) {
  if (borderRadius != null && (borderRadius.topLeft != Radius.zero || borderRadius.topRight != Radius.zero || borderRadius.bottomLeft != Radius.zero || borderRadius.bottomRight != Radius.zero)) {
    return true;
  } else {
    return false;
  }
}

/// Check if layout is single child view
bool isSingleChildLayout(WidgetModel widgetModel) {
  if (widgetModel.widgetType == WidgetTypeContainerLayout ||
      widgetModel.widgetType == WidgetTypeCardLayout ||
      widgetModel.widgetType == WidgetTypeOpacityLayout ||
      widgetModel.widgetType == WidgetTypeClipRRectLayout ||
      widgetModel.widgetType == WidgetTypeRotatedBoxLayout ||
      widgetModel.widgetType == WidgetTypeConstrainedLayout) {
    return true;
  }
  return false;
}

///get alignment return true or false
bool getHorizontalOrVerticalAlignment(double? horizontalAlignment, double? verticalAlignment, bool? isAlignX, bool? isAlignY) {
  if ((horizontalAlignment != null || verticalAlignment != null) && (isAlignX! || isAlignY!)) {
    return true;
  } else {
    return false;
  }
}

/// Track screen view
trackScreenView(String screenName) async {
  if (!appStore.isInDebugMode) {
    locator<AnalyticsService>().logEvent("View " + screenName);
  }
}

/// Track Firebase event logs
trackUserEvent(String eventName) async {
  if (!appStore.isInDebugMode) {
    locator<AnalyticsService>().logEvent(eventName);
  }
}

/// get Parent Widget Row and Column
bool getExpanded(WidgetModel widgetModel, bool? isExpanded) {
  if (widgetModel.parentWidgetType != null && (widgetModel.parentWidgetType == WidgetTypeColumn || widgetModel.parentWidgetType == WidgetTypeRow)) {
    if (isExpanded == null) {
      if ((widgetModel.parentWidgetType == WidgetTypeRow &&
          (widgetModel.widgetSubType == WidgetTypeTextField ||
              widgetModel.widgetSubType == WidgetTypeListTile ||
              widgetModel.widgetSubType == WidgetTypeCheckboxListTile ||
              widgetModel.widgetSubType == WidgetTypeSwitchListTile ||
              widgetModel.widgetSubType == WidgetTypeCalender ||
              widgetModel.widgetSubType == WidgetTypeVideoPlayer ||
              widgetModel.widgetSubType == WidgetTypeCreditCardView ||
              widgetModel.widgetSubType == WidgetTypeLinearProgressIndicator))) {
        return true;
      } else {
        return false;
      }
    } else {
      return isExpanded ? true : false;
    }
  } else {
    return false;
  }
}

String getValue(String value) {
  if (value.isNotEmpty) {
    return value;
  } else {
    return 'N/A';
  }
}

ExpandedModel getIsExpanded(bool? isExpanded) {
  String? widgetType = appStore.currentSelectedWidget!.widgetSubType;
  String? parentType = appStore.currentParentWidget!.widgetSubType;
  String? parentToParentType = appStore.currentParentWidget!.parentWidgetType;
  var parentModel = getWidgetCasting(appStore.currentParentWidget!);
  var parentToParentModel;
  if (parentToParentType == WidgetTypeList) {
    parentToParentModel = appStore.getParentWidgetsClass(appStore.currentParentWidget, appStore.currentParentWidget!.parentWidgetType);
  }

  if (parentToParentModel != null) {
    if (parentType == WidgetTypeColumn && parentToParentType == WidgetTypeList && (parentToParentModel.axis == AxisVertical) && isExpanded!) {
      return ExpandedModel(isExpanded: false, message: 'You cannot set Expanded for a widget if it is in a Column and Column is inside of vertical list.');

      /// You cannot set Expanded for a widget if it is in a Column and Column is inside of vertical list.
    } else if (parentType == WidgetTypeRow && parentToParentType == WidgetTypeList && (parentToParentModel.axis == AxisHorizontal) && isExpanded!) {
      return ExpandedModel(isExpanded: false, message: 'You cannot set Expanded for a widget if it is in a Row and Row is inside of horizontal list.');

      /// You cannot set Expanded for a widget if it is in a Row and Row is inside of horizontal list.
    }
  }

  if (parentType == WidgetTypeColumn && parentToParentType == WidgetTypeColumn && !parentModel.isExpanded && isExpanded!) {
    return ExpandedModel(isExpanded: false, message: 'You cannot set Expanded for a widget if it is in Column which is not expanded and Column is inside of Column.');

    /// You cannot set Expanded for a widget if it is in Column which is not expanded and Column is inside of Column.
  } else if (parentType == WidgetTypeRow && parentToParentType == WidgetTypeRow && !parentModel.isExpanded && isExpanded!) {
    return ExpandedModel(isExpanded: false, message: 'You cannot set Expanded for a widget if it is in Row which is not expanded and Row is inside of Row.');

    /// You cannot set Expanded for a widget if it is in Row which is not expanded and Row is inside of Row.
  } else if (parentModel.isScrollable) {
    return ExpandedModel(isExpanded: false, message: parentType == WidgetTypeColumn ? 'You cannot set Expanded for a widget if it is in a Column which is Scrollable' : 'You cannot set Expanded for a widget if it is in a Row which is Scrollable');

    /// You cannot set Expanded for a widget if it is in a Column which is Scrollable
    /// You cannot set Expanded for a widget if it is in a Row which is Scrollable
  } else if (widgetType == WidgetTypeTextField && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: 'TextField by default has an undefined width so,You cannot set Expanded to false if it is in a Row.');

    /// TextField by default has an undefined width so,You cannot set Expanded to false if it is in a Row.
  } else if (widgetType == WidgetTypeListTile && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: language!.listTilExpandedMsg);
  } else if (widgetType == WidgetTypeSwitchListTile && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: language!.switchListTileExpandedMsg);
  } else if (widgetType == WidgetTypeCheckboxListTile && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: language!.checkboxListTileExpandedMsg);
  } else if (widgetType == WidgetTypeCalender && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: language!.calenderExpandedMsg);
  } else if (widgetType == WidgetTypeVideoPlayer && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: language!.videoPlayerExpandedMsg);
  } else if (widgetType == WidgetTypeCreditCardView && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: language!.creditCardViewExpandedMsg);
  } else if (widgetType == WidgetTypeLinearProgressIndicator && parentType == WidgetTypeRow && !isExpanded!) {
    return ExpandedModel(isExpanded: false, message: language!.linearProgressIndicatorExpandedMsg);
  } else {
    return ExpandedModel(isExpanded: true);
  }
}

getWidgetCasting(WidgetModel widgetModel) {
  if (widgetModel.widgetSubType == WidgetTypeText) {
    return widgetModel.widgetViewModel as TextClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeContainer) {
    return widgetModel.widgetViewModel as ContainerClass?;
  } else if (widgetModel.widgetSubType == WidgetIconType) {
    return widgetModel.widgetViewModel as IconClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeIconButton) {
    return widgetModel.widgetViewModel as IconButtonClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeListTile) {
    return widgetModel.widgetViewModel as ListTileClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeChipView) {
    return widgetModel.widgetViewModel as ChipViewClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeVideoPlayer) {
    return widgetModel.widgetViewModel as VideoPlayerClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeAudioPlayer) {
    return widgetModel.widgetViewModel as AudioPlayerClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeSwitchListTile) {
    return widgetModel.widgetViewModel as SwitchListTileClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeCheckboxListTile) {
    return widgetModel.widgetViewModel as CheckboxListTileClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeSizedBox) {
    return widgetModel.widgetViewModel as SizedBoxClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeDivider) {
    return widgetModel.widgetViewModel as DividerClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeTextField) {
    return widgetModel.widgetViewModel as TextFieldClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeRow) {
    return widgetModel.widgetViewModel as RowClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeCard) {
    return widgetModel.widgetViewModel as CardClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeList) {
    return widgetModel.widgetViewModel as ListViewClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeGrid) {
    return widgetModel.widgetViewModel as GridViewClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeStack) {
    return widgetModel.widgetViewModel as StackClass?;
  } else if (widgetModel.widgetSubType == WidgetTypePageView) {
    return widgetModel.widgetViewModel as PageViewClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeColumn) {
    return widgetModel.widgetViewModel as ColumnClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeImage) {
    return widgetModel.widgetViewModel as ImageClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeCheckBox) {
    return widgetModel.widgetViewModel as CheckboxClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeTextButton) {
    return widgetModel.widgetViewModel as TextButtonClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeRadio) {
    return widgetModel.widgetViewModel as RadioButtonClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeCalender) {
    return widgetModel.widgetViewModel as CalenderClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeDropDown) {
    return widgetModel.widgetViewModel as DropDownClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeWebView) {
    return widgetModel.widgetViewModel as WebViewClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeCircleImage) {
    return widgetModel.widgetViewModel as CircleImageClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeGoogleMap) {
    return widgetModel.widgetViewModel as GoogleMapClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeYoutubePlayer) {
    return widgetModel.widgetViewModel as YoutubePlayerClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeSlider) {
    return widgetModel.widgetViewModel as SliderClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeRatingBar) {
    return widgetModel.widgetViewModel as RatingBarClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeRotatedBox) {
    return widgetModel.widgetViewModel as RotatedBoxClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeConstrainedBox) {
    return widgetModel.widgetViewModel as ConstrainedBoxClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeClipRRect) {
    return widgetModel.widgetViewModel as ClipRRectClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeOpacity) {
    return widgetModel.widgetViewModel as OpacityClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeImageIcon) {
    return widgetModel.widgetViewModel as ImageIconClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeCreditCardView) {
    return widgetModel.widgetViewModel as CreditCardViewClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeLottieAnimation) {
    return widgetModel.widgetViewModel as LottieAnimationClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeSwitch) {
    return widgetModel.widgetViewModel as SwitchClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeOTPTextField) {
    return widgetModel.widgetViewModel as OTPTextFieldClass?;
  } else if (widgetModel.widgetSubType == WidgetTypeLinearProgressIndicator) {
    return widgetModel.widgetViewModel as LinearProgressIndicatorClass?;
  }
}

bool updateIsExpanded() {
  dynamic widgetClass = getWidgetCasting(appStore.currentSelectedWidget!);
  if (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow) {
    widgetClass.isExpanded = true;
    return true;
  } else {
    widgetClass.isExpanded = false;
    return false;
  }
}

String getDollarString(String? text) {
  return text!.replaceAll('\$', '\\\$');
}

getToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM_RIGHT,
    textColor: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor,
    fontSize: 16.0,
    webBgColor: appStore.isDarkMode ? '#12181B' : '#ebeefc',
  );
}

logoutConfirmationDialog(BuildContext context) async {
  await showConfirmDialogCustom(
    context,
    dialogType: DialogType.CONFIRMATION,
    title: language!.logout,
    subTitle: language!.areYouSureWantToLogout,
    negativeText: language!.no,
    positiveText: language!.yes,
    primaryColor: btnBackgroundColor,
    onAccept: (c) async {
      trackUserEvent(LOGOUT);
      await removeKey(IS_LOGGED_IN);
      await removeKey(USER_NAME);
      await removeKey(USER_EMAIL);
      await removeKey(USER_ID);
      await removeKey(USER_TYPE);
      await removeKey(USER_COUNTRY_ID);
      await removeKey(USER_COUNTRY_NAME);
      await removeKey(USER_STATE_ID);
      await removeKey(USER_STATE_NAME);
      await removeKey(USER_CITY_NAME);
      await removeKey(USER_CITY_ID);
      await removeKey(USER_PHONE_NUMBER);
      await removeKey(USER_GENDER);
      await removeKey(USER_DATE_OF_BIRTH);
      await removeKey(USER_DETAILS);
      await removeKey(USER_DESIGNATION);
      await removeKey(FACEBOOK_URL);
      await removeKey(GITHUB_URL);
      await removeKey(TWITTER_URL);
      await removeKey(STACK_OVERFLOW_URL);
      await removeKey(LINKDIN_URL);
      await removeKey(PINTEREST_URL);
      await removeKey(DRIBBBLE_URL);
      await removeKey(UPLABS_URL);
      await removeKey(INSTAGRAM_URL);
      await removeKey(LAST_LOGIN);
      await removeKey(SELECTED_LANGUAGE_CODE);
      await removeKey(THEME_MODE_INDEX);
      await removeKey(USER_PHOTO);
      await appStore.setLoggedIn(false);
      LoginScreen().launch(context, isNewTask: true);
    },
  );
}

String getLastLogin({required String updateTimeString}) {
  if (updateTimeString.isNotEmpty) {
    String outputDate = DateFormat(DATE_FORMAT_1).format(DateTime.parse(updateTimeString).toLocal());
    Duration difference = DateTime.now().difference(DateTime.parse(updateTimeString));
    // not server time
    if (difference.inDays > 8) {
      return outputDate;
    } else if ((difference.inDays / 7).floor() >= 1) {
      return language!.oneWeekAgo;
    } else if (difference.inDays >= 2) {
      return difference.inDays.toString() + " " + language!.daysAgo;
    } else if (difference.inDays >= 1) {
      return language!.oneDayAgo;
    } else if (difference.inHours >= 2) {
      return difference.inHours.toString() + " " + language!.hoursAgo;
    } else if (difference.inHours >= 1) {
      return language!.oneHourAgo;
    } else if (difference.inMinutes >= 2) {
      return difference.inMinutes.toString() + " " + language!.minutesAgo;
    } else if (difference.inMinutes >= 1) {
      return language!.oneMinuteAgo;
    } else if (difference.inSeconds >= 3) {
      return difference.inSeconds.toString() + " " + language!.secondsAgo;
    } else {
      return language!.justNow;
    }
  } else {
    return 'N/A';
  }
}

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays >= 1) {
    return '${diff.inDays} day(s) ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hour(s) ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minute(s) ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} second(s) ago';
  } else {
    return 'just now';
  }
}

createProjectMaxLimitDialog(BuildContext context) {
  return showInDialog(
    context,
    barrierDismissible: false,
    backgroundColor: context.scaffoldBackgroundColor,
    contentPadding: EdgeInsets.all(32),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${language!.youCanCreateMax} ${getIntAsync(NO_OF_PROJECT, defaultValue: 3)} ${language!.projectForBetaRelease}',
            style: primaryTextStyle(),
          ),
          30.height,
          Align(
            alignment: Alignment.bottomRight,
            child: dialogPrimaryColorButton(
              text: language!.ok,
              onTap: () {
                finish(context);
              },
            ),
          ),
        ],
      );
    },
  );
}

/// Save Previous changes to screen
savePreviousChanges(ScreenListData newValue) async {
  Map<String, dynamic> rootScreenDataJson = await widgetClassToJsonData();
  appStore.updateScreenNewData(json.encode(rootScreenDataJson), appStore.selectedScreenId);

  appStore.selectedDropdownScreen = newValue;
  appStore.setScreenDetails(newValue);
  applyScreenJsonToView(newValue.screenJsonData);
}

Future<void> deleteConfirmationDialog({required BuildContext context, required String messageText, required VoidCallback onAccept}) async {
  await showConfirmDialogCustom(
    context,
    dialogType: DialogType.DELETE,
    title: language!.delete,
    subTitle: messageText,
    negativeText: language!.cancel,
    positiveText: language!.delete,
    onAccept: (c) async {
      onAccept.call();
    },
  );
}
