import 'dart:html' as webFile;

import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/syntax_highlighter.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class PubSpecFileDetails extends StatefulWidget {
  @override
  _PubSpecFileDetailsState createState() => _PubSpecFileDetailsState();
}

class _PubSpecFileDetailsState extends State<PubSpecFileDetails> {
  List<String> otherFiles = <String>[];

  double _textScaleFactor = 1.0;
  String codeContent = "";

  @override
  void initState() {
    super.initState();

    /// dependencies lib
    codeContent = codeContent + "dependencies:\n";
    for (int i = 0; i < appStore.yamlImportLib.length; i++) {
      codeContent = codeContent + "\n  " + appStore.yamlImportLib[i];
    }

    /// Other Files
    for (int i = 0; i < appStore.headerImport.length; i++) {
      if (!isContainsExtraFiles(appStore.headerImport[i])) {
        otherFiles.add(appStore.headerImport[i].replaceAll("import ", "").replaceAll("'", "").replaceAll(";", ""));
      }
    }
  }

  /// Download FlutterViz lib source code
  downloadCode(String fileName) async {
    trackUserEvent(DOWNLOAD_CODE);

    String fileContent = await loadFileContent(fileName);
    List<String> files = <String>[];
    files.add(language!.copyrightInformation);
    files.add(fileContent);

    var blob = webFile.Blob(files, 'text/plain', 'native');
    webFile.AnchorElement(
      href: webFile.Url.createObjectUrlFromBlob(blob).toString(),
    )
      ..setAttribute("download", "$fileName")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    Widget getCodeView(String codeContent, BuildContext context) {
      codeContent = codeContent.replaceAll('\r\n', '\n').replaceAll('\n\n', '\n');
      final SyntaxHighlighterStyle style = appStore.isDarkMode ? SyntaxHighlighterStyle.darkThemeStyle() : SyntaxHighlighterStyle.lightThemeStyle();
      return Container(
        child: SelectableText.rich(
          TextSpan(
            style: GoogleFonts.notoSansMono(
              textStyle: TextStyle(fontSize: 12),
            ).apply(fontSizeFactor: this._textScaleFactor),
            children: <TextSpan>[DartSyntaxHighlighter(style).format(codeContent)],
          ),
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: this._textScaleFactor),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(10),
      color: appStore.isDarkMode ? darkModePrimaryColorBackground : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language!.pubspecYaml,
            style: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : btnBackgroundColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          getCodeView(codeContent, context),
          SizedBox(height: 30),
          Text(
            language!.relatedFiles,
            style: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : btnBackgroundColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: otherFiles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  downloadCode(otherFiles[index]);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${otherFiles[index]}",
                            style: boldTextStyle(
                              color: appStore.isDarkMode ? darkModeSubTextColor : DEFAULT_TEXT_COLOR,
                              size: 14,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_circle_down, color: appStore.isDarkMode ? darkModeSubTextColor : DEFAULT_TEXT_COLOR),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
