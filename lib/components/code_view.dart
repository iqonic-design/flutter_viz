import 'dart:math';

import 'package:flutter_viz/utils/syntax_highlighter.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class CodeView extends StatefulWidget {
  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  double textScaleFactor = 1.0;
  String codeContent = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    for (int i = 0; i < appStore.codeViewData.length; i++) {
      codeContent = codeContent + appStore.codeViewData[i];
    }
  }

  Widget getCodeView(String codeContent, BuildContext context) {
    var formatter = DartFormatter(languageVersion: DartFormatter.latestLanguageVersion);
    final SyntaxHighlighterStyle style = appStore.isDarkMode ? SyntaxHighlighterStyle.darkThemeStyle() : SyntaxHighlighterStyle.lightThemeStyle();
    return Container(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SelectableText.rich(
          TextSpan(
            style: GoogleFonts.notoSansMono(
              textStyle: TextStyle(fontSize: 12),
            ).apply(fontSizeFactor: this.textScaleFactor),
            children: <TextSpan>[
              DartSyntaxHighlighter(style).format(
                formatter.format(""" $codeContent """),
              ),
            ],
          ),
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: this.textScaleFactor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.80,
      margin: EdgeInsets.all(30),
      child: Stack(
        children: [
          getCodeView(codeContent, context),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                GestureDetector(
                  child: Icon(Icons.zoom_out, size: 40),
                  onTap: () {
                    setState(() {
                      this.textScaleFactor = max(0.8, this.textScaleFactor - 0.1);
                    });
                  },
                ),
                GestureDetector(
                  child: Icon(Icons.zoom_in, size: 40),
                  onTap: () {
                    setState(() {
                      this.textScaleFactor += 0.1;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}