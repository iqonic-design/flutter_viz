import 'dart:html' as webFile;

import 'package:flutter_viz/externalClasses/on_hover.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class CodeViewHeaderComponent extends StatefulWidget {
  final bool isViewCode;

  CodeViewHeaderComponent(this.isViewCode);

  @override
  _CodeViewHeaderComponentState createState() => _CodeViewHeaderComponentState();
}

class _CodeViewHeaderComponentState extends State<CodeViewHeaderComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getHeaderLogoImage(),
          OnHover(builder: (isHovered) {
            return elevationButtonWithIcon(
              isHovered: isHovered,
              icon: Icons.close,
              toolTipMessage: language!.closeScreen,
              title: language!.close,
              onPressed: () {
                appStore.isPreviewCode = false;
                Navigator.pop(context);
              },
            );
          }),
          16.width,
          (widget.isViewCode)
              ? OnHover(builder: (isHovered) {
                  return elevationButtonWithIcon(
                      isHovered: isHovered,
                      toolTipMessage: language!.downloadCode,
                      icon: Icons.download,
                      title: language!.downloadCode,
                      onPressed: () {
                        trackUserEvent(DOWNLOAD_CODE);
                        downloadDartFileCode();
                      });
                })
              : SizedBox(),
        ],
      ),
    );
  }

  /// Download dart file source code
  downloadDartFileCode() async {
    List<String> filesContent = <String>[];
    filesContent.add(language!.copyrightInformation);
    filesContent.addAll(appStore.codeViewData);

    var blob = webFile.Blob(filesContent, 'text/plain', 'native');
    webFile.AnchorElement(
      href: webFile.Url.createObjectUrlFromBlob(blob).toString(),
    )
      ..setAttribute("download", "${getFileName()}.dart")
      ..click();
  }
}
