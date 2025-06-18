import 'package:flutter_viz/externalClasses/flutterViz_audio_player.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';

class AudioPlayerClass {
  ///Audio Url
  String? url;

  ///Audio Player Icon size
  double? iconSize;

  ///Active Tracker Icon Color
  Color? activeTrackColor;

  ///InActive Tracker Icon Color
  Color? inactiveTrackColor;

  ///Thumb Color
  Color? thumbColor;

  ///Icon Color
  Color? iconColor;

  ///Padding
  EdgeInsets? padding;

  ///Horizontal Alignment
  double? horizontalAlignment;

  ///Vertical Alignment
  double? verticalAlignment;

  /// Is AlignX
  bool? isAlignX;

  /// Is AlignY
  bool? isAlignY;

  ///Is Expanded
  bool? isExpanded;

  ///Flex
  int? flex;

  AudioPlayerClass({
    this.url,
    this.iconSize,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.iconColor,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  AudioPlayerClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    url = json['url'] != null ? json['url'] : DEFAULT_AUDIO_PLAYER_URL;
    iconSize = json['size'] != null ? json['size'] : DEFAULT_AUDIO_PLAYER_ICON_SIZE as double?;
    iconColor = json['iconColor'] != null ? fromJsonColor(json['iconColor']) : COMMON_BG_COLOR;
    activeTrackColor = json['activeTrackColor'] != null ? fromJsonColor(json['activeTrackColor']) : COMMON_BG_COLOR;
    inactiveTrackColor = json['inactiveTrackColor'] != null ? fromJsonColor(json['inactiveTrackColor']) : DEFAULT_AUDIO_PLAYER_INACTIVE_TRACKER_COLOR;
    thumbColor = json['thumbColor'] != null ? fromJsonColor(json['thumbColor']) : COMMON_BG_COLOR;
    iconSize = json['iconSize'] != null ? json['iconSize'] : DEFAULT_AUDIO_PLAYER_ICON_SIZE as double?;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.padding != null) {
      data['padding'] = toJsonPadding(this.padding!);
    }
    if (this.url != null) {
      data['url'] = this.url;
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
    if (this.iconSize != null) {
      data['iconSize'] = this.iconSize;
    }
    if (this.iconColor != null) {
      data['iconColor'] = toJsonColor(this.iconColor!);
    }
    if (this.activeTrackColor != null) {
      data['activeTrackColor'] = toJsonColor(this.activeTrackColor!);
    }
    if (this.inactiveTrackColor != null) {
      data['inactiveTrackColor'] = toJsonColor(this.inactiveTrackColor!);
    }
    if (this.thumbColor != null) {
      data['thumbColor'] = toJsonColor(this.thumbColor!);
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    return data;
  }

  Widget getAudioPlayerDefaultWidget(WidgetModel widgetModel) {
    Widget _childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: FlutterVizAudioPlayer(
        url: url ?? DEFAULT_AUDIO_PLAYER_URL,
        iconColor: iconColor ?? COMMON_BG_COLOR,
        activeTrackColor: activeTrackColor ?? COMMON_BG_COLOR,
        inactiveTrackColor: inactiveTrackColor ?? DEFAULT_AUDIO_PLAYER_INACTIVE_TRACKER_COLOR,
        thumbColor: thumbColor ?? COMMON_BG_COLOR,
        iconSize: iconSize ?? DEFAULT_AUDIO_PLAYER_ICON_SIZE as double?,
      ),
    );
    return getGestureDetector(widgetModel, _childData);
  }

  _getAudioPlayerExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getAudioPlayerPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getAudioPlayerAlign(Widget _child) {
    return Align(alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT), child: _child);
  }

  Widget getAudioPlayerWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getAudioPlayerExpanded(_getAudioPlayerPadding(_getAudioPlayerAlign(getAudioPlayerDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getAudioPlayerExpanded(_getAudioPlayerPadding(getAudioPlayerDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getAudioPlayerExpanded(_getAudioPlayerAlign(getAudioPlayerDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getAudioPlayerPadding(_getAudioPlayerAlign((getAudioPlayerDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getAudioPlayerPadding(getAudioPlayerDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getAudioPlayerAlign(getAudioPlayerDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getAudioPlayerExpanded(getAudioPlayerDefaultWidget(widgetModel));
    } else {
      return getAudioPlayerDefaultWidget(widgetModel);
    }
  }

  getAudioPlayerString() {
    return "FlutterVizAudioPlayer(\n"
        "url: \"${(url != null) ? url : DEFAULT_AUDIO_PLAYER_URL}\",\n"
        "iconColor:${iconColor ?? COMMON_BG_COLOR},\n"
        "activeTrackColor:${activeTrackColor ?? COMMON_BG_COLOR},\n"
        "inactiveTrackColor:${inactiveTrackColor ?? DEFAULT_AUDIO_PLAYER_INACTIVE_TRACKER_COLOR},\n"
        "thumbColor:${thumbColor ?? COMMON_BG_COLOR},\n"
        "iconSize:${iconSize ?? DEFAULT_AUDIO_PLAYER_ICON_SIZE},\n"
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
        "child:${getAudioPlayerString()},\n"
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
      return _getStringExpanded(_getStringPadding(getAudioPlayerString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getAudioPlayerString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getAudioPlayerString());
    } else {
      return getAudioPlayerString();
    }
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'flutterViz_audio_player.dart';"];
  }

  /// Import pubspec.yaml lib name
  getYamlLib() {
    return ["#Audio player lib", "just_audio: ^0.9.3", "rxdart: ^0.27.1 \n\n"];
  }
}
