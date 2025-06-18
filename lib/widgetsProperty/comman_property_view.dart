import 'package:flutter_viz/externalClasses/colorPicker/colorpicker.dart';
import 'package:flutter_viz/externalClasses/icon_picker.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppCommonApiCall.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/utils/CustomExpansion.dart' as custom;
import 'package:flutter_viz/utils/MaterialIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

const DUMMY_WIDGET_ID = 'DUMMY_CHILD';
const IS_TESTING_MODE = false;
const DUMMY_USER_ID = '55';
const double DEFAULT_FONT_SIZE = 14.0;
const int commonMaxLength = 6;

///Common Text Size
const commonTextSize = 16.0;
const commonSubTextSize = 14.0;

///Common Button Text Size
const btnTextSize = 14.0;

/// Common Button Icon Size
const btnIconSize = 22.0;

const widthPropertySize = 120.0;

/// Default background Color
const COMMON_BG_COLOR = Color(0xFF3a57e8);

///margin animation
const COMMON_CONTAINER_ANIMATION_MARGIN = 4.0;

///Common Border Radius
const COMMON_BUTTON_BORDER_RADIUS = 4.0;
const COMMON_CARD_BORDER_RADIUS = 8.0;
const COMMON_LEFT_WIDGET_RADIUS = 12.0;

const COMMON_BORDER_RADIUS = 4.0;
const COMMON_BORDER_COLOR = Color(0xFFE0E0E0);
const COMMON_ELEVATION = 8.0;

///Common Elevation
const COMMON_BUTTON_ELEVATION = 2.0;

/// Common  Padding
const COMMON_VERTICAL_PADDING = 14.0;
const COMMON_HORIZONTAL_PADDING = 18.0;

/// Bottom Navigation Bar
const UNSELECTED_ITEM_COLOR = Color(0xFF9E9E9E);
const BOTTOM_NAVIGATION_BG_COLOR = Color(0xFFFFFFFF);
const BOTTOM_NAVIGATION_ELEVATION = 8.0;

/// Transparent Color
const TRANSPARENT_COLOR = Color(0x00000000);

/// Default Width and height of container
const double DEFAULT_CONTAINER_WIDTH = 200;
const double DEFAULT_CONTAINER_HEIGHT = 100;
const double DEFAULT_CONTAINER_PER = 100;

/// Default Text Color
const DEFAULT_TEXT_COLOR = Color(0xFF000000);

/// Default Text Color
const DEFAULT_ICON_COLOR = Color(0xFF212435);

/// Default Card Color
const DEFAULT_CARD_COLOR = Color(0xFFE0E0E0);

/// Divider Default Color
const DEFAULT_DIVIDER_COLOR = Color(0xFF808080);

///  Chip Default Color
const DEFAULT_CHIP_SHADOW_COLOR = Color(0xFF808080);
const DEFAULT_CHIP_TEXT_COLOR = Color(0xFFFFFFFF);

///Default audioPlayer  Color
const DEFAULT_AUDIO_PLAYER_INACTIVE_TRACKER_COLOR = Color(0xFFE0E0E0);

///GOOGLE MAP
const DEFAULT_LATITUDE = 12.120000;
const DEFAULT_LONGITUDE = 76.680000;
const DEFAULT_ZOOM = 10;

///Default Stack Height and Width
const dynamic DEFAULT_STACK_HEIGHT = null;
const dynamic DEFAULT_STACK_WIDTH = null;

///Horizontal && Vertical Alignment Default Value
const DEFAULT_HORIZONTAL_ALIGNMENT = 0.0;
const DEFAULT_VERTICAL_ALIGNMENT = 0.0;

///GridView
const DEFAULT_CHILD_ASPECT_RATIO = 1.2;
const DEFAULT_CROSS_AXIS_COUNT = 2;
const DEFAULT_MAIN_AXIS_SPACING = 8.0;
const DEFAULT_CROSS_AXIS_SPACING = 8.0;

///Divider
const DEFAULT_DIVIDER_HEIGHT = 16;
const DEFAULT_DIVIDER_THICKNESS = 0.0;
const DEFAULT_DIVIDER_INDENT = 0.0;
const DEFAULT_DIVIDER_END_INDENT = 0.0;

///Checkbox
const DEFAULT_SPREAD_RADIUS = 20.0;

/// Icon
const DEFAULT_ICON_SIZE = 24.0;
const DEFAULT_DISABLE_ICON_COLOR = Color(0xff9e9e9e);

/// Image
const DEFAULT_IMAGE_WIDTH = 140;
const DEFAULT_IMAGE_HEIGHT = 100;
const DEFAULT_ASSET_IMAGE = "images/placeIndex.png";
const DEFAULT_NETWORK_IMAGE = "https://picsum.photos/250?image=9";
const DEFAULT_ASSETS_IMAGE_PATH = 'assets/images';

/// ImageIcon
const DEFAULT_ASSET_IMAGE_ICON = "images/ic_launcher.png";
const DEFAULT_NETWORK_IMAGE_ICON = "https://image.flaticon.com/icons/png/512/281/281764.png";

///LottieAnimation
const DEFAULT_LOTTIE_ANIMATION_WIDTH = 150;
const DEFAULT_LOTTIE_ANIMATION_HEIGHT = 150;

///Appbar
const DEFAULT_APPBAR_ELEVATION = 4.0;

///CircleImage
const DEFAULT_CIRCLE_IMAGE_WIDTH = 120.0;

///Card
const DEFAULT_CARD_ELEVATION = 1.0;
const DEFAULT_CARD_RADIUS = 4.0;

///DropDown
const double DEFAULT_DROPDOWN_FONT_SIZE = 16.0;
const double DEFAULT_DROPDOWN_ICON_SIZE = 24.0;
const double DEFAULT_DROPDOWN_BORDER_RADIUS = 0;
const int DEFAULT_DROPDOWN_ELEVATION = 8;
const double DEFAULT_DROPDOWN_WIDTH = 130;
const double DEFAULT_DROPDOWN_HEIGHT = 50;
const DEFAULT_DROPDOWN_FILL_COLOR = Color(0xffffffff);
const DEFAULT_DROPDOWN_BORDER_COLOR = Color(0x00000000);

///Text Button
const double DEFAULT_TEXT_BUTTON_ELEVATION = 0;
const DEFAULT_TEXT_BUTTON_BORDER_COLOR = Color(0xFF808080);
const DEFAULT_TEXT_BUTTON_BG_COLOR = Color(0xFFFFFFFF);
const DEFAULT_TEXT_BUTTON_WIDTH = 140.0;
const DEFAULT_TEXT_BUTTON_HEIGHT = 40.0;

/// TextField
const DEFAULT_TEXT_FIELD_COLOR = Color(0xFFf2f2f3);
const DEFAULT_BORDER_COLOR = Color(0xFF000000);
const DEFAULT_BORDER_WIDTH = 1.0;

/// CheckBox and RadioButton
const DEFAULT_CHECK_COLOR = Color(0xffffffff);
const DEFAULT_HOVER_COLOR = Color(0x42000000);
const DEFAULT_FOCUS_COLOR = Color(0x1f000000);

/// CheckBoxListTile and SwitchListTile
const DEFAULT_LIST_TILE_COLOR = Color(0x1F000000);
const DEFAULT_ACTIVE_TRACK_COLOR = Color(0xff92c6ef);
const DEFAULT_INACTIVE_THUMB_COLOR = Color(0xff9e9e9e);
const DEFAULT_INACTIVE_TRACK_COLOR = Color(0xFFE0E0E0);
const DEFAULT_SELECTED_TILE_COLOR = Color(0x42000000);

///Container
const DEFAULT_CONTAINER_BG_COLOR = Color(0x1f000000);
const DEFAULT_CONTAINER_BORDER_COLOR = Color(0x4d9e9e9e);

///SizedBox
const DEFAULT_SIZED_BOX_WIDTH = 16;
const DEFAULT_SIZED_BOX_HEIGHT = 16;

///Default Page View
const DEFAULT_PAGE_VIEW_HEIGHT = 400;
const DEFAULT_PAGE_VIEW_WIDTH = 300;
const DEFAULT_PAGE_VIEW_IMAGE_HEIGHT = 300;
const DEFAULT_PAGE_VIEW_IMAGE_WIDTH = 200;
const DEFAULT_INDICATOR_HORIZONTAL_ALIGNMENT = 0.0;
const DEFAULT_INDICATOR_VERTICAL_ALIGNMENT = 1.0;
const DEFAULT_PAGE_VIEW_COUNT = 3;
const DEFAULT_PAGE_VIEW_ASSET_IMAGE = "images/placeIndex.png";
const DEFAULT_PAGE_VIEW_NETWORK_IMAGE = "https://picsum.photos/200/300";

/// Default DotIndicator
const DEFAULT_DOT_COLOR = Color(0xFF9E9E9E);
const DEFAULT_DOT_HEIGHT = 16.0;
const DEFAULT_DOT_WIDTH = 16.0;
const DEFAULT_DOT_RADIUS = 16.0;
const DEFAULT_DOT_SPACING = 8.0;
const DEFAULT_DOT_SCALE = 1.4;
const DEFAULT_DOT_EXPANSION_FACTOR = 3.0;

///chip
const double DEFAULT_CHIP_ELEVATION = 0;
const double DEFAULT_CHIP_LABEL_PADDING = 0;

/// Commom Slider
const DEFAULT_SLIDER_INACTIVE_COLOR = Color(0xFF9E9E9E);

///Common Rating Bar
const DEFAULT_RATING = 2.75;
const DEFAULT_RATING_ITEM_COUNT = 5;
const DEFAULT_RATING_ITEM_SIZE = 30;
const DEFAULT_RATED_COLOR = Color(0xFFFFC107);
const DEFAULT_UNRATED_COLOR = Color(0xFF9E9E9E);

///Common Constrained Box
const DEFAULT_CONSTRAINED_MAX_HEIGHT = 100;
const DEFAULT_CONSTRAINED_MAX_WIDTH = 100;

///Common Limited Box
const DEFAULT_LIMITED_BOX_HEIGHT = 120;
const DEFAULT_LIMITED_BOX_WIDTH = 120;

///Common Youtube
const dynamic DEFAULT_YOUTUBE_HEIGHT = null;
const dynamic DEFAULT_YOUTUBE_WIDTH = null;

/// Common Opacity
const DEFAULT_OPACITY = 0.5;

/// Common FLEX
const DEFAULT_FLEX = 1;

///Common Audio Player
const DEFAULT_AUDIO_PLAYER_ICON_SIZE = 42;
const DEFAULT_AUDIO_PLAYER_URL = 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3';

///Common Video Player
const DEFAULT_VIDEO_PLAYER_URL = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

///TabBar
const DEFAULT_TAB_BAR_LABEL_COLOR = Color(0xFFFFC107);
const DEFAULT_TAB_BAR_INDICATOR_COLOR = Color(0xFFFF5722);
const DEFAULT_TAB_NAME = 'Tab Name';

/// OTP TextField
const OTP_NUMBER_OF_FIELD = 4;
const OTP_FILL_COLOR = TRANSPARENT_COLOR;
const OTP_ENABLE_BORDER_COLOR = Color(0xFFD6D6D6);
const OTP_BORDER_WIDTH = 2.0;
const OTP_FIELD_WIDTH = 40.0;
const OTP_MARGIN = EdgeInsets.only(right: 8.0);
const OTP_BORDER_RADIUS = BorderRadius.all(Radius.circular(4.0));

///Linear Progress Indicator
const DEFAULT_PROGRESSBAR_BACKGROUND_COLOR = Color(0xFF808080);
const DEFAULT_PROGRESS_VALUE = 0.5;
const DEFAULT_PROGRESS_HEIGHT = 3;

/// Left Drawer
const DEFAULT_DRAWER_ELEVATION = 16.0;
const DEFAULT_DRAWER_FONT_COLOR = Color(0xFFFFFFFF);
const DEFAULT_DRAWER_ASSET_IMAGE = "images/flutterVizlogo.png";
const DEFAULT_DRAWER_NETWORK_IMAGE = "https://image.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg";

/// Common Image Type
List<String> imageType = [
  ImageTypeAsset,
  ImageTypeNetwork,
];

/// Common Box Fit
List<String> boxFit = [
  boxFitFill,
  boxFitContain,
  boxFitCover,
  boxFitWidth,
  boxFitHeight,
  boxFitNone,
  boxFitScaleDown,
];

/// Common font Weight
List<String> fontWeight = [
  FontWeightTypeThin,
  FontWeightTypeExtraLight,
  FontWeightTypeLight,
  FontWeightTypeNormal,
  FontWeightTypeMedium,
  FontWeightTypeSemiBold,
  FontWeightTypeBold,
  FontWeightTypeExtraBold,
  FontWeightTypeBlack,
];

/// Common Text Align
List<IconData> textAlign = [
  Icons.format_align_left,
  Icons.format_align_center,
  Icons.format_align_right,
  Icons.format_align_justify,
];

/// Common alignment
List<String> alignment = [
  AlignmentTypeTopLeft,
  AlignmentTypeTopCenter,
  AlignmentTypeTopRight,
  AlignmentTypeCenterLeft,
  AlignmentTypeCenter,
  AlignmentTypeCenterRight,
  AlignmentTypeBottomLeft,
  AlignmentTypeBottomCenter,
  AlignmentTypeBottomRight,
  AlignmentTypeNone,
];

List<String> stackAlignment = [
  AlignmentTypeTopLeft,
  AlignmentTypeTopCenter,
  AlignmentTypeTopRight,
  AlignmentTypeCenterLeft,
  AlignmentTypeCenter,
  AlignmentTypeCenterRight,
  AlignmentTypeBottomLeft,
  AlignmentTypeBottomCenter,
  AlignmentTypeBottomRight,
];

/// Common MainAxisSize
List<String> mainAxisSize = [
  AxisMax,
  AxisMin,
];

/// Common MainAxisAlignment
List<String> mainAxisAlignment = [
  AxisAlignmentStart,
  AxisAlignmentCenter,
  AxisAlignmentEnd,
  AxisAlignmentSpaceEvenly,
  AxisAlignmentSpaceAround,
  AxisAlignmentSpaceBetween,
];

/// Common CrossAxisAlignment
List<String> crossAxisAlignment = [
  AxisAlignmentStart,
  AxisAlignmentCenter,
  AxisAlignmentEnd,
  AxisAlignmentStretch,
];

/// Common BoxShape
List<String> boxShape = [
  BoxShapeTypeRectangle,
  BoxShapeTypeCircle,
];

/// Common Axis
List<String> axis = [
  AxisVertical,
  AxisHorizontal,
];

List<String> overflow = [
  OverflowTypeClip,
  OverflowTypeEllipsis,
  OverflowTypeFade,
  OverflowTypeVisible,
];

///scrollPhysics
List<String> scrollPhysics = [
  ScrollNeverScrollableScrollPhysics,
  ScrollClampingScrollPhysics,
  ScrollPhysicsAlwaysScroll,
  ScrollScrollPhysics,
  ScrollBouncingScrollPhysics,
];

///gridTitleList
List<String> gridTitleList = [
  'GridView1',
  'GridView2',
  'GridView3',
  'GridView4',
];

///InputBorderType
List<String> inputBorderType = [
  InoutBorderTypeUnderLine,
  InputBorderTypeOutLine,
  InputBorderTypeNone,
];

///IndicatorEffect
List<String> indicatorEffectType = [
  IndicatorWormEffect,
  IndicatorExpandingDotsEffect,
  IndicatorJumpingDotsEffect,
  IndicatorScrollingDotsEffect,
  IndicatorScaleEffect,
  IndicatorSlideEffect,
];

///Common Function For ImageType
String getImageType(String imageType) {
  if (imageType == ImageTypeNetwork) {
    return ImageTypeNetwork;
  } else {
    return ImageTypeAsset;
  }
}

///Common Function For BoxFit
BoxFit getBoxFit(String? boxFit) {
  if (boxFit == boxFitFill) {
    return BoxFit.fill;
  } else if (boxFit == boxFitContain) {
    return BoxFit.contain;
  } else if (boxFit == boxFitContain) {
    return BoxFit.contain;
  } else if (boxFit == boxFitCover) {
    return BoxFit.cover;
  } else if (boxFit == boxFitWidth) {
    return BoxFit.fitWidth;
  } else if (boxFit == boxFitHeight) {
    return BoxFit.fitHeight;
  } else if (boxFit == boxFitScaleDown) {
    return BoxFit.scaleDown;
  } else {
    return BoxFit.none;
  }
}

///Common Function For MainAxisAlignment
MainAxisAlignment getMainAxisAlignment({String? mainAxisAlignment}) {
  if (mainAxisAlignment == AxisAlignmentStart) {
    return MainAxisAlignment.start;
  } else if (mainAxisAlignment == AxisAlignmentCenter) {
    return MainAxisAlignment.center;
  } else if (mainAxisAlignment == AxisAlignmentEnd) {
    return MainAxisAlignment.end;
  } else if (mainAxisAlignment == AxisAlignmentSpaceEvenly) {
    return MainAxisAlignment.spaceEvenly;
  } else if (mainAxisAlignment == AxisAlignmentSpaceAround) {
    return MainAxisAlignment.spaceAround;
  } else if (mainAxisAlignment == AxisAlignmentSpaceBetween) {
    return MainAxisAlignment.spaceBetween;
  } else {
    return MainAxisAlignment.start;
  }
}

///Common Function For CrossAxisAlignment
CrossAxisAlignment getCrossAxisAlignment({String? crossAxisAlignment}) {
  if (crossAxisAlignment == AxisAlignmentStart) {
    return CrossAxisAlignment.start;
  } else if (crossAxisAlignment == AxisAlignmentCenter) {
    return CrossAxisAlignment.center;
  } else if (crossAxisAlignment == AxisAlignmentEnd) {
    return CrossAxisAlignment.end;
  } else if (crossAxisAlignment == AxisAlignmentStretch) {
    return CrossAxisAlignment.stretch;
  } else {
    return CrossAxisAlignment.center;
  }
}

///Common Function For Axis
Axis getAxis({String? axis}) {
  if (axis == AxisVertical) {
    return Axis.vertical;
  } else if (axis == AxisHorizontal) {
    return Axis.horizontal;
  } else {
    return Axis.vertical;
  }
}

///Common Function For MainAxisSize
MainAxisSize getMainAxisSize({axisSize}) {
  if (axisSize == AxisMax) {
    return MainAxisSize.max;
  } else if (axisSize == AxisMin) {
    return MainAxisSize.min;
  } else {
    return MainAxisSize.max;
  }
}

/// Common get Alignment
Alignment? getAlignment(String? alignment) {
  if (alignment == AlignmentTypeTopLeft) {
    return Alignment.topLeft;
  }
  if (alignment == AlignmentTypeTopCenter) {
    return Alignment.topCenter;
  }
  if (alignment == AlignmentTypeTopRight) {
    return Alignment.topRight;
  }
  if (alignment == AlignmentTypeCenterLeft) {
    return Alignment.centerLeft;
  }
  if (alignment == AlignmentTypeCenter) {
    return Alignment.center;
  }
  if (alignment == AlignmentTypeCenterRight) {
    return Alignment.centerRight;
  }
  if (alignment == AlignmentTypeBottomLeft) {
    return Alignment.bottomLeft;
  }
  if (alignment == AlignmentTypeBottomCenter) {
    return Alignment.bottomCenter;
  }
  if (alignment == AlignmentTypeBottomRight) {
    return Alignment.bottomRight;
  } else {
    return null;
  }
}

/// Common get FontWeight
FontWeight? getFontWeight(String? fontWeight) {
  if (fontWeight == FontWeightTypeThin) {
    return FontWeight.w100;
  }
  if (fontWeight == FontWeightTypeExtraLight) {
    return FontWeight.w200;
  }
  if (fontWeight == FontWeightTypeLight) {
    return FontWeight.w300;
  }
  if (fontWeight == FontWeightTypeNormal) {
    return FontWeight.w400;
  }
  if (fontWeight == FontWeightTypeMedium) {
    return FontWeight.w500;
  }
  if (fontWeight == FontWeightTypeSemiBold) {
    return FontWeight.w600;
  }
  if (fontWeight == FontWeightTypeBold) {
    return FontWeight.w700;
  }
  if (fontWeight == FontWeightTypeExtraBold) {
    return FontWeight.w800;
  }
  if (fontWeight == FontWeightTypeBlack) {
    return FontWeight.w900;
  } else {
    return null;
  }
}

/// Common get BoxShape
BoxShape? getBoxShape(String? boxShape) {
  if (boxShape == BoxShapeTypeRectangle) {
    return BoxShape.rectangle;
  }
  if (boxShape == BoxShapeTypeCircle) {
    return BoxShape.circle;
  } else {
    return null;
  }
}

/// Common get Overflow
TextOverflow? getOverflow(String? overflow) {
  if (overflow == OverflowTypeClip) {
    return TextOverflow.clip;
  }
  if (overflow == OverflowTypeEllipsis) {
    return TextOverflow.ellipsis;
  }
  if (overflow == OverflowTypeFade) {
    return TextOverflow.fade;
  }
  if (overflow == OverflowTypeVisible) {
    return TextOverflow.visible;
  } else {
    return null;
  }
}

///Common Function For ScrollPhysics
ScrollPhysics getScrollPhysics({String? scrollPhysics}) {
  if (scrollPhysics == ScrollClampingScrollPhysics) {
    return ClampingScrollPhysics();
  } else if (scrollPhysics == ScrollPhysicsAlwaysScroll) {
    return AlwaysScrollableScrollPhysics();
  } else if (scrollPhysics == ScrollNeverScrollableScrollPhysics) {
    return NeverScrollableScrollPhysics();
  } else if (scrollPhysics == ScrollBouncingScrollPhysics) {
    return BouncingScrollPhysics();
  } else if (scrollPhysics == ScrollScrollPhysics) {
    return ScrollPhysics();
  } else {
    return NeverScrollableScrollPhysics();
  }
}

showColorPicker(BuildContext context, Color color, {Function(Color)? applyOnWidget}) async {
  Color pickColor = color;
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${language!.pickColor}!', style: boldTextStyle()),
              16.height,
              ColorPicker(
                pickerColor: color,
                labelTextStyle: primaryTextStyle(),
                onColorChanged: (color) {
                  pickColor = color;
                },
              ),
              16.height,
            ],
          ),
          actions: [
            SizedBox(
              height: 30,
              width: 80,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: appStore.isDarkMode ? scaffoldSecondaryDark : Colors.grey.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
                ),
                onPressed: () {
                  finish(context);
                },
                child: Text(language!.cancel, style: primaryTextStyle(size: 14, color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 30,
              width: 80,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
                ),
                onPressed: () {
                  finish(context);
                  applyOnWidget!(pickColor);
                },
                child: Text(language!.apply, style: primaryTextStyle(color: Colors.white, size: 14)),
              ),
            ),
          ],
        );
      });
}

Widget getBasicPropertyView() {
  return Column(
    children: [
      Text(language!.basicPropertyView),
    ],
  );
}

// ignore: must_be_immutable
class ExpansionTileView extends StatefulWidget {
  static String tag = '/expansionTileView';
  String title;
  BuildContext context;
  List<Widget> list;
  bool isInitiallyExpanded = false;

  ExpansionTileView(this.title, this.context, this.list, {this.isInitiallyExpanded = false});

  @override
  ExpansionTileViewState createState() => ExpansionTileViewState();
}

class ExpansionTileViewState extends State<ExpansionTileView> {
  bool isExpanding = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      childrenPadding: EdgeInsets.all(16),
      onExpansionChanged: (bool expanding) {
        isExpanding = expanding;
        setState(() {});
      },
      title: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: isExpanding
                    ? appStore.isDarkMode
                        ? darkModeHighLightColor
                        : btnBackgroundColor
                    : appStore.isDarkMode
                        ? darkModeSubTextColor
                        : DEFAULT_TEXT_COLOR,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
      iconColor: isExpanding
          ? appStore.isDarkMode
              ? darkModeHighLightColor
              : btnBackgroundColor
          : appStore.isDarkMode
              ? darkModeSubTextColor
              : DEFAULT_TEXT_COLOR,
      initiallyExpanded: widget.isInitiallyExpanded,
      headerBackgroundColor: isExpanding
          ? appStore.isDarkMode
              ? darkModeSecondaryBackgroundDark
              : leftExpansionTileBackgroundColor
          : appStore.isDarkMode
              ? darkModeSecondaryBackgroundDark
              : Colors.transparent,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: widget.list,
          ),
        ),
      ],
    );
  }
}

Widget checkBoxView(bool? isCheck, String text, {required Function(dynamic) onChanged}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Theme(
        data: ThemeData(unselectedWidgetColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : iconColor),
        child: Checkbox(
          value: isCheck,
          onChanged: onChanged,
          activeColor: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor,
        ),
      ),
      8.width,
      Text(text, style: secondaryTextStyle()),
    ],
  );
}

Widget paddingView({Function(double, double, double, double)? onPaddingChanged, EdgeInsets? padding}) {
  double left = 0.0;
  double top = 0.0;
  double right = 0.0;
  double bottom = 0.0;
  TextEditingController lController = TextEditingController();
  TextEditingController tController = TextEditingController();
  TextEditingController rController = TextEditingController();
  TextEditingController bController = TextEditingController();

  if (padding != null) {
    lController.text = padding != EdgeInsets.all(0) ? padding.left.toString() : '';
    tController.text = padding != EdgeInsets.all(0) ? padding.top.toString() : '';
    rController.text = padding != EdgeInsets.all(0) ? padding.right.toString() : '';
    bController.text = padding != EdgeInsets.all(0) ? padding.bottom.toString() : '';
    left = padding.left;
    top = padding.top;
    right = padding.right;
    bottom = padding.bottom;
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      getTextField(
        controller: lController,
        hint: "L",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (String s) {
          left = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isPaddingLock) {
            rController.text = s;
            right = left;

            tController.text = s;
            top = left;

            bController.text = s;
            bottom = left;
          }
          onPaddingChanged!(left, top, right, bottom);
        },
        maxLength: commonMaxLength,
      ).expand(),
      8.width,
      getTextField(
        controller: tController,
        hint: "T",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (String s) {
          top = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isPaddingLock) {
            lController.text = s;
            left = top;

            rController.text = s;
            right = top;

            bController.text = s;
            bottom = top;
          }
          onPaddingChanged!(left, top, right, bottom);
        },
        maxLength: commonMaxLength,
      ).expand(),
      8.width,
      getTextField(
        controller: rController,
        hint: "R",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (String s) {
          right = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isPaddingLock) {
            lController.text = s;
            left = right;

            tController.text = s;
            top = right;

            bController.text = s;
            bottom = right;
          }
          onPaddingChanged!(left, top, right, bottom);
        },
        maxLength: commonMaxLength,
      ).expand(),
      8.width,
      getTextField(
        controller: bController,
        hint: "B",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (String s) {
          bottom = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isPaddingLock) {
            lController.text = s;
            left = bottom;

            rController.text = s;
            right = bottom;

            tController.text = s;
            top = bottom;
          }
          onPaddingChanged!(left, top, right, bottom);
        },
        maxLength: commonMaxLength,
      ).expand(),
      16.width,
      Observer(
        builder: (context) {
          return unLockIcon().onTap(() {
            appStore.setIsPaddingLock(true);
          }).visible(!appStore.isPaddingLock);
        },
      ),
      Observer(
        builder: (context) {
          return lockIcon().onTap(() {
            appStore.setIsPaddingLock(false);
          }).visible(appStore.isPaddingLock);
        },
      ),
      16.width,
      closeIcon().onTap(() {
        lController.clear();
        rController.clear();
        tController.clear();
        bController.clear();
        left = right = top = bottom = 0.0;
        onPaddingChanged!(left, top, right, bottom);
      }),
    ],
  );
}

Widget radiusView({Function(double, double, double, double)? onRadiusChanged, BorderRadius? radius}) {
  double topLeft = 0.0;
  double topRight = 0.0;
  double bottomLeft = 0.0;
  double bottomRight = 0.0;
  TextEditingController tlController = TextEditingController();
  TextEditingController trController = TextEditingController();
  TextEditingController blController = TextEditingController();
  TextEditingController brController = TextEditingController();

  if (radius != null) {
    tlController.text = radius != BorderRadius.zero ? radius.topLeft.x.toString() : '';
    trController.text = radius != BorderRadius.zero ? radius.topRight.x.toString() : '';
    blController.text = radius != BorderRadius.zero ? radius.bottomLeft.x.toString() : '';
    brController.text = radius != BorderRadius.zero ? radius.bottomRight.x.toString() : '';
    topLeft = radius.topLeft.x;
    topRight = radius.topRight.x;
    bottomLeft = radius.bottomLeft.x;
    bottomRight = radius.bottomRight.x;
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      getTextField(
        controller: tlController,
        hint: "TL",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (String s) {
          topLeft = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isRadiusLock) {
            trController.text = s;
            topRight = topLeft;

            blController.text = s;
            bottomLeft = topLeft;

            brController.text = s;
            bottomRight = topLeft;
          }
          onRadiusChanged!(topLeft, topRight, bottomLeft, bottomRight);
        },
        maxLength: commonMaxLength,
      ).expand(),
      8.width,
      getTextField(
        controller: trController,
        hint: "TR",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (String s) {
          topRight = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isRadiusLock) {
            tlController.text = s;
            topLeft = topRight;

            blController.text = s;
            bottomLeft = topRight;

            brController.text = s;
            bottomRight = topRight;
          }
          onRadiusChanged!(topLeft, topRight, bottomLeft, bottomRight);
        },
        maxLength: commonMaxLength,
      ).expand(),
      8.width,
      getTextField(
        controller: brController,
        hint: "BR",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (String s) {
          bottomRight = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isRadiusLock) {
            trController.text = s;
            topRight = bottomRight;

            blController.text = s;
            bottomLeft = bottomRight;

            tlController.text = s;
            topLeft = bottomRight;
          }

          onRadiusChanged!(topLeft, topRight, bottomLeft, bottomRight);
        },
        maxLength: commonMaxLength,
      ).expand(),
      8.width,
      getTextField(
        controller: blController,
        hint: "BL",
        textAlign: TextAlign.center,
        inputFormatter: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
        ],
        onChanged: (s) {
          bottomLeft = s.isNotEmpty ? double.parse(s) : 0.0;
          if (appStore.isRadiusLock) {
            trController.text = s;
            topRight = bottomLeft;

            tlController.text = s;
            topLeft = bottomLeft;

            brController.text = s;
            bottomRight = bottomLeft;
          }
          onRadiusChanged!(topLeft, topRight, bottomLeft, bottomRight);
        },
        maxLength: commonMaxLength,
      ).expand(),
      16.width,
      Observer(
        builder: (context) => unLockIcon().onTap(() {
          appStore.setIsRadiusLock(true);
        }).visible(!appStore.isRadiusLock),
      ),
      Observer(
        builder: (context) => lockIcon().onTap(() {
          appStore.setIsRadiusLock(false);
        }).visible(appStore.isRadiusLock),
      ),
      16.width,
      closeIcon().onTap(() {
        tlController.clear();
        trController.clear();
        blController.clear();
        brController.clear();
        topLeft = topRight = bottomLeft = bottomRight = 0.0;
        onRadiusChanged!(topLeft, topRight, bottomLeft, bottomRight);
      }),
    ],
  );
}

class ColorView extends StatefulWidget {
  static String tag = '/ColorView';

  final Color color;
  final Function()? pickColor;
  final Function()? applyColor;
  final bool isRemoveColor;

  ColorView({required this.color, this.pickColor, this.applyColor, this.isRemoveColor = false});

  @override
  ColorViewState createState() => ColorViewState();
}

class ColorViewState extends State<ColorView> {
  TextEditingController? codeController;
  bool isEditColorCode = false;

  @override
  void initState() {
    super.initState();
  }

  void init() {
    appStore.setColor(widget.color);
    codeController = TextEditingController(text: appStore.color!.toHex(leadingHashSign: true, includeAlpha: true));
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
            border: Border.all(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: appStore.color,
                        border: Border.all(color: COMMON_BORDER_COLOR),
                      ),
                    ).onTap(widget.pickColor),
                    4.width,
                    Container(
                      width: 75,
                      child: TextField(
                        style: primaryTextStyle(size: 14, color: appStore.isDarkMode ? Colors.white : DEFAULT_TEXT_COLOR),
                        textAlign: TextAlign.center,
                        enabled: isEditColorCode,
                        controller: codeController,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: COMMON_BORDER_COLOR, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent, width: 1),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          counterText: '',
                        ),
                        maxLength: 9,
                      ),
                    ),
                  ],
                ),
              ),
              4.width,
              Container(width: 1, height: 35, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
              12.width,
              Text((appStore.color!.opacity * 100).round().toString() + " %", style: primaryTextStyle(size: 14, color: appStore.isDarkMode ? Colors.white : DEFAULT_TEXT_COLOR)),
            ],
          ),
        ),
        8.width,
        Container(
          padding: EdgeInsets.all(8),
          child: editIcon(context, () {
            isEditColorCode = true;
            setState(() {});
          }),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
            border: Border.all(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
            color: Colors.transparent,
          ),
        ).visible(!isEditColorCode),
        Container(
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset(
            "${WidgetIconPath}CheckBox.svg",
            color: context.iconColor,
            height: btnIconSize,
            width: btnIconSize,
          ),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
            border: Border.all(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
            color: Colors.transparent,
          ),
        ).onTap(() {
          appStore.setColor(fromJsonColor(codeController!.text));
          widget.applyColor!();
          isEditColorCode = false;
          setState(() {});
        }).visible(isEditColorCode),
        8.width,
        closeIcon().onTap(() {
          appStore.setColor(TRANSPARENT_COLOR);
          widget.applyColor!();
        }).visible(widget.isRemoveColor),
      ],
    );
  }
}

class TextAlignView extends StatefulWidget {
  static String tag = '/TextAlignView';

  final Function(TextAlign)? onTextAlignChanged;
  TextAlign? tAlign;

  TextAlignView({this.onTextAlignChanged, this.tAlign});

  @override
  TextAlignViewState createState() => TextAlignViewState();
}

class TextAlignViewState extends State<TextAlignView> {
  int? textAlignIndex;

  init() async {
    if (widget.tAlign == TextAlign.left) {
      textAlignIndex = 0;
    } else if (widget.tAlign == TextAlign.center) {
      textAlignIndex = 1;
    } else if (widget.tAlign == TextAlign.right) {
      textAlignIndex = 2;
    } else if (widget.tAlign == TextAlign.justify) {
      textAlignIndex = 3;
    } else {
      textAlignIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(textAlign.length, (index) {
        return Container(
          child: Icon(textAlign[index],
              color: textAlignIndex == index
                  ? appStore.isDarkMode
                      ? darkModeHighLightColor
                      : Colors.white
                  : appStore.isDarkMode
                      ? Colors.grey
                      : iconColor,
              size: btnIconSize),
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
            border: Border.all(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
            color: textAlignIndex == index
                ? appStore.isDarkMode
                    ? Colors.transparent
                    : btnBackgroundColor
                : appStore.isDarkMode
                    ? darkModePrimaryColorBackground
                    : Colors.white,
          ),
        ).onTap(() {
          textAlignIndex = index;

          if (textAlign[index] == Icons.format_align_left) {
            widget.onTextAlignChanged!(TextAlign.left);
            widget.tAlign = TextAlign.left;
          } else if (textAlign[index] == Icons.format_align_center) {
            widget.onTextAlignChanged!(TextAlign.center);
            widget.tAlign = TextAlign.center;
          } else if (textAlign[index] == Icons.format_align_right) {
            widget.onTextAlignChanged!(TextAlign.right);
            widget.tAlign = TextAlign.right;
          } else if (textAlign[index] == Icons.format_align_justify) {
            widget.onTextAlignChanged!(TextAlign.justify);
            widget.tAlign = TextAlign.justify;
          } else {
            widget.onTextAlignChanged!(TextAlign.left);
            widget.tAlign = TextAlign.left;
          }
          setState(() {});
        });
      }),
    );
  }
}

/// TextField
Widget getTextField({
  Function(String)? onChanged,
  TextAlign? textAlign,
  String? hint,
  List<TextInputFormatter>? inputFormatter,
  TextEditingController? controller,
  EdgeInsets? contentPadding,
  int? maxLength,
}) {
  return TextFormField(
    controller: controller ?? null,
    autofocus: false,
    style: primaryTextStyle(size: 14, color: appStore.isDarkMode ? Colors.white : DEFAULT_TEXT_COLOR),
    textAlign: textAlign ?? TextAlign.start,
    inputFormatters: inputFormatter ?? <TextInputFormatter>[],
    decoration: InputDecoration(
      counterText: "",
      isDense: true,
      filled: true,
      fillColor: appStore.isDarkMode ? Colors.transparent : Colors.white,
      hintText: hint ?? "",
      hintStyle: secondaryTextStyle(color: appStore.isDarkMode ? Colors.grey : Color(0xFFbdc6cf)),
      contentPadding: EdgeInsets.all(12),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : btnBackgroundColor),
        borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
        borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
      ),
      border: OutlineInputBorder(),
    ),
    onChanged: onChanged,
    maxLength: maxLength,
  );
}

Widget getDropDownField(List<dynamic> list, {required Function(dynamic) onChanged, dynamic defaultValue}) {
  return Container(
    height: 35,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(COMMON_BUTTON_BORDER_RADIUS)),
        border: Border.all(
          color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR,
          width: 1,
        ),
        color: appStore.isDarkMode ? Colors.transparent : Colors.white),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : dropDownColor,
          value: defaultValue,
          isExpanded: true,
          isDense: true,
          autofocus: false,
          items: list.map((item) {
            return DropdownMenuItem(
              child: Text(
                item.toString(),
                style: primaryTextStyle(size: 14, color: appStore.isDarkMode ? Colors.white : DEFAULT_TEXT_COLOR),
              ),
              value: item,
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}

/// Common Height
Widget getHeight(double _height) {
  return SizedBox(
    height: _height,
  );
}

/// Common Width & Height
Widget getImageWidthType({
  TextEditingController? controller,
  required String title,
  required String widthType1,
  required String widthType2,
  String? type,
  Function(String)? onTextChanged,
  Function()? onTapInf,
  required Function() onTapPer,
  required Function() onTapPX,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(title, style: secondaryTextStyle()),
          4.width,
          InkWell(
            child: Container(
              padding: EdgeInsets.all(4),
              width: 26,
              alignment: Alignment.center,
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(COMMON_BUTTON_BORDER_RADIUS),
                  bottomLeft: Radius.circular(COMMON_BUTTON_BORDER_RADIUS),
                ),
                backgroundColor: (type == TypePX) ? salmon : COMMON_BORDER_COLOR,
              ),
              child: Text(widthType1, style: secondaryTextStyle(color: (type == TypePX) ? white : grey, size: 12)),
            ),
            onTap: onTapPX,
          ),
          VerticalDivider(color: white, width: 1),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              width: 26,
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(COMMON_BUTTON_BORDER_RADIUS),
                  bottomRight: Radius.circular(COMMON_BUTTON_BORDER_RADIUS),
                ),
                backgroundColor: type == TypePercentage ? salmon : COMMON_BORDER_COLOR,
              ),
              child: Text(widthType2, style: secondaryTextStyle(color: type == TypePercentage ? white : grey, size: 12)),
            ),
            onTap: onTapPer,
          ),
        ],
      ),
      8.height,
      Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            width: widthPropertySize,
            child: getTextField(
              controller: controller,
              textAlign: TextAlign.start,
              inputFormatter: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: onTextChanged,
              maxLength: commonMaxLength,
            ),
          ),
        ],
      ),
    ],
  );
}

getWidthControllerValue(double? width, String? widthType) {
  if (widthType == TypePX || widthType == TypePercentage) {
    return width.toString();
  }
}

getSubPropertyWidget({required String title, Widget? widget}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: secondaryTextStyle()),
      8.height,
      widget!,
      10.height,
    ],
  );
}

Widget alignView({
  Function(double, double)? onAlignChanged,
  Function(bool)? isAlignXChanged,
  Function(bool)? isAlignYChanged,
  double? alignX,
  double? alignY,
  bool? isAlignX = false,
  bool? isAlignY = false,
}) {
  appStore.setAlignment(Alignment(alignX ?? 0, alignY ?? 0));
  appStore.setIsAlignX(isAlignX);
  appStore.setIsAlignY(isAlignY);

  TextEditingController hController = TextEditingController(text: appStore.isAlignX! ? appStore.alignment!.x.toString() : "");
  TextEditingController vController = TextEditingController(text: appStore.isAlignY! ? appStore.alignment!.y.toString() : "");

  return Observer(
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: closeIcon().onTap(() {
              isAlignXChanged!(false);
              isAlignYChanged!(false);
              alignX = 0;
              alignY = 0;
              hController.clear();
              vController.clear();
              appStore.setAlignment(Alignment(0, 0));
              appStore.setIsAlignX(false);
              appStore.setIsAlignY(false);
              onAlignChanged!(0, 0);
            }),
          ),
          getSubPropertyWidget(
            title: language!.horizontalAlignment,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Slider(
                  inactiveColor: leftExpansionTileBackgroundColor,
                  activeColor: appStore.isAlignX!
                      ? appStore.isDarkMode
                          ? darkModeHighLightColor
                          : btnBackgroundColor
                      : appStore.isDarkMode
                          ? darkModeSecondaryBackgroundDark
                          : COMMON_BORDER_COLOR,
                  min: -1,
                  max: 1,
                  value: appStore.alignment!.x,
                  onChanged: (value) {
                    alignX = double.parse(value.toStringAsFixed(2));
                    hController.text = alignX!.toStringAsFixed(2);
                    appStore.setAlignment(Alignment(alignX!, alignY!));
                    isAlignXChanged!(true);
                    onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                  },
                ).expand(),
                Container(
                  width: 60,
                  child: getTextField(
                    textAlign: TextAlign.center,
                    controller: hController,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9 . -]')),
                    ],
                    onChanged: (value) {
                      if (hController.text.isEmpty) {
                        appStore.setAlignment(Alignment(0, appStore.alignment!.y));
                        onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                        isAlignXChanged!(false);
                      } else if (double.parse(value) < -1 || double.parse(value) > 1) {
                        appStore.setAlignment(Alignment(0, appStore.alignment!.y));
                        onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                        isAlignXChanged!(true);
                        getToast(language!.selectValueBetweenMinusOneToOne);
                      } else {
                        alignX = double.parse(value);
                        appStore.setAlignment(Alignment(alignX!, alignY!));
                        onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                        isAlignXChanged!(true);
                      }
                    },
                    maxLength: commonMaxLength,
                  ),
                ),
              ],
            ),
          ),
          getSubPropertyWidget(
            title: language!.verticalAlignment,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Slider(
                  inactiveColor: leftExpansionTileBackgroundColor,
                  activeColor: appStore.isAlignY!
                      ? appStore.isDarkMode
                          ? darkModeHighLightColor
                          : btnBackgroundColor
                      : appStore.isDarkMode
                          ? darkModeSecondaryBackgroundDark
                          : COMMON_BORDER_COLOR,
                  min: -1,
                  max: 1,
                  value: appStore.alignment!.y,
                  onChanged: (value) {
                    alignY = double.parse(value.toStringAsFixed(2));
                    vController.text = alignY!.toStringAsFixed(2);
                    appStore.setAlignment(Alignment(alignX!, alignY!));
                    isAlignYChanged!(true);
                    onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                  },
                ).expand(),
                Container(
                  width: 60,
                  child: getTextField(
                    textAlign: TextAlign.center,
                    controller: vController,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9 . -]')),
                    ],
                    onChanged: (value) {
                      if (vController.text.isEmpty) {
                        appStore.setAlignment(Alignment(appStore.alignment!.x, 0));
                        onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                        isAlignYChanged!(false);
                      } else if (double.parse(value) < -1 || double.parse(value) > 1) {
                        appStore.setAlignment(Alignment(appStore.alignment!.x, 0));
                        onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                        isAlignYChanged!(true);
                        getToast(language!.selectValueBetweenMinusOneToOne);
                      } else {
                        alignY = double.parse(value);
                        appStore.setAlignment(Alignment(alignX!, alignY!));
                        onAlignChanged!(appStore.alignment!.x, appStore.alignment!.y);
                        isAlignYChanged!(true);
                      }
                    },
                    maxLength: commonMaxLength,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget pageViewIndicatorAlignView({
  Function(double, double)? onAlignChanged,
  Function(bool)? setIsPaginationAlignX,
  Function(bool)? setIsPaginationAlignY,
  double? paginationAlignX,
  double? paginationAlignY,
  bool? isPaginationAlignX = false,
  bool? isPaginationAlignY = false,
}) {
  appStore.setPageViewAlignment(Alignment(paginationAlignX ?? 0, paginationAlignY ?? 1));
  appStore.setIsPaginationIndicatorAlignX(isPaginationAlignX);
  appStore.setIsPaginationIndicatorAlignY(isPaginationAlignY);

  TextEditingController hController = TextEditingController(text: appStore.isPaginationIndicatorAlignX! ? appStore.pageViewAlignment!.x.toString() : "");
  TextEditingController vController = TextEditingController(text: appStore.isPaginationIndicatorAlignY! ? appStore.pageViewAlignment!.y.toString() : "");

  return Observer(
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: closeIcon().onTap(() {
              setIsPaginationAlignX!(false);
              setIsPaginationAlignY!(false);
              paginationAlignX = 0;
              paginationAlignY = 0;
              hController.clear();
              vController.clear();
              appStore.setAlignment(Alignment(0, 0));
              appStore.setIsAlignX(false);
              appStore.setIsAlignY(false);
              onAlignChanged!(0, 0);
            }),
          ),
          getSubPropertyWidget(
            title: language!.horizontalAlignment,
            widget: Row(
              children: [
                Slider(
                  inactiveColor: leftExpansionTileBackgroundColor,
                  activeColor: appStore.isAlignX!
                      ? appStore.isDarkMode
                          ? darkModeHighLightColor
                          : btnBackgroundColor
                      : appStore.isDarkMode
                          ? darkModeSecondaryBackgroundDark
                          : COMMON_BORDER_COLOR,
                  min: -1,
                  max: 1,
                  value: appStore.pageViewAlignment!.x,
                  onChanged: (value) {
                    paginationAlignX = double.parse(value.toStringAsFixed(2));
                    hController.text = paginationAlignX!.toStringAsFixed(2);
                    appStore.setPageViewAlignment(Alignment(paginationAlignX!, paginationAlignY!));
                    setIsPaginationAlignX!(true);
                    onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                  },
                ),
                8.width,
                Container(
                  width: 80,
                  child: getTextField(
                    textAlign: TextAlign.center,
                    controller: hController,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9 . -]')),
                    ],
                    onChanged: (value) {
                      if (hController.text.isEmpty) {
                        appStore.setPageViewAlignment(Alignment(0, appStore.pageViewAlignment!.y));
                        onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                        setIsPaginationAlignX!(false);
                      } else if (double.parse(value) < -1 || double.parse(value) > 1) {
                        appStore.setPageViewAlignment(Alignment(0, appStore.pageViewAlignment!.y));
                        onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                        setIsPaginationAlignX!(true);
                        getToast(language!.selectValueBetweenMinusOneToOne);
                      } else {
                        paginationAlignX = double.parse(value);
                        appStore.setPageViewAlignment(Alignment(paginationAlignX!, paginationAlignY!));
                        onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                        setIsPaginationAlignX!(true);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          getSubPropertyWidget(
            title: language!.verticalAlignment,
            widget: Row(
              children: [
                Slider(
                  inactiveColor: leftExpansionTileBackgroundColor,
                  activeColor: appStore.isAlignX!
                      ? appStore.isDarkMode
                          ? darkModeHighLightColor
                          : btnBackgroundColor
                      : appStore.isDarkMode
                          ? darkModeSecondaryBackgroundDark
                          : COMMON_BORDER_COLOR,
                  min: -1,
                  max: 1,
                  value: appStore.pageViewAlignment!.y,
                  onChanged: (value) {
                    paginationAlignY = double.parse(value.toStringAsFixed(2));
                    vController.text = paginationAlignY!.toStringAsFixed(2);
                    appStore.setPageViewAlignment(Alignment(paginationAlignX!, paginationAlignY!));
                    setIsPaginationAlignY!(true);
                    onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                  },
                ),
                8.width,
                Container(
                  width: 80,
                  child: getTextField(
                    textAlign: TextAlign.center,
                    controller: vController,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9 . -]')),
                    ],
                    onChanged: (value) {
                      if (vController.text.isEmpty) {
                        appStore.setPageViewAlignment(Alignment(appStore.pageViewAlignment!.x, 1));
                        onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                        setIsPaginationAlignY!(false);
                      } else if (double.parse(value) < -1 || double.parse(value) > 1) {
                        appStore.setPageViewAlignment(Alignment(appStore.pageViewAlignment!.x, 1));
                        onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                        setIsPaginationAlignY!(true);
                        getToast(language!.selectValueBetweenMinusOneToOne);
                      } else {
                        paginationAlignY = double.parse(value);
                        appStore.setPageViewAlignment(Alignment(paginationAlignX!, paginationAlignY!));
                        onAlignChanged!(appStore.pageViewAlignment!.x, appStore.pageViewAlignment!.y);
                        setIsPaginationAlignY!(true);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget iconPickerView({
  bool isShowRemoved = false,
  bool isShowIconName = true,
  required Map? iconDataJson,
  required Function(String) onChanged,
  Function()? onRemoved,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      height: 35,
      width: isShowIconName ? 500 : 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
        border: Border.all(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconPicker(
            style: primaryTextStyle(size: 14, color: appStore.isDarkMode ? Colors.white : DEFAULT_TEXT_COLOR),
            controller: TextEditingController(text: !isShowIconName ? "" : (iconDataJson != null ? "${iconDataJson['iconName']}" : "None")),
            textAlign: TextAlign.center,
            title: language!.selectAnIcon,
            cancelBtn: language!.cancel.toUpperCase(),
            enableSearch: true,
            searchHint: language!.searchIcon,
            enableInteractiveSelection: false,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              prefixIcon: iconDataJson != null
                  ? Icon(
                      IconData(iconDataJson['codePoint'], fontFamily: iconDataJson['fontFamily']),
                      color: appStore.isDarkMode ? Colors.white : iconColor,
                    )
                  : SizedBox(),
            ),
            iconCollection: MaterialIcons.myIconCollection,
            onChanged: onChanged,
          ).expand(),
          Icon(Icons.close, color: appStore.isDarkMode ? Colors.white : iconColor, size: btnIconSize).paddingOnly(left: 16, right: 12).onTap(onRemoved).visible(iconDataJson != null && isShowRemoved),
        ],
      ),
    ),
  );
}

Widget commonAssetImageWidget(BuildContext context, {required Function(String?)? onChanged, String? selectedImage}) {
  return Column(
    children: [
      appStore.mediaList.isNotEmpty
          ? getSubPropertyWidget(
              title: 'Asset Image',
              widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(
                      color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR,
                      width: 1,
                    ),
                    color: appStore.isDarkMode ? Colors.transparent : Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : Colors.white,
                    hint: Text('Select Image', style: primaryTextStyle(size: 14)),
                    value: selectedImage,
                    isExpanded: true,
                    items: appStore.mediaList.map((item) {
                      return DropdownMenuItem(
                        child: Row(
                          children: [
                            commonCachedNetworkImage(item.userAttachment!, fit: BoxFit.cover, height: 30, width: 50),
                            16.width,
                            Text(
                              item.userAttachment.validate().split('/').last,
                              style: primaryTextStyle(size: 14),
                              maxLines: 2,
                            ).expand(),
                          ],
                        ),
                        value: item.userAttachment,
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            )
          : SizedBox(),
      GestureDetector(
        child: Container(
          height: 35,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : btnBackgroundColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
            border: Border.all(
              color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Text('Upload Image', style: primaryTextStyle(size: 14)).expand(),
              16.width,
              Icon(Icons.add),
            ],
          ),
        ),
        onTap: () {
          uploadMedia(
            context,
            onUpdate: () {
              allMediaListApi();
            },
          );
        },
      ),
      10.height,
    ],
  );
}
