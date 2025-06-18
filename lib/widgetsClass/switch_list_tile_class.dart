import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SwitchListTileClass {
  /// Whether this switch is checked.
  bool? value;

  /// Tile Color
  Color? tileColor;

  /// The color to use when this switch is on.
  Color? activeColor;

  /// The color to use on the track when this switch is on.
  Color? activeTrackColor;

  /// The color to use on the thumb when this switch is off.
  Color? inactiveThumbColor;

  /// The color to use on the track when this switch is off.
  Color? inactiveTrackColor;

  /// The tile's internal padding.
  EdgeInsets? contentPadding;

  /// Dense
  bool? dense;

  /// Where to place the control relative to the text
  ListTileControlAffinity? listTileControlAffinity;

  /// Title
  String? title;

  /// TextAlign
  TextAlign? tTextAlign;

  /// Font Weight
  String? tFontWeight;

  /// Font Style is italic or not
  FontStyle? tFontStyle;

  /// Font size
  double? tFontSize;

  /// Font Color
  Color? tFontColor;

  /// Subtitle
  String? subtitle;

  /// TextAlign
  TextAlign? stTextAlign;

  /// Font Weight
  String? stFontWeight;

  /// Font Style is italic or not
  FontStyle? stFontStyle;

  /// Font size
  double? stFontSize;

  /// Font Color
  Color? stFontColor;

  /// selected
  bool? selected;

  /// Selected Tile Color
  Color? selectedTileColor;

  ///isLeading
  bool? isLeading;

  ///padding
  EdgeInsets? padding;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  /// Border Width
  double? borderWidth;

  /// Border Radius
  BorderRadius? borderRadius;

  /// Border Color
  Color? borderColor;

  /// Secondary Icon
  dynamic secondaryIconDataJson;
  Color? secondaryIconColor;
  double? secondaryIconSize;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  SwitchListTileClass({
    this.value,
    this.tileColor,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.contentPadding,
    this.dense,
    this.listTileControlAffinity,
    this.title,
    this.tTextAlign,
    this.tFontWeight,
    this.tFontStyle,
    this.tFontSize,
    this.tFontColor,
    this.subtitle,
    this.stTextAlign,
    this.stFontWeight,
    this.stFontStyle,
    this.stFontSize,
    this.stFontColor,
    this.selected,
    this.selectedTileColor,
    this.isLeading = false,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.secondaryIconDataJson,
    this.secondaryIconSize,
    this.secondaryIconColor,
    this.isExpanded,
    this.flex = 1,
  });

  SwitchListTileClass.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? json['value'] : true;
    tileColor = json['tileColor'] != null ? fromJsonColor(json['tileColor']) : DEFAULT_LIST_TILE_COLOR;
    activeColor = json['activeColor'] != null ? fromJsonColor(json['activeColor']) : COMMON_BG_COLOR;
    activeTrackColor = json['activeTrackColor'] != null ? fromJsonColor(json['activeTrackColor']) : DEFAULT_ACTIVE_TRACK_COLOR;
    inactiveThumbColor = json['inactiveThumbColor'] != null ? fromJsonColor(json['inactiveThumbColor']) : DEFAULT_INACTIVE_THUMB_COLOR;
    inactiveTrackColor = json['inactiveTrackColor'] != null ? fromJsonColor(json['inactiveTrackColor']) : DEFAULT_INACTIVE_TRACK_COLOR;
    contentPadding = json['contentPadding'] != null ? fromJsonPadding(json['contentPadding']) : EdgeInsets.symmetric(horizontal: 16.0);
    dense = json['dense'] != null ? json['dense'] : false;
    listTileControlAffinity = json['listTileControlAffinity'] != null ? fromJsonListTileControlAffinity(json['listTileControlAffinity']) : ListTileControlAffinity.trailing;
    title = json['title'] != null ? json['title'] : 'Title';
    tTextAlign = json['tTextAlign'] != null ? fromJsonTextAlign(json['tTextAlign']) : TextAlign.start;
    tFontWeight = json['tFontWeight'] != null ? json['tFontWeight'] : FontWeightTypeNormal;
    tFontStyle = json['tFontStyle'] != null ? fromJsonFontStyle(json['tFontStyle']) : FontStyle.normal;
    tFontSize = json['tFontSize'] != null ? json['tFontSize'] : DEFAULT_FONT_SIZE;
    tFontColor = json['tFontColor'] != null ? fromJsonColor(json['tFontColor']) : DEFAULT_TEXT_COLOR;
    subtitle = json['subtitle'] != null ? json['subtitle'] : 'Sub Title';
    stTextAlign = json['stTextAlign'] != null ? fromJsonTextAlign(json['stTextAlign']) : TextAlign.start;
    stFontWeight = json['stFontWeight'] != null ? json['stFontWeight'] : FontWeightTypeNormal;
    stFontStyle = json['stFontStyle'] != null ? fromJsonFontStyle(json['stFontStyle']) : FontStyle.normal;
    stFontSize = json['stFontSize'] != null ? json['stFontSize'] : DEFAULT_FONT_SIZE;
    stFontColor = json['stFontColor'] != null ? fromJsonColor(json['stFontColor']) : DEFAULT_TEXT_COLOR;
    selected = json['selected'] != null ? json['selected'] : false;
    selectedTileColor = json['selectedTileColor'] != null ? fromJsonColor(json['selectedTileColor']) : DEFAULT_SELECTED_TILE_COLOR;
    isLeading = json['isLeading'] != null ? json['isLeading'] : false;
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.circular(0.0);
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_CONTAINER_BORDER_COLOR;
    secondaryIconDataJson = json['secondaryIconDataJson'] != null ? json['secondaryIconDataJson'] : null;
    secondaryIconColor = json['secondaryIconColor'] != null ? fromJsonColor(json['secondaryIconColor']) : DEFAULT_ICON_COLOR;
    secondaryIconSize = json['secondaryIconSize'] != null ? json['secondaryIconSize'] : DEFAULT_ICON_SIZE;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false);
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value;
    }
    if (this.tileColor != null) {
      data['tileColor'] = toJsonColor(this.tileColor!);
    }
    if (this.activeColor != null) {
      data['activeColor'] = toJsonColor(this.activeColor!);
    }
    if (this.activeTrackColor != null) {
      data['activeTrackColor'] = toJsonColor(this.activeTrackColor!);
    }
    if (this.inactiveThumbColor != null) {
      data['inactiveThumbColor'] = toJsonColor(this.inactiveThumbColor!);
    }
    if (this.inactiveTrackColor != null) {
      data['inactiveTrackColor'] = toJsonColor(this.inactiveTrackColor!);
    }
    if (this.contentPadding != null) {
      data['contentPadding'] = toJsonPadding(this.contentPadding!);
    }
    if (this.dense != null) {
      data['dense'] = this.dense;
    }
    if (this.listTileControlAffinity != null) {
      data['listTileControlAffinity'] = toJsonListTileControlAffinity(this.listTileControlAffinity);
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.tTextAlign != null) {
      data['tTextAlign'] = toJsonTextAlign(this.tTextAlign);
    }
    if (this.tFontWeight != null) {
      data['tFontWeight'] = this.tFontWeight;
    }
    if (this.tFontStyle != null) {
      data['tFontStyle'] = toJsonFontStyle(this.tFontStyle);
    }
    if (this.tFontSize != null) {
      data['tFontSize'] = this.tFontSize;
    }
    if (this.tFontColor != null) {
      data['tFontColor'] = toJsonColor(this.tFontColor!);
    }
    if (this.subtitle != null) {
      data['subtitle'] = this.subtitle;
    }
    if (this.stTextAlign != null) {
      data['stTextAlign'] = toJsonTextAlign(this.stTextAlign);
    }
    if (this.stFontWeight != null) {
      data['stFontWeight'] = this.stFontWeight;
    }
    if (this.stFontStyle != null) {
      data['stFontStyle'] = toJsonFontStyle(this.stFontStyle);
    }
    if (this.stFontSize != null) {
      data['stFontSize'] = this.stFontSize;
    }
    if (this.stFontColor != null) {
      data['stFontColor'] = toJsonColor(this.stFontColor!);
    }
    if (this.selected != null) {
      data['selected'] = this.selected;
    }
    if (this.selectedTileColor != null) {
      data['selectedTileColor'] = toJsonColor(this.selectedTileColor!);
    }
    if (this.isLeading != null) {
      data['isLeading'] = this.isLeading;
    }
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.horizontalAlignment != null && this.verticalAlignment != null) {
      data['horizontalAlignment'] = this.horizontalAlignment;
      data['verticalAlignment'] = this.verticalAlignment;
    } else if (this.horizontalAlignment != null) {
      data['horizontalAlignment'] = this.horizontalAlignment;
    } else if (this.verticalAlignment != null) {
      data['verticalAlignment'] = this.verticalAlignment;
    }
    if (this.isAlignX != null) {
      data['isAlignX'] = this.isAlignX;
    }
    if (this.isAlignY != null) {
      data['isAlignY'] = this.isAlignY;
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = toJsonBorderRadius(this.borderRadius!);
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.borderColor != null) {
      data['borderColor'] = toJsonColor(this.borderColor!);
    }
    if (this.secondaryIconDataJson != null) {
      data['secondaryIconDataJson'] = this.secondaryIconDataJson;
    }
    if (this.secondaryIconColor != null) {
      data['secondaryIconColor'] = toJsonColor(this.secondaryIconColor!);
    }
    if (this.secondaryIconSize != null) {
      data['secondaryIconSize'] = this.secondaryIconSize;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getSwitchListTileDefaultWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: SwitchListTile(
        value: value ?? true,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH), borderRadius: borderRadius ?? BorderRadius.circular(0.0)),
        onChanged: (value) {},
        tileColor: tileColor ?? DEFAULT_LIST_TILE_COLOR,
        activeColor: activeColor ?? COMMON_BG_COLOR,
        activeTrackColor: activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR,
        controlAffinity: listTileControlAffinity ?? ListTileControlAffinity.trailing,
        title: title != ""
            ? Text(
                title ?? "Title",
                style: TextStyle(
                  fontWeight: getFontWeight(tFontWeight) ?? FontWeight.normal,
                  fontStyle: tFontStyle ?? FontStyle.normal,
                  fontSize: tFontSize ?? DEFAULT_FONT_SIZE,
                  color: tFontColor ?? DEFAULT_TEXT_COLOR,
                ),
                textAlign: tTextAlign ?? TextAlign.start,
              )
            : null,
        subtitle: subtitle != ""
            ? Text(
                subtitle ?? "Sub Title",
                style: TextStyle(
                  fontWeight: getFontWeight(stFontWeight) ?? FontWeight.normal,
                  fontStyle: stFontStyle ?? FontStyle.normal,
                  fontSize: stFontSize ?? DEFAULT_FONT_SIZE,
                  color: stFontColor ?? DEFAULT_TEXT_COLOR,
                ),
                textAlign: stTextAlign ?? TextAlign.start,
              )
            : null,
        dense: dense ?? false,
        inactiveThumbColor: inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR,
        inactiveTrackColor: inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16.0),
        secondary: secondaryIconDataJson != null
            ? Icon(
                IconData(secondaryIconDataJson['codePoint'], fontFamily: secondaryIconDataJson['fontFamily']),
                color: secondaryIconColor ?? DEFAULT_ICON_COLOR,
                size: secondaryIconSize ?? DEFAULT_ICON_SIZE,
              )
            : null,
        selected: selected ?? false,
        selectedTileColor: selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR,
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getSwitchListTileExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getSwitchListTilePadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getSwitchListTileAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getSwitchListTileWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchListTileExpanded(_getSwitchListTilePadding(_getSwitchListTileAlign(getSwitchListTileDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getSwitchListTileExpanded(_getSwitchListTilePadding(getSwitchListTileDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchListTileExpanded(_getSwitchListTileAlign(getSwitchListTileDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchListTilePadding(_getSwitchListTileAlign((getSwitchListTileDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getSwitchListTilePadding(getSwitchListTileDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getSwitchListTileAlign(getSwitchListTileDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getSwitchListTileExpanded(getSwitchListTileDefaultWidget(widgetModel));
    } else {
      return getSwitchListTileDefaultWidget(widgetModel);
    }
  }

  getSwitchListTileString() {
    return "SwitchListTile(\n"
        "value:${value ?? true},\n"
        "${title != "" ? "title:Text(\n"
            "\"${getDollarString(title ?? "Title")}\",\n"
            "style:TextStyle(\n"
            "fontWeight:${getFontWeight(tFontWeight) ?? FontWeight.normal},\n"
            "fontStyle:${tFontStyle ?? FontStyle.normal},\n"
            "fontSize:${tFontSize ?? DEFAULT_FONT_SIZE},\n"
            "color:${tFontColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n"
            "textAlign:${tTextAlign ?? TextAlign.start},\n"
            "),\n" : ""}"
        "${subtitle != "" ? "subtitle:Text(\n"
            "\"${getDollarString(subtitle ?? "Sub Title")}\",\n"
            "style:TextStyle(\n"
            "fontWeight:${getFontWeight(stFontWeight) ?? FontWeight.normal},\n"
            "fontStyle:${stFontStyle ?? FontStyle.normal},\n"
            "fontSize:${stFontSize ?? DEFAULT_FONT_SIZE},\n"
            "color:${stFontColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n"
            "textAlign:${stTextAlign ?? TextAlign.start},\n"
            "),\n" : ""}"
        "shape:RoundedRectangleBorder(\n"
        "borderRadius:${borderRadius ?? BorderRadius.zero},\n"
        "${(borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR).alpha != 0 ? 'side:BorderSide(color:${borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR},width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
        "),\n"
        "onChanged:(value){},\n"
        "tileColor:${tileColor ?? DEFAULT_LIST_TILE_COLOR},\n"
        "activeColor:${activeColor ?? COMMON_BG_COLOR},\n"
        "activeTrackColor:${activeTrackColor ?? DEFAULT_ACTIVE_TRACK_COLOR},\n"
        "controlAffinity:${listTileControlAffinity ?? ListTileControlAffinity.platform},\n"
        "dense:${dense ?? false},\n"
        "inactiveThumbColor:${inactiveThumbColor ?? DEFAULT_INACTIVE_THUMB_COLOR},\n"
        "inactiveTrackColor:${inactiveTrackColor ?? DEFAULT_INACTIVE_TRACK_COLOR},\n"
        "contentPadding:${contentPadding != null ? getPaddingString(contentPadding) : 'EdgeInsets.symmetric(horizontal: 16.0)'},\n"
        "${secondaryIconDataJson != null ? "secondary:Icon(Icons.${secondaryIconDataJson['iconName']},color:${secondaryIconColor ?? DEFAULT_ICON_COLOR},size:${secondaryIconSize ?? DEFAULT_ICON_SIZE}),\n" : ""}"
        "selected:${selected ?? false},\n"
        "selectedTileColor:${selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR},\n"
        ")";
  }

  _getStringExpanded(String _child) {
    return "Expanded(\n"
        "flex: ${flex ?? 1},\n"
        "child: $_child,\n"
        ")";
  }

  _getStringAlign() {
    return "Align(\n"
        "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
        "child:${getSwitchListTileString()},\n"
        ")";
  }

  _getStringPadding(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$child,\n"
        ")";
  }

  /// For view code
  getCodeAsString(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringPadding(_getStringAlign()));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getSwitchListTileString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getSwitchListTileString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getSwitchListTileString());
    } else {
      return getSwitchListTileString();
    }
  }
}
