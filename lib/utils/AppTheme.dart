import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: colorPrimary,
    scaffoldBackgroundColor: colorPrimary,
    fontFamily: font,
    cardColor: scaffoldSecondaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.black),
    dialogBackgroundColor: colorPrimary,
    unselectedWidgetColor: Colors.black,
    dividerColor: Colors.white,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkModePrimaryColorBackground,
    scaffoldBackgroundColor: darkModePrimaryColorBackground,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: darkModeSecondaryBackgroundDark),
    iconTheme: IconThemeData(color: Colors.white),
    cardColor: darkModeSecondaryBackgroundDark,
    fontFamily: font,
    dialogBackgroundColor: darkModeSecondaryBackgroundDark,
    unselectedWidgetColor: Colors.grey,
    dividerColor: Colors.white,
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
