import 'package:flutter_viz/externalClasses/flutterViz_drawer.dart';
import 'package:flutter_viz/externalClasses/flutterViz_drawerItem_model.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/drawer_Item_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class LeftDrawerClass {
  /// Elevation
  double? elevation;

  /// Header Color
  Color? headerColor;

  /// Profile Image Path
  String? profileImagePath;

  /// Profile Image Type
  String? profileImageType;

  /// Name text
  String? name;

  /// Email Text
  String? email;

  /// Name TextStyle
  String? nameFontWeight;
  FontStyle? nameFontStyle;
  Color? nameFontColor;

  /// Email TextStyle
  String? emailFontWeight;
  FontStyle? emailFontStyle;
  Color? emailFontColor;

  /// Drawer Items style
  Color? iconColor;
  double? iconSize;
  String? labelFontWeight;
  FontStyle? labelFontStyle;
  double? labelFontSize;
  Color? labelFontColor;

  /// Drawer items
  List<DrawerItemModel?> drawerItems = [];

  LeftDrawerClass(
      {this.elevation,
      this.headerColor,
      this.profileImagePath,
      this.profileImageType = ImageTypeNetwork,
      this.name,
      this.email,
      this.nameFontWeight,
      this.nameFontStyle,
      this.nameFontColor,
      this.emailFontWeight,
      this.emailFontStyle,
      this.emailFontColor,
      this.iconColor,
      this.iconSize,
      this.labelFontColor,
      this.labelFontSize,
      this.labelFontStyle,
      this.labelFontWeight});

  LeftDrawerClass.fromJson(Map<String, dynamic> json) {
    elevation = json['elevation'] != null ? json['elevation'] : DEFAULT_DRAWER_ELEVATION;
    headerColor = json['headerColor'] != null ? fromJsonColor(json['headerColor']) : COMMON_BG_COLOR;
    profileImagePath = json['profileImagePath'] != null ? json['profileImagePath'] : (json['profileImageType'] == ImageTypeNetwork ? DEFAULT_DRAWER_NETWORK_IMAGE : DEFAULT_DRAWER_ASSET_IMAGE);
    profileImageType = json['profileImageType'] != null ? json['profileImageType'] : ImageTypeNetwork;
    name = json['name'] != null ? json['name'] : DUMMY_USER_NAME;
    nameFontWeight = json['nameFontWeight'] != null ? json['nameFontWeight'] : FontWeightTypeNormal;
    nameFontStyle = json['nameFontStyle'] != null ? fromJsonFontStyle(json['nameFontStyle']) : FontStyle.normal;
    nameFontColor = json['nameFontColor'] != null ? fromJsonColor(json['nameFontColor']) : DEFAULT_DRAWER_FONT_COLOR;
    email = json['email'] != null ? json['email'] : DUMMY_USER_EMAIL;
    emailFontWeight = json['emailFontWeight'] != null ? json['emailFontWeight'] : FontWeightTypeNormal;
    emailFontStyle = json['emailFontStyle'] != null ? fromJsonFontStyle(json['emailFontStyle']) : FontStyle.normal;
    emailFontColor = json['emailFontColor'] != null ? fromJsonColor(json['emailFontColor']) : DEFAULT_DRAWER_FONT_COLOR;
    iconColor = json['iconColor'] != null ? fromJsonColor(json['iconColor']) : DEFAULT_ICON_COLOR;
    iconSize = json['iconSize'] != null ? json['iconSize'] : DEFAULT_ICON_SIZE;
    labelFontWeight = json['labelFontWeight'] != null ? json['labelFontWeight'] : FontWeightTypeNormal;
    labelFontStyle = json['labelFontStyle'] != null ? fromJsonFontStyle(json['labelFontStyle']) : FontStyle.normal;
    labelFontSize = json['labelFontSize'] != null ? json['labelFontSize'] : DEFAULT_FONT_SIZE;
    labelFontColor = json['labelFontColor'] != null ? fromJsonColor(json['labelFontColor']) : DEFAULT_TEXT_COLOR;
    if (json['drawerItems'] != null) {
      drawerItems = [];
      json['drawerItems'].forEach((v) {
        drawerItems.add(new DrawerItemModel.fromJson(v));
      });
    } else {
      drawerItems = [];
    }
  }

  Map<String, dynamic> emptyJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elevation != null) {
      data['elevation'] = this.elevation;
    }
    if (this.headerColor != null) {
      data['headerColor'] = toJsonColor(this.headerColor!);
    }
    if (this.profileImagePath != null) {
      data['profileImagePath'] = this.profileImagePath;
    }
    if (this.profileImageType != null) {
      data['profileImageType'] = this.profileImageType;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.nameFontWeight != null) {
      data['nameFontWeight'] = this.nameFontWeight;
    }
    if (this.nameFontStyle != null) {
      data['nameFontStyle'] = toJsonFontStyle(this.nameFontStyle);
    }
    if (this.nameFontColor != null) {
      data['nameFontColor'] = toJsonColor(this.nameFontColor!);
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.emailFontWeight != null) {
      data['emailFontWeight'] = this.emailFontWeight;
    }
    if (this.emailFontStyle != null) {
      data['emailFontStyle'] = toJsonFontStyle(this.emailFontStyle);
    }
    if (this.emailFontColor != null) {
      data['emailFontColor'] = toJsonColor(this.emailFontColor!);
    }
    if (this.iconColor != null) {
      data['iconColor'] = toJsonColor(this.iconColor!);
    }
    if (this.iconSize != null) {
      data['iconSize'] = this.iconSize;
    }
    if (this.labelFontWeight != null) {
      data['labelFontWeight'] = this.labelFontWeight;
    }
    if (this.labelFontStyle != null) {
      data['labelFontStyle'] = toJsonFontStyle(this.labelFontStyle);
    }
    if (this.labelFontSize != null) {
      data['labelFontSize'] = this.labelFontSize;
    }
    if (this.labelFontColor != null) {
      data['labelFontColor'] = toJsonColor(this.labelFontColor!);
    }
    if (this.drawerItems.isNotEmpty) {
      data['drawerItems'] = this.drawerItems;
    }
    return data;
  }

  /// Drawer Items
  List<FlutterVizDrawerItemModel> getFlutterVizDrawerItems() {
    List<FlutterVizDrawerItemModel> flutterVizDrawerItems = [];
    drawerItems.forEach((element) {
      flutterVizDrawerItems.add(FlutterVizDrawerItemModel(icon: IconData(element!.icon!.codePoint!, fontFamily: "MaterialIcons"), label: element.label));
    });
    return flutterVizDrawerItems;
  }

  Widget getLeftDrawerWidget({BuildContext? context}) {
    return GestureDetector(
      child: FlutterVizDrawer(
        elevation: elevation ?? DEFAULT_DRAWER_ELEVATION,
        headerColor: headerColor ?? COMMON_BG_COLOR,
        profileImage: (profileImageType == ImageTypeAsset ? NetworkImage(profileImagePath ?? DEFAULT_DRAWER_ASSET_IMAGE) : NetworkImage(profileImagePath ?? DEFAULT_DRAWER_NETWORK_IMAGE)),
        name: name ?? DUMMY_USER_NAME,
        nameStyle: TextStyle(
          fontWeight: getFontWeight(nameFontWeight) ?? FontWeight.normal,
          fontStyle: nameFontStyle ?? FontStyle.normal,
          fontSize: 16,
          color: nameFontColor ?? DEFAULT_DRAWER_FONT_COLOR,
        ),
        email: email ?? DUMMY_USER_EMAIL,
        emailStyle: TextStyle(
          fontWeight: getFontWeight(emailFontWeight) ?? FontWeight.normal,
          fontStyle: emailFontStyle ?? FontStyle.normal,
          fontSize: 14,
          color: emailFontColor ?? DEFAULT_DRAWER_FONT_COLOR,
        ),
        drawerItems: getFlutterVizDrawerItems(),
        iconColor: iconColor ?? DEFAULT_ICON_COLOR,
        iconSize: iconSize ?? DEFAULT_ICON_SIZE,
        labelStyle: TextStyle(
          fontWeight: getFontWeight(labelFontWeight) ?? FontWeight.normal,
          fontStyle: labelFontStyle ?? FontStyle.normal,
          fontSize: labelFontSize ?? DEFAULT_FONT_SIZE,
          color: labelFontColor ?? DEFAULT_TEXT_COLOR,
        ),
      ),
      onTap: () {
        appStore.selectDrawer();
      },
    );
  }

  /// For view code
  getCodeAsString() {
    return "FlutterVizDrawer(\n"
        "elevation: ${elevation ?? DEFAULT_DRAWER_ELEVATION},\n"
        "headerColor: ${headerColor ?? COMMON_BG_COLOR},\n"
        "profileImage:${profileImageType == ImageTypeAsset ? "AssetImage(\"${profileImagePath != null ? 'images/${profileImagePath!.split('/').last}' : DEFAULT_DRAWER_ASSET_IMAGE}\")" : "NetworkImage(\"${profileImagePath ?? DEFAULT_DRAWER_NETWORK_IMAGE}\")"},\n"
        "${name != "" ? "name:\"${name ?? DUMMY_USER_NAME}\",\n"
            "nameStyle:TextStyle(\n"
            "fontWeight:${getFontWeight(nameFontWeight) ?? FontWeight.normal},\n"
            "fontStyle:${nameFontStyle ?? FontStyle.normal},\n"
            "fontSize:16,\n"
            "color:${nameFontColor ?? DEFAULT_DRAWER_FONT_COLOR},\n"
            "),\n" : ""}"
        "${email != "" ? "email:\"${email ?? DUMMY_USER_EMAIL}\",\n"
            "emailStyle:TextStyle(\n"
            "fontWeight:${getFontWeight(emailFontWeight) ?? FontWeight.normal},\n"
            "fontStyle:${emailFontStyle ?? FontStyle.normal},\n"
            "fontSize:14,\n"
            "color:${emailFontColor ?? DEFAULT_DRAWER_FONT_COLOR},\n"
            "),\n" : ""}"
        "${getFlutterVizDrawerItems().length != 0 ? "drawerItems: flutterVizDrawerItems,\n"
            "iconColor: ${iconColor ?? DEFAULT_ICON_COLOR},\n"
            "iconSize: ${iconSize ?? DEFAULT_ICON_SIZE},\n"
            "labelStyle: TextStyle(\n"
            "fontWeight: ${getFontWeight(labelFontWeight) ?? FontWeight.normal},\n"
            "fontStyle: ${labelFontStyle ?? FontStyle.normal},\n"
            "fontSize: ${labelFontSize ?? DEFAULT_FONT_SIZE},\n"
            "color: ${labelFontColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n" : ""}"
        ")";
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'flutterViz_drawerItem_model.dart';", "import 'flutterViz_drawer.dart';"];
  }
}
