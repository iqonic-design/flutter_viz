// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:string_scanner/string_scanner.dart';

class SyntaxHighlighterStyle {
  SyntaxHighlighterStyle({this.baseStyle, this.numberStyle, this.commentStyle, this.keywordStyle, this.stringStyle, this.punctuationStyle, this.classStyle, this.constantStyle});

  static SyntaxHighlighterStyle lightThemeStyle() {
    return SyntaxHighlighterStyle(
        baseStyle: const TextStyle(color: const Color(0xFF000000)),
        numberStyle: const TextStyle(color: const Color(0xFF1565C0)),
        commentStyle: const TextStyle(color: const Color(0xFF9E9E9E)),
        keywordStyle: const TextStyle(color: const Color(0xFF9C27B0)),
        stringStyle: const TextStyle(color: const Color(0xFF43A047)),
        punctuationStyle: const TextStyle(color: const Color(0xFF000000)),
        classStyle: const TextStyle(color: const Color(0xFF512DA8)),
        constantStyle: const TextStyle(color: const Color(0xFF795548)));
  }

  static SyntaxHighlighterStyle darkThemeStyle() {
    return SyntaxHighlighterStyle(
        baseStyle: const TextStyle(color: const Color(0xFFFFC66D)),
        numberStyle: const TextStyle(color: const Color(0xFF1565C0)),
        commentStyle: const TextStyle(color: const Color(0xFF9E9E9E)),
        keywordStyle: const TextStyle(color: const Color(0xFFCC7832)),
        stringStyle: const TextStyle(color: const Color(0xFF6A8759)),
        punctuationStyle: const TextStyle(color: const Color(0xFFFFFFFF)),
        classStyle: const TextStyle(color: const Color(0xFF80CBC4)),
        constantStyle: const TextStyle(color: const Color(0xFF795548)));
  }

  final TextStyle? baseStyle;
  final TextStyle? numberStyle;
  final TextStyle? commentStyle;
  final TextStyle? keywordStyle;
  final TextStyle? stringStyle;
  final TextStyle? punctuationStyle;
  final TextStyle? classStyle;
  final TextStyle? constantStyle;
}

abstract class SyntaxHighlighter {
  // ignore: one_member_abstracts
  TextSpan format(String src);
}

class DartSyntaxHighlighter extends SyntaxHighlighter {

  DartSyntaxHighlighter([this._style]) {
    _spans = <_HighlightSpan>[];
    _style ??= SyntaxHighlighterStyle.darkThemeStyle();
  }

  SyntaxHighlighterStyle? _style;

  static const List<String> _keywords = const <String>[
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'deferred',
    'do',
    'dynamic',
    'else',
    'enum',
    'export',
    'external',
    'extends',
    'factory',
    'false',
    'final',
    'finally',
    'for',
    'get',
    'if',
    'implements',
    'import',
    'in',
    'is',
    'library',
    'new',
    'null',
    'operator',
    'part',
    'rethrow',
    'return',
    'set',
    'static',
    'super',
    'switch',
    'sync',
    'this',
    'throw',
    'true',
    'try',
    'typedef',
    'var',
    'void',
    'while',
    'with',
    'yield'
  ];

  static const List<String> _builtInTypes = const <String>['int', 'double', 'num', 'bool'];

  late String _src;
  late StringScanner _scanner;

  late List<_HighlightSpan> _spans;

  @override
  TextSpan format(String src) {
    _src = src;
    _scanner = StringScanner(_src);

    if (_generateSpans()) {
      // Successfully parsed the code
      final List<TextSpan> formattedText = <TextSpan>[];
      int currentPosition = 0;

      for (_HighlightSpan span in _spans) {
        if (currentPosition != span.start) formattedText.add(TextSpan(text: _src.substring(currentPosition, span.start)));

        formattedText.add(TextSpan(style: span.textStyle(_style), text: span.textForSpan(_src)));

        currentPosition = span.end;
      }

      if (currentPosition != _src.length) formattedText.add(TextSpan(text: _src.substring(currentPosition, _src.length)));

      return TextSpan(style: _style!.baseStyle, children: formattedText);
    } else {
      // Parsing failed, return with only basic formatting
      return TextSpan(style: _style!.baseStyle, text: src);
    }
  }

  bool _generateSpans() {
    int lastLoopPosition = _scanner.position;

    while (!_scanner.isDone) {
      // Skip White space
      _scanner.scan(RegExp(r'\s+'));

      // Block comments
      if (_scanner.scan(RegExp(r'/\*(.|\n)*\*/'))) {
        _spans.add(_HighlightSpan(_HighlightType.comment, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Line comments
      if (_scanner.scan('//')) {
        final int startComment = _scanner.lastMatch!.start;

        bool eof = false;
        int endComment;
        if (_scanner.scan(RegExp(r'.*\n'))) {
          endComment = _scanner.lastMatch!.end - 1;
        } else {
          eof = true;
          endComment = _src.length;
        }

        _spans.add(_HighlightSpan(_HighlightType.comment, startComment, endComment));

        if (eof) break;

        continue;
      }

      // Raw r"String"
      if (_scanner.scan(RegExp(r'r".*"'))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Raw r'String'
      if (_scanner.scan(RegExp(r"r'.*'"))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Multiline """String"""
      if (_scanner.scan(RegExp(r'"""(?:[^"\\]|\\(.|\n))*"""'))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Multiline '''String'''
      if (_scanner.scan(RegExp(r"'''(?:[^'\\]|\\(.|\n))*'''"))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // "String"
      if (_scanner.scan(RegExp(r'"(?:[^"\\]|\\.)*"'))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // 'String'
      if (_scanner.scan(RegExp(r"'(?:[^'\\]|\\.)*'"))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Double
      if (_scanner.scan(RegExp(r'\d+\.\d+'))) {
        _spans.add(_HighlightSpan(_HighlightType.number, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Integer
      if (_scanner.scan(RegExp(r'\d+'))) {
        _spans.add(_HighlightSpan(_HighlightType.number, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Punctuation
      if (_scanner.scan(RegExp(r'[\[\]{}().!=<>&\|\?\+\-\*/%\^~;:,]'))) {
        _spans.add(_HighlightSpan(_HighlightType.punctuation, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Meta data
      if (_scanner.scan(RegExp(r'@\w+'))) {
        _spans.add(_HighlightSpan(_HighlightType.keyword, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Words
      if (_scanner.scan(RegExp(r'\w+'))) {
        _HighlightType? type;

        String word = _scanner.lastMatch![0]!;
        if (word.startsWith('_')) word = word.substring(1);

        if (_keywords.contains(word))
          type = _HighlightType.keyword;
        else if (_builtInTypes.contains(word))
          type = _HighlightType.keyword;
        else if (_firstLetterIsUpperCase(word))
          type = _HighlightType.klass;
        else if (word.length >= 2 && word.startsWith('k') && _firstLetterIsUpperCase(word.substring(1))) type = _HighlightType.constant;

        if (type != null) {
          _spans.add(_HighlightSpan(type, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        }
      }

      // Check if this loop did anything
      if (lastLoopPosition == _scanner.position) {
        // Failed to parse this file, abort gracefully
        return false;
      }
      lastLoopPosition = _scanner.position;
    }

    _simplify();
    return true;
  }

  void _simplify() {
    for (int i = _spans.length - 2; i >= 0; i -= 1) {
      if (_spans[i].type == _spans[i + 1].type && _spans[i].end == _spans[i + 1].start) {
        _spans[i] = _HighlightSpan(_spans[i].type, _spans[i].start, _spans[i + 1].end);
        _spans.removeAt(i + 1);
      }
    }
  }

  bool _firstLetterIsUpperCase(String str) {
    if (str.isNotEmpty) {
      final String first = str.substring(0, 1);
      return first == first.toUpperCase();
    }
    return false;
  }
}

enum _HighlightType { number, comment, keyword, string, punctuation, klass, constant }

class _HighlightSpan {
  _HighlightSpan(this.type, this.start, this.end);

  final _HighlightType type;
  final int start;
  final int end;

  String textForSpan(String src) {
    return src.substring(start, end);
  }

  TextStyle? textStyle(SyntaxHighlighterStyle? style) {
    if (type == _HighlightType.number)
      return style!.numberStyle;
    else if (type == _HighlightType.comment)
      return style!.commentStyle;
    else if (type == _HighlightType.keyword)
      return style!.keywordStyle;
    else if (type == _HighlightType.string)
      return style!.stringStyle;
    else if (type == _HighlightType.punctuation)
      return style!.punctuationStyle;
    else if (type == _HighlightType.klass)
      return style!.classStyle;
    else if (type == _HighlightType.constant)
      return style!.constantStyle;
    else
      return style!.baseStyle;
  }
}
