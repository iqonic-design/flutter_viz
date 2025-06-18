import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reorderables/reorderables.dart';

class ReorderScreenWidget extends StatefulWidget {
  @override
  _ReorderScreenWidgetState createState() => _ReorderScreenWidgetState();
}

class _ReorderScreenWidgetState extends State<ReorderScreenWidget> {
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (appStore.selectedWidgetList[0].subWidgetsList![oldIndex]!.widgetType == WidgetTypeAppBarLayout) {
      if (oldIndex == 0) {
        Fluttertoast.showToast(
          msg: language!.appBarNotMovable,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Color(0xFFFAFAFA),
          textColor: Colors.white,
        );
      } else {
        updateIndex(newIndex, oldIndex);
      }
    } else if (newIndex == 0 && appStore.selectedWidgetList[0].subWidgetsList![0]!.widgetType == WidgetTypeAppBarLayout) {
      Fluttertoast.showToast(
        msg: language!.youCanNotReplaceWidgetOfAppBar,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Color(0xFFFAFAFA),
        textColor: Colors.white,
      );
    } else {
      updateIndex(newIndex, oldIndex);
    }
  }

  @action
  void updateIndex(newIndex, oldIndex) {
    WidgetModel? item = appStore.selectedWidgetList[0].subWidgetsList!.removeAt(oldIndex);
    appStore.selectedWidgetList[0].subWidgetsList!.insert(newIndex, item);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ReorderableColumn(
          children: List.generate(
            appStore.selectedWidgetList[0].subWidgetsList!.length,
            (index) {
              WidgetModel widgetModel = appStore.selectedWidgetList[0].subWidgetsList![index]!;
              return Container(
                key: ValueKey(widgetModel.id),
                margin: EdgeInsets.only(bottom: 10),
                decoration: boxDecorationRoundedWithShadow(
                  defaultRadius.toInt(),
                  spreadRadius: 0,
                  blurRadius: 5,
                  backgroundColor: Theme.of(context).cardColor,
                ),
                child: Row(
                  children: [
                    (widgetModel.widgetType == WidgetTypeAppBarLayout)
                        ? SizedBox()
                        : Image.asset(
                            'images/drag_icon.png',
                            fit: BoxFit.cover,
                            height: 25,
                            width: 25,
                            color: iconColor,
                          ),
                    16.width,
                    Text(widgetModel.title.toString(), style: primaryTextStyle(size: 16)).expand(),
                  ],
                ).paddingAll(12),
              );
            },
          ),
          padding: EdgeInsets.all(0),
          scrollController: ScrollController(initialScrollOffset: 50),
          onReorder: _onReorder,
          mainAxisSize: MainAxisSize.max,
          onNoReorder: (int index) {},
        ).withHeight(
          context.height() * (appStore.selectedWidgetList[0].subWidgetsList!.length.toDouble() * 8.5 / 100),
        );
      },
    );
  }
}
