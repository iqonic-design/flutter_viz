import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../main.dart';
import 'AppColors.dart';
import 'AppCommon.dart';

class CustomTheme extends StatelessWidget {
  final Widget child;

  CustomTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: colorPrimary,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white),
        iconTheme: IconThemeData(color: scaffoldSecondaryDark),
        textTheme: TextTheme(titleLarge: TextStyle()),
        unselectedWidgetColor: Colors.white,
        dividerColor: Colors.transparent,
        hintColor: Colors.white, dialogTheme: DialogThemeData(backgroundColor: Colors.white),
      ),
      child: child,
    );
  }
}

Widget outLineIconButton(BuildContext context, Widget icon) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 16),
      child: icon,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
        border: Border.all(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR),
        color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
      ),
    ),
  );
}

Widget runIcon() {
  return Icon(Icons.play_arrow, color: appStore.isDarkMode ? Colors.white : Colors.black54, size: btnIconSize);
}

Widget editIcon(BuildContext context, Function()? onTap) {
  return IconButton(
      splashRadius: 20.0,
      icon: SvgPicture.asset(
        "${WidgetIconPath}edit.svg",
        colorFilter: ColorFilter.mode(context.iconColor, BlendMode.srcIn),
        height: btnIconSize,
        width: btnIconSize,
      ),
      onPressed: onTap);
}

Widget copyToClipBoardIcon(BuildContext context, Function()? onTap) {
  return IconButton(
      splashRadius: 20.0,
      icon: SvgPicture.asset(
        "${WidgetIconPath}clipboard.svg",
        colorFilter: ColorFilter.mode(context.iconColor, BlendMode.srcIn),
        height: btnIconSize,
        width: btnIconSize,
      ),
      onPressed: onTap);
}

Widget deleteIcon(BuildContext context) {
  return SvgPicture.asset(
    "${WidgetIconPath}Delete.svg",
    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
    height: btnIconSize,
    width: btnIconSize,
  );
}

Widget deleteIconOutline(BuildContext context) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      margin: EdgeInsets.only(right: 16),
      alignment: Alignment.center,
      child: deleteIcon(context),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
        border: Border.all(color: appStore.isDarkMode ? Colors.transparent : Colors.red),
        color: Colors.red.withValues(alpha: 0.1),
      ),
    ),
  );
}

Widget cloneIcon(BuildContext context) {
  return Icon(
    Icons.content_copy,
    color: appStore.isDarkMode ? Colors.white : Colors.black54,
    size: btnIconSize,
  );
}

Widget sourceCodeIcon(BuildContext context) {
  return Icon(
    Icons.code,
    color: appStore.isDarkMode ? Colors.white : Colors.black54,
    size: btnIconSize,
  );
}

Widget clearIcon(BuildContext context) {
  return Icon(
    Icons.clear_all,
    color: appStore.isDarkMode ? Colors.white : Colors.black54,
    size: btnIconSize,
  );
}

Widget closeIcon() {
  return tooltipView(
    message: language!.clear,
    child: SvgPicture.asset(
      "${WidgetIconPath}Close.svg",
      colorFilter: ColorFilter.mode(appStore.isDarkMode ? Colors.white : menuIconColor, BlendMode.srcIn),
    ),
  );
}

Widget unLockIcon() {
  return tooltipView(
    message: language!.unlock,
    child: SvgPicture.asset(
      "${WidgetIconPath}UnLock.svg",
      colorFilter: ColorFilter.mode(appStore.isDarkMode ? Colors.white : menuIconColor, BlendMode.srcIn),
      height: btnIconSize,
      width: btnIconSize,
    ),
  );
}

Widget lockIcon() {
  return tooltipView(
    message: language!.lock,
    child: SvgPicture.asset(
      "${WidgetIconPath}Lock.svg",
      colorFilter: ColorFilter.mode(appStore.isDarkMode ? Colors.white : menuIconColor, BlendMode.srcIn),
      height: btnIconSize,
      width: btnIconSize,
    ),
  );
}

Widget defaultRowWidget({required String title}) {
  return Container(
    width: 80,
    height: 30,
    alignment: Alignment.center,
    color: grey.withValues(alpha: 0.2),
    child: Text(title, style: secondaryTextStyle(size: 10), textAlign: TextAlign.center),
  );
}

Widget defaultColumnWidget({required String title}) {
  return Container(
    key: ObjectKey("DummyKey"),
    width: 150,
    height: 30,
    alignment: Alignment.center,
    color: grey.withValues(alpha: 0.2),
    child: Text(title, style: secondaryTextStyle(), textAlign: TextAlign.center),
  );
}

Widget loadingAnimation({Key? key, double widgetHeight = 150, double widgetWidth = 150, bool isWhite = false}) {
  return Container(
    key: key,
    width: widgetWidth,
    height: widgetHeight,
    child: isWhite ? Lottie.asset('images/loader_white.json').center() : Lottie.asset('images/loader.json').center(),
  );
}

Widget defaultListWidget({required String title, required String subTitle}) {
  return Container(
    padding: EdgeInsets.all(8),
    color: Colors.grey.withValues(alpha: 0.2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: primaryTextStyle(size: 14)),
        Text(subTitle, style: secondaryTextStyle(size: 12)),
      ],
    ),
  );
}

InputDecoration commonInputDecoration(
    {String? hintName, String? labelName, FloatingLabelAlignment floatingLabelAlignment = FloatingLabelAlignment.start, Widget? suffixWidget}) {
  return InputDecoration(
    counterStyle: secondaryTextStyle(size: 10),
    isDense: true,
    border: OutlineInputBorder(borderSide: BorderSide(color: COMMON_BORDER_COLOR), borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
    hintText: hintName.validate(),
    labelText: labelName.validate(),
    labelStyle: TextStyle(fontSize: commonSubTextSize, color: Colors.grey),
    floatingLabelAlignment: floatingLabelAlignment,
    filled: true,
    fillColor: appStore.isDarkMode ? Colors.transparent : centerBackgroundColor,
    counterText: "",
    hintStyle: TextStyle(fontSize: commonSubTextSize, color: Colors.grey),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor, width: 0.5),
        borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: COMMON_BORDER_COLOR, width: 0.5), borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 0.5), borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
    disabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: COMMON_BORDER_COLOR, width: 0.5), borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor, width: 0.5),
        borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS)),
    suffix: suffixWidget,
  );
}

/// Show tooltip view to user for better understanding of view
Widget tooltipView({Widget? child, required String message}) {
  return Tooltip(
    /* showDuration: Duration(seconds: 5),*/
    padding: EdgeInsets.all(5),
    textStyle: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : menuIconColor),
    message: message,
    child: child,
  );
}

Widget getHeaderLogoImage() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      /// HEADER COMPONENT WELCOME SCREEN OPEN
      Image.asset(
        getHeaderLogo(),
        height: 40,
        width: 60,
      ),
      Text('v $VERSION_NAME', style: secondaryTextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : Colors.grey)),
    ],
  ).expand();
}

Widget getProfileWidget(BuildContext context) {
  return Observer(
    builder: (context) {
      return PopupMenuButton<int>(
        tooltip: language!.profile,
        color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : Colors.white,
        child: profileImage(35).cornerRadiusWithClipRRect(20),
        initialValue: 0,
        onSelected: (value) async {
          if (value == 0) {
            appStore.selectedMenu = PROFILE_INDEX;
          } else if (value == 1) {
            logoutConfirmationDialog(context);
          }
        },
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(value: 0, child: Text(language!.profile, style: primaryTextStyle())),
            PopupMenuItem<int>(value: 1, child: Text(language!.logout, style: primaryTextStyle())),
          ];
        },
      );
    },
  );
}

Widget getTotalCountWidget(BuildContext context, {required String icon, required String title, int? total, Color? bgColor}) {
  return Container(
    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(COMMON_BORDER_RADIUS)), boxShadow: defaultBoxShadow()),
    width: 260,
    padding: EdgeInsets.all(22),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon, height: 30, color: btnBackgroundColor),
        16.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: primaryTextStyle(size: 16)),
            8.height,
            Text(total.toString(), style: boldTextStyle(size: 26)),
          ],
        ),
      ],
    ),
  );
}

Widget profilePersonalInfoWidget({IconData? icon, String? imageUrl, required String title, required String titleValue, bool isSocial = false}) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isSocial
            ? ClipOval(
                child: Image.asset(
                  imageUrl!,
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              )
            : Icon(icon, color: iconColor, size: btnIconSize),
        8.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: secondaryTextStyle(size: 12)),
            4.height,
            Text(getValue(titleValue), style: boldTextStyle(size: 12)),
          ],
        ).expand(),
      ],
    ).onTap(() {
      if (isSocial && titleValue.isNotEmpty) {
        launchUrl(Uri.parse(titleValue));
      }
    }),
  );
}

Widget editProfileComponentWidget(
    {required String title,
    TextEditingController? controller,
    required TextFieldType textFieldType,
    bool enable = true,
    String? hintText,
    String? Function(String?)? onValidate,
    TextInputType? textInputType,
    Function? onTap,
    IconData? suffixIcon,
    bool? readOnly}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: primaryTextStyle(size: 12)),
      8.height,
      AppTextField(
        controller: controller,
        textFieldType: textFieldType,
        decoration: commonInputDecoration(hintName: hintText),
        textStyle: primaryTextStyle(),
        keyboardType: textInputType,
        autoFocus: false,
        enabled: enable,
        validator: onValidate,
        onTap: onTap as dynamic Function()?,
        readOnly: readOnly ?? false,
        suffix: Icon(suffixIcon, color: btnBackgroundColor),
      ),
    ],
  );
}

getSnackBarWidget(String message) {
  final snackBar = SnackBar(
    //backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : Color(0xffebeefc),
    backgroundColor: Colors.red.shade100,
    elevation: 0,
    padding: EdgeInsets.all(16),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your recent action could cause crash error, hence we have prohibited it.',
              //style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor),
              style: primaryTextStyle(color: Colors.red),
            ),
            8.height,
            Text(
              message,
              //style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor),
              style: primaryTextStyle(color: Colors.red),
            ),
          ],
        ).expand(),
        50.width,
        Container(
          child: Icon(Icons.close, color: Colors.red),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ).onTap(() {
          ScaffoldMessenger.of(getContext).clearSnackBars();
        }),
      ],
    ),
    duration: Duration(seconds: 15),
  );
  ScaffoldMessenger.of(getContext).showSnackBar(snackBar);
}

Widget addScreenDialogWidget(BuildContext context, {required String title, String? hintName, TextEditingController? controller, Function? onSave}) {
  return Container(
    width: context.width() * 0.3,
    height: 200,
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: boldTextStyle(size: 20)),
                CloseButton(),
              ],
            ),
            30.height,
            AppTextField(
              controller: controller,
              textFieldType: TextFieldType.NAME,
              decoration: commonInputDecoration(hintName: hintName),
              textStyle: primaryTextStyle(),
              autoFocus: false,
              maxLines: 1,
            ),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                dialogGrayBorderButton(
                    text: language!.cancel,
                    onTap: () {
                      finish(context);
                    }),
                16.width,
                dialogPrimaryColorButton(
                  text: language!.save,
                  onTap: onSave,
                ),
              ],
            ),
          ],
        ),
        Observer(builder: (_) => loadingAnimation().visible(appStore.isLoading)).center(),
      ],
    ),
  );
}

Widget noProjectFoundWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(language!.noProjectFound, style: boldTextStyle(size: 22)).center(),
      8.height,
      Text(language!.createNewProjectToGetStarted, style: secondaryTextStyle()),
    ],
  );
}

BoxShadow commonCardBoxShadow() {
  return BoxShadow(
    blurRadius: 12.0,
    offset: Offset(3.0, 3.0),
    color: Colors.grey.withValues(alpha: 0.2),
  );
}

BoxShadow commonCardBoxShadowDarkMode() {
  return BoxShadow(
    color: Colors.grey.withValues(alpha: 0.1),
    blurRadius: 6,
  );
}

///elevation button with icon
elevationButtonWithIcon({bool isHovered = false, Function? onPressed, String toolTipMessage = '', IconData? icon, required String title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: isHovered ? primaryButtonHoverColor : btnBackgroundColor,
      elevation: COMMON_BUTTON_ELEVATION,
      padding: EdgeInsets.symmetric(horizontal: COMMON_HORIZONTAL_PADDING, vertical: COMMON_VERTICAL_PADDING),
      shadowColor: primaryButtonShadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS)),
    ),
    child: tooltipView(
      message: toolTipMessage,
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: btnIconSize),
          6.width,
          Text(title, style: TextStyle(color: btnWhiteTextColor, fontSize: btnTextSize)),
        ],
      ),
    ),
    onPressed: onPressed as void Function()?,
  );
}

///elevation button with text
elevationButtonWithText({bool isHovered = false, Function? onPressed, String toolTipMessage = '', String? image, required String title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: isHovered ? primaryButtonHoverColor : btnBackgroundColor,
      elevation: COMMON_BUTTON_ELEVATION,
      padding: EdgeInsets.symmetric(horizontal: COMMON_HORIZONTAL_PADDING, vertical: COMMON_VERTICAL_PADDING),
      shadowColor: primaryButtonShadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS)),
    ),
    child: tooltipView(
      message: toolTipMessage,
      child: Row(
        children: [
          SvgPicture.asset("images/svgicons/project_white.svg", width: btnIconSize, height: btnIconSize),
          6.width,
          Text(title, style: TextStyle(color: btnWhiteTextColor, fontSize: btnTextSize)),
        ],
      ),
    ),
    onPressed: onPressed as void Function()?,
  );
}

///elevation high light color button
Widget highLightIcon(bool isHovered, {IconData? icon}) {
  return Icon(
    icon,
    color: isHovered
        ? btnBackgroundColor
        : appStore.isDarkMode
            ? Colors.white
            : btnBackgroundColor,
    size: btnIconSize,
  );
}

elevationButtonHighLightColor({bool isHovered = false, Function? onPressed, String toolTipMessage = '', Widget? child}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: COMMON_HORIZONTAL_PADDING, vertical: COMMON_VERTICAL_PADDING), backgroundColor: isHovered
            ? highLightButtonHoverColor
            : appStore.isDarkMode
                ? darkModeSecondaryBackgroundDark
                : leftExpansionTileBackgroundColor,
        elevation: COMMON_BUTTON_ELEVATION,
        shadowColor: appStore.isDarkMode ? highLightButtonDarkShadow : highLightButtonLightShadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS)),
      ),
      child: tooltipView(message: toolTipMessage, child: child),
      onPressed: onPressed as void Function()?);
}

///app button with primary color
Widget dialogPrimaryColorButton({Key? key, String text = '', Function? onTap, Widget? child, double height = 45, double width = 120}) {
  return AppButton(
    key: key,
    height: height,
    width: width,
    text: text,
    elevation: COMMON_BUTTON_ELEVATION,
    hoverColor: primaryButtonHoverColor,
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS)),
    padding: EdgeInsets.symmetric(horizontal: COMMON_HORIZONTAL_PADDING, vertical: COMMON_VERTICAL_PADDING),
    color: btnBackgroundColor,
    textStyle: TextStyle(color: btnWhiteTextColor, fontSize: btnTextSize),
    onTap: onTap,
    child: child,
  );
}

///dialog app button with gray border color
dialogGrayBorderButton({String text = '', Function? onTap, double height = 45, double width = 120}) {
  return AppButton(
    height: height,
    width: width,
    text: text,
    color: Colors.white,
    elevation: 0,
    padding: EdgeInsets.symmetric(horizontal: COMMON_HORIZONTAL_PADDING, vertical: COMMON_VERTICAL_PADDING),
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
      side: BorderSide(color: COMMON_BORDER_COLOR),
    ),
    textStyle: TextStyle(color: Colors.black, fontSize: btnTextSize),
    onTap: onTap,
  );
}

/// Admin Panel Pagination View
Widget paginationWidget(int index, int selectedIndex) {
  return Container(
    width: 30,
    height: 30,
    margin: EdgeInsets.only(left: 8),
    alignment: Alignment.center,
    decoration: boxDecorationWithRoundedCorners(
      borderRadius: BorderRadius.all(Radius.circular(COMMON_BUTTON_BORDER_RADIUS)),
      backgroundColor: selectedIndex == index ? btnBackgroundColor : Colors.grey,
    ),
    child: Text("${index + 1}", style: boldTextStyle(color: Colors.white)),
  );
}

/// Admin add Button
Widget addButtonRounded() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Icon(Icons.add, color: Colors.white, size: btnIconSize),
    decoration: BoxDecoration(shape: BoxShape.circle, color: btnBackgroundColor),
  );
}

Widget darkModeSwitchWidget() {
  /// edit profile api call
  Future editProfileApi(int themeMode) async {
    Map req = {
      'email': getStringAsync(USER_EMAIL),
      'user_id': getIntAsync(USER_ID),
      'is_darkmode': themeMode,
    };

    await updateProfile(req).then((value) {
      printLogData("profile data$req");
      log(value.message);
    }).catchError((e) {
      log(e.toString());
    });
  }

  return FlutterSwitch(
    value: appStore.isDarkMode,
    width: 55,
    height: 30,
    toggleSize: 25,
    borderRadius: 30.0,
    padding: 4.0,
    activeIcon: ImageIcon(AssetImage('images/moon.png'), color: Colors.white, size: 30),
    inactiveIcon: ImageIcon(AssetImage('images/sun.png'), color: Colors.white, size: 30),
    activeColor: btnBackgroundColor,
    activeToggleColor: Colors.black,
    inactiveToggleColor: Colors.orangeAccent,
    inactiveColor: leftExpansionTileBackgroundColor,
    onToggle: (value) {
      appStore.setDarkMode(value);
      setValue(THEME_MODE_INDEX, value ? ThemeModeDark : ThemeModeLight);
      editProfileApi(value ? ThemeModeDark : ThemeModeLight);
    },
  );
}

Widget commonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  String? placeHolderImage,
}) {
  if (url.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url!,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        log(d);
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius, placeHolderImage: placeHolderImage);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius, placeHolderImage: placeHolderImage);
      },
    );
  } else {
    return Image.asset(
      url!,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
    ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius, String? placeHolderImage}) {
  return Image.asset(
    placeHolderImage ?? 'images/placeholder.jpg',
    height: height,
    width: width,
    fit: fit ?? BoxFit.cover,
    alignment: alignment ?? Alignment.center,
  ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget versionNameWidget() {
  return Container(
    child: Text('v $VERSION_NAME', style: secondaryTextStyle(size: 16)),
    width: 300,
    alignment: Alignment.topRight,
  );
}