import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ListTileClass {
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

  /// The tile's internal padding.
  EdgeInsets? contentPadding;

  /// Tile Color
  Color? tileColor;

  /// Dense
  bool? dense;

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

  /// Border Width
  double? borderWidth;

  /// Border Radius
  BorderRadius? borderRadius;

  /// Border Color
  Color? borderColor;

  ///Leading Icon
  dynamic leadingIconDataJson;
  Color? leadingIconColor;
  double? leadingIconSize;

  /// Trailing Icon
  dynamic trailingIconDataJson;
  Color? trailingIconColor;
  double? trailingIconSize;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  ListTileClass({
    this.contentPadding,
    this.tileColor,
    this.dense,
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
    this.selected = false,
    this.selectedTileColor,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.leadingIconDataJson,
    this.trailingIconDataJson,
    this.leadingIconColor,
    this.leadingIconSize,
    this.trailingIconColor,
    this.trailingIconSize,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.isExpanded,
    this.flex = 1,
  });

  ListTileClass.fromJson(Map<String, dynamic> json) {
    tileColor = json['tileColor'] != null ? fromJsonColor(json['tileColor']) : DEFAULT_LIST_TILE_COLOR;
    contentPadding = json['contentPadding'] != null ? fromJsonPadding(json['contentPadding']) : EdgeInsets.symmetric(horizontal: 16.0);
    dense = json['dense'] != null ? json['dense'] : false;
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
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    leadingIconDataJson = json['leadingIconDataJson'] != null ? json['leadingIconDataJson'] : null;
    trailingIconDataJson = json['trailingIconDataJson'] != null ? json['trailingIconDataJson'] : null;
    leadingIconColor = json['leadingIconColor'] != null ? fromJsonColor(json['leadingIconColor']) : DEFAULT_ICON_COLOR;
    trailingIconColor = json['trailingIconColor'] != null ? fromJsonColor(json['trailingIconColor']) : DEFAULT_ICON_COLOR;
    leadingIconSize = json['leadingIconSize'] != null ? json['leadingIconSize'] : DEFAULT_ICON_SIZE;
    trailingIconSize = json['trailingIconSize'] != null ? json['trailingIconSize'] : DEFAULT_ICON_SIZE;
    borderRadius = json['borderRadius'] != null ? fromJsonBorderRadius(json['borderRadius']) : BorderRadius.zero;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_CONTAINER_BORDER_COLOR;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : (appStore.currentSelectedWidget!.parentWidgetType == WidgetTypeRow ? true : false);
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tileColor != null) {
      data['tileColor'] = toJsonColor(this.tileColor!);
    }
    if (this.contentPadding != null) {
      data['contentPadding'] = toJsonPadding(this.contentPadding!);
    }
    if (this.dense != null) {
      data['dense'] = this.dense;
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
    if (this.leadingIconDataJson != null) {
      data['leadingIconDataJson'] = this.leadingIconDataJson;
    }
    if (this.trailingIconDataJson != null) {
      data['trailingIconDataJson'] = this.trailingIconDataJson;
    }
    if (this.leadingIconColor != null) {
      data['leadingIconColor'] = toJsonColor(this.leadingIconColor!);
    }
    if (this.trailingIconColor != null) {
      data['trailingIconColor'] = toJsonColor(this.trailingIconColor!);
    }
    if (this.leadingIconSize != null) {
      data['leadingIconSize'] = this.leadingIconSize;
    }
    if (this.trailingIconSize != null) {
      data['trailingIconSize'] = this.trailingIconSize;
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
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getListTileDefaultWidget(WidgetModel widgetModel) {
    Widget childData = ListTile(
      tileColor: tileColor ?? DEFAULT_LIST_TILE_COLOR,
      horizontalTitleGap: 20,
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
      contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16.0),
      selected: selected ?? false,
      selectedTileColor: selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.zero,
        side: BorderSide(color: borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
      ),
      leading: leadingIconDataJson != null
          ? Icon(
              IconData(leadingIconDataJson['codePoint'], fontFamily: leadingIconDataJson['fontFamily']),
              color: leadingIconColor ?? DEFAULT_ICON_COLOR,
              size: leadingIconSize ?? DEFAULT_ICON_SIZE,
            )
          : null,
      trailing: trailingIconDataJson != null
          ? Icon(
              IconData(trailingIconDataJson['codePoint'], fontFamily: trailingIconDataJson['fontFamily']),
              color: trailingIconColor ?? DEFAULT_ICON_COLOR,
              size: trailingIconSize ?? DEFAULT_ICON_SIZE,
            )
          : null,
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getListTileExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getListTilePadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getListTileAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getListTileWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getListTileExpanded(_getListTilePadding(_getListTileAlign(getListTileDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getListTileExpanded(_getListTilePadding(getListTileDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getListTileExpanded(_getListTileAlign(getListTileDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getListTilePadding(_getListTileAlign((getListTileDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getListTilePadding(getListTileDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getListTileAlign(getListTileDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getListTileExpanded(getListTileDefaultWidget(widgetModel));
    } else {
      return getListTileDefaultWidget(widgetModel);
    }
  }

  getListTileString() {
    return "ListTile(\n"
        "tileColor:${tileColor ?? DEFAULT_LIST_TILE_COLOR},\n"
        "${title != "" ? "title:Text(\"${getDollarString(title ?? "Title")}\",\n"
            "style:TextStyle(\n"
            "fontWeight:${getFontWeight(tFontWeight) ?? FontWeight.normal},\n"
            "fontStyle:${tFontStyle ?? FontStyle.normal},\n"
            "fontSize:${tFontSize ?? DEFAULT_FONT_SIZE},\n"
            "color:${tFontColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n"
            "textAlign:${tTextAlign ?? TextAlign.start},\n"
            "),\n" : ""}"
        "${subtitle != "" ? "subtitle:Text(\"${getDollarString(subtitle ?? "Sub Title")}\",\n"
            "style:TextStyle(\n"
            "fontWeight:${getFontWeight(stFontWeight) ?? FontWeight.normal},\n"
            "fontStyle:${stFontStyle ?? FontStyle.normal},\n"
            "fontSize:${stFontSize ?? DEFAULT_FONT_SIZE},\n"
            "color:${stFontColor ?? DEFAULT_TEXT_COLOR},\n"
            "),\n"
            "textAlign:${stTextAlign ?? TextAlign.start},\n"
            "),\n" : ""}"
        "dense:${dense ?? false},\n"
        "contentPadding:${contentPadding != null ? getPaddingString(contentPadding) : 'EdgeInsets.symmetric(horizontal: 16.0)'},\n"
        "selected:${selected ?? false},\n"
        "selectedTileColor:${selectedTileColor ?? DEFAULT_SELECTED_TILE_COLOR},\n"
        "shape:RoundedRectangleBorder(\n"
        "borderRadius:${borderRadius ?? BorderRadius.zero},\n"
        "${(borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR).alpha != 0 ? 'side: BorderSide(color:${borderColor ?? DEFAULT_CONTAINER_BORDER_COLOR}, width:${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
        "),\n"
        "${leadingIconDataJson != null ? "leading:Icon(Icons.${leadingIconDataJson['iconName']},color:${leadingIconColor ?? DEFAULT_ICON_COLOR},size:${leadingIconSize ?? DEFAULT_ICON_SIZE}),\n" : ""}"
        "${trailingIconDataJson != null ? "trailing:Icon(Icons.${trailingIconDataJson['iconName']},color:${trailingIconColor ?? DEFAULT_ICON_COLOR},size:${trailingIconSize ?? DEFAULT_ICON_SIZE}),\n" : ""}"
        ")";
  }

  /// For view code
  getCodeAsString() {
    if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return "Align(\n"
          "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
          "child:Padding(\n"
          "padding:${getPaddingString(padding)},\n"
          "child:${getListTileString()},\n"
          "),\n"
          ")";
    } else if (getPadding(padding)) {
      return "Padding(\n"
          "padding:${getPaddingString(padding)},\n"
          "child:${getListTileString()},\n"
          ")";
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return "Align(\n"
          "alignment:${Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT)},\n"
          "child:${getListTileString()},\n"
          ")";
    } else {
      return getListTileString();
    }
  }
}
