import 'package:flutter_viz/externalClasses/flutterViz_youtube_player.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YoutubePlayerClass {
  String? url;

  ///whether the initial video will automatically start to play when the player loads
  bool? autoPlay;

  ///play the initial video again and again.
  bool? loop;

  ///Mute
  bool? mute;

  ///indicates whether the video player controls are displayed.
  bool? showControls;

  ///Full Screen Video
  bool? showFullscreenButton;

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

  ///Height
  double? height;

  ///Width
  double? width;

  /// width type
  String? widthType;

  /// height type
  String? heightType;

  YoutubePlayerClass({
    this.url,
    this.autoPlay = false,
    this.loop = false,
    this.mute = false,
    this.showFullscreenButton = false,
    this.showControls = false,
    this.padding,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
    this.height,
    this.width,
    this.widthType = TypePX,
    this.heightType = TypePX,
  });

  YoutubePlayerClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    autoPlay = json['autoPlay'] != null ? json['autoPlay'] : false;
    loop = json['loop'] != null ? json['loop'] : false;
    mute = json['mute'] != null ? json['mute'] : false;
    showControls = json['showControls'] != null ? json['showControls'] : false;
    showFullscreenButton = json['showFullscreenButton'] != null ? json['showFullscreenButton'] : false;
    url = json['url'] != null ? json['url'] : 'https://www.youtube.com/watch?v=$DEFAULT_YOUTUBE_ID';
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
    height = json['height'] != null ? fromJsonHeight(json['height'], heightType ?? TypePX) : null;
    width = json['width'] != null ? fromJsonWidth(json['width'], widthType ?? TypePX) : null;
    widthType = json['widthType'] != null ? json['widthType'] : TypePX;
    heightType = json['heightType'] != null ? json['heightType'] : TypePX;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.url != null) {
      data['url'] = this.url;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    if (this.height != null) {
      data['height'] = this.height;
    }
    if (this.width != null) {
      data['width'] = this.width;
    }
    if (this.widthType != null) {
      data['widthType'] = this.widthType;
    }
    if (this.heightType != null) {
      data['heightType'] = this.heightType;
    }
    return data;
  }

  Widget getYoutubePlayerDefaultWidget(WidgetModel widgetModel) {
    Widget childData;
    childData = FlutterVizYoutubePlayer(
      url: (url != null) ? getYoutubeVideoId(url!) : DEFAULT_YOUTUBE_ID,
      autoPlay: autoPlay ?? false,
      looping: loop ?? false,
      mute: mute ?? false,
      showControls: showControls ?? false,
      showFullScreen: showFullscreenButton ?? false,
      height: height != null ? fromJsonHeight(height, heightType) : null,
      width: width != null ? fromJsonWidth(width, widthType) : null,
    );
    return getGestureDetector(widgetModel, childData);
  }

  Widget getYoutubePlayerWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getYoutubeExpanded(_getYoutubePadding(_getYoutubeAlign(getYoutubePlayerDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getYoutubeExpanded(_getYoutubePadding(getYoutubePlayerDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getYoutubeExpanded(_getYoutubeAlign(getYoutubePlayerDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getYoutubePadding(_getYoutubeAlign((getYoutubePlayerDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getYoutubePadding(getYoutubePlayerDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getYoutubeAlign(getYoutubePlayerDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getYoutubeExpanded(getYoutubePlayerDefaultWidget(widgetModel));
    } else {
      return getYoutubePlayerDefaultWidget(widgetModel);
    }
  }

  _getYoutubeExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getYoutubePadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getYoutubeAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
  }

  getYoutubePlayerString() {
    return "FlutterVizYoutubePlayer(\n"
        "url: \"${(url != null) ? url : "https://www.youtube.com/watch?v=$DEFAULT_YOUTUBE_ID"}\",\n"
        "autoPlay:${autoPlay ?? false},\n"
        "looping:${loop ?? false},\n"
        "mute:${mute ?? false},\n"
        "showControls:${showControls ?? false},\n"
        "showFullScreen:${showFullscreenButton ?? false},\n"
        "${height != null ? 'height:${getHeightString(height, heightType)},\n' : ''}"
        "${width != null ? 'width:${getWidthString(width, widthType)},\n' : ''}"
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
        "child:${getYoutubePlayerString()},\n"
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
      return _getStringExpanded(_getStringPadding(getYoutubePlayerString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getYoutubePlayerString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getYoutubePlayerString());
    } else {
      return getYoutubePlayerString();
    }
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'flutterViz_youtube_player.dart';"];
  }

  /// Import pubspec.yaml lib name
  getYamlLib() {
    return ["#Youtube player lib", "youtube_plyr_iframe: ^2.0.7 \n\n"];
  }
}
