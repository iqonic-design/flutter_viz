import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/local/app_localizations.dart';
import 'package:flutter_viz/model/device_screen_size.dart';
import 'package:flutter_viz/model/media_list_model.dart';
import 'package:flutter_viz/model/menu_widgets_model.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgets/on_accept_widgets.dart';
import 'package:flutter_viz/widgetsClass/app_bar_class.dart';
import 'package:flutter_viz/widgetsClass/bottom_navigation_bar_class.dart';
import 'package:flutter_viz/widgetsClass/column_class.dart';
import 'package:flutter_viz/widgetsClass/left_drawer_class.dart';
import 'package:flutter_viz/widgetsClass/list_view_class.dart';
import 'package:flutter_viz/widgetsClass/root_view_class.dart';
import 'package:flutter_viz/widgetsClass/row_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  GlobalKey<ScaffoldState>? scaffold_key;

  @observable
  bool isProjectDownloading = false;

  @observable
  bool isDarkModeOn = true;

  bool isInDebugMode = true;

  @observable
  bool isPreviewCode = false;

  @observable
  bool isLoadingScreenData = true;

  @observable
  LogicalKeyboardKey? previousKey;

  @observable
  bool isViewProperty = true;

  @observable
  bool isLoading = false;

  @observable
  bool? isAlignX = false;

  @observable
  String? lastSyncTime = "";

  @observable
  bool? isAlignY = true;

  @observable
  bool? isPaginationIndicatorAlignX = false;

  @observable
  bool? isPaginationIndicatorAlignY = true;

  @observable
  bool isLoggedIn = false;

  @observable
  bool isComponent = false;

  @observable
  bool isProjectTemplate = false;

  @observable
  AppBarTheme appBarTheme = AppBarTheme();

  @observable
  TemplateData? screenTemplateData;

  @observable
  List<String> codeViewData = <String>[];

  @observable
  List<String> widgetCodeData = [];

  @observable
  int selectedProperty = 0;

  @observable
  int? selectedMenu = 0;

  @observable
  int? selectedScreenId = 0;

  @observable
  int? projectId = 0;

  @observable
  String? projectName = "";

  /// Default File name
  @observable
  String? fileName = DEFAULT_FILE_NAME;

  @observable
  String? fileContent;

  /// Selected Device screen Size
  DeviceScreenSize selectedDeviceScreenSize = DeviceScreenSize(screenId: 100, name: "Vivo V11 Pro", deviceWidth: DEVICE_WIDTH, deviceHeight: DEVICE_HEIGHT);

  /// ScreenList dropdown list
  @observable
  ScreenListData? selectedDropdownScreen;

  /// Drawer view
  @observable
  WidgetModel? drawerClass;

  /// App Bar view
  @observable
  WidgetModel? appBarClass;

  /// Bottom Bar view
  @observable
  WidgetModel? bottomNavigationBarClass;

  /// Root Scaffold View
  @observable
  WidgetModel? rootView;

  ///Parent Widget list for selected widgets
  @observable
  List<WidgetModel> parentWidgetsList = ObservableList<WidgetModel>();

  /// Selected Screen Widgets list
  @observable
  List<WidgetModel> selectedWidgetList = ObservableList<WidgetModel>();

  final List<List<WidgetModel>> undoWidgetsList = [];
  final List<List<WidgetModel>> redoWidgetList = [];

  /// All Import Headers
  List<String> headerImport = <String>[];

  /// Import pubspec.yaml lib name
  List<String> yamlImportLib = <String>[];

  /// User screen list
  @observable
  List<ScreenListData> screenList = ObservableList<ScreenListData>();

  /// Current selected widget's parentView
  WidgetModel? currentParentWidget;

  /// Current selected widgets to view property on right side drawer
  @observable
  WidgetModel? currentSelectedWidget;

  /// Left side menu list
  @observable
  List<MenuWidgetsModel> menuList = ObservableList<MenuWidgetsModel>();

  /// Left side menu list
  @observable
  List<MenuWidgetsModel> adminMenuList = ObservableList<MenuWidgetsModel>();

  @observable
  List<MediaData> mediaList = [];

  @observable
  bool isPaddingLock = false;

  @observable
  bool isRadiusLock = false;

  @observable
  Color? color;

  @observable
  bool isAlign = false;

  @observable
  Alignment? alignment;

  @observable
  Alignment? pageViewAlignment;

  @observable
  String valueErrorMsg = "";

  @observable
  String? selectedLanguageCode = defaultLanguage;

  @observable
  bool isLanguageChanged = false;

  @observable
  bool isDarkMode = true;

  @observable
  String profileImage = '';

  @observable
  String userEmail = '';

  @action
  void setProfileImage(String? val) {
    profileImage = val!;
  }

  @action
  void setUserEmail(String? val) {
    userEmail = val!;
  }

  @action
  void setProjectId(int? val) {
    projectId = val;
  }

  @action
  void setProjectDownloading(bool isDownload) {
    isProjectDownloading = isDownload;
  }

  @action
  void setProjectName(String? data) {
    projectName = data;
  }

  /// Add to undo list
  void addToChangeStack() async {
    // printLogData("addToChangeStack call");
    /* List<WidgetModel> change = <WidgetModel>[];
    change = List.of(selectedWidgetList);*/
    /*undoWidgetsList.add(selectedWidgetList);
    redoWidgetList.clear();*/
  }

  bool canUndo() {
    if (undoWidgetsList.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool canRedo() {
    if (redoWidgetList.isNotEmpty) {
      return true;
    }
    return false;
  }

  /// Perform Undo Operation
  void undo() async {
    if (canUndo()) {
      printLogData("undo are perform");

      List<WidgetModel> oldChange = <WidgetModel>[];
      oldChange = List.of(selectedWidgetList);
      redoWidgetList.insert(0, oldChange);

      List<WidgetModel> change = undoWidgetsList.removeAt(undoWidgetsList.length - 1);

      selectedWidgetList = change;
      refreshMainViewData();
    } else {
      printLogData("undo are not perform");
    }
  }

  /// Perform Redo Operation
  void redo() async {
    if (canRedo()) {
      List<WidgetModel> removeObject = [];
      removeObject = redoWidgetList.removeAt(0);
      if (undoWidgetsList.length > 0) {
        undoWidgetsList.insert(undoWidgetsList.length, removeObject);
      } else {
        undoWidgetsList.insert(undoWidgetsList.length, []);
      }
      selectedWidgetList = removeObject;
      refreshMainViewData();
    }
  }

  @action
  void setIsLanguageChanged(bool value) {
    isLanguageChanged = value;
  }

  @action
  void setValueErrorMsg(String value) {
    valueErrorMsg = value;
  }

  @action
  void setIsPaddingLock(bool value) {
    isPaddingLock = value;
  }

  @action
  void setSelectedProperty(int value) {
    selectedProperty = value;
  }

  @action
  void setIsRadiusLock(bool value) {
    isRadiusLock = value;
  }

  @action
  void updateSyncTime(String value) {
    lastSyncTime = null;
    lastSyncTime = value;
  }

  @action
  void setIsAlignX(bool? value) {
    isAlignX = value;
  }

  @action
  void setIsAlignY(bool? value) {
    isAlignY = value;
  }

  @action
  void setIsPaginationIndicatorAlignX(bool? value) {
    isPaginationIndicatorAlignX = value;
  }

  @action
  void setIsPaginationIndicatorAlignY(bool? value) {
    isPaginationIndicatorAlignY = value;
  }

  @action
  void setColor(Color value) {
    color = value;
  }

  @action
  void setAlignment(Alignment value) {
    alignment = value;
  }

  @action
  void setPageViewAlignment(Alignment value) {
    pageViewAlignment = value;
  }

  @action
  Future<void> setLoggedIn(bool val) async {
    isLoggedIn = val;
    await setValue(IS_LOGGED_IN, val);
  }

  @action
  void updateSelectedWidget(WidgetModel selectedWidgetModel) {
    currentSelectedWidget = null;
    currentSelectedWidget = selectedWidgetModel;
    findParentViewFromRoot(widgetId: selectedWidgetModel.id);
  }

  @action
  void updateSelectedWidgetFromMenu(WidgetModel? selectedWidgetModel) {
    currentSelectedWidget = null;
    currentSelectedWidget = selectedWidgetModel;
  }

  findParentViewFromRoot({String? widgetId = "", bool isPopupClick = false}) {
    parentWidgetsList.clear();
    currentParentWidget = null;
    if (selectedWidgetList.length > 0) {
      if (selectedWidgetList[0].subWidgetsList != null) {
        if (isPopupClick) {
          if (selectedWidgetList[0].id == widgetId) {
            currentParentWidget = selectedWidgetList[0];
            if (isPopupClick) {
              updateSelectedWidgetFromMenu(selectedWidgetList[0]);
            }
            return;
          }
        }
        if (selectedWidgetList[0].subWidgetsList!.length > 0) {
          for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
            if (isPopupClick) {
              if (selectedWidgetList[0].subWidgetsList![index]!.id == widgetId) {
                currentParentWidget = selectedWidgetList[0];
                if (isPopupClick) {
                  updateSelectedWidgetFromMenu(selectedWidgetList[0].subWidgetsList![index]);
                }
                break;
              }
            }
            if (selectedWidgetList[0].subWidgetsList![index]!.id == currentSelectedWidget!.id) {
              currentParentWidget = selectedWidgetList[0];
              addToParentWidgets(selectedWidgetList[0]);
              break;
            } else if (selectedWidgetList[0].subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
              /// Add Parent widgets for selection at time time of mouse right click
              bool isExist = selectParentFromSubChild(selectedWidgetList[0].subWidgetsList![index]!, widgetId, isPopupClick);
              if (isExist) {
                addToParentWidgets(selectedWidgetList[0]);
              }
            }
          }
        }
      }
    }
  }

  addToParentWidgets(WidgetModel parentWidgets) {
    parentWidgetsList.insert(0, parentWidgets);
  }

  bool selectParentFromSubChild(WidgetModel parentWidgets, String? widgetId, bool isPopupClick) {
    bool isChildExist = false;
    if (parentWidgets.subWidgetsList != null) {
      for (int index = 0; index < parentWidgets.subWidgetsList!.length; index++) {
        if (isPopupClick) {
          if (parentWidgets.subWidgetsList![index]!.id == widgetId) {
            currentParentWidget = parentWidgets;
            if (isPopupClick) {
              updateSelectedWidgetFromMenu(parentWidgets.subWidgetsList![index]);
            }
            isChildExist = true;
            break;
          }
        }

        if (parentWidgets.subWidgetsList![index]!.id == currentSelectedWidget!.id) {
          currentParentWidget = parentWidgets;
          addToParentWidgets(parentWidgets);
          isChildExist = true;
          break;
        } else if (parentWidgets.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          /// Add Parent widgets for selection at time time of mouse right click
          bool isExist = selectParentFromSubChild(parentWidgets.subWidgetsList![index]!, widgetId, isPopupClick);
          if (isExist) {
            addToParentWidgets(parentWidgets);
            isChildExist = isExist;
            break;
          }
        }
      }
    }
    return isChildExist;
  }

  @action
  void addChildWidget(WidgetModel addWidgets) {
    if (currentSelectedWidget != null) {
      if (selectedWidgetList.length > 0) {
        WidgetModel rootModelView = selectedWidgetList[0];
        if (isRootTypeView(rootModelView)) {
          if (rootModelView.subWidgetsList != null && rootModelView.subWidgetsList!.length > 0) {
            if (currentSelectedWidget!.widgetType == WidgetTypeRootView) {
              rootViewAcceptChild(addWidgets);
            } else {
              if (rootModelView.id == currentSelectedWidget!.id) {
                scaffoldFirstWidgetAcceptChild(addWidgets, rootModelView);
              } else {
                outerLoop:
                for (int index = 0; index < rootModelView.subWidgetsList!.length; index++) {
                  if (rootModelView.subWidgetsList![index]!.id == currentSelectedWidget!.id) {
                    addChildWidgets(addWidgets, rootModelView.subWidgetsList![index]!);
                    break outerLoop;
                  } else if (rootModelView.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
                    addChildWidgetToSubChild(rootModelView.subWidgetsList![index]!, addWidgets);
                  }
                }
              }
            }
          } else {
            rootModelView.subWidgetsList!.add(addWidgets);
          }
        } else {
          if (rootModelView.widgetType == WidgetTypeNormal) {
            //showRootReplace(addWidgets);
            rootViewAcceptChild(addWidgets);
          }
        }
      } else {
        blankScreenChildAccept(addWidgets);
      }
      refreshMainViewData();
    }
  }

  /// Add Widgets with selected widget
  void addChildWidgetToSubChild(WidgetModel parentWidgets, WidgetModel addWidgets) {
    if (parentWidgets.subWidgetsList != null) {
      indexLabel:
      for (int index = 0; index < parentWidgets.subWidgetsList!.length; index++) {
        if (parentWidgets.subWidgetsList![index]!.id == currentSelectedWidget!.id) {
          addChildWidgets(addWidgets, parentWidgets.subWidgetsList![index]!);
          break indexLabel;
        } else if (parentWidgets.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          addChildWidgetToSubChild(parentWidgets.subWidgetsList![index]!, addWidgets);
        }
      }
    }
  }

  WidgetModel createCopyOfWidgets(WidgetModel widgetModel) {
    WidgetModel copyWidgetModel = WidgetModel();
    copyWidgetModel = widgetModel.copyWith(isClearChild: true);
    if (widgetModel.subWidgetsList != null) {
      for (int cIndex = 0; cIndex < widgetModel.subWidgetsList!.length; cIndex++) {
        if (widgetModel.subWidgetsList![cIndex]!.widgetType != WidgetTypeNormal) {
          copyWidgetModel.subWidgetsList!.add(createCopyOfWidgets(widgetModel.subWidgetsList![cIndex]!));
        } else {
          copyWidgetModel.subWidgetsList!.add(widgetModel.subWidgetsList![cIndex]!.copyWith());
        }
      }
    }
    return copyWidgetModel;
  }

  @action
  void copyWidget() {
    if (currentSelectedWidget != null && selectedWidgetList.length > 0) {
      if (currentSelectedWidget!.parentWidgetType == WidgetTypeRow ||
          currentSelectedWidget!.parentWidgetType == WidgetTypeColumn ||
          currentSelectedWidget!.parentWidgetType == WidgetTypeList ||
          currentSelectedWidget!.parentWidgetType == WidgetTypeGrid ||
          currentSelectedWidget!.parentWidgetType == WidgetTypeStack) {
        if (selectedWidgetList[0].subWidgetsList != null) {
          outerLoop:
          for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
            WidgetModel widgetModel = selectedWidgetList[0].subWidgetsList![index]!;
            // printLogData("copyWidget: ${widgetModel.widgetSubType}");
            if (currentSelectedWidget!.id == widgetModel.id) {
              selectedWidgetList[0].subWidgetsList!.insert(index + 1, createCopyOfWidgets(currentSelectedWidget!));
              break outerLoop;
            }
            if (widgetModel.widgetType != WidgetTypeNormal) {
              selectedWidgetList[0].subWidgetsList![index] = copyChildWidget(selectedWidgetList[0].subWidgetsList![index]!);
            }
          }
          refreshMainViewData();
        } else {
          printLogData("Selected widgets is not row or column");
        }
      } else {
        getToast(language!.copyOperationNotPerform);
      }
    }
  }

  copyChildWidget(WidgetModel aWidgetModel) {
    if (aWidgetModel.subWidgetsList != null) {
      innerIndex:
      for (int index = 0; index < aWidgetModel.subWidgetsList!.length; index++) {
        WidgetModel widgetModel = aWidgetModel.subWidgetsList![index]!;
        if (currentSelectedWidget!.id == widgetModel.id) {
          aWidgetModel.subWidgetsList!.insert(index + 1, createCopyOfWidgets(currentSelectedWidget!));
          break innerIndex;
        }
        if (widgetModel.widgetType != WidgetTypeNormal) {
          aWidgetModel.subWidgetsList![index] = copyChildWidget(aWidgetModel.subWidgetsList![index]!);
        }
      }
    }
    return aWidgetModel;
  }

  /// Move Up/Down widgets
  @action
  void moveWidget({bool? isMoveUpOperation}) {
    if (currentSelectedWidget != null && selectedWidgetList.length > 0) {
      //printLogData("moveWidget");
      if (selectedWidgetList[0].subWidgetsList != null) {
        outerLoop:
        for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
          WidgetModel widgetModel = selectedWidgetList[0].subWidgetsList![index]!;
          if (currentSelectedWidget!.id == widgetModel.id) {
            if (isMoveUpOperation!) {
              if (index > 0) {
                WidgetModel? oldWidgetModel = selectedWidgetList[0].subWidgetsList!.removeAt(index);
                selectedWidgetList[0].subWidgetsList!.insert(index - 1, oldWidgetModel);
                break outerLoop;
              } else {
                //toast("First Index");
                break outerLoop;
              }
            } else {
              if (index == selectedWidgetList[0].subWidgetsList!.length - 1) {
                break outerLoop;
              } else {
                WidgetModel? oldWidgetModel = selectedWidgetList[0].subWidgetsList!.removeAt(index);
                selectedWidgetList[0].subWidgetsList!.insert(index + 1, oldWidgetModel);
                break outerLoop;
              }
            }
          }
          if (widgetModel.widgetType != WidgetTypeNormal) {
            performChildMoveOperation(widgetModel, isMoveUpOperation);
          }
        }
      }
    }
  }

  performChildMoveOperation(WidgetModel aWidgetModel, bool? isMoveUpOperation) {
    if (aWidgetModel.subWidgetsList != null) {
      innerIndex:
      for (int index = 0; index < aWidgetModel.subWidgetsList!.length; index++) {
        WidgetModel widgetModel = aWidgetModel.subWidgetsList![index]!;
        if (currentSelectedWidget!.id == widgetModel.id) {
          if (isMoveUpOperation!) {
            if (index > 0) {
              WidgetModel? oldWidgetModel = aWidgetModel.subWidgetsList!.removeAt(index);
              aWidgetModel.subWidgetsList!.insert(index - 1, oldWidgetModel);
              break innerIndex;
            } else {
              // toast("Child First Index");
              break innerIndex;
            }
          } else {
            if (index == aWidgetModel.subWidgetsList!.length - 1) {
              //toast("Child Last Index");
              break innerIndex;
            } else {
              WidgetModel? oldWidgetModel = aWidgetModel.subWidgetsList!.removeAt(index);
              aWidgetModel.subWidgetsList!.insert(index + 1, oldWidgetModel);
              break innerIndex;
            }
          }
        }
        if (widgetModel.widgetType != WidgetTypeNormal) {
          performChildMoveOperation(widgetModel, isMoveUpOperation);
        }
      }
    }
    //refreshMainViewData();
  }

  bool wrapFillWidgetWhileRowParent(WidgetModel? selectedWidgets, WidgetModel wrapWidgets) {
    /// If Wrap Widget is Row
    if (wrapWidgets.widgetSubType == WidgetTypeRow) {
      if (fullWidthWidgetTypeList.contains(selectedWidgets!.widgetSubType)) {
        var classData = getWidgetCasting(selectedWidgets);
        classData.isExpanded = true;
      }
      if (selectedWidgets.widgetSubType == WidgetTypeRow || selectedWidgets.widgetSubType == WidgetTypeColumn) {
        bool isExpandedChild = false;
        bool isFullWidthWidgets = false;
        selectedWidgets.subWidgetsList!.map((mData) {
          if (fullWidthWidgetTypeList.contains(mData!.widgetSubType)) {
            isFullWidthWidgets = true;
          }
          if (getWidgetCasting(mData).isExpanded) {
            isExpandedChild = true;
          }
        }).toList();
        if ((isExpandedChild && selectedWidgets.widgetSubType == WidgetTypeRow) || (isFullWidthWidgets && selectedWidgets.widgetSubType == WidgetTypeColumn)) {
          dynamic classData = getWidgetCasting(selectedWidgets);
          classData.isExpanded = true;
        }
      }
      if (appStore.currentParentWidget != null) {
        if (appStore.currentParentWidget!.widgetSubType == WidgetTypeRow || appStore.currentParentWidget!.widgetSubType == WidgetTypeColumn) {
          if (appStore.currentParentWidget!.widgetSubType == WidgetTypeRow) {
            if (getWidgetCasting(selectedWidgets).isExpanded || fullWidthWidgetTypeList.contains(selectedWidgets.widgetSubType)) {
              dynamic classData = getWidgetCasting(wrapWidgets);
              classData.isExpanded = true;
            }
          }
          if (appStore.currentParentWidget!.widgetSubType == WidgetTypeColumn) {
            if (fullHeightWidgetTypeList.contains(selectedWidgets.widgetSubType)) {
              dynamic classData = getWidgetCasting(wrapWidgets);
              classData.isExpanded = true;
            }
          }
        }
      }
    }

    /// If Wrap Widget is Column
    else if (wrapWidgets.widgetSubType == WidgetTypeColumn) {
      if (selectedWidgets!.widgetSubType == WidgetTypeRow || selectedWidgets.widgetSubType == WidgetTypeColumn) {
        bool isExpandedChild = false;
        bool isFullHeightWidgets = false;
        selectedWidgets.subWidgetsList!.map((mData) {
          if (getWidgetCasting(mData!).isExpanded) {
            isExpandedChild = true;
          }
          if (fullHeightWidgetTypeList.contains(mData.widgetSubType)) {
            isFullHeightWidgets = true;
          }
        }).toList();
        if ((isExpandedChild && selectedWidgets.widgetSubType == WidgetTypeColumn) || (isFullHeightWidgets && selectedWidgets.widgetSubType == WidgetTypeRow)) {
          dynamic classData = getWidgetCasting(selectedWidgets);
          classData.isExpanded = true;
        }
      }
      if (appStore.currentParentWidget != null) {
        if (appStore.currentParentWidget!.widgetSubType == WidgetTypeRow || appStore.currentParentWidget!.widgetSubType == WidgetTypeColumn) {
          if (appStore.currentParentWidget!.widgetSubType == WidgetTypeColumn) {
            if (getWidgetCasting(selectedWidgets).isExpanded || fullHeightWidgetTypeList.contains(selectedWidgets.widgetSubType)) {
              dynamic classData = getWidgetCasting(wrapWidgets);
              classData.isExpanded = true;
            }
          }
          if (appStore.currentParentWidget!.widgetSubType == WidgetTypeRow) {
            if (fullWidthWidgetTypeList.contains(selectedWidgets.widgetSubType)) {
              dynamic classData = getWidgetCasting(wrapWidgets);
              classData.isExpanded = true;
            }
          }
        }
      }
    }

    /// If Wrap Widget is ListView
    else if (wrapWidgets.widgetSubType == WidgetTypeList) {
      if (selectedWidgets!.widgetSubType == WidgetTypeRow || selectedWidgets.widgetSubType == WidgetTypeColumn) {
        bool isExpandedChild = false;
        bool isFullHeightVerticalNotShrinkWrap = false;
        bool isFullHeightHorizontal = false;
        selectedWidgets.subWidgetsList!.map((mData) {
          if (getWidgetCasting(mData!).isExpanded) {
            isExpandedChild = true;
          }
          if (fullHeightWidgetTypeList.contains(mData.widgetSubType) && !getWidgetCasting(mData).shrinkWrap && getWidgetCasting(mData).axis == AxisVertical) {
            isFullHeightVerticalNotShrinkWrap = true;
          }
          if (fullHeightWidgetTypeList.contains(mData.widgetSubType) && getWidgetCasting(mData).axis == AxisHorizontal) {
            isFullHeightHorizontal = true;
          }
        }).toList();
        if (isExpandedChild && selectedWidgets.widgetSubType == WidgetTypeColumn) {
          //getSnackBarWidget('');
          getSnackBarWidget('You can not wrap column widget with ListView widget if it have an expanded child.');
          return false;
        } else if (isFullHeightVerticalNotShrinkWrap && selectedWidgets.widgetSubType == WidgetTypeRow) {
          //getSnackBarWidget('');
          getSnackBarWidget(
              'Vertical viewport was given unbounded height. \n You can not wrap Row Widget with ListView widget if its child have infinite height. Set "shrinkWrap" to true. if "ShrinkWrap" is true then height of viewport is sum of the heights of its children.');
          return false;
          // Row Widget have vertical ListView|GridView which is not shrinkWrap so, you cannot wrap row widget with ListView widget.
        } else if (isFullHeightHorizontal && selectedWidgets.widgetSubType == WidgetTypeRow) {
          // getSnackBarWidget('');
          getSnackBarWidget('Horizontal viewport was given unbounded height. \n You can not wrap Row Widget with ListView widget if its child have infinite height.');
          return false;
          // Row Widget have horizontal ListView|GridView so, you cannot wrap row widget with ListView widget.
        }
      } else if (selectedWidgets.widgetSubType == WidgetTypeList || selectedWidgets.widgetSubType == WidgetTypeGrid) {
        dynamic classData = getWidgetCasting(selectedWidgets);
        if (!classData.shrinkWrap && classData.axis == AxisVertical) {
          //  getSnackBarWidget('');
          getSnackBarWidget(
              'Vertical viewport was given unbounded height.\n You cannot wrap this widget with ListView because it have an unbounded height. Set "shrinkWrap" to true. if "ShrinkWrap" is true then height of viewport is sum of the heights of its children.');
          return false;
          // Vertical ListView|GridView widget is not shrinkWrap so, you cannot wrap ListView|GridView with ListView widget.
        } else if (classData.axis == AxisHorizontal) {
          //getSnackBarWidget('');
          getSnackBarWidget('Horizontal viewport was given unbounded height. \n You cannot wrap this widget with ListView because it have an unbounded height.');
          return false;
          // you cannot wrap Horizontal listView|GridView with ListView widget
        }
      }
    }
    return true;
  }

  /// Wrap current widget with new one
  @action
  void wrapWidget(WidgetModel wrapWidgets) {
    if (currentSelectedWidget != null) {
      WidgetModel? tempWidgetModel;
      int selectedIndex = -1;

      if (selectedWidgetList[0].id == currentSelectedWidget!.id) {
        //printLogData("wrapWidget root view ");
        tempWidgetModel = selectedWidgetList[0];
        //if (wrapWidgets.widgetSubType == WidgetTypeRow || wrapWidgets.widgetSubType == WidgetTypeColumn) {
        tempWidgetModel.parentWidgetId = wrapWidgets.id;
        tempWidgetModel.parentWidgetType = wrapWidgets.widgetSubType;
        //  }
        if (wrapFillWidgetWhileRowParent(tempWidgetModel, wrapWidgets)) {
          selectedWidgetList.clear();
          wrapWidgets.subWidgetsList!.add(tempWidgetModel);
          selectedWidgetList.insert(0, wrapWidgets);
        }
      } else {
        if (selectedWidgetList[0].subWidgetsList!.length > 0) {
          outerLoop:
          for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
            //printLogData("outerLoop : ${selectedWidgetList[0].subWidgetsList[index].widgetSubType}");
            if (selectedWidgetList[0].subWidgetsList![index]!.id == currentSelectedWidget!.id) {
              // printLogData("outerLoop If Part");
              selectedIndex = index;
              tempWidgetModel = selectedWidgetList[0].subWidgetsList![index];
              // if (wrapWidgets.widgetSubType == WidgetTypeRow || wrapWidgets.widgetSubType == WidgetTypeColumn) {
              tempWidgetModel!.parentWidgetId = wrapWidgets.id;
              tempWidgetModel.parentWidgetType = wrapWidgets.widgetSubType;
              // } else {
              //   tempWidgetModel.parentWidgetId = null;
              //   tempWidgetModel.parentWidgetType = null;
              //}
              wrapFillWidgetWhileRowParent(tempWidgetModel, wrapWidgets);
              break outerLoop;
            } else if (selectedWidgetList[0].subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
              //printLogData("outerLoop If Else");
              wrapWidgetSubChild(selectedWidgetList[0].subWidgetsList![index]!, wrapWidgets);
            }
          }
          if (tempWidgetModel != null && selectedIndex >= 0) {
            selectedWidgetList[0].subWidgetsList!.removeAt(selectedIndex);
            // if (selectedWidgetList[0].widgetSubType == WidgetTypeRow || selectedWidgetList[0].widgetSubType == WidgetTypeColumn) {
            wrapWidgets.parentWidgetId = selectedWidgetList[0].id;
            wrapWidgets.parentWidgetType = selectedWidgetList[0].widgetSubType;
            // }
            wrapWidgets.subWidgetsList!.add(tempWidgetModel);
            selectedWidgetList[0].subWidgetsList!.insert(selectedIndex, wrapWidgets);
            updateSelectedWidget(wrapWidgets);
          }
        } else {
          printLogData("wrapWidget Else");
        }
      }
      refreshMainViewData();
    }
  }

  /// Wrap Widgets with selected widget
  void wrapWidgetSubChild(WidgetModel parentWidgets, WidgetModel wrapWidgets) {
    if (parentWidgets.subWidgetsList != null) {
      WidgetModel? tempChildWidgetModel;
      int selectedChildIndex = -1;
      indexLabel:
      for (int index = 0; index < parentWidgets.subWidgetsList!.length; index++) {
        if (parentWidgets.subWidgetsList![index]!.id == currentSelectedWidget!.id) {
          selectedChildIndex = index;
          tempChildWidgetModel = parentWidgets.subWidgetsList![index];
          //if (wrapWidgets.widgetSubType == WidgetTypeRow || wrapWidgets.widgetSubType == WidgetTypeColumn) {
          tempChildWidgetModel!.parentWidgetId = wrapWidgets.id;
          tempChildWidgetModel.parentWidgetType = wrapWidgets.widgetSubType;
          //   } else {
          //   tempChildWidgetModel.parentWidgetId = null;
          //  tempChildWidgetModel.parentWidgetType = null;
          //  }
          wrapFillWidgetWhileRowParent(tempChildWidgetModel, wrapWidgets);
          break indexLabel;
        } else if (parentWidgets.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          wrapWidgetSubChild(parentWidgets.subWidgetsList![index]!, wrapWidgets);
        }
      }
      if (tempChildWidgetModel != null && selectedChildIndex >= 0) {
        parentWidgets.subWidgetsList!.removeAt(selectedChildIndex);
        //  if (parentWidgets.widgetSubType == WidgetTypeRow || parentWidgets.widgetSubType == WidgetTypeColumn) {
        wrapWidgets.parentWidgetId = parentWidgets.id;
        wrapWidgets.parentWidgetType = parentWidgets.widgetSubType;
        // }

        wrapWidgets.subWidgetsList!.add(tempChildWidgetModel);
        parentWidgets.subWidgetsList!.insert(selectedChildIndex, wrapWidgets);
        updateSelectedWidget(wrapWidgets);
      }
    } else {
      printLogData("wrapWidgetSubChild else ");
    }
  }

  /// get parent widgets data
  dynamic getParentWidgetsClass(WidgetModel? widgetModel, String? parentWidgetType) {
    if (selectedWidgetList[0].subWidgetsList!.isNotEmpty) {
      for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
        if (selectedWidgetList[0].subWidgetsList![index]!.parentWidgetId == widgetModel!.parentWidgetId) {
          if (parentWidgetType == WidgetTypeColumn)
            return (selectedWidgetList[0].subWidgetsList![index]!.widgetViewModel as ColumnClass?);
          else if (parentWidgetType == WidgetTypeRow)
            return (selectedWidgetList[0].subWidgetsList![index]!.widgetViewModel as RowClass?);
          else if (parentWidgetType == WidgetTypeList) return (selectedWidgetList[0].widgetViewModel as ListViewClass?);
        } else if (selectedWidgetList[0].subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          if (getParentWidgetsClassChild(selectedWidgetList[0].subWidgetsList![index]!, widgetModel, parentWidgetType) != null) {
            return getParentWidgetsClassChild(selectedWidgetList[0].subWidgetsList![index]!, widgetModel, parentWidgetType);
          }
        }
      }
    }
    return null;
  }

  dynamic getParentWidgetsClassChild(WidgetModel childWidgetModel, WidgetModel? widgetModel, String? parentWidgetType) {
    for (int index = 0; index < childWidgetModel.subWidgetsList!.length; index++) {
      if (childWidgetModel.subWidgetsList![index]!.parentWidgetId == widgetModel!.parentWidgetId) {
        if (parentWidgetType == WidgetTypeColumn)
          return (childWidgetModel.subWidgetsList![index]!.widgetViewModel as ColumnClass?);
        else if (parentWidgetType == WidgetTypeRow)
          return (childWidgetModel.subWidgetsList![index]!.widgetViewModel as RowClass?);
        else if (parentWidgetType == WidgetTypeList) return (childWidgetModel.widgetViewModel as ListViewClass?);
      } else if (childWidgetModel.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
        return getParentWidgetsClassChild(childWidgetModel.subWidgetsList![index]!, widgetModel, parentWidgetType);
      }
    }
    return null;
  }

  @action
  void selectParentWidget(String? parentWidgetId) {
    if (selectedWidgetList[0].id == parentWidgetId) {
      updateSelectedWidget(selectedWidgetList[0]);
    }
    if (selectedWidgetList[0].subWidgetsList!.length > 0) {
      for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
        if (selectedWidgetList[0].subWidgetsList![index]!.parentWidgetId == parentWidgetId) {
          // currentSelectedWidget = selectedWidgetList[0];
          updateSelectedWidget(selectedWidgetList[0]);
          break;
        } else if (selectedWidgetList[0].subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          selectSubParent(selectedWidgetList[0].subWidgetsList![index]!, parentWidgetId);
        } else {
          //printLogData("Else Part on Delete");
        }
      }
    }
  }

  /// Select Parent view from sub child
  @action
  void selectSubParent(WidgetModel parentWidgets, parentWidgetId) {
    if (parentWidgets.subWidgetsList != null) {
      for (int index = 0; index < parentWidgets.subWidgetsList!.length; index++) {
        if (parentWidgets.subWidgetsList![index]!.parentWidgetId == parentWidgetId) {
          updateSelectedWidget(parentWidgets);
          break;
        } else if (parentWidgets.subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          selectSubParent(parentWidgets.subWidgetsList![index]!, parentWidgetId);
        }
      }
    } else {
      printLogData("Delete Sub widgets null");
    }
  }

  @action
  void selectAppbar() {
    currentSelectedWidget = null;
    currentSelectedWidget = appBarClass;
  }

  @action
  void selectBottomNavigation() {
    currentSelectedWidget = null;
    currentSelectedWidget = bottomNavigationBarClass;
  }

  @action
  void selectDrawer() {
    currentSelectedWidget = null;
    currentSelectedWidget = drawerClass;
  }

  @action
  void selectRootView() {
    currentSelectedWidget = null;
    if (rootView != null) {
      currentSelectedWidget = rootView;
    } else {
      addRootView();
    }
  }

  @action
  void addRootView() {
    rootView = WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeRootView),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeRootView), getWidgetTitle(WidgetTypeRootView)),
      widgetSubType: WidgetTypeRootView,
      widgetViewModel: RootViewClass(),
      widgetType: WidgetTypeRootView,
    );
    selectRootView();
  }

  @action
  void finishLoadingData() {
    isLoadingScreenData = false;
  }

  @action
  void setLoading(bool val) {
    isLoading = val;
  }

  @action
  void addScreens(List<ScreenListData> allScreens) {
    screenList.clear();

    /// Add default Screen
    screenList.add(ScreenListData(
      name: "New Screen",
      id: -1,
    ));
    screenList.addAll(allScreens);
    int index = 0;
    if (allScreens.length > 0) {
      index = 1;
    }

    /// set screen Data
    setScreenDetails(screenList[index]);

    /// get Json data from selected screen
    applyScreenJsonToView(screenList[index].screenJsonData);
  }

  /// Update new screen json data
  @action
  void updateScreenNewData(jsonData, selectedScreenId) {
    for (int i = 0; i < screenList.length; i++) {
      if (screenList[i].id == selectedScreenId) {
        screenList[i].screenJsonData = jsonData;
        return;
      }
    }
  }

  /// Update new screen json data
  @action
  void updateScreenImage(screenImage, selectedScreenId) {
    for (int i = 0; i < screenList.length; i++) {
      if (screenList[i].id == selectedScreenId) {
        screenList[i].screenImage = screenImage;
        return;
      }
    }
  }

  /// Update new screen name data
  @action
  void updateScreenName(screenName, selectedScreenId) {
    for (int i = 0; i < screenList.length; i++) {
      if (screenList[i].id == selectedScreenId) {
        screenList[i].name = screenName;
        return;
      }
    }
  }

  @action
  void setScreenDetails(ScreenListData screenListData) {
    isLoadingScreenData = true;
    selectedScreenId = null;
    currentSelectedWidget = null;
    fileName = screenListData.name;
    selectedScreenId = screenListData.id;

    /// Set first screen as selected
    selectedDropdownScreen = screenListData;

    LiveStream().emit("updateScreenId");
    selectRootView();
  }

  @action
  void removeScreen(int? id) {
    screenList.remove(ScreenListData(id: id));
    for (int i = 0; i < screenList.length; i++) {
      if (screenList[i].id == id) {
        screenList.removeAt(i);
        break;
      }
    }
    if (screenList.length > 1) {
      selectedDropdownScreen = screenList[1];
      setScreenDetails(screenList[1]);
      applyScreenJsonToView(screenList[1].screenJsonData);
    } else {
      selectedDropdownScreen = screenList[0];
      setScreenDetails(screenList[0]);
      applyScreenJsonToView(screenList[0].screenJsonData);
    }
    refreshMainViewData();
  }

  @action
  void setScreenList(List<ScreenListData> aScreenList) {
    screenList.clear();
    screenList.addAll(aScreenList);
  }

  /// This function is used for set selected screen json data to selected widgets list
  @action
  void setWidgetsList(List<WidgetModel> widgetList) {
    selectedWidgetList.clear();
    selectedWidgetList.addAll(widgetList);
  }

  /// Remove selected widgets from list
  @action
  void removeSelectedWidget() {
    /// Remove App bar
    if (appBarClass != null && appBarClass!.id == currentSelectedWidget!.id) {
      appBarClass = null;
      currentSelectedWidget = rootView;
      return;
    }

    /// Remove Bottom Navigation bar
    if (bottomNavigationBarClass != null && bottomNavigationBarClass!.id == currentSelectedWidget!.id) {
      bottomNavigationBarClass = null;
      currentSelectedWidget = rootView;
      return;
    }

    /// Remove Drawer
    if (drawerClass != null && drawerClass!.id == currentSelectedWidget!.id) {
      drawerClass = null;
      currentSelectedWidget = rootView;
      return;
    }

    /// remove root view
    if (selectedWidgetList.length > 0) {
      if (selectedWidgetList[0].id == currentSelectedWidget!.id) {
        selectedWidgetList.removeAt(0);
        currentSelectedWidget = rootView;
        return;
      }

      if (selectedWidgetList[0].subWidgetsList!.length > 0) {
        for (int rIndex = 0; rIndex < selectedWidgetList[0].subWidgetsList!.length; rIndex++) {
          // printLogData("");
          if (selectedWidgetList[0].subWidgetsList![rIndex]!.id == currentSelectedWidget!.id) {
            selectedWidgetList[0].subWidgetsList!.removeAt(rIndex);
            break;
          } else if (selectedWidgetList[0].subWidgetsList![rIndex]!.widgetType != WidgetTypeNormal) {
            removeWidgets(selectedWidgetList[0].subWidgetsList![rIndex]!);
          }
        }
      }
      currentSelectedWidget = rootView;
      refreshMainViewData();
    }
  }

  /// Remove Sub widgets
  void removeWidgets(WidgetModel widgetModel) {
    if (widgetModel.subWidgetsList != null) {
      for (int wIndex = 0; wIndex < widgetModel.subWidgetsList!.length; wIndex++) {
        int newIndex = wIndex;
        if (widgetModel.subWidgetsList![newIndex]!.id == currentSelectedWidget!.id) {
          widgetModel.subWidgetsList!.removeAt(newIndex);
          break;
        } else if (widgetModel.subWidgetsList![newIndex]!.widgetType != WidgetTypeNormal) {
          removeWidgets(widgetModel.subWidgetsList![newIndex]!);
        }
      }
    }
  }

  @action
  void refreshMainViewData() {
    if (selectedWidgetList.length > 0) {
      WidgetModel _selectedWidgetModel = selectedWidgetList[0];
      selectedWidgetList.removeAt(0);
      selectedWidgetList.insert(0, _selectedWidgetModel);
    } else {
      printLogData("refreshMainViewData: Data Not Found");
    }
    LiveStream().emit("updateTreeViewComponents");
  }

  @action
  void addDrawer(WidgetModel drawer) {
    drawerClass = drawer;
    updateSelectedWidget(drawer);
  }

  @action
  void addBottomNavigation(WidgetModel bNBar) {
    bottomNavigationBarClass = bNBar;
    updateSelectedWidget(bNBar);
  }

  @action
  void addAppBar(WidgetModel appBar) {
    appBarClass = appBar;
    updateSelectedWidget(appBar);
  }

  @action
  void resetView() {
    undoWidgetsList.clear();
    redoWidgetList.clear();

    selectedWidgetList.clear();
    currentSelectedWidget = null;
    appBarClass = null;
    bottomNavigationBarClass = null;
    drawerClass = null;
    refreshMainViewData();
    addRootView();
  }

  @action
  void selectViewFromTree(Node selectedView) {
    /// Rootview select from Nodes
    if (selectedView.key == ROOT_VIEW_ID || selectedView.key == rootView?.id) {
      selectRootView();
      refreshMainViewData();
      return;
    }

    /// Appbar select from Nodes
    if (appBarClass?.id == selectedView.key) {
      selectAppbar();
      return;
    }

    /// Bottom Navigation select from Nodes
    if (bottomNavigationBarClass?.id == selectedView.key) {
      selectBottomNavigation();
      return;
    }

    /// Drawer select from Nodes
    if (drawerClass?.id == selectedView.key) {
      scaffold_key!.currentState!.openDrawer();
      selectDrawer();
      return;
    } else {
      if (scaffold_key!.currentState!.isDrawerOpen) {
        Navigator.pop(getContext);
      }
    }

    if (selectedWidgetList[0].id == selectedView.key) {
      updateSelectedWidget(selectedWidgetList[0]);
      refreshMainViewData();
      return;
    } else {
      if (selectedWidgetList[0].subWidgetsList!.isNotEmpty) {
        for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
          if (selectedWidgetList[0].subWidgetsList![index]!.id == selectedView.key) {
            updateSelectedWidget(selectedWidgetList[0].subWidgetsList![index]!);
            break;
          } else if (selectedWidgetList[0].subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
            selectSubViewFromTree(selectedWidgetList[0].subWidgetsList![index]!.subWidgetsList!, selectedView);
          }
        }
      }
    }
    refreshMainViewData();
  }

  @action
  void selectSubViewFromTree(List<WidgetModel?> aSelectedWidgetList, Node selectedView) {
    for (int index = 0; index < aSelectedWidgetList.length; index++) {
      if (aSelectedWidgetList[index]!.id == selectedView.key) {
        updateSelectedWidget(aSelectedWidgetList[index]!);
        break;
      } else if (aSelectedWidgetList[index]!.widgetType != WidgetTypeNormal) {
        selectSubViewFromTree(aSelectedWidgetList[index]!.subWidgetsList!, selectedView);
      }
    }
  }

  @action
  void addText(String data) {
    fileContent = data;
  }

  @action
  void setViewProperty(bool val) {
    isViewProperty = val;
  }

  @action
  void setPreviewCode(bool val) {
    isPreviewCode = val;
  }

  @action
  void setCodeViewData(List<String> data) {
    codeViewData = data;
  }

/*
  @action
  menuHoverEffectAnimation(String menuName, bool isHover) {
    for (int index = 0; index < menuList.length; index++) {
      if (menuList[index].menuName == menuName) {
        menuList[index].isOnHover = isHover;
      } else {
        menuList[index].isOnHover = false;
      }
    }

    List<MenuWidgetsModel> tempMenuList = List<MenuWidgetsModel>();
    tempMenuList.addAll(menuList);
    menuList.clear();
    menuList.addAll(tempMenuList);
  }

  @action
  adminMenuHoverEffectAnimation(String menuName, bool isHover) {
    for (int index = 0; index < adminMenuList.length; index++) {
      if (adminMenuList[index].menuName == menuName) {
        adminMenuList[index].isOnHover = isHover;
      } else {
        adminMenuList[index].isOnHover = false;
      }
    }

    List<MenuWidgetsModel> tempMenuList = List<MenuWidgetsModel>();
    tempMenuList.addAll(adminMenuList);
    adminMenuList.clear();
    adminMenuList.addAll(tempMenuList);
  }*/

  /// Update Change on mail selected view when we are changing from right panel
  @action
  void updateData(dynamic modelData, {bool isRootView = false}) {
    currentSelectedWidget!.widgetViewModel = modelData;

    /// Root view class updates
    if (isRootView) {
      WidgetModel tempRootView = rootView!;
      tempRootView.widgetViewModel = modelData;
      rootView = null;
      rootView = tempRootView;
      return;
    }

    /// Appbar class updates
    if (modelData is AppBarClass) {
      WidgetModel tempAppBarClass = appBarClass!;
      tempAppBarClass.widgetViewModel = modelData;
      appBarClass = null;
      appBarClass = tempAppBarClass;
      return;
    }

    /// Bottom navigation bar class updates
    if (modelData is BottomNavigationBarClass) {
      WidgetModel tempBottomNavigationClass = bottomNavigationBarClass!;
      tempBottomNavigationClass.widgetViewModel = modelData;
      bottomNavigationBarClass = null;
      bottomNavigationBarClass = tempBottomNavigationClass;
      return;
    }

    /// Left Drawer class updates
    if (modelData is LeftDrawerClass) {
      WidgetModel tempDrawerClass = drawerClass!;
      tempDrawerClass.widgetViewModel = modelData;
      drawerClass = null;
      drawerClass = tempDrawerClass;
      return;
    }

    if (selectedWidgetList[0].subWidgetsList != null) {
      //printLogData("Not Normal View");
      for (int index = 0; index < selectedWidgetList[0].subWidgetsList!.length; index++) {
        if (selectedWidgetList[0].subWidgetsList![index]!.widgetType != WidgetTypeNormal) {
          updateSubView(selectedWidgetList[0].subWidgetsList![index]!.subWidgetsList);
        } else if (selectedWidgetList[0].subWidgetsList![index]!.id == currentSelectedWidget!.id) {
          selectedWidgetList[0].subWidgetsList![index]!.widgetViewModel = currentSelectedWidget!.widgetViewModel;
          WidgetModel? newViewModel = selectedWidgetList[0].subWidgetsList![index];
          selectedWidgetList[0].subWidgetsList!.removeAt(index);
          selectedWidgetList[0].subWidgetsList!.insert(index, newViewModel);
        }
      }
    } else {
      //printLogData(" Normal View");
      if (selectedWidgetList[0].id == currentSelectedWidget!.id) {
        //printLogData("ID Match");
        selectedWidgetList[0].widgetViewModel = modelData;
      }
    }
    refreshMainViewData();
  }

  void updateSubView(aSelectedWidgetList) {
    for (int index = 0; index < aSelectedWidgetList.length; index++) {
      if (aSelectedWidgetList[index].widgetType != WidgetTypeNormal) {
        updateSubView(aSelectedWidgetList[index].subWidgetsList);
      } else if (aSelectedWidgetList[index].id == currentSelectedWidget!.id) {
        aSelectedWidgetList[index].widgetViewModel = currentSelectedWidget!.widgetViewModel;
        WidgetModel? newViewModel = aSelectedWidgetList[index];
        aSelectedWidgetList.removeAt(index);
        aSelectedWidgetList.insert(index, newViewModel);
      }
    }
  }

  @action
  clearData() {
    selectedWidgetList.clear();
    menuList.clear();
    adminMenuList.clear();
    currentSelectedWidget = null;
    rootView = null;
    appBarClass = null;
    bottomNavigationBarClass = null;
    drawerClass = null;
    isDarkModeOn = false;
    isPreviewCode = false;
    isLoadingScreenData = true;
    isViewProperty = true;
    isLoading = false;
    isAlignX = false;
    isAlignY = true;
    selectedMenu = WIDGETS_INDEX;
  }

  @action
  Future<void> setLanguage(String? val, {BuildContext? context}) async {
    selectedLanguageCode = val;

    await setValue(SELECTED_LANGUAGE_CODE, selectedLanguageCode);
    selectedLanguageDataModel = getSelectedLanguageModel();

    language = await AppLocalizations().load(Locale(selectedLanguageCode!));
  }

  @action
  Future<void> setDarkMode(bool aIsDarkMode) async {
    isDarkMode = aIsDarkMode;

    if (isDarkMode) {
      textPrimaryColorGlobal = darModePrimaryTextColor;
      textSecondaryColorGlobal = darkModeSubTextColor;

      appButtonBackgroundColorGlobal = darkModeHighLightColor;
      shadowColorGlobal = Colors.white12;

      appBarBackgroundColorGlobal = darkModePrimaryColorBackground;
    } else {
      textPrimaryColorGlobal = textColorPrimary;
      textSecondaryColorGlobal = textColorSecondary;

      defaultLoaderBgColorGlobal = Colors.white;
      appButtonBackgroundColorGlobal = Colors.white;
      shadowColorGlobal = Colors.black12;

      appBarBackgroundColorGlobal = Colors.white;
    }
    appBarTheme = AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: appStore.isDarkMode ? Brightness.dark : Brightness.light),
    );
  }
}