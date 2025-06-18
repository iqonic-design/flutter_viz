import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'AppColors.dart';
import 'AppConstant.dart';
import 'AppFunctions.dart';

appBarMessage() {
  getToast(language!.notAddMoreThanOneAppBar);
}

printLogData(String? logs) {
  log("-----\nLogs:$logs");
}

void ifNotTester(VoidCallback callback, [bool showToast = true]) {
  if ((!appStore.userEmail.contains(DEMO_EMAIL) && getStringAsync(USER_TYPE) == USER)) {
    callback.call();
  } else {
    if (showToast) toast(language!.youCanNotPerformAction);
  }
}

drawerMessage() {
  getToast(language!.notAddMoreThanOneDrawer);
}

bottomNavigationBarMessage() {
  getToast(language!.alreadyHaveBottomNavigationBar);
}

String? parseHtmlString(String? value) {
  return value;
}

String getFileName({String? projectFileName}) {
  if (projectFileName != null) {
    return projectFileName.trim().replaceAll(" ", "").replaceAll(".", "").replaceAll(new RegExp(r'[#*)(@!,^&%.$\s]+'), "").replaceAll(new RegExp(r'[0-9]+'), '');
  } else {
    return appStore.fileName!.trim().replaceAll(" ", "").replaceAll(".", "").replaceAll(new RegExp(r'[#*)(@!,^&%.$\s]+'), "").replaceAll(new RegExp(r'[0-9]+'), '');
  }
}

String getWidgetsIcon(String? widgetType) {
  if (widgetType == WidgetTypeText) {
    return getPath("Text.svg");
  } else if (widgetType == WidgetTypeTextField) {
    return getPath("TextField.svg");
  } else if (widgetType == WidgetTypeTextButton) {
    return getPath("TextButton.svg");
  } else if (widgetType == WidgetTypePageView) {
    return getPath("PageView.svg");
  } else if (widgetType == WidgetTypeRotatedBox) {
    return getPath("RotatedBox.svg");
  } else if (widgetType == WidgetTypeTabView) {
    return getPath("TabView.svg");
  } else if (widgetType == WidgetTypeImage) {
    return getPath("Image.svg");
  } else if (widgetType == WidgetTypeCheckBox) {
    return getPath("CheckBox.svg");
  } else if (widgetType == WidgetTypeRadio) {
    return getPath("RadioButton.svg");
  } else if (widgetType == WidgetIconType) {
    return getPath("Icon.svg");
  } else if (widgetType == WidgetTypeIconButton) {
    return getPath("IconButton.svg");
  } else if (widgetType == WidgetTypeAppBar) {
    return getPath("Appbar.svg");
  } else if (widgetType == WidgetTypeContainer) {
    return getPath("Container.svg");
  } else if (widgetType == WidgetTypeColumn) {
    return getPath("Column.svg");
  } else if (widgetType == WidgetTypeRow) {
    return getPath("Row.svg");
  } else if (widgetType == WidgetTypeCard) {
    return getPath("Card.svg");
  } else if (widgetType == WidgetTypeList) {
    return getPath("ListView.svg");
  } else if (widgetType == WidgetTypeGrid) {
    return getPath("GridView.svg");
  } else if (widgetType == WidgetTypeCalender) {
    return getPath("Calender.svg");
  } else if (widgetType == WidgetTypeDropDown) {
    return getPath("Dropdown.svg");
  } else if (widgetType == WidgetTypeWebView) {
    return getPath("Webview.svg");
  } else if (widgetType == WidgetTypeCircleImage) {
    return getPath("CircleImage 2.svg");
  } else if (widgetType == WidgetTypeChipView) {
    return getPath("Chip.svg");
  } else if (widgetType == WidgetTypeSizedBox) {
    return getPath("SizeBox.svg");
  } else if (widgetType == WidgetTypeSwitchListTile) {
    return getPath("SwitchListTile.svg");
  } else if (widgetType == WidgetTypeCheckboxListTile) {
    return getPath("CheckboxListTile.svg");
  } else if (widgetType == WidgetTypeDivider) {
    return getPath("Divider.svg");
  } else if (widgetType == WidgetTypeVideoPlayer) {
    return getPath("VideoPlayer.svg");
  } else if (widgetType == WidgetTypeAudioPlayer) {
    return getPath("AudioPlayer.svg");
  } else if (widgetType == WidgetTypeListTile) {
    return getPath("ListTile.svg");
  } else if (widgetType == WidgetTypeStack) {
    return getPath("Stack.svg");
  } else if (widgetType == WidgetTypeGoogleMap) {
    return getPath("location.svg");
  } else if (widgetType == WidgetTypeSlider) {
    return getPath("Slider.svg");
  } else if (widgetType == WidgetTypeYoutubePlayer) {
    return getPath("YoutubePlayer.svg");
  } else if (widgetType == WidgetTypeRatingBar) {
    return getPath("RatingBar.svg");
  } else if (widgetType == WidgetTypeLottieAnimation) {
    return getPath("lottie.svg");
  } else if (widgetType == WidgetTypeCreditCardView) {
    return getPath("CreditCardView.svg");
  } else if (widgetType == WidgetTypeBottomNavigationBar) {
    return getPath("RatingBar.svg");
  } else if (widgetType == WidgetTypeSwitch) {
    return getPath("SwitchListTile.svg");
  } else if (widgetType == WidgetTypeOTPTextField) {
    return getPath("OTPTextfiled.svg");
  } else if (widgetType == WidgetTypeLinearProgressIndicator) {
    return getPath("linear_progress.svg");
  } else if (widgetType == WidgetTypeLeftDrawer) {
    return getPath("widgets.svg");
  } else if (widgetType == WidgetTypeConstrainedBox) {
    return getPath("ConstrainedBox.svg");
  } else if (widgetType == WidgetTypeClipRRect) {
    return getPath("ClipRRect.svg");
  } else if (widgetType == WidgetTypeOpacity) {
    return getPath("Opacity.svg");
  } else {
    return getPath("widgets.svg");
  }
}

List<String> deviceList = [
  'Google Pixel',
  'Lato',
  'Montserrat',
  'Open Sans',
  'Source Sans Pro',
  'Oswald',
];

List<String> fullWidthWidgetTypeList = [
  WidgetTypeList,
  WidgetTypeGrid,
  WidgetTypeTextField,
  WidgetTypeListTile,
  WidgetTypeSwitchListTile,
  WidgetTypeCheckboxListTile,
  WidgetTypeCalender,
  WidgetTypeVideoPlayer,
  WidgetTypeCreditCardView,
  WidgetTypeLinearProgressIndicator,
];

String getPath(String iconName) {
  return "$WidgetIconPath$iconName";
}

List<String> fullHeightWidgetTypeList = [WidgetTypeList, WidgetTypeGrid];

getMenuWidth(BuildContext context, {bool isExpanded = true}) {
  return isExpanded ? 200 : 70;
}

getChildWidgetsWidth(BuildContext context, {bool isExpanded = true}) {
  return MediaQuery.of(context).size.width - getMenuWidth(context, isExpanded: isExpanded);
}

getLeftWidgetsWidth(BuildContext context) {
  return 340;
}

getCenterScreenWidth(BuildContext context, {bool isExpanded = true}) {
  return getChildWidgetsWidth(context, isExpanded: isExpanded) - getLeftWidgetsWidth(context) - getRightPropertyViewWidth(context);
}

getRightPropertyViewWidth(BuildContext context) {
  return 360;
}

///adminScreen Width
getAdminMenuWidth(BuildContext context, {bool isExpanded = true}) {
  return isExpanded ? 200 : 70;
}

getAdminChildViewWidth(BuildContext context, {bool isExpanded = true}) {
  return MediaQuery.of(context).size.width - getAdminMenuWidth(context, isExpanded: isExpanded);
}

OutlineInputBorder outlineInputBorder({required Color color}) {
  return OutlineInputBorder(borderSide: BorderSide(color: color));
}

fromJsonWidth(double? width, String? widthType) {
  if (widthType == TypePX) {
    return width;
  } else if (widthType == TypePercentage) {
    if (width! >= 100) {
      return deviceWidth;
    } else {
      return deviceWidth * width * 0.01;
    }
  }
}

fromJsonHeight(double? height, String? heightType) {
  if (heightType == TypePX) {
    return height;
  } else if (heightType == TypePercentage) {
    if (height! >= 100) {
      return deviceHeight;
    } else {
      return deviceHeight * height * 0.01;
    }
  }
}

toJsonColor(Color color) {
  return color.toHex(includeAlpha: true);
}

fromJsonColor(String hexString) {
  return Color(int.parse(hexString.replaceFirst('#', ''), radix: 16));
}

toJsonPadding(EdgeInsets padding) {
  return {"left": padding.left, "top": padding.top, "right": padding.right, "bottom": padding.bottom};
}

fromJsonPadding(Map padding) {
  return EdgeInsets.fromLTRB(padding['left'] ?? 0.0, padding['top'] ?? 0.0, padding['right'] ?? 0.0, padding['bottom'] ?? 0.0);
}

toJsonMargin(EdgeInsets margin) {
  return {"left": margin.left, "top": margin.top, "right": margin.right, "bottom": margin.bottom};
}

fromJsonMargin(Map margin) {
  return EdgeInsets.fromLTRB(margin['left'] ?? 0.0, margin['top'] ?? 0.0, margin['right'] ?? 0.0, margin['bottom'] ?? 0.0);
}

toJsonBorderRadius(BorderRadius borderRadius) {
  return {
    "topLeft": borderRadius.topLeft.x,
    "topRight": borderRadius.topRight.x,
    "bottomLeft": borderRadius.bottomLeft.x,
    "bottomRight": borderRadius.bottomRight.x,
  };
}

fromJsonBorderRadius(Map borderRadius) {
  return BorderRadius.only(
    topLeft: Radius.circular(borderRadius['topLeft'] ?? 0.0),
    topRight: Radius.circular(borderRadius['topRight'] ?? 0.0),
    bottomLeft: Radius.circular(borderRadius['bottomLeft'] ?? 0.0),
    bottomRight: Radius.circular(borderRadius['bottomRight'] ?? 0.0),
  );
}

toJsonTextAlign(TextAlign? textAlign) {
  if (textAlign == TextAlign.left) {
    return TextAlignTypeLeft;
  } else if (textAlign == TextAlign.center) {
    return TextAlignTypeCenter;
  } else if (textAlign == TextAlign.right) {
    return TextAlignTypeRight;
  } else if (textAlign == TextAlign.justify) {
    return TextAlignTypeJustify;
  }
}

fromJsonTextAlign(String? textAlign) {
  printLogData(textAlign);
  if (textAlign == TextAlignTypeLeft) {
    return TextAlign.left;
  } else if (textAlign == TextAlignTypeCenter) {
    return TextAlign.center;
  } else if (textAlign == TextAlignTypeRight) {
    return TextAlign.right;
  } else if (textAlign == TextAlignTypeJustify) {
    return TextAlign.justify;
  }
}

toJsonFontStyle(FontStyle? fontStyle) {
  if (fontStyle == FontStyle.normal) {
    return FontStyleNormal;
  } else if (fontStyle == FontStyle.italic) {
    return FontStyleItalic;
  }
}

fromJsonFontStyle(String? fontStyle) {
  if (fontStyle == FontStyleNormal) {
    return FontStyle.normal;
  } else if (fontStyle == FontStyleItalic) {
    return FontStyle.italic;
  }
}

toJsonListTileControlAffinity(ListTileControlAffinity? listTileControlAffinity) {
  if (listTileControlAffinity == ListTileControlAffinity.platform) {
    return ListTileControlAffinityPlatform;
  } else if (listTileControlAffinity == ListTileControlAffinity.leading) {
    return ListTileControlAffinityLeading;
  } else if (listTileControlAffinity == ListTileControlAffinity.trailing) {
    return ListTileControlAffinityTrailing;
  }
}

fromJsonListTileControlAffinity(String? listTileControlAffinity) {
  if (listTileControlAffinity == ListTileControlAffinityPlatform) {
    return ListTileControlAffinity.platform;
  } else if (listTileControlAffinity == ListTileControlAffinityLeading) {
    return ListTileControlAffinity.leading;
  } else if (listTileControlAffinity == ListTileControlAffinityTrailing) {
    return ListTileControlAffinity.trailing;
  }
}

String? getPaddingString(EdgeInsets? padding) {
  if (padding != null) {
    if (padding.left == padding.right && padding.left == padding.top && padding.left == padding.bottom) {
      return "EdgeInsets.all(${padding.left})";
    } else if (padding.left == padding.right && padding.top == padding.bottom) {
      return "EdgeInsets.symmetric(vertical: ${padding.top},horizontal:${padding.left})";
    } else {
      return "EdgeInsets.fromLTRB(${padding.left}, ${padding.top}, ${padding.right}, ${padding.bottom})";
    }
  } else {
    return "";
  }
}

String? getWidthString(double? width, String? widthType) {
  if (widthType == TypePX) {
    return '$width';
  } else if (widthType == TypePercentage) {
    if (width! >= 100) {
      return 'MediaQuery.of(context).size.width';
    } else {
      return 'MediaQuery.of(context).size.width * ${width * 0.01}';
    }
  } else {
    return "";
  }
}

String? getHeightString(double? height, String? heightType) {
  if (heightType == TypePX) {
    return '$height';
  } else if (heightType == TypePercentage) {
    if (height! >= 100) {
      return 'MediaQuery.of(context).size.height';
    } else {
      return 'MediaQuery.of(context).size.height * ${height * 0.01}';
    }
  } else {
    return "";
  }
}

String? getYoutubeVideoId(String url) {
  RegExp regExp = new RegExp(
    r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
    caseSensitive: false,
    multiLine: false,
  );
  final match = regExp.firstMatch(url)!.group(1);
  String? str = match;
  return str;
}

bool getValidUrl(String url) {
  bool validURL = Uri.parse(url).isAbsolute;
  if (validURL || url.isEmpty) {
    return true;
  } else {
    return false;
  }
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: 'images/flag/ic_us.png'),
    LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: 'images/flag/ic_india.png'),
    LanguageDataModel(id: 3, name: 'Arabic', languageCode: 'ar', fullLanguageCode: 'ar-AR', flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(id: 4, name: 'French', languageCode: 'fr', fullLanguageCode: 'fr-FR', flag: 'images/flag/ic_france.png'),
    LanguageDataModel(id: 5, name: 'Spanish', languageCode: 'es', fullLanguageCode: 'es-ES', flag: 'images/flag/ic_spain.png'),
    LanguageDataModel(id: 6, name: 'afrikaan', languageCode: 'af', fullLanguageCode: 'ar-AF', flag: 'images/flag/ic_south_africa.png'),
    LanguageDataModel(id: 7, name: 'German', languageCode: 'de', fullLanguageCode: 'de-DE', flag: 'images/flag/ic_germany.png'),
    LanguageDataModel(id: 8, name: 'Indonesian', languageCode: 'id', fullLanguageCode: 'id-ID', flag: 'images/flag/ic_indonesia.png'),
    LanguageDataModel(id: 9, name: 'Turkish', languageCode: 'tr', fullLanguageCode: 'tr-TR', flag: 'images/flag/ic_turkey.png'),
    LanguageDataModel(id: 10, name: 'Vietnam', languageCode: 'vi', fullLanguageCode: 'vi-VI', flag: 'images/flag/ic_vitnam.png'),
    LanguageDataModel(id: 11, name: 'Dutch', languageCode: 'nl', fullLanguageCode: 'nl-NL', flag: 'images/flag/ic_dutch.png'),
    LanguageDataModel(id: 12, name: 'Gujarati', languageCode: 'gu', fullLanguageCode: 'gu-IN', flag: 'images/flag/ic_india.png'),
    LanguageDataModel(id: 13, name: 'Portugal', languageCode: 'pt', fullLanguageCode: 'pt-PT', flag: 'images/flag/ic_portugal.png'),
  ];
}

getHeaderLogo() {
  if (appStore.isDarkMode) {
    return "images/flutterVizlogo.png";
  } else {
    return "images/flutterVizlogo.png";
  }
}

String get getAppLogo {
  if (appStore.isDarkMode) {
    return "images/flutterViz_white.png";
  } else {
    return "images/flutterViz.png";
  }
}

Widget profileImage(double size) {
  if (appStore.profileImage.isNotEmpty) {
    return commonCachedNetworkImage(
      appStore.profileImage,
      fit: BoxFit.cover,
      height: size,
      width: size,
      placeHolderImage: 'images/user_place_holder.png',
    );
  } else {
    return Image.asset('images/user.jpg', fit: BoxFit.cover, height: size, width: size);
  }
}

String getDateFormatted(DateTime dateTime, {String dateFormat = DATE_FORMAT_1}) {
  return DateFormat(dateFormat).format(dateTime);
}

int get perPageCount => getIntAsync(PER_PAGE_ITEM_KEY, defaultValue: PER_PAGE_ITEM);

Future<void> copyToClipboard({String message = 'copied to clipboard', String? copyValue}) {
  return Clipboard.setData(ClipboardData(text: copyValue.toString())).then((_) {
    getToast(message);
  });
}

Future<DateTimeRange?> dateTimeRangePicker(BuildContext context, {DateTimeRange? initialDateRange}) async {
  return await showDateRangePicker(
    context: context,
    initialDateRange: initialDateRange,
    firstDate: DateTime(DateTime.now().year - 5),
    lastDate: DateTime.now(),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.dark(
            primary: btnBackgroundColor,
            onPrimary: Colors.white,
            surface: btnBackgroundColor,
            onSurface: appStore.isDarkMode ? darkModeSubTextColor : Colors.black,
          ),
          dialogTheme: DialogThemeData(backgroundColor: darkModeSecondaryBackgroundDark),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400.0, maxHeight: 500),
            child: child,
          ),
        ),
      );
    },
  );
}