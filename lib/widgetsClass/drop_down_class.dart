import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DropDownClass {
  /// Padding
  EdgeInsets? padding;

  /// FontWeight
  String? fWeight;

  /// Font Size
  double? fontSize;

  /// Font Color
  Color? fontColor;

  /// FontStyle
  FontStyle? fStyle;

  /// Content Padding
  EdgeInsets? contentPadding;

  /// Fill Color
  Color? fillColor;

  /// Border color;
  Color? borderColor;

  /// Border width
  double? borderWidth;

  /// Border Radius
  double? borderRadius;

  /// elevation
  int? elevation;

  /// Width
  double? width;

  /// Height
  double? height;

  /// Icon
  dynamic iconDataJson;

  /// IconSize
  double? iconSize;

  /// Icon Color
  Color? iconColor;

  /// items
  List<String?> itemsList = ["Option 1"];

  /// value
  String? value;

  /// Height Type
  String? heightType;

  /// Width type
  String? widthType;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  /// Height isClear or not
  bool? isHeightClear;

  /// Width isClear or not
  bool? isWidthClear;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  ///remove UnderLine
  bool? isRemoveUnderLine;

  DropDownClass({
    this.padding,
    this.fWeight,
    this.fontSize,
    this.fontColor,
    this.fStyle,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.width,
    this.height,
    this.iconDataJson,
    this.iconSize,
    this.iconColor,
    this.value,
    this.heightType = TypePX,
    this.widthType = TypePX,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isHeightClear = false,
    this.isWidthClear = false,
    this.isExpanded = false,
    this.flex = 1,
    this.isRemoveUnderLine = false,
  });

  DropDownClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    fWeight = json['fWeight'] != null ? json['fWeight'] : FontWeightTypeNormal;
    fontSize = json['fontSize'] != null ? json['fontSize'] : DEFAULT_DROPDOWN_FONT_SIZE;
    fontColor = json['fontColor'] != null ? fromJsonColor(json['fontColor']) : DEFAULT_TEXT_COLOR;
    fStyle = json['fStyle'] != null ? fromJsonFontStyle(json['fStyle']) : FontStyle.normal;
    contentPadding = json['contentPadding'] != null ? fromJsonPadding(json['contentPadding']) : EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    fillColor = json['fillColor'] != null ? fromJsonColor(json['fillColor']) : DEFAULT_DROPDOWN_FILL_COLOR;
    borderColor = json['borderColor'] != null ? fromJsonColor(json['borderColor']) : DEFAULT_DROPDOWN_BORDER_COLOR;
    borderWidth = json['borderWidth'] != null ? json['borderWidth'] : DEFAULT_BORDER_WIDTH;
    borderRadius = json['borderRadius'] != null ? json['borderRadius'] : DEFAULT_DROPDOWN_BORDER_RADIUS;
    elevation = json['elevation'] != null ? json['elevation'] : DEFAULT_DROPDOWN_ELEVATION;
    width = json['width'] != null ? fromJsonWidth(json['width'], widthType ?? TypePX) : DEFAULT_DROPDOWN_WIDTH;
    height = json['height'] != null ? fromJsonHeight(json['height'], heightType ?? TypePX) : DEFAULT_DROPDOWN_HEIGHT;
    iconDataJson = json['iconDataJson'] != null ? json['iconDataJson'] : null;
    iconSize = json['iconSize'] != null ? json['iconSize'] : DEFAULT_DROPDOWN_ICON_SIZE;
    iconColor = json['iconColor'] != null ? fromJsonColor(json['iconColor']) : DEFAULT_ICON_COLOR;
    value = json['value'] != null ? json['value'] : itemsList[0];
    widthType = json['widthType'] != null ? json['widthType'] : TypePX;
    heightType = json['heightType'] != null ? json['heightType'] : TypePX;
    itemsList = json['itemsList'] != null ? new List<String?>.from(json['itemsList']) : ['Option 1'];
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    isHeightClear = json['isHeightClear'] != null ? json['isHeightClear'] : false;
    isWidthClear = json['isWidthClear'] != null ? json['isWidthClear'] : false;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
    isRemoveUnderLine = json['isRemoveUnderLine'] != null ? json['isRemoveUnderLine'] : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.fWeight != null) {
      data['fWeight'] = this.fWeight;
    }
    if (this.fontSize != null) {
      data['fontSize'] = this.fontSize;
    }
    if (this.fontColor != null) {
      data['fontColor'] = toJsonColor(this.fontColor!);
    }
    if (this.fStyle != null) {
      data['fStyle'] = toJsonFontStyle(this.fStyle);
    }
    if (this.contentPadding != null) {
      data['contentPadding'] = toJsonPadding(this.contentPadding!);
    }
    if (this.fillColor != null) {
      data['fillColor'] = toJsonColor(this.fillColor!);
    }
    if (this.borderColor != null) {
      data['borderColor'] = toJsonColor(this.borderColor!);
    }
    if (this.borderWidth != null) {
      data['borderWidth'] = this.borderWidth;
    }
    if (this.borderRadius != null) {
      data['borderRadius'] = this.borderRadius;
    }
    if (this.elevation != null) {
      data['elevation'] = this.elevation;
    }
    if (this.width != null) {
      data['width'] = this.width;
    }
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.iconDataJson != null) {
      data['iconDataJson'] = this.iconDataJson;
    }
    if (this.iconSize != null) {
      data['iconSize'] = this.iconSize;
    }
    if (this.iconColor != null) {
      data['iconColor'] = toJsonColor(this.iconColor!);
    }
    if (this.value != null) {
      data['value'] = this.value;
    }
    if (this.widthType != null) {
      data['widthType'] = this.widthType;
    }
    if (this.heightType != null) {
      data['heightType'] = this.heightType;
    }
    data['itemsList'] = this.itemsList;
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
    if (this.isHeightClear != null) {
      data['isHeightClear'] = this.isHeightClear;
    }
    if (this.isWidthClear != null) {
      data['isWidthClear'] = this.isWidthClear;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    if (this.isRemoveUnderLine != null) {
      data['isRemoveUnderLine'] = this.isRemoveUnderLine;
    }
    return data;
  }

  Widget getDropDown() {
    return DropdownButton(
      value: value ?? itemsList[0],
      items: itemsList.map<DropdownMenuItem<String>>((String? value) {
        return DropdownMenuItem<String>(
          value: value!,
          child: Text('${value.validate()}'),
        );
      }).toList(),
      style: TextStyle(
        color: fontColor ?? DEFAULT_TEXT_COLOR,
        fontSize: fontSize ?? DEFAULT_DROPDOWN_FONT_SIZE,
        fontWeight: getFontWeight(fWeight),
        fontStyle: fStyle ?? FontStyle.normal,
      ),
      onChanged: (dynamic s) {},
      icon: Icon(iconDataJson != null ? IconData(iconDataJson['codePoint'], fontFamily: iconDataJson['fontFamily']) : Icons.arrow_drop_down),
      iconSize: iconSize ?? DEFAULT_DROPDOWN_ICON_SIZE,
      iconEnabledColor: iconColor ?? DEFAULT_ICON_COLOR,
      elevation: elevation ?? DEFAULT_DROPDOWN_ELEVATION,
      isExpanded: true,
    );
  }

  Widget getDropDownDefaultWidget(WidgetModel widgetModel) {
    Widget childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: Container(
        width: isWidthClear! ? null : fromJsonWidth(width ?? DEFAULT_DROPDOWN_WIDTH, widthType),
        height: isHeightClear! ? null : fromJsonHeight(height ?? DEFAULT_DROPDOWN_HEIGHT, heightType),
        padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: fillColor ?? DEFAULT_DROPDOWN_FILL_COLOR,
          border: Border.all(color: borderColor ?? DEFAULT_DROPDOWN_BORDER_COLOR, width: borderWidth ?? DEFAULT_BORDER_WIDTH),
          borderRadius: BorderRadius.circular(borderRadius ?? DEFAULT_DROPDOWN_BORDER_RADIUS),
        ),
        child: isRemoveUnderLine!
            ? DropdownButtonHideUnderline(
                child: getDropDown(),
              )
            : getDropDown(),
      ),
    );
    return getGestureDetector(widgetModel, childData);
  }

  _getDropDownExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getDropDownPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getDropDownAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  Widget getDropDownWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getDropDownExpanded(_getDropDownPadding(_getDropDownAlign(getDropDownDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getDropDownExpanded(_getDropDownPadding(getDropDownDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getDropDownExpanded(_getDropDownAlign(getDropDownDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getDropDownPadding(_getDropDownAlign((getDropDownDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getDropDownPadding(getDropDownDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getDropDownAlign(getDropDownDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getDropDownExpanded(getDropDownDefaultWidget(widgetModel));
    } else {
      return getDropDownDefaultWidget(widgetModel);
    }
  }

  String getDefaultDropDownString() {
    return "DropdownButton(\n"
        "value:\"${getDollarString(value ?? itemsList[0])}\",\n"
        "items:${itemsList.map((item) {
      return "\"${getDollarString(item)}\"";
    }).toList()}.map<DropdownMenuItem<String>>((String value) {\n"
        "return DropdownMenuItem<String>(\n"
        "value: value,\n"
        "child: Text(value),"
        ");\n"
        "}).toList(),"
        "style: TextStyle(\n"
        "color:${fontColor ?? DEFAULT_TEXT_COLOR},\n"
        "fontSize:${fontSize ?? DEFAULT_DROPDOWN_FONT_SIZE},\n"
        "fontWeight:${fWeight != null ? getFontWeight(fWeight) : FontWeight.normal},\n"
        "fontStyle:${fStyle ?? FontStyle.normal},\n"
        "),"
        " onChanged: (value){},\n"
        "${iconDataJson != null ? "icon: Icon(${iconDataJson != null ? 'Icons.${iconDataJson['iconName']}' : 'Icons.arrow_drop_down'}),\n"
            "iconSize:${iconSize ?? DEFAULT_DROPDOWN_ICON_SIZE},\n"
            "iconEnabledColor:${iconColor ?? DEFAULT_ICON_COLOR},\n" : ""}"
        "elevation:${elevation ?? DEFAULT_DROPDOWN_ELEVATION},\n"
        "isExpanded: true,"
        "),";
  }

  String getDropDownString() {
    return "Container(\n"
        "${isWidthClear! ? "" : 'width:${getWidthString(width ?? DEFAULT_DROPDOWN_WIDTH, widthType)},\n'}"
        "${isHeightClear! ? "" : 'height:${getHeightString(height ?? DEFAULT_DROPDOWN_HEIGHT, heightType)},\n'}"
        "padding:${contentPadding != null ? getPaddingString(contentPadding) : 'EdgeInsets.symmetric(horizontal: 8, vertical: 4)'},\n"
        "decoration: BoxDecoration(\n"
        "color:${fillColor ?? DEFAULT_DROPDOWN_FILL_COLOR},\n"
        "${(borderColor ?? DEFAULT_DROPDOWN_BORDER_COLOR).alpha != 0 ? 'border:Border.all(color: ${borderColor ?? DEFAULT_DROPDOWN_BORDER_COLOR} , width: ${borderWidth ?? DEFAULT_BORDER_WIDTH}),\n' : ''}"
        "borderRadius:BorderRadius.circular(${borderRadius ?? DEFAULT_DROPDOWN_BORDER_RADIUS}),\n"
        "),\n"
        "child:${isRemoveUnderLine! ? 'DropdownButtonHideUnderline(child:${getDefaultDropDownString()})' : getDefaultDropDownString()}\n"
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
        "child:${getDropDownString()},\n"
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
      return _getStringExpanded(_getStringPadding(getDropDownString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getDropDownString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getDropDownString());
    } else {
      return getDropDownString();
    }
  }
}
