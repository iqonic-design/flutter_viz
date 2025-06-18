import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

/// show Container confirm dialog box
Future<bool?> showReplaceConfirmDialog<bool>(
  context,
  String title, {
  String replaceText = 'Replace',
  String negativeText = 'Cancel',
  Color? buttonColor,
  Function? onReplaceAccept,
}) async {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title.validate(), style: primaryTextStyle()),
      actions: <Widget>[
        SimpleDialogOption(
          child: Text(negativeText.validate(), style: secondaryTextStyle()),
          onPressed: () {
            finish(_, false);
          },
        ),
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onReplaceAccept?.call();
          },
          child: Text(replaceText.validate(), style: primaryTextStyle(color: buttonColor ?? Theme.of(_).primaryColor)),
        ),
      ],
    ),
  );
}

/// show root view confirm dialog box
Future<bool?> showRootConfirmDialog<bool>(
  context,
  String title, {
  String columnText = 'Add Column',
  String containerText = 'Add Container',
  String rowText = 'Add Row',
  String negativeText = 'Cancel',
  String defaultView = 'Default',
  Color? buttonColor,
  bool? barrierDismissible,
  Function? onColumnAccept,
  Function? onRowAccept,
  Function? onContainerAccept,
  Function? onDefaultAccept,
}) async {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title.validate(), style: primaryTextStyle()),
      actions: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onDefaultAccept?.call();
          },
          child: Text(defaultView.validate(), style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : Colors.black)),
        ),
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onRowAccept?.call();
          },
          child: Text(rowText.validate(), style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : Colors.black)),
        ),
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onContainerAccept?.call();
          },
          child: Text(containerText.validate(), style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : Colors.black)),
        ),
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onColumnAccept?.call();
          },
          child: Text(columnText.validate(), style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : Colors.black)),
        ),
        SimpleDialogOption(
          child: Text(negativeText.validate(), style: secondaryTextStyle()),
          onPressed: () {
            finish(_, false);
          },
        ),
      ],
    ),
  );
}

/// show Container confirm dialog box
Future<bool?> showContainerConfirmDialog<bool>(
  context,
  String title, {
  String columnText = 'Add Column',
  String replaceText = 'Replace',
  String rowText = 'Add Row',
  String negativeText = 'Cancel',
  Color? buttonColor,
  bool? barrierDismissible,
  Function? onColumnAccept,
  Function? onRowAccept,
  Function? onReplaceAccept,
}) async {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title.validate(), style: primaryTextStyle()),
      actions: <Widget>[
        SimpleDialogOption(
          child: Text(negativeText.validate(), style: secondaryTextStyle()),
          onPressed: () {
            finish(_, false);
          },
        ),
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onRowAccept?.call();
          },
          child: Text(rowText.validate(), style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : Colors.black)),
        ),
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onColumnAccept?.call();
          },
          child: Text(columnText.validate(), style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : Colors.black)),
        ),
        SimpleDialogOption(
          onPressed: () {
            finish(_, true);
            onReplaceAccept?.call();
          },
          child: Text(replaceText.validate(), style: primaryTextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : Colors.black)),
        ),
      ],
    ),
  );
}
