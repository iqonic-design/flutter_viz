import 'dart:math';

import 'package:flutter_viz/model/screen_json_data.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/screen/code_view_screen.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
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
import 'package:flutter_viz/widgetsClass/tab_bar_class.dart';
import 'package:flutter_viz/widgetsClass/tab_bar_view_class.dart';
import 'package:flutter_viz/widgetsClass/tab_class.dart';
import 'package:flutter_viz/widgetsClass/tab_view_class.dart';
import 'package:flutter_viz/widgetsClass/text_button_class.dart';
import 'package:flutter_viz/widgetsClass/text_class.dart';
import 'package:flutter_viz/widgetsClass/text_field_class.dart';
import 'package:flutter_viz/widgetsClass/video_player_class.dart';
import 'package:flutter_viz/widgetsClass/web_view_class.dart';
import 'package:flutter_viz/widgetsClass/youtube_player_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'on_accept_widgets.dart';

/// Page Widgets List
List<WidgetModel> pageWidgetsList = [
  /// Appbar View
  getWidgets(WidgetTypeAppBar),

  /// BottomNavigationBar View
  getWidgets(WidgetTypeBottomNavigationBar),

  /// Left Drawer View
  getWidgets(WidgetTypeLeftDrawer),
];

/// Layout Widgets
List<WidgetModel> layoutWidgetsList = [
  /// Container View
  getWidgets(WidgetTypeContainer),

  /// Column View
  getWidgets(WidgetTypeColumn),

  /// ROW View
  getWidgets(WidgetTypeRow),

  /// Card View
  getWidgets(WidgetTypeCard),

  /// List View
  getWidgets(WidgetTypeList),

  /// Grid View
  getWidgets(WidgetTypeGrid),

  /// Stack View
  getWidgets(WidgetTypeStack),

  /// Page View
  getWidgets(WidgetTypePageView),

  ///RotatedBox
  getWidgets(WidgetTypeRotatedBox),

  ///ConstrainedBox
  getWidgets(WidgetTypeConstrainedBox),

  ///ClipRRect
  getWidgets(WidgetTypeClipRRect),

  ///Opacity
  getWidgets(WidgetTypeOpacity),
];

/// Layout Widgets
List<WidgetModel> wrapLayoutWidgetsList = [
  /// Container View
  getWidgets(WidgetTypeContainer),

  /// Column View
  getWidgets(WidgetTypeColumn),

  /// ROW View
  getWidgets(WidgetTypeRow),

  /// Card View
  getWidgets(WidgetTypeCard),

  /// Stack View
  getWidgets(WidgetTypeStack),

  /// List View
  getWidgets(WidgetTypeList),

  /// Grid View
  getWidgets(WidgetTypeGrid),

  /// ClipRRect
  getWidgets(WidgetTypeClipRRect),

  /// Opacity
  getWidgets(WidgetTypeOpacity),

  ///Constrained Box
  getWidgets(WidgetTypeConstrainedBox),

  ///Rotated Box
  getWidgets(WidgetTypeRotatedBox)
];

/// Base Widgets
List<WidgetModel> baseWidgetsList = [
  /// Text View
  getWidgets(WidgetTypeText),

  /// TextField View
  getWidgets(WidgetTypeTextField),

  /// Flat Button View
  getWidgets(WidgetTypeTextButton),

  /// Image View
  getWidgets(WidgetTypeImage),

  /// Checkbox View
  getWidgets(WidgetTypeCheckBox),

  /// Radiobutton View
  getWidgets(WidgetTypeRadio),

  /// Icon
  getWidgets(WidgetIconType),

  /// Icon Button
  getWidgets(WidgetTypeIconButton),

  /// List Tile
  getWidgets(WidgetTypeListTile),

  /// Video Player
  getWidgets(WidgetTypeVideoPlayer),

  /// Audio Player
  getWidgets(WidgetTypeAudioPlayer),

  /// Switch List Tile
  getWidgets(WidgetTypeSwitchListTile),

  /// Checkbox List Tile
  getWidgets(WidgetTypeCheckboxListTile),

  /// SizedBox
  getWidgets(WidgetTypeSizedBox),

  /// Divider
  getWidgets(WidgetTypeDivider),

  /// Calender
  getWidgets(WidgetTypeCalender),

  /// DropDown
  getWidgets(WidgetTypeDropDown),

  /// Chip View
  getWidgets(WidgetTypeChipView),

  /// Circle Image View
  getWidgets(WidgetTypeCircleImage),

  /// Youtube Player
  getWidgets(WidgetTypeYoutubePlayer),

  /// Slider
  getWidgets(WidgetTypeSlider),

  /// Rating Bar
  getWidgets(WidgetTypeRatingBar),

  /// ImageIcon
  getWidgets(WidgetTypeImageIcon),

  ///LottieAnimation
  getWidgets(WidgetTypeLottieAnimation),

  ///CreditCardView
  getWidgets(WidgetTypeCreditCardView),

  /// Switch
  getWidgets(WidgetTypeSwitch),

  /// OTPTextField
  getWidgets(WidgetTypeOTPTextField),

  /// Linear Progress Indicator
  getWidgets(WidgetTypeLinearProgressIndicator),
];

class LayoutExpanded {
  bool? isExpanded;
  int? flex;

  LayoutExpanded({this.isExpanded = false, this.flex = 1});
}

getWidgets(String? subType) {
  if (subType == WidgetTypeText) {
    /// Text View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeText),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeText), getWidgetTitle(WidgetTypeText)),
      widgetSubType: WidgetTypeText,
      widgetViewModel: TextClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeGoogleMap) {
    /// Google Map View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeGoogleMap),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeGoogleMap), getWidgetTitle(WidgetTypeGoogleMap)),
      widgetSubType: WidgetTypeGoogleMap,
      widgetViewModel: GoogleMapClass(),
      yamlLibName: GoogleMapClass().getYamlLib(),
      headerImport: GoogleMapClass().getHeaderClassFiles(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeSlider) {
    /// Slider Widgets
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeSlider),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeSlider), getWidgetTitle(WidgetTypeSlider)),
      widgetSubType: WidgetTypeSlider,
      widgetViewModel: SliderClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeYoutubePlayer) {
    /// Youtube Player
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeYoutubePlayer),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeYoutubePlayer), getWidgetTitle(WidgetTypeYoutubePlayer)),
      widgetSubType: WidgetTypeYoutubePlayer,
      widgetViewModel: YoutubePlayerClass(),
      headerImport: YoutubePlayerClass().getHeaderClassFiles(),
      yamlLibName: YoutubePlayerClass().getYamlLib(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeTextField) {
    /// TextField View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeTextField),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeTextField), getWidgetTitle(WidgetTypeTextField)),
      widgetSubType: WidgetTypeTextField,
      widgetViewModel: TextFieldClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeTextButton) {
    /// Text Button View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeTextButton),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeTextButton), getWidgetTitle(WidgetTypeTextButton)),
      widgetSubType: WidgetTypeTextButton,
      widgetViewModel: TextButtonClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeImage) {
    /// Image View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeImage),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeImage), getWidgetTitle(WidgetTypeImage)),
      widgetSubType: WidgetTypeImage,
      widgetViewModel: ImageClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeChipView) {
    /// Chip View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeChipView),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeChipView), getWidgetTitle(WidgetTypeChipView)),
      widgetSubType: WidgetTypeChipView,
      widgetViewModel: ChipViewClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeCheckBox) {
    /// Checkbox View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeCheckBox),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeCheckBox), getWidgetTitle(WidgetTypeCheckBox)),
      widgetSubType: WidgetTypeCheckBox,
      widgetViewModel: CheckboxClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypePageView) {
    /// PageView View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypePageView),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypePageView), getWidgetTitle(WidgetTypePageView)),
      widgetSubType: WidgetTypePageView,
      widgetViewModel: PageViewClass(),
      subWidgetsList: [],
      headerImport: PageViewClass().getHeaderClassFiles(),
      yamlLibName: PageViewClass().getYamlLib(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeStack) {
    /// Stack View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeStack),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeStack), getWidgetTitle(WidgetTypeStack)),
      widgetSubType: WidgetTypeStack,
      widgetViewModel: StackClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeStackLayout,
    );
  } else if (subType == WidgetTypeTabView) {
    /// Tabview View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeTabView),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeTabView), getWidgetTitle(WidgetTypeTabView)),
      widgetSubType: WidgetTypeTabView,
      widgetViewModel: TabViewClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeTabViewLayout,
    );
  } else if (subType == WidgetTypeListTile) {
    /// ListTile View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeListTile),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeListTile), getWidgetTitle(WidgetTypeListTile)),
      widgetSubType: WidgetTypeListTile,
      widgetViewModel: ListTileClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeRadio) {
    /// Radio Button
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeRadio),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeRadio), getWidgetTitle(WidgetTypeRadio)),
      widgetSubType: WidgetTypeRadio,
      widgetViewModel: RadioButtonClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetIconType) {
    /// Icon
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetIconType),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetIconType), getWidgetTitle(WidgetIconType)),
      widgetSubType: WidgetIconType,
      widgetViewModel: IconClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeIconButton) {
    /// Icon Button
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeIconButton),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeIconButton), getWidgetTitle(WidgetTypeIconButton)),
      widgetSubType: WidgetTypeIconButton,
      widgetViewModel: IconButtonClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeImageIcon) {
    /// Image Button
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeImageIcon),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeImageIcon), getWidgetTitle(WidgetTypeImageIcon)),
      widgetSubType: WidgetTypeImageIcon,
      widgetViewModel: ImageIconClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeAppBar) {
    /// Appbar View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeAppBar),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeAppBar), getWidgetTitle(WidgetTypeAppBar)),
      widgetViewModel: AppBarClass(),
      widgetSubType: WidgetTypeAppBar,
      subWidgetsList: [],
      widgetType: WidgetTypeAppBarLayout,
    );
  } else if (subType == WidgetTypeBottomNavigationBar) {
    /// BottomNavigationBar View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeBottomNavigationBar),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeBottomNavigationBar), getWidgetTitle(WidgetTypeBottomNavigationBar)),
      widgetViewModel: BottomNavigationBarClass(),
      widgetSubType: WidgetTypeBottomNavigationBar,
      subWidgetsList: [],
      headerImport: BottomNavigationBarClass().getHeaderClassFiles(),
      widgetType: WidgetTypeBottomNavigationBarLayout,
    );
  } else if (subType == WidgetTypeLeftDrawer) {
    /// Left Drawer View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeLeftDrawer),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeLeftDrawer), getWidgetTitle(WidgetTypeLeftDrawer)),
      widgetSubType: WidgetTypeLeftDrawer,
      subWidgetsList: [],
      widgetViewModel: LeftDrawerClass(),
      headerImport: LeftDrawerClass().getHeaderClassFiles(),
      widgetType: WidgetTypeLeftDrawerLayout,
    );
  } else if (subType == WidgetTypeContainer) {
    /// Container View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeContainer),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeContainer), getWidgetTitle(WidgetTypeContainer)),
      widgetSubType: WidgetTypeContainer,
      subWidgetsList: [],
      widgetViewModel: ContainerClass(),
      widgetType: WidgetTypeContainerLayout,
    );
  } else if (subType == WidgetTypeColumn) {
    /// Column View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeColumn),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeColumn), getWidgetTitle(WidgetTypeColumn)),
      widgetSubType: WidgetTypeColumn,
      widgetViewModel: ColumnClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeColumnLayout,
    );
  } else if (subType == WidgetTypeRow) {
    /// ROW View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeRow),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeRow), getWidgetTitle(WidgetTypeRow)),
      widgetSubType: WidgetTypeRow,
      widgetViewModel: RowClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeRowLayout,
    );
  } else if (subType == WidgetTypeCard) {
    /// Card View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeCard),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeCard), getWidgetTitle(WidgetTypeCard)),
      widgetSubType: WidgetTypeCard,
      widgetViewModel: CardClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeCardLayout,
    );
  } else if (subType == WidgetTypeList) {
    /// List View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeList),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeList), getWidgetTitle(WidgetTypeList)),
      widgetSubType: WidgetTypeList,
      widgetViewModel: ListViewClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeListLayout,
    );
  } else if (subType == WidgetTypeGrid) {
    /// Grid View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeGrid),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeGrid), getWidgetTitle(WidgetTypeGrid)),
      widgetSubType: WidgetTypeGrid,
      widgetViewModel: GridViewClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeGridLayout,
    );
  } else if (subType == WidgetTypeVideoPlayer) {
    /// Video Player
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeVideoPlayer),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeVideoPlayer), getWidgetTitle(WidgetTypeVideoPlayer)),
      widgetSubType: WidgetTypeVideoPlayer,
      widgetViewModel: VideoPlayerClass(),
      headerImport: VideoPlayerClass().getHeaderClassFiles(),
      yamlLibName: VideoPlayerClass().getYamlLib(),
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeAudioPlayer) {
    /// Audio Player
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeAudioPlayer),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeAudioPlayer), getWidgetTitle(WidgetTypeAudioPlayer)),
      widgetSubType: WidgetTypeAudioPlayer,
      widgetViewModel: AudioPlayerClass(),
      headerImport: AudioPlayerClass().getHeaderClassFiles(),
      yamlLibName: AudioPlayerClass().getYamlLib(),
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeSwitchListTile) {
    /// Switch List Tile
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeSwitchListTile),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeSwitchListTile), getWidgetTitle(WidgetTypeSwitchListTile)),
      widgetSubType: WidgetTypeSwitchListTile,
      widgetViewModel: SwitchListTileClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeCheckboxListTile) {
    /// Checkbox List Tile
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeCheckboxListTile),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeCheckboxListTile), getWidgetTitle(WidgetTypeCheckboxListTile)),
      widgetSubType: WidgetTypeCheckboxListTile,
      widgetViewModel: CheckboxListTileClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeSizedBox) {
    /// SizedBox
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeSizedBox),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeSizedBox), getWidgetTitle(WidgetTypeSizedBox)),
      widgetSubType: WidgetTypeSizedBox,
      widgetViewModel: SizedBoxClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeDivider) {
    /// Divider
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeDivider),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeDivider), getWidgetTitle(WidgetTypeDivider)),
      widgetViewModel: DividerClass(),
      widgetSubType: WidgetTypeDivider,
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeCalender) {
    /// Calender
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeCalender),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeCalender), getWidgetTitle(WidgetTypeCalender)),
      widgetViewModel: CalenderClass(),
      widgetSubType: WidgetTypeCalender,
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeDropDown) {
    /// DropDown
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeDropDown),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeDropDown), getWidgetTitle(WidgetTypeDropDown)),
      widgetViewModel: DropDownClass(),
      widgetSubType: WidgetTypeDropDown,
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeWebView) {
    /// WebView
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeWebView),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeWebView), getWidgetTitle(WidgetTypeWebView)),
      widgetViewModel: WebViewClass(),
      widgetSubType: WidgetTypeWebView,
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeCircleImage) {
    /// CircleImage
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeCircleImage),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeCircleImage), getWidgetTitle(WidgetTypeCircleImage)),
      widgetViewModel: CircleImageClass(),
      widgetSubType: WidgetTypeCircleImage,
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeRatingBar) {
    /// Rating Bar
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeRatingBar),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeRatingBar), getWidgetTitle(WidgetTypeRatingBar)),
      widgetViewModel: RatingBarClass(),
      widgetSubType: WidgetTypeRatingBar,
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
      headerImport: RatingBarClass().getHeaderClassFiles(),
      yamlLibName: RatingBarClass().getYamlLib(),
    );
  } else if (subType == WidgetTypeRotatedBox) {
    /// Rotated Box
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeRotatedBox),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeRotatedBox), getWidgetTitle(WidgetTypeRotatedBox)),
      widgetViewModel: RotatedBoxClass(),
      widgetSubType: WidgetTypeRotatedBox,
      subWidgetsList: [],
      widgetType: WidgetTypeRotatedBoxLayout,
    );
  } else if (subType == WidgetTypeConstrainedBox) {
    /// Constrained Box
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeConstrainedBox),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeConstrainedBox), getWidgetTitle(WidgetTypeConstrainedBox)),
      widgetViewModel: ConstrainedBoxClass(),
      widgetSubType: WidgetTypeConstrainedBox,
      subWidgetsList: [],
      widgetType: WidgetTypeConstrainedLayout,
    );
  } else if (subType == WidgetTypeClipRRect) {
    /// ClipRRect
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeClipRRect),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeClipRRect), getWidgetTitle(WidgetTypeClipRRect)),
      widgetViewModel: ClipRRectClass(),
      widgetSubType: WidgetTypeClipRRect,
      subWidgetsList: [],
      widgetType: WidgetTypeClipRRectLayout,
    );
  } else if (subType == WidgetTypeOpacity) {
    /// Opacity View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeOpacity),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeOpacity), getWidgetTitle(WidgetTypeOpacity)),
      widgetSubType: WidgetTypeOpacity,
      widgetViewModel: OpacityClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeOpacityLayout,
    );
  } else if (subType == WidgetTypeTabBar) {
    /// TabBar View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeTabBar),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeTabBar), getWidgetTitle(WidgetTypeTabBar)),
      widgetSubType: WidgetTypeTabBar,
      widgetViewModel: TabBarClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeTabBarLayout,
    );
  } else if (subType == WidgetTypeTabBarView) {
    /// TabBarView View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeTabBarView),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeTabBarView), getWidgetTitle(WidgetTypeTabBarView)),
      widgetSubType: WidgetTypeTabBarView,
      widgetViewModel: TabBarViewClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeTabBarViewLayout,
    );
  } else if (subType == WidgetTypeCreditCardView) {
    /// CreditCardView
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeCreditCardView),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeCreditCardView), getWidgetTitle(WidgetTypeCreditCardView)),
      widgetSubType: WidgetTypeCreditCardView,
      widgetViewModel: CreditCardViewClass(),
      headerImport: CreditCardViewClass().getHeaderClassFiles(),
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeLottieAnimation) {
    /// LottieAnimation
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeLottieAnimation),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeLottieAnimation), getWidgetTitle(WidgetTypeLottieAnimation)),
      widgetSubType: WidgetTypeLottieAnimation,
      widgetViewModel: LottieAnimationClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeNormal,
      headerImport: LottieAnimationClass().getHeaderClassFiles(),
      yamlLibName: LottieAnimationClass().getYamlLib(),
    );
  } else if (subType == WidgetTypeSwitch) {
    /// Switch
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeSwitch),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeSwitch), getWidgetTitle(WidgetTypeSwitch)),
      widgetSubType: WidgetTypeSwitch,
      widgetViewModel: SwitchClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeOTPTextField) {
    /// OTP TextFiled
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeOTPTextField),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeOTPTextField), getWidgetTitle(WidgetTypeOTPTextField)),
      widgetSubType: WidgetTypeOTPTextField,
      widgetViewModel: OTPTextFieldClass(),
      widgetType: WidgetTypeNormal,
      headerImport: OTPTextFieldClass().getHeaderClassFiles(),
      yamlLibName: OTPTextFieldClass().getYamlLib(),
    );
  } else if (subType == WidgetTypeLinearProgressIndicator) {
    /// TextField View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeLinearProgressIndicator),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeLinearProgressIndicator), getWidgetTitle(WidgetTypeLinearProgressIndicator)),
      widgetSubType: WidgetTypeLinearProgressIndicator,
      widgetViewModel: LinearProgressIndicatorClass(),
      widgetType: WidgetTypeNormal,
    );
  } else if (subType == WidgetTypeDummyAddWidget) {
    /// Wrap Dummy View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeDummyAddWidget),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeDummyAddWidget), getWidgetTitle(WidgetTypeDummyAddWidget)),
      widgetSubType: WidgetTypeDummyAddWidget,
      widgetViewModel: TextClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeDummyAddWidget,
    );
  } else if (subType == WidgetTypeDummyWrapWidget) {
    /// Add Dummy View
    return WidgetModel(
      id: getWidgetId(),
      title: getWidgetTitle(WidgetTypeDummyWrapWidget),
      displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeDummyWrapWidget), getWidgetTitle(WidgetTypeDummyWrapWidget)),
      widgetSubType: WidgetTypeDummyWrapWidget,
      widgetViewModel: TextClass(),
      subWidgetsList: [],
      widgetType: WidgetTypeDummyWrapWidget,
    );
  }
}

/// Get hover box decoration effect
getBoxDecoration(WidgetModel widgetModel, bool isHovering) {
  return BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(2)),
    border: Border.all(
        color: isHovering
            ? (!appStore.isPreviewCode)
                ? mouseHoverColor
                : Colors.transparent
            : (appStore.currentSelectedWidget != null && widgetModel.id == appStore.currentSelectedWidget!.id)
                ? (!appStore.isPreviewCode)
                    ? selectedViewSelectionColor
                    : Colors.transparent
                : Colors.transparent,
        width: (appStore.currentSelectedWidget != null && widgetModel.id == appStore.currentSelectedWidget!.id)
            ? (!appStore.isPreviewCode)
                ? 1
                : 0
            : 0),
  );
}

/// Tab View
WidgetModel getTabView(String title) {
  return WidgetModel(
    id: getWidgetId(),
    title: title,
    displayWidget: getDisplayWidget(getWidgetsIcon(""), title),
    widgetSubType: WidgetTypeTab,
    widgetViewModel: TabClass(),
    widgetType: WidgetTypeNormal,
  );
}

/// Add Tabview layout
addTabViewWidget(List<WidgetModel> selectedWidgetList, WidgetModel item) async {
  appStore.addToChangeStack();

  WidgetModel tempItem = item;

  /// get TabBar view
  WidgetModel taBar = getWidgets(WidgetTypeTabBar);
  taBar.subWidgetsList!.clear();

  /// Add Tab into tabBar view
  taBar.subWidgetsList!.add(getTabView("Tab 1"));
  taBar.subWidgetsList!.add(getTabView("Tab 2"));
  taBar.subWidgetsList!.add(getTabView("Tab 3"));

  tempItem.subWidgetsList!.clear();
  tempItem.subWidgetsList!.add(taBar);

  /// Get TabBarView
  WidgetModel taBarView = getWidgets(WidgetTypeTabBarView);
  taBarView.subWidgetsList!.add(getWidgets(WidgetTypeColumn));
  taBarView.subWidgetsList!.add(getWidgets(WidgetTypeColumn));
  taBarView.subWidgetsList!.add(getWidgets(WidgetTypeColumn));

  tempItem.subWidgetsList!.add(taBarView);

  selectedWidgetList.add(tempItem);
  appStore.refreshMainViewData();
}

/// Check if widgets type as Root
bool isRootTypeView(WidgetModel rootModelView) {
  if (rootModelView.widgetSubType == WidgetTypeColumn ||
      rootModelView.widgetSubType == WidgetTypeRow ||
      rootModelView.widgetSubType == WidgetTypeContainer ||
      rootModelView.widgetSubType == WidgetTypeCard ||
      rootModelView.widgetSubType == WidgetTypeStack ||
      rootModelView.widgetSubType == WidgetTypeClipRRect ||
      rootModelView.widgetSubType == WidgetTypeConstrainedBox ||
      rootModelView.widgetSubType == WidgetTypeRotatedBox ||
      rootModelView.widgetSubType == WidgetTypeOpacity ||
      rootModelView.widgetSubType == WidgetTypeList ||
      rootModelView.widgetSubType == WidgetTypeGrid ||
      rootModelView.widgetSubType == WidgetTypeTabView) {
    return true;
  } else {
    return false;
  }
}

/// Remove default child view
removeDefaultChildView(List<WidgetModel?> subWidgetsList) {
  if (subWidgetsList[0]!.id!.startsWith(DUMMY_WIDGET_ID)) {
    subWidgetsList.removeAt(0);
  }
}

Widget getDragTargetView(WidgetModel widgetModel) {
  return DragTarget<WidgetModel>(
    builder: (context, candidateItems, rejectedItems) {
      return GestureDetector(
        child: Container(
            color: candidateItems.isNotEmpty ? Colors.grey : Colors.transparent,
            child: HoverWidget(
              builder: (context, isHovering) {
                return AnimatedContainer(
                  decoration: getBoxDecoration(widgetModel, isHovering),
                  duration: commonAnimationDuration,
                  child: getLayoutWidgets(widgetModel),
                );
              },
            )),
        onTap: () {
          onViewTap(widgetModel);
        },
      );
    },
    onAccept: (item) {
      layoutWidgetsOnAccept(item, widgetModel);
    },
  );
}

Widget getTargetView(WidgetModel widgetModel) {
  Widget childDataWidget = getWidgetsClassData(widgetModel, isChildData: true);
  return childDataWidget;
}

/// Get Child Widgets
getGestureDetector(WidgetModel widgetModel, Widget childWidget) {
  return GestureDetector(
    child: HoverWidget(
      builder: (context, isHovering) {
        return AnimatedContainer(
          duration: commonAnimationDuration,
          decoration: getBoxDecoration(widgetModel, isHovering),
          child: childWidget,
        );
      },
    ),
    onTap: () {
      onViewTap(widgetModel);
    },
  );
}

/// Tap of any child view to get property data
onViewTap(WidgetModel widgetModel) {
  if (!appStore.isPreviewCode) {
    if (widgetModel.id!.startsWith(DUMMY_WIDGET_ID)) {
      appStore.selectParentWidget(widgetModel.parentWidgetId);
    } else {
      appStore.updateSelectedWidget(widgetModel);
    }
  }
}

Widget getLayoutWidgets(WidgetModel selectedWidgetModel) {
  /// Column View
  if (selectedWidgetModel.widgetType == WidgetTypeColumnLayout) {
    if (selectedWidgetModel.subWidgetsList!.isEmpty) {
      selectedWidgetModel.subWidgetsList!.add(WidgetModel(
        id: (DUMMY_WIDGET_ID + getWidgetId()),
        title: language!.titleColumnChild,
        displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeText), language!.titleColumnChild),
        widgetSubType: WidgetTypeText,
        parentWidgetId: selectedWidgetModel.id,
        widgetViewModel: TextClass(text: language!.titleColumnChild),
        widgetType: WidgetTypeNormal,
      ));
    }
    return subChildView(selectedWidgetModel);
  }

  /// Container View
  else if (selectedWidgetModel.widgetType == WidgetTypeContainerLayout) {
    if (selectedWidgetModel.subWidgetsList!.isNotEmpty) {
      /// Return actual child view of Container
      return subChildView(selectedWidgetModel);
    } else {
      /// Return Demo View of Container
      return (selectedWidgetModel.widgetViewModel as ContainerClass).getContainerWidget(selectedWidgetModel);
    }
  }

  /// Row View
  else if (selectedWidgetModel.widgetType == WidgetTypeRowLayout) {
    if (selectedWidgetModel.subWidgetsList!.isEmpty) {
      selectedWidgetModel.subWidgetsList!.add(WidgetModel(
        id: (DUMMY_WIDGET_ID + getWidgetId()),
        title: language!.titleRowChild,
        displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeText), language!.titleRowChild),
        widgetSubType: WidgetTypeText,
        parentWidgetId: selectedWidgetModel.id,
        widgetViewModel: TextClass(text: language!.titleRowChild),
        widgetType: WidgetTypeNormal,
      ));
    }
    return subChildView(selectedWidgetModel);
  }

  /// Stack View
  else if (selectedWidgetModel.widgetType == WidgetTypeStackLayout) {
    if (selectedWidgetModel.subWidgetsList!.isEmpty) {
      selectedWidgetModel.subWidgetsList!.add(WidgetModel(
        id: (DUMMY_WIDGET_ID + getWidgetId()),
        title: language!.titleStackChild,
        displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeText), language!.titleStackChild),
        widgetSubType: WidgetTypeText,
        parentWidgetId: selectedWidgetModel.id,
        widgetViewModel: TextClass(text: language!.titleStackChild),
        widgetType: WidgetTypeNormal,
      ));
    }
    return subChildView(selectedWidgetModel);
  }

  /// List View
  else if (selectedWidgetModel.widgetType == WidgetTypeListLayout) {
    if (selectedWidgetModel.subWidgetsList!.isEmpty) {
      selectedWidgetModel.subWidgetsList!.add(WidgetModel(
        id: (DUMMY_WIDGET_ID + getWidgetId()),
        title: language!.titleListChild,
        displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeText), language!.titleListChild),
        widgetSubType: WidgetTypeText,
        parentWidgetId: selectedWidgetModel.id,
        widgetViewModel: TextClass(text: language!.titleListChild),
        widgetType: WidgetTypeNormal,
      ));
    }
    return subChildView(selectedWidgetModel);
  }

  /// Grid View
  else if (selectedWidgetModel.widgetType == WidgetTypeGridLayout) {
    if (selectedWidgetModel.subWidgetsList!.isEmpty) {
      selectedWidgetModel.subWidgetsList!.add(WidgetModel(
        id: (DUMMY_WIDGET_ID + getWidgetId()),
        title: language!.titleGridChild,
        displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeText), language!.titleGridChild),
        widgetSubType: WidgetTypeText,
        parentWidgetId: selectedWidgetModel.id,
        widgetViewModel: TextClass(text: language!.titleGridChild),
        widgetType: WidgetTypeNormal,
      ));
    }
    return subChildView(selectedWidgetModel);
  }

  /// Card View
  else if (selectedWidgetModel.widgetType == WidgetTypeCardLayout) {
    if (selectedWidgetModel.subWidgetsList!.isNotEmpty) {
      /// Return actual View with column root view
      return subChildView(selectedWidgetModel);
    } else {
      /// Return Demo View of Column
      return (selectedWidgetModel.widgetViewModel as CardClass).getCardWidget(selectedWidgetModel);
    }
  }

  /// Opacity View
  else if (selectedWidgetModel.widgetType == WidgetTypeOpacityLayout) {
    if (selectedWidgetModel.subWidgetsList!.isNotEmpty) {
      /// Return actual View with column root view
      return subChildView(selectedWidgetModel);
    } else {
      /// Return Demo View of Column
      return (selectedWidgetModel.widgetViewModel as OpacityClass).getOpacityWidget(selectedWidgetModel);
    }
  }

  /// ClipRRect View
  else if (selectedWidgetModel.widgetType == WidgetTypeClipRRectLayout) {
    if (selectedWidgetModel.subWidgetsList!.isNotEmpty) {
      return subChildView(selectedWidgetModel);
    } else {
      return (selectedWidgetModel.widgetViewModel as ClipRRectClass).getClipRRectWidget(selectedWidgetModel);
    }
  }

  /// RotatedBox View
  else if (selectedWidgetModel.widgetType == WidgetTypeRotatedBoxLayout) {
    if (selectedWidgetModel.subWidgetsList!.isNotEmpty) {
      return subChildView(selectedWidgetModel);
    } else {
      return (selectedWidgetModel.widgetViewModel as RotatedBoxClass).getRotatedBoxWidget(selectedWidgetModel);
    }
  }

  /// Tabview View
  else if (selectedWidgetModel.widgetType == WidgetTypeTabViewLayout) {
    if (selectedWidgetModel.subWidgetsList!.isNotEmpty) {
      return subChildView(selectedWidgetModel);
    } else {
      return (selectedWidgetModel.widgetViewModel as TabViewClass).getTabViewWidget();
    }
  }

  /// TabBar View
  else if (selectedWidgetModel.widgetType == WidgetTypeTabBarLayout) {
    return subChildView(selectedWidgetModel);
  }

  /// TabBarView View
  else if (selectedWidgetModel.widgetType == WidgetTypeTabBarViewLayout) {
    return subChildView(selectedWidgetModel);
  }

  /// Constrained View
  else if (selectedWidgetModel.widgetType == WidgetTypeConstrainedLayout) {
    if (selectedWidgetModel.subWidgetsList!.isNotEmpty) {
      return subChildView(selectedWidgetModel);
    } else {
      return (selectedWidgetModel.widgetViewModel as ConstrainedBoxClass).getConstrainedBoxWidget(selectedWidgetModel);
    }
  } else {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.green[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Dummy Default View', style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
  }
}

LayoutExpanded getLayoutExpanded(WidgetModel widgetModel) {
  LayoutExpanded layoutExpanded = LayoutExpanded();
  if (widgetModel.widgetSubType == WidgetTypeColumn) {
    layoutExpanded = (widgetModel.widgetViewModel as ColumnClass).isColumnExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeRow) {
    layoutExpanded = (widgetModel.widgetViewModel as RowClass).isRowExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeContainer) {
    layoutExpanded = (widgetModel.widgetViewModel as ContainerClass).isContainerExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeStack) {
    layoutExpanded = (widgetModel.widgetViewModel as StackClass).isStackExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeCard) {
    layoutExpanded = (widgetModel.widgetViewModel as CardClass).isCardExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeList) {
    layoutExpanded = (widgetModel.widgetViewModel as ListViewClass).isListViewExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeGrid) {
    layoutExpanded = (widgetModel.widgetViewModel as GridViewClass).isGridViewExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeTabView) {
  } else if (widgetModel.widgetSubType == WidgetTypeRotatedBox) {
    layoutExpanded = (widgetModel.widgetViewModel as RotatedBoxClass).isRotatedExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeConstrainedBox) {
    layoutExpanded = (widgetModel.widgetViewModel as ConstrainedBoxClass).isConstrainedExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeClipRRect) {
    layoutExpanded = (widgetModel.widgetViewModel as ClipRRectClass).isClipRRectExpanded(widgetModel);
  } else if (widgetModel.widgetSubType == WidgetTypeOpacity) {
    layoutExpanded = (widgetModel.widgetViewModel as OpacityClass).isOpacityExpanded(widgetModel);
  }
  return layoutExpanded;
}

/// Get Scaffold main view
getBaseWidgets(WidgetModel widgetModel) {
  if (widgetModel.widgetType != WidgetTypeNormal) {
    if (widgetModel.parentWidgetType != null && (widgetModel.parentWidgetType == WidgetTypeColumn || widgetModel.parentWidgetType == WidgetTypeRow)) {
      LayoutExpanded expanded = getLayoutExpanded(widgetModel);
      if (expanded.isExpanded!) {
        return Expanded(flex: expanded.flex!, child: getDragTargetView(widgetModel));
      } else {
        return getDragTargetView(widgetModel);
      }
    }
    return getDragTargetView(widgetModel);
  } else {
    return getTargetView(widgetModel);
  }
}

/// Get widgets child based on widgets type
Widget subChildView(WidgetModel selectedWidgetModel) {
  if (selectedWidgetModel.widgetType == WidgetTypeNormal) {
    return getWidgetsClassData(selectedWidgetModel, isChildData: true);
  }

  Column? columnView;
  Row? rowView;
  late Column columnListView;
  late Column columnGridView;
  Container? container;
  Card? cardView;
  ListView? listView;
  GridView? gridView;
  Stack? stack;
  Align? align;
  Padding? padding;
  SizedBox? sizedBox;
  SingleChildScrollView? singleChildScrollView;
  ClipRRect? clipRRect;
  ConstrainedBox? constrainedBox;
  RotatedBox? rotatedBox;
  Opacity? opacity;
  DefaultTabController? defaultTabController;
  TabBar? tabBar;
  TabBarView? tabBarView;
  Column? tabColumnView;
  Expanded? expanded;
  GestureDetector? gestureDetector;
  PageView? pageView;

  if (selectedWidgetModel.widgetType == WidgetTypeColumnLayout) {
    /// Column Widget
    columnView = Column(children: []);
  } else if (selectedWidgetModel.widgetType == WidgetTypeRowLayout) {
    /// Row Widget
    rowView = Row(children: []);
  } else if (selectedWidgetModel.widgetType == WidgetTypeContainerLayout) {
    /// Container View
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as ContainerClass).getContainerWidget(selectedWidgetModel);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      container = tempWidget as Container?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeCardLayout) {
    /// Card Widget
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as CardClass).getCardWidget(selectedWidgetModel);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      cardView = tempWidget as Card?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeOpacityLayout) {
    /// Opacity Widget
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as OpacityClass).getOpacityWidget(selectedWidgetModel);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      opacity = tempWidget as Opacity?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeClipRRectLayout) {
    /// ClipRRect Widget
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as ClipRRectClass).getClipRRectWidget(selectedWidgetModel);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      clipRRect = tempWidget as ClipRRect?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeRotatedBoxLayout) {
    /// RotatedBox Widget
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as RotatedBoxClass).getRotatedBoxWidget(selectedWidgetModel);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      rotatedBox = tempWidget as RotatedBox?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeConstrainedLayout) {
    /// ConstrainedLayout Widget
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as ConstrainedBoxClass).getConstrainedBoxWidget(selectedWidgetModel);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      constrainedBox = tempWidget as ConstrainedBox?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypePageView) {
    /// PageView Widget
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as PageViewClass).getPageViewWidget(selectedWidgetModel);
    if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      pageView = tempWidget as PageView?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeListLayout) {
    /// ListView Widget
    columnListView = Column(children: []);
  } else if (selectedWidgetModel.widgetType == WidgetTypeGridLayout) {
    /// GridView Widget
    columnGridView = Column(children: []);
  } else if (selectedWidgetModel.widgetType == WidgetTypeStackLayout) {
    /// Stack Widget
    stack = Stack(children: []);
  } else if (selectedWidgetModel.widgetType == WidgetTypeTabViewLayout) {
    /// TabView Widget
    tabColumnView = Column(children: []);
  } else if (selectedWidgetModel.widgetType == WidgetTypeTabBarLayout) {
    /// TabBar Widget
    tabBar = (selectedWidgetModel.widgetViewModel as TabBarClass).getTabBarWidget() as TabBar?;
  } else if (selectedWidgetModel.widgetType == WidgetTypeTabBarViewLayout) {
    /// TabBarView Widget
    tabBarView = (selectedWidgetModel.widgetViewModel as TabBarViewClass).getTabBarViewWidget() as TabBarView?;
  } else {
    printLogData("subChildView:............ERROR............");
  }

  if (selectedWidgetModel.subWidgetsList != null && selectedWidgetModel.subWidgetsList!.length > 0) {
    WidgetModel? singleWidgetModel = selectedWidgetModel.subWidgetsList![0];
    if (selectedWidgetModel.widgetType == WidgetTypeColumnLayout ||
        selectedWidgetModel.widgetType == WidgetTypeRowLayout ||
        selectedWidgetModel.widgetType == WidgetTypeStackLayout ||
        selectedWidgetModel.widgetType == WidgetTypeTabViewLayout ||
        selectedWidgetModel.widgetType == WidgetTypeTabBarLayout ||
        selectedWidgetModel.widgetType == WidgetTypeListLayout ||
        selectedWidgetModel.widgetType == WidgetTypeGridLayout ||
        selectedWidgetModel.widgetType == WidgetTypeTabBarViewLayout) {
      for (int index = 0; index < selectedWidgetModel.subWidgetsList!.length; index++) {
        WidgetModel? widgetModel = selectedWidgetModel.subWidgetsList![index];
        if (selectedWidgetModel.widgetType == WidgetTypeColumnLayout) {
          /// Column Widget
          columnView!.children.add(getBaseWidgets(widgetModel!));
        } else if (selectedWidgetModel.widgetType == WidgetTypeRowLayout) {
          /// Row Widget
          rowView!.children.add(getBaseWidgets(widgetModel!));
        } else if (selectedWidgetModel.widgetType == WidgetTypeStackLayout) {
          /// Stack Widget
          stack!.children.add(getBaseWidgets(widgetModel!));
        } else if (selectedWidgetModel.widgetType == WidgetTypeListLayout) {
          /// ListView Widget
          columnListView.children.add(getBaseWidgets(widgetModel!));
        } else if (selectedWidgetModel.widgetType == WidgetTypeGridLayout) {
          /// GridView Widget
          columnGridView.children.add(getBaseWidgets(widgetModel!));
        } else if (selectedWidgetModel.widgetType == WidgetTypeTabViewLayout) {
          /// TabBar Widget
          Widget tempWidget = getBaseWidgets(widgetModel!);
          tabColumnView!.children.add(tempWidget);
        } else if (selectedWidgetModel.widgetType == WidgetTypeTabBarLayout) {
          /// Tab Widget
          tabBar!.tabs.add(getBaseWidgets(widgetModel!));
        } else if (selectedWidgetModel.widgetType == WidgetTypeTabBarViewLayout) {
          /// TabBarView Widget
          if (tabBarView != null) {
            tabBarView.children.add(getBaseWidgets(widgetModel!));
          }
        }
      }
    } else if (selectedWidgetModel.widgetType == WidgetTypeContainerLayout) {
      /// Container Widget
      Widget tempWidget = (selectedWidgetModel.widgetViewModel as ContainerClass).getContainerWidget(selectedWidgetModel, widget: getBaseWidgets(singleWidgetModel!));
      if (tempWidget is Align) {
        align = tempWidget;
      } else if (tempWidget is Padding) {
        padding = tempWidget;
      } else if (tempWidget is GestureDetector) {
        gestureDetector = tempWidget;
      } else {
        container = tempWidget as Container?;
      }
    } else if (selectedWidgetModel.widgetType == WidgetTypeCardLayout) {
      /// Card Widget
      Widget tempWidget = (selectedWidgetModel.widgetViewModel as CardClass).getCardWidget(selectedWidgetModel, widget: getBaseWidgets(singleWidgetModel!));
      if (tempWidget is Align) {
        align = tempWidget;
      } else if (tempWidget is Padding) {
        padding = tempWidget;
      } else if (tempWidget is GestureDetector) {
        gestureDetector = tempWidget;
      } else {
        cardView = tempWidget as Card?;
      }
    } else if (selectedWidgetModel.widgetType == WidgetTypeOpacityLayout) {
      /// Opacity Widget
      Widget tempWidget = (selectedWidgetModel.widgetViewModel as OpacityClass).getOpacityWidget(selectedWidgetModel, widget: getBaseWidgets(singleWidgetModel!));
      if (tempWidget is Align) {
        align = tempWidget;
      } else if (tempWidget is Padding) {
        padding = tempWidget;
      } else if (tempWidget is GestureDetector) {
        gestureDetector = tempWidget;
      } else {
        opacity = tempWidget as Opacity?;
      }
    } else if (selectedWidgetModel.widgetType == WidgetTypeClipRRectLayout) {
      /// ClipRRect Widget
      Widget tempWidget = (selectedWidgetModel.widgetViewModel as ClipRRectClass).getClipRRectWidget(selectedWidgetModel, widget: getBaseWidgets(singleWidgetModel!));
      if (tempWidget is Align) {
        align = tempWidget;
      } else if (tempWidget is Padding) {
        padding = tempWidget;
      } else if (tempWidget is GestureDetector) {
        gestureDetector = tempWidget;
      } else {
        clipRRect = tempWidget as ClipRRect?;
      }
    } else if (selectedWidgetModel.widgetType == WidgetTypeConstrainedLayout) {
      /// Constrained Widget
      Widget tempWidget = (selectedWidgetModel.widgetViewModel as ConstrainedBoxClass).getConstrainedBoxWidget(selectedWidgetModel, widget: getBaseWidgets(singleWidgetModel!));
      if (tempWidget is Align) {
        align = tempWidget;
      } else if (tempWidget is Padding) {
        padding = tempWidget;
      } else if (tempWidget is GestureDetector) {
        gestureDetector = tempWidget;
      } else {
        constrainedBox = tempWidget as ConstrainedBox?;
      }
    } else if (selectedWidgetModel.widgetType == WidgetTypeRotatedBoxLayout) {
      /// RotatedBox Widget
      Widget tempWidget = (selectedWidgetModel.widgetViewModel as RotatedBoxClass).getRotatedBoxWidget(selectedWidgetModel, widget: getBaseWidgets(singleWidgetModel!));
      if (tempWidget is Align) {
        align = tempWidget;
      } else if (tempWidget is Padding) {
        padding = tempWidget;
      } else if (tempWidget is GestureDetector) {
        gestureDetector = tempWidget;
      } else {
        rotatedBox = tempWidget as RotatedBox?;
      }
    } else if (selectedWidgetModel.widgetType == WidgetTypeRotatedBoxLayout) {
      ///PageView Class
      Widget tempWidget = (selectedWidgetModel.widgetViewModel as PageViewClass).getPageViewWidget(selectedWidgetModel);
      if (tempWidget is GestureDetector) {
        gestureDetector = tempWidget;
      } else {
        pageView = tempWidget as PageView?;
      }
    }
  }

  /// Align and padding widgets return
  if (selectedWidgetModel.widgetType == WidgetTypeColumnLayout) {
    /// Column Widget

    /// Add default View
    if (columnView!.children.length == 0) {
      columnView.children.add(
        getBaseWidgets(
          defaultChildWidget(selectedWidgetModel),
        ),
      );
    }
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as ColumnClass).getColumnWidget(selectedWidgetModel, widget: columnView.children);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is SingleChildScrollView) {
      singleChildScrollView = tempWidget;
    } else if (tempWidget is Expanded) {
      expanded = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      columnView = tempWidget as Column?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeListLayout) {
    /// ListView Widget

    /// Add default View
    if (columnListView.children.length == 0) {
      columnListView.children.add(
        getBaseWidgets(
          defaultChildWidget(selectedWidgetModel),
        ),
      );
    }
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as ListViewClass).getListViewWidget(selectedWidgetModel, widget: columnListView.children);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is SizedBox) {
      sizedBox = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      listView = tempWidget as ListView?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeGridLayout) {
    /// GridView Widget

    /// Add default View
    if (columnGridView.children.length == 0) {
      columnGridView.children.add(
        getBaseWidgets(
          defaultChildWidget(selectedWidgetModel),
        ),
      );
    }
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as GridViewClass).getGridViewWidget(selectedWidgetModel, widget: columnGridView.children);

    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is SizedBox) {
      sizedBox = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      gridView = tempWidget as GridView?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeRowLayout) {
    /// Row Widget

    /// Add default View
    if (rowView!.children.length == 0) {
      rowView.children.add(
        getBaseWidgets(
          defaultChildWidget(selectedWidgetModel),
        ),
      );
    }
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as RowClass).getRowWidget(selectedWidgetModel, widget: rowView.children);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is SingleChildScrollView) {
      singleChildScrollView = tempWidget;
    } else if (tempWidget is Expanded) {
      expanded = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else {
      rowView = tempWidget as Row?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeStackLayout) {
    /// Stack Widget

    /// Add default View
    if (stack!.children.length == 0) {
      stack.children.add(
        getBaseWidgets(
          defaultChildWidget(selectedWidgetModel),
        ),
      );
    }
    Widget tempWidget = (selectedWidgetModel.widgetViewModel as StackClass).getStackWidget(selectedWidgetModel, widget: stack.children);
    if (tempWidget is Align) {
      align = tempWidget;
    } else if (tempWidget is Padding) {
      padding = tempWidget;
    } else if (tempWidget is GestureDetector) {
      gestureDetector = tempWidget;
    } else if (tempWidget is SizedBox) {
      sizedBox = tempWidget;
    } else {
      stack = tempWidget as Stack?;
    }
  } else if (selectedWidgetModel.widgetType == WidgetTypeTabViewLayout) {
    /// tabBar Widget
    Widget tempTabViewWidget = (selectedWidgetModel.widgetViewModel as TabViewClass).getTabViewWidget(widget: tabColumnView);
    if (tempTabViewWidget is Align) {
      align = tempTabViewWidget;
    } else if (tempTabViewWidget is Padding) {
      padding = tempTabViewWidget;
    } else {
      defaultTabController = tempTabViewWidget as DefaultTabController?;
    }
  }

  if (align != null) {
    return align;
  } else if (gestureDetector != null) {
    return gestureDetector;
  } else if (expanded != null) {
    return expanded;
  } else if (padding != null) {
    return padding;
  } else if (singleChildScrollView != null) {
    return singleChildScrollView;
  } else if (sizedBox != null) {
    return sizedBox;
  } else if (columnView != null) {
    return columnView;
  } else if (stack != null) {
    return stack;
  } else if (rowView != null) {
    return rowView;
  } else if (container != null) {
    return container;
  } else if (cardView != null) {
    return cardView;
  } else if (clipRRect != null) {
    return clipRRect;
  } else if (listView != null) {
    return listView;
  } else if (gridView != null) {
    return gridView;
  } else if (constrainedBox != null) {
    return constrainedBox;
  } else if (rotatedBox != null) {
    return rotatedBox;
  } else if (opacity != null) {
    return opacity;
  } else if (pageView != null) {
    return pageView;
  } else if (tabBar != null) {
  return tabBar;
} else if (tabBarView != null) {
  return SizedBox(height: 300, child: tabBarView);
} else if (defaultTabController != null) {
  return defaultTabController;
} else {
  return SizedBox(
    child: Text("Dummy subChildView"),
  );
}
}

WidgetModel defaultChildWidget(WidgetModel widgetModel) {
  if (widgetModel.subWidgetsList != null) {
    widgetModel.subWidgetsList!.clear();
  }

  String childTitle = "";
  if (widgetModel.widgetSubType == WidgetTypeRow) {
    childTitle = language!.titleRowChild;
  } else if (widgetModel.widgetSubType == WidgetTypeColumn) {
    childTitle = language!.titleColumnChild;
  } else if (widgetModel.widgetSubType == WidgetTypeStack) {
    childTitle = language!.titleStackChild;
  } else if (widgetModel.widgetSubType == WidgetTypeList) {
    childTitle = language!.titleListChild;
  } else if (widgetModel.widgetSubType == WidgetTypeGrid) {
    childTitle = language!.titleGridChild;
  }

  WidgetModel widgetModel1 = getWidgets(widgetModel.widgetSubType);

  if (widgetModel.widgetSubType == WidgetTypeColumn || widgetModel.widgetSubType == WidgetTypeRow || widgetModel.widgetSubType == WidgetTypeStack || widgetModel.widgetSubType == WidgetTypeList || widgetModel.widgetSubType == WidgetTypeGrid) {
    widgetModel1.subWidgetsList!.add(
      WidgetModel(
        id: (DUMMY_WIDGET_ID + getWidgetId()),
        title: childTitle,
        displayWidget: getDisplayWidget(getWidgetsIcon(WidgetTypeText), childTitle),
        widgetSubType: WidgetTypeText,
        parentWidgetId: widgetModel.id,
        widgetViewModel: TextClass(text: childTitle),
        widgetType: WidgetTypeNormal,
      ),
    );
    return widgetModel1;
  }
  return widgetModel1;
}

/// Get unique id for view
String getWidgetId() {
  var r = Random();
  const _number = '1234567890';
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  id = id + _chars[r.nextInt(_chars.length)] + _chars[r.nextInt(_chars.length)] + _number[r.nextInt(_number.length)] + _number[r.nextInt(_number.length)];
  return id;
}

/// Get Child model based on type
getWidgetsClassData(
  WidgetModel widgetModel, {
  bool isChildData = false,
  bool? isChild = false,
  bool isCodeAsString = false,
  bool isPropertyJsonData = false,
  bool isEndCodeAsString = false,
}) {
  if (widgetModel.widgetSubType == WidgetTypeText) {
    /// Text View
    if (isChildData) {
      return (widgetModel.widgetViewModel as TextClass).getTextWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as TextClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as TextClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeTabView) {
    /// Tabview View
    if (isChildData) {
      return (widgetModel.widgetViewModel as TabViewClass).getTabViewWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as TabViewClass).getCodeAsString(isChild);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as TabViewClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeTabBarView) {
    /// TabBarView class
    if (isChildData) {
      return (widgetModel.widgetViewModel as TabBarViewClass).getTabBarViewWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as TabBarViewClass).getCodeAsString(isChild);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as TabBarViewClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeTabBar) {
    /// TabBar class
    if (isChildData) {
      return (widgetModel.widgetViewModel as TabBarClass).getTabBarWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as TabBarClass).getCodeAsString(isChild);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as TabBarClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeTab) {
    /// Tab class
    if (isChildData) {
      return (widgetModel.widgetViewModel as TabClass).getTabWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as TabClass).getCodeAsString();
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as TabClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeSlider) {
    /// Slider View
    if (isChildData) {
      return (widgetModel.widgetViewModel as SliderClass).getSliderWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as SliderClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as SliderClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeGoogleMap) {
    /// Google Map View
    if (isChildData) {
      return (widgetModel.widgetViewModel as GoogleMapClass).getGoogleMapWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as GoogleMapClass).getCodeAsString();
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as GoogleMapClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypePageView) {
    /// PageView View
    if (isChildData) {
      return (widgetModel.widgetViewModel as PageViewClass).getPageViewWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as PageViewClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as PageViewClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeTextField) {
    /// TextField View
    if (isChildData) {
      return (widgetModel.widgetViewModel as TextFieldClass).getTextFieldWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as TextFieldClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as TextFieldClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeTextButton) {
    /// Text Button View
    if (isChildData) {
      return (widgetModel.widgetViewModel as TextButtonClass).getTextButtonWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as TextButtonClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as TextButtonClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeImage) {
    /// Image View
    if (isChildData) {
      return (widgetModel.widgetViewModel as ImageClass).getImageWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ImageClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ImageClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeCheckBox) {
    if (isChildData) {
      /// Checkbox View
      return (widgetModel.widgetViewModel as CheckboxClass).getCheckboxWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as CheckboxClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as CheckboxClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeRadio) {
    /// Radio Button
    if (isChildData) {
      return (widgetModel.widgetViewModel as RadioButtonClass).getRadioButtonWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as RadioButtonClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as RadioButtonClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetIconType) {
    /// Icon
    if (isChildData) {
      return (widgetModel.widgetViewModel as IconClass).getIconWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as IconClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as IconClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeIconButton) {
    /// Icon Button
    if (isChildData) {
      return (widgetModel.widgetViewModel as IconButtonClass).getIconButtonWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as IconButtonClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as IconButtonClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeImageIcon) {
    /// ImageIcon
    if (isChildData) {
      return (widgetModel.widgetViewModel as ImageIconClass).getImageIconWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ImageIconClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ImageIconClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeAppBar) {
    /// Appbar View
    if (isChildData) {
      return (widgetModel.widgetViewModel as AppBarClass).getAppBarWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as AppBarClass).getCodeAsString();
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as AppBarClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeBottomNavigationBar) {
    /// BottomNavigationBar View
    if (isChildData) {
      return (widgetModel.widgetViewModel as BottomNavigationBarClass).getBottomNavigationBarWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as BottomNavigationBarClass).getCodeAsString();
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as BottomNavigationBarClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeLeftDrawer) {
    /// Left Drawer View
    if (isChildData) {
      return (widgetModel.widgetViewModel as LeftDrawerClass).getLeftDrawerWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as LeftDrawerClass).getCodeAsString();
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as LeftDrawerClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeContainer) {
    /// Container View
    if (isChildData) {
      return (widgetModel.widgetViewModel as ContainerClass).getContainerWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ContainerClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ContainerClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as ContainerClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeColumn) {
    /// Column View
    if (isChildData) {
      return (widgetModel.widgetViewModel as ColumnClass).getColumnWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ColumnClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ColumnClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as ColumnClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeRow) {
    /// ROW View
    if (isChildData) {
      return (widgetModel.widgetViewModel as RowClass).getRowWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as RowClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as RowClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as RowClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeCard) {
    /// Card View
    if (isChildData) {
      return (widgetModel.widgetViewModel as CardClass).getCardWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as CardClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as CardClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as CardClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeList) {
    /// List View
    if (isChildData) {
      return (widgetModel.widgetViewModel as ListViewClass).getListViewWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ListViewClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ListViewClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as ListViewClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeGrid) {
    /// Grid View
    if (isChildData) {
      return (widgetModel.widgetViewModel as GridViewClass).getGridViewWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as GridViewClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as GridViewClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as GridViewClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeVideoPlayer) {
    /// Video Player
    if (isChildData) {
      return (widgetModel.widgetViewModel as VideoPlayerClass).getVideoPlayerWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as VideoPlayerClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as VideoPlayerClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeAudioPlayer) {
    /// Audio Player
    if (isChildData) {
      return (widgetModel.widgetViewModel as AudioPlayerClass).getAudioPlayerWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as AudioPlayerClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as AudioPlayerClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeSwitchListTile) {
    /// Switch List Tile
    if (isChildData) {
      return (widgetModel.widgetViewModel as SwitchListTileClass).getSwitchListTileWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as SwitchListTileClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as SwitchListTileClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeCheckboxListTile) {
    /// Checkbox List Tile
    if (isChildData) {
      return (widgetModel.widgetViewModel as CheckboxListTileClass).getCheckboxListTileWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as CheckboxListTileClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as CheckboxListTileClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeSizedBox) {
    /// SizedBox
    if (isChildData) {
      return (widgetModel.widgetViewModel as SizedBoxClass).getSizedBoxWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as SizedBoxClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as SizedBoxClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeDivider) {
    /// Divider
    if (isChildData) {
      return (widgetModel.widgetViewModel as DividerClass).getDividerWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as DividerClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as DividerClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeCalender) {
    /// Calender
    if (isChildData) {
      return (widgetModel.widgetViewModel as CalenderClass).getCalenderWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as CalenderClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as CalenderClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeDropDown) {
    /// DropDown
    if (isChildData) {
      return (widgetModel.widgetViewModel as DropDownClass).getDropDownWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as DropDownClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as DropDownClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeWebView) {
    /// WebView
    if (isChildData) {
      return (widgetModel.widgetViewModel as WebViewClass).getWebViewWidget();
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as WebViewClass).getCodeAsString();
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as WebViewClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeListTile) {
    /// List Tile
    if (isChildData) {
      return (widgetModel.widgetViewModel as ListTileClass).getListTileWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ListTileClass).getCodeAsString();
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ListTileClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeStack) {
    /// Stack
    if (isChildData) {
      return (widgetModel.widgetViewModel as StackClass).getStackWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as StackClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as StackClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as StackClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeChipView) {
    /// Chip View
    if (isChildData) {
      return (widgetModel.widgetViewModel as ChipViewClass).getChipWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ChipViewClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ChipViewClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeCircleImage) {
    /// CircleImage
    if (isChildData) {
      return (widgetModel.widgetViewModel as CircleImageClass).getCircleImageWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as CircleImageClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as CircleImageClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeRatingBar) {
    /// Rating Bar
    if (isChildData) {
      return (widgetModel.widgetViewModel as RatingBarClass).getRatingBarWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as RatingBarClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as RatingBarClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeRotatedBox) {
    /// Rotated Box
    if (isChildData) {
      return (widgetModel.widgetViewModel as RotatedBoxClass).getRotatedBoxWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as RotatedBoxClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as RotatedBoxClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as RotatedBoxClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeConstrainedBox) {
    /// Constrained Box
    if (isChildData) {
      return (widgetModel.widgetViewModel as ConstrainedBoxClass).getConstrainedBoxWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ConstrainedBoxClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ConstrainedBoxClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as ConstrainedBoxClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeClipRRect) {
    /// ClipRRect
    if (isChildData) {
      return (widgetModel.widgetViewModel as ClipRRectClass).getClipRRectWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as ClipRRectClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as ClipRRectClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as ClipRRectClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeOpacity) {
    /// OpacityClass
    if (isChildData) {
      return (widgetModel.widgetViewModel as OpacityClass).getOpacityWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as OpacityClass).getCodeAsString(isChild, widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as OpacityClass).toJson();
    } else if (isEndCodeAsString) {
      return (widgetModel.widgetViewModel as OpacityClass).getEndCodeAsString(isChild!, widgetModel);
    }
  } else if (widgetModel.widgetSubType == WidgetTypeYoutubePlayer) {
    /// Youtube Player
    if (isChildData) {
      return (widgetModel.widgetViewModel as YoutubePlayerClass).getYoutubePlayerWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as YoutubePlayerClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as YoutubePlayerClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeCreditCardView) {
    /// CreditCardView
    if (isChildData) {
      return (widgetModel.widgetViewModel as CreditCardViewClass).getCreditCardViewClassWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as CreditCardViewClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as CreditCardViewClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeLottieAnimation) {
    /// LottieAnimation
    if (isChildData) {
      return (widgetModel.widgetViewModel as LottieAnimationClass).getLottieAnimationWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as LottieAnimationClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as LottieAnimationClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeSwitch) {
    /// Switch
    if (isChildData) {
      return (widgetModel.widgetViewModel as SwitchClass).getSwitchWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as SwitchClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as SwitchClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeOTPTextField) {
    /// OTP TextField
    if (isChildData) {
      return (widgetModel.widgetViewModel as OTPTextFieldClass).getOTPTextFieldWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as OTPTextFieldClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as OTPTextFieldClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeLinearProgressIndicator) {
    /// TextField View
    if (isChildData) {
      return (widgetModel.widgetViewModel as LinearProgressIndicatorClass).getLinearProgressIndicatorWidget(widgetModel);
    } else if (isCodeAsString) {
      return (widgetModel.widgetViewModel as LinearProgressIndicatorClass).getCodeAsString(widgetModel);
    } else if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as LinearProgressIndicatorClass).toJson();
    }
  } else if (widgetModel.widgetSubType == WidgetTypeRootView) {
    /// Scaffold View
    if (isPropertyJsonData) {
      return (widgetModel.widgetViewModel as RootViewClass).toJson();
    }
  } else {
    printLogData("WidgetsClassData Not Found");
  }
}

/// Get all Import lib
getHeaderClassFiles(ScreenJsonData childData) {
  if (childData.subType == WidgetTypeYoutubePlayer) {
    return childData.youtubePlayerClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeAudioPlayer) {
    return childData.audioPlayerClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeVideoPlayer) {
    return childData.videoPlayerClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeRatingBar) {
    return childData.ratingBarClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeCreditCardView) {
    return childData.creditCardViewClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeLottieAnimation) {
    return childData.lottieAnimationClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypePageView) {
    return childData.pageViewClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeOTPTextField) {
    return childData.otpTextFieldClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeBottomNavigationBar) {
    return childData.bottomNavigationBarClass!.getHeaderClassFiles();
  } else if (childData.subType == WidgetTypeLeftDrawer) {
    return childData.leftDrawerClass!.getHeaderClassFiles();
  }
}

/// Get all pubspec lib name
getYamlLib(ScreenJsonData childData) {
  if (childData.subType == WidgetTypeYoutubePlayer) {
    return childData.youtubePlayerClass!.getYamlLib();
  } else if (childData.subType == WidgetTypeAudioPlayer) {
    return childData.audioPlayerClass!.getYamlLib();
  } else if (childData.subType == WidgetTypeVideoPlayer) {
    return childData.videoPlayerClass!.getYamlLib();
  } else if (childData.subType == WidgetTypeRatingBar) {
    return childData.ratingBarClass!.getYamlLib();
  } else if (childData.subType == WidgetTypeLottieAnimation) {
    return childData.lottieAnimationClass!.getYamlLib();
  } else if (childData.subType == WidgetTypePageView) {
    return childData.pageViewClass!.getYamlLib();
  } else if (childData.subType == WidgetTypeOTPTextField) {
    return childData.otpTextFieldClass!.getYamlLib();
  }
}

/// Return json to real class data
getWidgetJsonData(ScreenJsonData childData) {
  if (childData.subType == WidgetTypeText) {
    return childData.textClass;
  } else if (childData.subType == WidgetTypeColumn) {
    return childData.column;
  } else if (childData.subType == WidgetTypeContainer) {
    return childData.container;
  } else if (childData.subType == WidgetTypeCalender) {
    return childData.calenderClass;
  } else if (childData.subType == WidgetTypeCard) {
    return childData.cardClass;
  } else if (childData.subType == WidgetTypeCheckBox) {
    return childData.checkboxClass;
  } else if (childData.subType == WidgetTypeCheckboxListTile) {
    return childData.checkboxListTileClass;
  } else if (childData.subType == WidgetTypeCircleImage) {
    return childData.circleImageClass;
  } else if (childData.subType == WidgetTypeDivider) {
    return childData.dividerClass;
  } else if (childData.subType == WidgetTypeDropDown) {
    return childData.dropDownClass;
  } else if (childData.subType == WidgetTypeGrid) {
    return childData.gridViewClass;
  } else if (childData.subType == WidgetTypeIconButton) {
    return childData.iconButtonClass;
  } else if (childData.subType == WidgetIconType) {
    return childData.iconClass;
  } else if (childData.subType == WidgetTypeImage) {
    return childData.imageClass;
  } else if (childData.subType == WidgetTypeList) {
    return childData.listViewClass;
  } else if (childData.subType == WidgetTypeRadio) {
    return childData.radioButtonClass;
  } else if (childData.subType == WidgetTypeRow) {
    return childData.rowClass;
  } else if (childData.subType == WidgetTypeSizedBox) {
    return childData.sizedBoxClass;
  } else if (childData.subType == WidgetTypeSwitchListTile) {
    return childData.switchListTileClass;
  } else if (childData.subType == WidgetTypeTextButton) {
    return childData.textButtonClass;
  } else if (childData.subType == WidgetTypeTextField) {
    return childData.textFieldClass;
  } else if (childData.subType == WidgetTypeDropDown) {
    return childData.dropDownClass;
  } else if (childData.subType == WidgetTypeAppBar) {
    return childData.appBarClass;
  } else if (childData.subType == WidgetTypeLeftDrawer) {
    return childData.leftDrawerClass;
  } else if (childData.subType == WidgetTypeBottomNavigationBar) {
    return childData.bottomNavigationBarClass;
  } else if (childData.subType == WidgetTypeStack) {
    return childData.stackClass;
  } else if (childData.subType == WidgetTypeListTile) {
    return childData.listTileClass;
  } else if (childData.subType == WidgetTypeWebView) {
    return childData.webViewClass;
  } else if (childData.subType == WidgetTypeChipView) {
    return childData.chipViewClass;
  } else if (childData.subType == WidgetTypeGoogleMap) {
    return childData.googleMapClass;
  } else if (childData.subType == WidgetTypeSlider) {
    return childData.sliderClass;
  } else if (childData.subType == WidgetTypeRatingBar) {
    return childData.ratingBarClass;
  } else if (childData.subType == WidgetTypeRotatedBox) {
    return childData.rotatedBoxClass;
  } else if (childData.subType == WidgetTypeConstrainedBox) {
    return childData.constrainedBoxClass;
  } else if (childData.subType == WidgetTypeClipRRect) {
    return childData.clipRRectClass;
  } else if (childData.subType == WidgetTypeOpacity) {
    return childData.opacityClass;
  } else if (childData.subType == WidgetTypeImageIcon) {
    return childData.imageIconClass;
  } else if (childData.subType == WidgetTypeYoutubePlayer) {
    return childData.youtubePlayerClass;
  } else if (childData.subType == WidgetTypeAudioPlayer) {
    return childData.audioPlayerClass;
  } else if (childData.subType == WidgetTypeVideoPlayer) {
    return childData.videoPlayerClass;
  } else if (childData.subType == WidgetTypePageView) {
    return childData.pageViewClass;
  } else if (childData.subType == WidgetTypeTab) {
    return childData.tabClass;
  } else if (childData.subType == WidgetTypeTabView) {
    return childData.tabViewClass;
  } else if (childData.subType == WidgetTypeTabBar) {
    return childData.tabBarClass;
  } else if (childData.subType == WidgetTypeTabBarView) {
    return childData.tabBarViewClass;
  } else if (childData.subType == WidgetTypeLottieAnimation) {
    return childData.lottieAnimationClass;
  } else if (childData.subType == WidgetTypeCreditCardView) {
    return childData.creditCardViewClass;
  } else if (childData.subType == WidgetTypeSwitch) {
    return childData.switchClass;
  } else if (childData.subType == WidgetTypeOTPTextField) {
    return childData.otpTextFieldClass;
  } else if (childData.subType == WidgetTypeLinearProgressIndicator) {
    return childData.linearProgressIndicatorClass;
  } else {
    return null;
  }
}

String getWidgetTitle(String? subType) {
  if (subType == WidgetTypeRootView) {
    return language!.titleScaffold;
  } else if (subType == WidgetTypeText) {
    return language!.titleText;
  } else if (subType == WidgetTypeColumn) {
    return language!.titleColumn;
  } else if (subType == WidgetTypeContainer) {
    return language!.titleContainer;
  } else if (subType == WidgetTypeAppBar) {
    return language!.titleAppBar;
  } else if (subType == WidgetTypeLeftDrawer) {
    return language!.titleLeftDrawer;
  } else if (subType == WidgetTypeCalender) {
    return language!.titleCalender;
  } else if (subType == WidgetTypeCard) {
    return language!.titleCard;
  } else if (subType == WidgetTypeCheckBox) {
    return language!.titleCheckBox;
  } else if (subType == WidgetTypeCheckboxListTile) {
    return language!.titleCheckboxListTile;
  } else if (subType == WidgetTypeCircleImage) {
    return language!.titleCircleImage;
  } else if (subType == WidgetTypeDivider) {
    return language!.titleDivider;
  } else if (subType == WidgetTypeDropDown) {
    return language!.titleDropDown;
  } else if (subType == WidgetTypeGrid) {
    return language!.titleGridView;
  } else if (subType == WidgetTypeIconButton) {
    return language!.titleIconButton;
  } else if (subType == WidgetIconType) {
    return language!.titleIcon;
  } else if (subType == WidgetTypeImage) {
    return language!.titleImage;
  } else if (subType == WidgetTypeList) {
    return language!.titleListView;
  } else if (subType == WidgetTypeRadio) {
    return language!.titleRadioButton;
  } else if (subType == WidgetTypeRow) {
    return language!.titleRow;
  } else if (subType == WidgetTypeSizedBox) {
    return language!.titleSizedBox;
  } else if (subType == WidgetTypeSwitchListTile) {
    return language!.titleSwitchListTile;
  } else if (subType == WidgetTypeTextButton) {
    return language!.titleTextButton;
  } else if (subType == WidgetTypeTextField) {
    return language!.titleTextField;
  } else if (subType == WidgetTypeWebView) {
    return language!.titleWebView;
  } else if (subType == WidgetTypeAudioPlayer) {
    return language!.titleAudioPlayer;
  } else if (subType == WidgetTypeVideoPlayer) {
    return language!.titleVideoPlayer;
  } else if (subType == WidgetTypeListTile) {
    return language!.titleListTile;
  } else if (subType == WidgetTypeStack) {
    return language!.titleStack;
  } else if (subType == WidgetTypeChipView) {
    return language!.titleChip;
  } else if (subType == WidgetTypeGoogleMap) {
    return language!.titleGoogleMap;
  } else if (subType == WidgetTypeYoutubePlayer) {
    return language!.titleYoutubePlayer;
  } else if (subType == WidgetTypeSlider) {
    return language!.titleSlider;
  } else if (subType == WidgetTypeRatingBar) {
    return language!.titleRatingBar;
  } else if (subType == WidgetTypeRotatedBox) {
    return language!.titleRotatedBox;
  } else if (subType == WidgetTypeConstrainedBox) {
    return language!.titleConstrainedBox;
  } else if (subType == WidgetTypeClipRRect) {
    return language!.titleClipRRect;
  } else if (subType == WidgetTypeOpacity) {
    return language!.titleOpacity;
  } else if (subType == WidgetTypeImageIcon) {
    return language!.titleImageIcon;
  } else if (subType == WidgetTypeTabView) {
    return language!.titleTabView;
  } else if (subType == WidgetTypePageView) {
    return language!.titlePageView;
  } else if (subType == WidgetTypeLottieAnimation) {
    return language!.titleLottieAnimation;
  } else if (subType == WidgetTypeCreditCardView) {
    return language!.titleCreditCardView;
  } else if (subType == WidgetTypeBottomNavigationBar) {
    return language!.titleBottomNavigationBar;
  } else if (subType == WidgetTypeSwitch) {
    return language!.titleSwitch;
  } else if (subType == WidgetTypeOTPTextField) {
    return language!.titleOTPTextField;
  } else if (subType == WidgetTypeLinearProgressIndicator) {
    return language!.titleLinearProgressIndicator;
  }
  return "";
}

/// Display View on left side
Widget getDisplayWidget(String imgPath, String? title, {bool isDragging = false}) {
  double size;
  int fSize;
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth >= 88) {
        size = appStore.isDarkMode ? 36 : 40;
        fSize = 12;
      } else if (constraints.maxWidth >= 82) {
        size = 35;
        fSize = 11;
      } else if (constraints.maxWidth >= 72) {
        size = 25;
        fSize = 11;
      } else {
        size = 13;
        fSize = 10;
      }
      return HoverWidget(
        builder: (context, isHovering) {
          return AnimatedContainer(
            duration: commonAnimationDuration,
            child: Card(
              color: (isDragging || isHovering)
                  ? appStore.isDarkMode
                      ? darkModeSecondaryBackgroundDark
                      : menuMouseHoverColor
                  : appStore.isDarkMode
                      ? Colors.transparent
                      : Colors.white,
              shape: appStore.isDarkMode
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: isDragging || isHovering ? Colors.transparent : darkModeSecondaryBackgroundDark, width: 1.0),
                      borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                    )
                  : RoundedRectangleBorder(
                      side: BorderSide(color: COMMON_BORDER_COLOR),
                      borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                    ),
              margin: EdgeInsets.all(0),
              elevation: 0,
              shadowColor: isHovering ? Colors.grey : Colors.grey.withValues(alpha: 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "$imgPath",
                    height: size,
                    width: size,
                    color: (isHovering)
                        ? appStore.isDarkMode
                            ? context.iconColor
                            : btnBackgroundColor
                        : appStore.isDarkMode
                            ? context.iconColor
                            : menuIconColor,
                  ),
                  8.height,
                  Text(
                    title!,
                    style: primaryTextStyle(size: fSize),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ).paddingAll(4),
            ),
          );
        },
      );
    },
  );
}

Future<String> loadFileContent(String fileName) async {
  return await rootBundle.loadString('images/files/$fileName');
}

bool isContainsExtraFiles(String value) {
  if (value.contains("smooth_page_indicator") || value.contains("flutter_rating_bar") || value.contains("lottie") || value.contains("flutter_otp_text_field")) {
    return true;
  }
  return false;
}

/// View source code
viewSourceCode(BuildContext context) async {
  trackUserEvent(VIEW_CODE);
  appStore.codeViewData.clear();
  appStore.headerImport.clear();
  appStore.yamlImportLib.clear();
  List<String> finalSourceData = await viewFinalSourceData(appStore.selectedWidgetList);
  appStore.setCodeViewData(finalSourceData);
  CodeViewScreen().launch(context);
}
