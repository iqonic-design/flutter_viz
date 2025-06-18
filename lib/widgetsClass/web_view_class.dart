import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter/material.dart';

class WebViewClass {
  String? url;

  WebViewClass({this.url});

  WebViewClass.fromJson(Map<String, dynamic> json) {
    url = json['url'] != null ? json['url'] : "https://flutter.dev/";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.url != null) {
      data['url'] = this.url;
    }
    return data;
  }

  Widget getWebViewWidget({Widget? widget}) {
    return AbsorbPointer(absorbing: absorbPointer(), child: HtmlElementView(viewType: 'hello-html'));
  }

  /// For view code
  getCodeAsString() {
    return "";
  }
}
