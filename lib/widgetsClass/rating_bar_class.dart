import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarClass {
  ///Padding
  EdgeInsets? padding;

  ///rating
  double? rating;

  ///rating item count
  int? ratingItemCount;

  ///rating size
  double? ratingSize;

  ///Scroll Direction
  String? axis;

  /// Rated RatingBar Color
  Color? ratedColor;

  /// UnRated RatingBar Color
  Color? unRatedColor;

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

  /// allow HalfRating
  bool? allowHalfRating;

  RatingBarClass({
    this.padding,
    this.rating,
    this.ratingItemCount,
    this.ratingSize,
    this.axis,
    this.ratedColor,
    this.unRatedColor,
    this.allowHalfRating = false,
    this.horizontalAlignment,
    this.verticalAlignment,
    this.isAlignX = false,
    this.isAlignY = false,
    this.isExpanded = false,
    this.flex = 1,
  });

  RatingBarClass.fromJson(Map<String, dynamic> json) {
    padding = json['padding'] != null ? fromJsonPadding(json['padding']) : EdgeInsets.zero;
    horizontalAlignment = json['horizontalAlignment'] != null ? json['horizontalAlignment'] : DEFAULT_HORIZONTAL_ALIGNMENT;
    verticalAlignment = json['verticalAlignment'] != null ? json['verticalAlignment'] : DEFAULT_VERTICAL_ALIGNMENT;
    isAlignX = json['isAlignX'] != null ? json['isAlignX'] : false;
    isAlignY = json['isAlignY'] != null ? json['isAlignY'] : false;
    ratedColor = json['ratedColor'] != null ? fromJsonColor(json['ratedColor']) : DEFAULT_RATED_COLOR;
    unRatedColor = json['unRatedColor'] != null ? fromJsonColor(json['unRatedColor']) : DEFAULT_UNRATED_COLOR;
    axis = json['axis'] != null ? json['axis'] : AxisHorizontal;
    ratingItemCount = json['ratingItemCount'] != null ? json['ratingItemCount'] : DEFAULT_RATING_ITEM_COUNT;
    ratingSize = json['ratingSize'] != null ? json['ratingSize'] : DEFAULT_RATING_ITEM_SIZE as double?;
    rating = json['rating'] != null ? json['rating'] : DEFAULT_RATING;
    isExpanded = json['isExpanded'] != null ? json['isExpanded'] : false;
    flex = json['flex'] != null ? json['flex'] : DEFAULT_FLEX;
    allowHalfRating = json['allowHalfRating'] != null ? json['allowHalfRating'] : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.ratedColor != null) {
      data['ratedColor'] = toJsonColor(this.ratedColor!);
    }
    if (this.unRatedColor != null) {
      data['unRatedColor'] = toJsonColor(this.unRatedColor!);
    }
    if (this.axis != null) {
      data['axis'] = this.axis;
    }
    if (this.ratingItemCount != null) {
      data['ratingItemCount'] = this.ratingItemCount;
    }
    if (this.ratingSize != null) {
      data['ratingSize'] = this.ratingSize;
    }
    if (this.rating != null) {
      data['rating'] = this.rating;
    }
    if (this.isExpanded != null) {
      data['isExpanded'] = this.isExpanded;
    }
    if (this.flex != null) {
      data['flex'] = this.flex;
    }
    if (this.allowHalfRating != null) {
      data['allowHalfRating'] = this.allowHalfRating;
    }
    return data;
  }

  Widget getRatingBarDefaultWidget(WidgetModel widgetModel) {
    Widget childData;
    childData = AbsorbPointer(
      absorbing: absorbPointer(),
      child: RatingBar.builder(
        initialRating: rating ?? DEFAULT_RATING,
        unratedColor: unRatedColor ?? DEFAULT_UNRATED_COLOR,
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: ratedColor ?? DEFAULT_RATED_COLOR,
        ),
        itemCount: ratingItemCount ?? DEFAULT_RATING_ITEM_COUNT,
        itemSize: ratingSize ?? DEFAULT_RATING_ITEM_SIZE as double,
        direction: axis != null ? getAxis(axis: axis) : Axis.horizontal,
        allowHalfRating: allowHalfRating ?? false,
        onRatingUpdate: (value) {},
      ),
    );

    return getGestureDetector(widgetModel, childData);
  }

  Widget getRatingBarWidget(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRatingBarExpanded(_getRatingBarPadding(_getRatingBarAlign(getRatingBarDefaultWidget(widgetModel))));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getRatingBarExpanded(_getRatingBarPadding(getRatingBarDefaultWidget(widgetModel)));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRatingBarExpanded(_getRatingBarAlign(getRatingBarDefaultWidget(widgetModel)));
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRatingBarPadding(_getRatingBarAlign((getRatingBarDefaultWidget(widgetModel))));
    } else if (getPadding(padding)) {
      return _getRatingBarPadding(getRatingBarDefaultWidget(widgetModel));
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getRatingBarAlign(getRatingBarDefaultWidget(widgetModel));
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getRatingBarExpanded(getRatingBarDefaultWidget(widgetModel));
    } else {
      return getRatingBarDefaultWidget(widgetModel);
    }
  }

  _getRatingBarExpanded(Widget _child) {
    return Expanded(child: _child, flex: flex ?? 1);
  }

  _getRatingBarPadding(Widget _child) {
    return Padding(padding: padding!, child: _child);
  }

  _getRatingBarAlign(Widget _child) {
    return Align(
      alignment: Alignment(horizontalAlignment ?? DEFAULT_HORIZONTAL_ALIGNMENT, verticalAlignment ?? DEFAULT_VERTICAL_ALIGNMENT),
      child: _child,
    );
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
        "child:${getRatingBarString()},\n"
        ")";
  }

  _getStringPadding(String child) {
    return "Padding(\n"
        "padding:${getPaddingString(padding)},\n"
        "child:$child,\n"
        ")";
  }

  /// For view code
  getRatingBarString() {
    return "RatingBar.builder(\n"
        "initialRating: ${rating ?? DEFAULT_RATING},\n"
        "unratedColor: ${unRatedColor ?? DEFAULT_UNRATED_COLOR},\n"
        "itemBuilder: (context, index) => Icon(\n"
        "${'Icons.star'},\n"
        "color:${ratedColor ?? DEFAULT_RATED_COLOR}\n"
        "),\n"
        "itemCount: ${ratingItemCount ?? DEFAULT_RATING_ITEM_COUNT},\n"
        "itemSize: ${ratingSize ?? DEFAULT_RATING_ITEM_SIZE},\n"
        "direction: ${axis != null ? getAxis(axis: axis) : Axis.horizontal},\n"
        "allowHalfRating: ${allowHalfRating ?? false},\n"
        "onRatingUpdate: (value) {},\n"
        ")";
  }

  /// For view code
  getCodeAsString(WidgetModel widgetModel) {
    if (getExpanded(widgetModel, isExpanded) && getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringPadding(_getStringAlign()));
    } else if (getExpanded(widgetModel, isExpanded) && getPadding(padding)) {
      return _getStringExpanded(_getStringPadding(getRatingBarString()));
    } else if (getExpanded(widgetModel, isExpanded) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringExpanded(_getStringAlign());
    } else if (getPadding(padding) && getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringPadding(_getStringAlign());
    } else if (getPadding(padding)) {
      return _getStringPadding(getRatingBarString());
    } else if (getHorizontalOrVerticalAlignment(horizontalAlignment, verticalAlignment, isAlignX, isAlignY)) {
      return _getStringAlign();
    } else if (getExpanded(widgetModel, isExpanded)) {
      return _getStringExpanded(getRatingBarString());
    } else {
      return getRatingBarString();
    }
  }

  /// Import all header files which are use for this lib
  getHeaderClassFiles() {
    return ["import 'package:flutter_rating_bar/flutter_rating_bar.dart';"];
  }

  /// Import pubspec.yaml lib name
  getYamlLib() {
    return ["#Rating bar lib", "flutter_rating_bar: ^4.0.0 \n\n"];
  }
}
