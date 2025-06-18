import 'package:flutter_viz/utils/AppConstant.dart';
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
import 'package:flutter_viz/widgetsClass/Icon_class.dart';
import 'package:flutter_viz/widgetsClass/Image_class.dart';
import 'package:flutter_viz/widgetsClass/image_icon_class.dart';
import 'package:flutter_viz/widgetsClass/left_drawer_class.dart';
import 'package:flutter_viz/widgetsClass/linear_progress_indicator_class.dart';
import 'package:flutter_viz/widgetsClass/list_tile_class.dart';
import 'package:flutter_viz/widgetsClass/list_view_class.dart';
import 'package:flutter_viz/widgetsClass/lottie_animation_class.dart';
import 'package:flutter_viz/widgetsClass/otp_text_field_class.dart';
import 'package:flutter_viz/widgetsClass/opacity_class.dart';
import 'package:flutter_viz/widgetsClass/page_view_class.dart';
import 'package:flutter_viz/widgetsClass/radio_button_class.dart';
import 'package:flutter_viz/widgetsClass/rating_bar_class.dart';
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

class ScreenJsonData {
  String? type;
  String? subType;
  String? id;
  AppBarClass? appBarClass;
  BottomNavigationBarClass? bottomNavigationBarClass;
  LeftDrawerClass? leftDrawerClass;
  ContainerClass? container;
  ColumnClass? column;
  RowClass? rowClass;
  CardClass? cardClass;
  ListViewClass? listViewClass;
  GridViewClass? gridViewClass;
  TextClass? textClass;
  TextFieldClass? textFieldClass;
  StackClass? stackClass;
  ListTileClass? listTileClass;
  TextButtonClass? textButtonClass;
  ImageClass? imageClass;
  CheckboxClass? checkboxClass;
  RadioButtonClass? radioButtonClass;
  IconClass? iconClass;
  IconButtonClass? iconButtonClass;
  SwitchListTileClass? switchListTileClass;
  CheckboxListTileClass? checkboxListTileClass;
  SizedBoxClass? sizedBoxClass;
  DividerClass? dividerClass;
  CalenderClass? calenderClass;
  DropDownClass? dropDownClass;
  CircleImageClass? circleImageClass;
  ChipViewClass? chipViewClass;
  WebViewClass? webViewClass;
  GoogleMapClass? googleMapClass;
  SliderClass? sliderClass;
  RatingBarClass? ratingBarClass;
  RotatedBoxClass? rotatedBoxClass;
  ConstrainedBoxClass? constrainedBoxClass;
  ClipRRectClass? clipRRectClass;
  OpacityClass? opacityClass;
  ImageIconClass? imageIconClass;
  AudioPlayerClass? audioPlayerClass;
  VideoPlayerClass? videoPlayerClass;
  YoutubePlayerClass? youtubePlayerClass;
  PageViewClass? pageViewClass;
  TabBarClass? tabBarClass;
  TabBarViewClass? tabBarViewClass;
  TabClass? tabClass;
  TabViewClass? tabViewClass;
  CreditCardViewClass? creditCardViewClass;
  LottieAnimationClass? lottieAnimationClass;
  SwitchClass? switchClass;
  OTPTextFieldClass? otpTextFieldClass;
  LinearProgressIndicatorClass? linearProgressIndicatorClass;

  List<ScreenJsonData>? childData = [];

  ScreenJsonData({this.type, this.subType, this.column, this.childData});

  ScreenJsonData.fromJson(Map<String, dynamic> json) {
    type = json[JSON_TYPE] ?? "";
    subType = json[JSON_SUB_TYPE] ?? "";
    id = json[JSON_WIDGET_ID] != null ? json[JSON_WIDGET_ID] : "";
    appBarClass = json[WidgetTypeAppBar] != null ? new AppBarClass.fromJson(json[WidgetTypeAppBar]) : null;
    bottomNavigationBarClass = json[WidgetTypeBottomNavigationBar] != null ? new BottomNavigationBarClass.fromJson(json[WidgetTypeBottomNavigationBar]) : null;
    leftDrawerClass = json[WidgetTypeLeftDrawer] != null ? new LeftDrawerClass.fromJson(json[WidgetTypeLeftDrawer]) : null;
    container = json[WidgetTypeContainer] != null ? new ContainerClass.fromJson(json[WidgetTypeContainer]) : null;
    tabBarClass = json[WidgetTypeTabBar] != null ? new TabBarClass.fromJson(json[WidgetTypeTabBar]) : null;
    tabBarViewClass = json[WidgetTypeTabBarView] != null ? new TabBarViewClass.fromJson(json[WidgetTypeTabBarView]) : null;
    tabClass = json[WidgetTypeTab] != null ? new TabClass.fromJson(json[WidgetTypeTab]) : null;
    tabViewClass = json[WidgetTypeTabView] != null ? new TabViewClass.fromJson(json[WidgetTypeTabView]) : null;
    pageViewClass = json[WidgetTypePageView] != null ? new PageViewClass.fromJson(json[WidgetTypePageView]) : null;
    stackClass = json[WidgetTypeStack] != null ? new StackClass.fromJson(json[WidgetTypeStack]) : null;
    listTileClass = json[WidgetTypeListTile] != null ? new ListTileClass.fromJson(json[WidgetTypeListTile]) : null;
    column = json[WidgetTypeColumn] != null ? new ColumnClass.fromJson(json[WidgetTypeColumn]) : null;
    rowClass = json[WidgetTypeRow] != null ? new RowClass.fromJson(json[WidgetTypeRow]) : null;
    cardClass = json[WidgetTypeCard] != null ? new CardClass.fromJson(json[WidgetTypeCard]) : null;
    listViewClass = json[WidgetTypeList] != null ? new ListViewClass.fromJson(json[WidgetTypeList]) : null;
    gridViewClass = json[WidgetTypeGrid] != null ? new GridViewClass.fromJson(json[WidgetTypeGrid]) : null;
    audioPlayerClass = json[WidgetTypeAudioPlayer] != null ? new AudioPlayerClass.fromJson(json[WidgetTypeAudioPlayer]) : null;
    videoPlayerClass = json[WidgetTypeVideoPlayer] != null ? new VideoPlayerClass.fromJson(json[WidgetTypeVideoPlayer]) : null;
    youtubePlayerClass = json[WidgetTypeYoutubePlayer] != null ? new YoutubePlayerClass.fromJson(json[WidgetTypeYoutubePlayer]) : null;
    textClass = json[WidgetTypeText] != null ? new TextClass.fromJson(json[WidgetTypeText]) : null;
    textFieldClass = json[WidgetTypeTextField] != null ? new TextFieldClass.fromJson(json[WidgetTypeTextField]) : null;
    textButtonClass = json[WidgetTypeTextButton] != null ? new TextButtonClass.fromJson(json[WidgetTypeTextButton]) : null;
    imageClass = json[WidgetTypeImage] != null ? new ImageClass.fromJson(json[WidgetTypeImage]) : null;
    checkboxClass = json[WidgetTypeCheckBox] != null ? new CheckboxClass.fromJson(json[WidgetTypeCheckBox]) : null;
    radioButtonClass = json[WidgetTypeRadio] != null ? new RadioButtonClass.fromJson(json[WidgetTypeRadio]) : null;
    iconClass = json[WidgetIconType] != null ? new IconClass.fromJson(json[WidgetIconType]) : null;
    iconButtonClass = json[WidgetTypeIconButton] != null ? new IconButtonClass.fromJson(json[WidgetTypeIconButton]) : null;
    switchListTileClass = json[WidgetTypeSwitchListTile] != null ? new SwitchListTileClass.fromJson(json[WidgetTypeSwitchListTile]) : null;
    checkboxListTileClass = json[WidgetTypeCheckboxListTile] != null ? new CheckboxListTileClass.fromJson(json[WidgetTypeCheckboxListTile]) : null;
    sizedBoxClass = json[WidgetTypeSizedBox] != null ? new SizedBoxClass.fromJson(json[WidgetTypeSizedBox]) : null;
    dividerClass = json[WidgetTypeDivider] != null ? new DividerClass.fromJson(json[WidgetTypeDivider]) : null;
    calenderClass = json[WidgetTypeCalender] != null ? new CalenderClass.fromJson(json[WidgetTypeCalender]) : null;
    dropDownClass = json[WidgetTypeDropDown] != null ? new DropDownClass.fromJson(json[WidgetTypeDropDown]) : null;
    circleImageClass = json[WidgetTypeCircleImage] != null ? new CircleImageClass.fromJson(json[WidgetTypeCircleImage]) : null;
    chipViewClass = json[WidgetTypeChipView] != null ? new ChipViewClass.fromJson(json[WidgetTypeChipView]) : null;
    webViewClass = json[WidgetTypeWebView] != null ? new WebViewClass.fromJson(json[WidgetTypeWebView]) : null;
    googleMapClass = json[WidgetTypeGoogleMap] != null ? new GoogleMapClass.fromJson(json[WidgetTypeGoogleMap]) : null;
    sliderClass = json[WidgetTypeSlider] != null ? new SliderClass.fromJson(json[WidgetTypeSlider]) : null;
    ratingBarClass = json[WidgetTypeRatingBar] != null ? new RatingBarClass.fromJson(json[WidgetTypeRatingBar]) : null;
    rotatedBoxClass = json[WidgetTypeRotatedBox] != null ? new RotatedBoxClass.fromJson(json[WidgetTypeRotatedBox]) : null;
    constrainedBoxClass = json[WidgetTypeConstrainedBox] != null ? new ConstrainedBoxClass.fromJson(json[WidgetTypeConstrainedBox]) : null;
    clipRRectClass = json[WidgetTypeClipRRect] != null ? new ClipRRectClass.fromJson(json[WidgetTypeClipRRect]) : null;
    opacityClass = json[WidgetTypeOpacity] != null ? new OpacityClass.fromJson(json[WidgetTypeOpacity]) : null;
    imageIconClass = json[WidgetTypeImageIcon] != null ? new ImageIconClass.fromJson(json[WidgetTypeImageIcon]) : null;
    creditCardViewClass = json[WidgetTypeCreditCardView] != null ? new CreditCardViewClass.fromJson(json[WidgetTypeCreditCardView]) : null;
    lottieAnimationClass = json[WidgetTypeLottieAnimation] != null ? new LottieAnimationClass.fromJson(json[WidgetTypeLottieAnimation]) : null;
    switchClass = json[WidgetTypeSwitch] != null ? new SwitchClass.fromJson(json[WidgetTypeSwitch]) : null;
    otpTextFieldClass = json[WidgetTypeOTPTextField] != null ? new OTPTextFieldClass.fromJson(json[WidgetTypeOTPTextField]) : null;
    linearProgressIndicatorClass = json[WidgetTypeLinearProgressIndicator] != null ? new LinearProgressIndicatorClass.fromJson(json[WidgetTypeLinearProgressIndicator]) : null;

    if (json[JSON_CHILD_DATA] != null) {
      json[JSON_CHILD_DATA].forEach((v) {
        childData!.add(new ScreenJsonData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[JSON_TYPE] = this.type;
    data[JSON_SUB_TYPE] = this.subType;
    data[JSON_WIDGET_ID] = this.id;
    if (this.appBarClass != null) {
      data[WidgetTypeAppBar] = this.appBarClass!.toJson();
    }
    if (this.bottomNavigationBarClass != null) {
      data[WidgetTypeBottomNavigationBar] = this.bottomNavigationBarClass!.toJson();
    }
    if (this.leftDrawerClass != null) {
      data[WidgetTypeLeftDrawer] = this.leftDrawerClass!.toJson();
    }
    if (this.container != null) {
      data[WidgetTypeContainer] = this.container!.toJson();
    }
    if (this.column != null) {
      data[WidgetTypeColumn] = this.column!.toJson();
    }
    if (this.pageViewClass != null) {
      data[WidgetTypePageView] = this.pageViewClass!.toJson();
    }
    if (this.stackClass != null) {
      data[WidgetTypeStack] = this.stackClass!.toJson();
    }
    if (this.listTileClass != null) {
      data[WidgetTypeListTile] = this.listTileClass!.toJson();
    }
    if (this.rowClass != null) {
      data[WidgetTypeRow] = this.rowClass!.toJson();
    }
    if (this.cardClass != null) {
      data[WidgetTypeCard] = this.cardClass!.toJson();
    }
    if (this.listViewClass != null) {
      data[WidgetTypeList] = this.listViewClass!.toJson();
    }
    if (this.gridViewClass != null) {
      data[WidgetTypeGrid] = this.gridViewClass!.toJson();
    }
    if (this.textClass != null) {
      data[WidgetTypeText] = this.textClass!.toJson();
    }
    if (this.textFieldClass != null) {
      data[WidgetTypeTextField] = this.textFieldClass!.toJson();
    }
    if (this.textButtonClass != null) {
      data[WidgetTypeTextButton] = this.textButtonClass!.toJson();
    }
    if (this.imageClass != null) {
      data[WidgetTypeImage] = this.imageClass!.toJson();
    }
    if (this.checkboxClass != null) {
      data[WidgetTypeCheckBox] = this.checkboxClass!.toJson();
    }
    if (this.radioButtonClass != null) {
      data[WidgetTypeRadio] = this.radioButtonClass!.toJson();
    }
    if (this.iconClass != null) {
      data[WidgetIconType] = this.iconClass!.toJson();
    }
    if (this.iconButtonClass != null) {
      data[WidgetTypeIconButton] = this.iconButtonClass!.toJson();
    }
    if (this.switchListTileClass != null) {
      data[WidgetTypeSwitchListTile] = this.switchListTileClass!.toJson();
    }
    if (this.checkboxListTileClass != null) {
      data[WidgetTypeCheckboxListTile] = this.checkboxListTileClass!.toJson();
    }
    if (this.sizedBoxClass != null) {
      data[WidgetTypeSizedBox] = this.sizedBoxClass!.toJson();
    }
    if (this.dividerClass != null) {
      data[WidgetTypeDivider] = this.dividerClass!.toJson();
    }
    if (this.calenderClass != null) {
      data[WidgetTypeCalender] = this.calenderClass!.toJson();
    }
    if (this.dropDownClass != null) {
      data[WidgetTypeDropDown] = this.dropDownClass!.toJson();
    }
    if (this.circleImageClass != null) {
      data[WidgetTypeCircleImage] = this.circleImageClass!.toJson();
    }
    if (this.webViewClass != null) {
      data[WidgetTypeWebView] = this.webViewClass!.toJson();
    }
    if (this.chipViewClass != null) {
      data[WidgetTypeChipView] = this.chipViewClass!.toJson();
    }
    if (this.googleMapClass != null) {
      data[WidgetTypeGoogleMap] = this.googleMapClass!.toJson();
    }
    if (this.sliderClass != null) {
      data[WidgetTypeSlider] = this.sliderClass!.toJson();
    }
    if (this.ratingBarClass != null) {
      data[WidgetTypeRatingBar] = this.ratingBarClass!.toJson();
    }
    if (this.rotatedBoxClass != null) {
      data[WidgetTypeRotatedBox] = this.rotatedBoxClass!.toJson();
    }
    if (this.constrainedBoxClass != null) {
      data[WidgetTypeConstrainedBox] = this.constrainedBoxClass!.toJson();
    }
    if (this.clipRRectClass != null) {
      data[WidgetTypeClipRRect] = this.clipRRectClass!.toJson();
    }
    if (this.opacityClass != null) {
      data[WidgetTypeOpacity] = this.opacityClass!.toJson();
    }
    if (this.imageIconClass != null) {
      data[WidgetTypeImageIcon] = this.imageIconClass!.toJson();
    }
    if (this.youtubePlayerClass != null) {
      data[WidgetTypeYoutubePlayer] = this.youtubePlayerClass!.toJson();
    }
    if (this.audioPlayerClass != null) {
      data[WidgetTypeAudioPlayer] = this.audioPlayerClass!.toJson();
    }
    if (this.videoPlayerClass != null) {
      data[WidgetTypeVideoPlayer] = this.youtubePlayerClass!.toJson();
    }
    if (this.tabBarClass != null) {
      data[WidgetTypeTabBar] = this.tabBarClass!.toJson();
    }
    if (this.tabBarViewClass != null) {
      data[WidgetTypeTabBarView] = this.tabBarViewClass!.toJson();
    }
    if (this.tabClass != null) {
      data[WidgetTypeTab] = this.tabClass!.toJson();
    }
    if (this.tabViewClass != null) {
      data[WidgetTypeTabView] = this.tabViewClass!.toJson();
    }
    if (this.creditCardViewClass != null) {
      data[WidgetTypeCreditCardView] = this.creditCardViewClass!.toJson();
    }
    if (this.lottieAnimationClass != null) {
      data[WidgetTypeLottieAnimation] = this.lottieAnimationClass!.toJson();
    }
    if (this.switchClass != null) {
      data[WidgetTypeSwitch] = this.switchClass!.toJson();
    }
    if (this.otpTextFieldClass != null) {
      data[WidgetTypeOTPTextField] = this.otpTextFieldClass!.toJson();
    }
    if (this.linearProgressIndicatorClass != null) {
      data[WidgetTypeLinearProgressIndicator] = this.linearProgressIndicatorClass!.toJson();
    }

    if (this.childData != null) {
      data[JSON_CHILD_DATA] = this.childData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
