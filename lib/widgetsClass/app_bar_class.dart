import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class AppBarClass {
  /// Shadow below the app bar
  double? elevation;

  /// centerTitle of Text
  bool? centerTitle;

  /// The text to display of AppBar.
  String? text;

  /// thickness to use text
  String? fWeight;

  /// drawing the letters
  FontStyle? fontStyle;

  /// fontSize of Text
  double? fontSize;

  /// Font Color
  Color? textColor;

  ///BackGround Color For AppBar
  Color? backgroundColor;

  /// Icon
  dynamic iconDataJson;

  /// Icon Color
  Color? iconColor;

  /// Size of icon
  double? iconSize;

  bool? isShowIconDefault;

  ///Action First Icon
  dynamic actionFirstIconDataJson;
  Color? actionFirstIconColor;
  double? actionFirstIconSize;
  EdgeInsets? actionFirstIconPadding;

  ///Action Second Icon
  dynamic actionSecondIconDataJson;
  Color? actionSecondIconColor;
  double? actionSecondIconSize;
  EdgeInsets? actionSecondIconPadding;

  /// Border Width
  double? borderWidth;

  /// Border Radius
  BorderRadius? borderRadius;

  /// Border Color
  Color? borderColor;

  AppBarClass({
    this.elevation,
    this.centerTitle,
    this.text,
    this.fWeight,
    this.fontStyle,
    this.fontSize,
    this.textColor,
    this.backgroundColor,
    this.iconDataJson,
    this.iconColor,
    this.iconSize,
    this.isShowIconDefault = true,
    this.actionFirstIconDataJson,
    this.actionFirstIconColor,
    this.actionFirstIconSize,
    this.actionSecondIconDataJson,
    this.actionSecondIconColor,
    this.actionSecondIconSize,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.actionFirstIconPadding,
    this.actionSecondIconPadding,
  });

  AppBarClass.fromJson(Map<String, dynamic> json) {
    elevation = json['elevation'] != null ? json['elevation'] : DEFAULT_APPBAR_ELEVATION;
    centerTitle = json['centerTitle'] != null ? json['centerTitle'] : false;
    text = json['text'] != null ? json['text'] : "AppBar";
    fWeight = json['fWeight'] != null ? json['fWeight'] : FontWeightTypeNormal;
    fontStyle = json['fontStyle'] != null ? fromJsonFontStyle(json['fontStyle']) : FontStyle.normal;
    fontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_FONT_SIZE;
    textColor = json['textColor'] != null ? fromJsonColor(json['textColor']) : DEFAULT_TEXT_COLOR;
    backgroundColor = json['backgroundColor'] != null ? fromJsonColor(json['backgroundColor']) : COMMON_BG_COLOR;
    iconDataJson = json['iconDataJson'] != null
        ? json['iconDataJson']
        : {"iconName": appStore.drawerClass != null ? "menu" : "arrow_back", "codePoint": appStore.drawerClass != null ? 58332 : 57490, "fontFamily": "MaterialIcons"};
    iconColor = json['iconColor'] != null ? fromJsonColor(json['iconColor']) : DEFAULT_ICON_COLOR;
    iconSize = json['iconSize'] != null ? json['iconSize'] : DEFAULT_ICON_SIZE;
    isShowIconDefault = json['isShowIconDefault'] != null ? json['isShowIconDefault'] : true;
    actionFirstIconDataJson = json['actionFirstIconDataJson'] != null ? json['actionFirstIconDataJson'] : null;
    actionFirstIconColor = json['actionFirstIconColor'] != null ? fromJsonColor(json['actionFirstIconColor']) : DEFAULT_ICON_COLOR;
    actionFirstIconSize = json['actionFirstIconSize'] != null ? json['actionFirstIconSize'] : DEFAULT_ICON_SIZE;
    actionFirstIconPadding = json['actionFirstIconPadding'] != null ? fromJsonPadding(json['actionFirstIconPadding']) : EdgeInsets.zero;

    actionSecondIconDataJson = json['actionSecondIconDataJson'] != null ? json['actionSecondIconDataJson'] : null;
    actionSecondIconColor = json['actionSecondIconColor'] != null ? fromJsonColor(json['actionSecondIconColor']) : DEFAULT_ICON_COLOR;
    actionSecondIconSize = json['actionSecondIconSize'] != null ? json['actionSecondIconSize'] : DEFAULT_ICON_SIZE;
    actionSecondIconPadding = json['actionSecondIconPadding'] != null ? fromJsonPadding(json['actionSecondIconPadding']) : EdgeInsets.zero;

    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.zero;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : TRANSPARENT_COLOR;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elevation != null) {
      data['elevation'] = this.elevation;
    }
    if (this.centerTitle != null) {
      data['centerTitle'] = this.centerTitle;
    }
    if (this.text != null) {
      data['text'] = this.text;
    }
    if (this.fWeight != null) {
      data['fWeight'] = this.fWeight;
    }
    if (this.fontStyle != null) {
      data['fontStyle'] = toJsonFontStyle(this.fontStyle);
    }
    if (this.fontSize != null) {
      data['fontSize'] = this.fontSize;
    }
    if (this.textColor != null) {
      data['textColor'] = toJsonColor(this.textColor!);
    }
    if (this.backgroundColor != null) {
      data['backgroundColor'] = toJsonColor(this.backgroundColor!);
    }
    if (this.iconDataJson != null) {
      data['iconDataJson'] = this.iconDataJson;
    }
    if (this.iconColor != null) {
      data['iconColor'] = toJsonColor(this.iconColor!);
    }
    if (this.iconSize != null) {
      data['iconSize'] = this.iconSize;
    }
    if (this.isShowIconDefault != null) {
      data['isShowIconDefault'] = this.isShowIconDefault;
    }
    if (this.actionFirstIconDataJson != null) {
      data['actionFirstIconDataJson'] = this.actionFirstIconDataJson;
    }
    if (this.actionFirstIconColor != null) {
      data['actionFirstIconColor'] = toJsonColor(this.actionFirstIconColor!);
    }
    if (this.actionFirstIconSize != null) {
      data['actionFirstIconSize'] = this.actionFirstIconSize;
    }
    if (this.actionFirstIconPadding != null) {
      data['actionFirstIconPadding'] = toJsonPadding(this.actionFirstIconPadding!);
    }
    if (this.actionSecondIconDataJson != null) {
      data['actionSecondIconDataJson'] = this.actionSecondIconDataJson;
    }
    if (this.actionSecondIconColor != null) {
      data['actionSecondIconColor'] = toJsonColor(this.actionSecondIconColor!);
    }
    if (this.actionSecondIconSize != null) {
      data['actionSecondIconSize'] = this.actionSecondIconSize;
    }
    if (this.actionSecondIconPadding != null) {
      data['actionSecondIconPadding'] = toJsonPadding(this.actionSecondIconPadding!);
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.borderColor != null) {
      data['borderColor'] = toJsonColor(this.borderColor!);
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
    }
    return data;
  }

  Widget actionFirstIcon() {
    return actionFirstIconDataJson != null
        ? (getPadding(actionFirstIconPadding)
            ? Padding(
                padding: actionFirstIconPadding!,
                child: Icon(
                  IconData(actionFirstIconDataJson['codePoint'], fontFamily: actionFirstIconDataJson['fontFamily']),
                  color: actionFirstIconColor ?? DEFAULT_ICON_COLOR,
                  size: actionFirstIconSize ?? DEFAULT_ICON_SIZE,
                ),
              )
            : Icon(
                IconData(actionFirstIconDataJson['codePoint'], fontFamily: actionFirstIconDataJson['fontFamily']),
                color: actionFirstIconColor ?? DEFAULT_ICON_COLOR,
                size: actionFirstIconSize ?? DEFAULT_ICON_SIZE,
              ))
        : SizedBox();
  }

  Widget actionSecondIcon() {
    return actionSecondIconDataJson != null
        ? (getPadding(actionSecondIconPadding)
            ? Padding(
                padding: actionSecondIconPadding!,
                child: Icon(
                  IconData(actionSecondIconDataJson['codePoint'], fontFamily: actionSecondIconDataJson['fontFamily']),
                  color: actionSecondIconColor ?? DEFAULT_ICON_COLOR,
                  size: actionSecondIconSize ?? DEFAULT_ICON_SIZE,
                ),
              )
            : Icon(
                IconData(actionSecondIconDataJson['codePoint'], fontFamily: actionSecondIconDataJson['fontFamily']),
                color: actionSecondIconColor ?? DEFAULT_ICON_COLOR,
                size: actionSecondIconSize ?? DEFAULT_ICON_SIZE,
              ))
        : SizedBox();
  }

  Widget getAppBarWidget() {
    return CustomAppBar(
      onTap: () {
        appStore.selectAppbar();
      },
      appBar: AppBar(
        elevation: elevation ?? DEFAULT_APPBAR_ELEVATION,
        centerTitle: centerTitle ?? false,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor ?? COMMON_BG_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
          side: BorderSide(color: borderColor ?? TRANSPARENT_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
        ),
        title: Text(
          text ?? "AppBar",
          style: TextStyle(
            fontWeight: getFontWeight(fWeight) ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.normal,
            fontSize: fontSize ?? DEFAULT_FONT_SIZE,
            color: textColor ?? DEFAULT_TEXT_COLOR,
          ),
        ),
        leading: isShowIconDefault!
            ? Icon(
                iconDataJson != null
                    ? IconData(iconDataJson['codePoint'], fontFamily: iconDataJson['fontFamily'])
                    : IconData(appStore.drawerClass != null ? 58332 : 57490, fontFamily: 'MaterialIcons'),
                color: iconColor ?? DEFAULT_ICON_COLOR,
                size: iconSize ?? DEFAULT_ICON_SIZE,
              ).onTap(() {
                appStore.scaffold_key!.currentState!.openDrawer();
              })
            : null,
        actions: [
          actionFirstIcon(),
          8.width,
          actionSecondIcon(),
        ],
      ),
    );
  }

  String actionFirstIconString() {
    if (actionFirstIconDataJson != null) {
      String firstIconString = "Icon(Icons.${actionFirstIconDataJson['iconName']},color:${actionFirstIconColor ?? DEFAULT_ICON_COLOR},size:${actionFirstIconSize ?? DEFAULT_ICON_SIZE}),\n";
      if (getPadding(actionFirstIconPadding)) {
        return "Padding(\n"
            "padding:${getPaddingString(actionFirstIconPadding)},\n"
            "child:$firstIconString"
            "),\n";
      } else {
        return firstIconString;
      }
    } else {
      return "";
    }
  }

  actionSecondIconString() {
    if (actionSecondIconDataJson != null) {
      String secondIconString = "Icon(Icons.${actionSecondIconDataJson['iconName']},color:${actionSecondIconColor ?? DEFAULT_ICON_COLOR},size:${actionSecondIconSize ?? DEFAULT_ICON_SIZE}),\n";
      if (getPadding(actionSecondIconPadding)) {
        return "Padding(\n"
            "padding:${getPaddingString(actionSecondIconPadding)},\n"
            "child:$secondIconString"
            "),\n";
      } else {
        return secondIconString;
      }
    } else {
      return "";
    }
  }

  getAppBarString() {
    return "\nAppBar(\n"
        "elevation:${elevation ?? DEFAULT_APPBAR_ELEVATION},\n"
        "centerTitle:${centerTitle ?? false},\n"
        "automaticallyImplyLeading: false,\n"
        "backgroundColor:${backgroundColor ?? COMMON_BG_COLOR},\n"
        "shape:RoundedRectangleBorder(\n"
        "borderRadius:${borderRadius ?? BorderRadius.zero},\n"
        "${(borderColor ?? TRANSPARENT_COLOR).alpha != 0 ? 'side: BorderSide(color:${borderColor ?? TRANSPARENT_COLOR}, width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
        "),\n"
        "${text != "" ? "title:Text(\n"
            "\"${getDollarString(text ?? "AppBar")}\",\n"
            "style:TextStyle(\n"
            "fontWeight:${getFontWeight(fWeight) ?? FontWeight.normal},\n"
            "fontStyle:${fontStyle ?? FontStyle.normal},\n"
            "fontSize:${fontSize ?? DEFAULT_FONT_SIZE},\n"
            "color:${textColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n"
            "),\n" : ""}"
        "${isShowIconDefault! ? "leading: Icon(\n"
            "${iconDataJson != null ? 'Icons.${iconDataJson['iconName']}' : 'Icons.${appStore.drawerClass != null ? "menu" : "arrow_back"}'},\n"
            "color:${iconColor ?? DEFAULT_ICON_COLOR},\n"
            "size:${iconSize ?? DEFAULT_ICON_SIZE},\n"
            "),\n" : ""}"
        "${actionFirstIconDataJson == null && actionSecondIconDataJson == null ? '' : "actions:[\n"
            "${actionFirstIconString()}"
            "${actionSecondIconString()}"
            "],\n"}"
        ")";
  }

  /// For view code
  getCodeAsString() {
    return getAppBarString();
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  final AppBar? appBar;

  const CustomAppBar({Key? key, this.onTap, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: appBar);
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
