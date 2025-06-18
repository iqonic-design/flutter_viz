import 'package:flutter/material.dart';

class ZoomExample extends StatefulWidget {
  @override
  _ZoomExampleState createState() => _ZoomExampleState();
}

class _ZoomExampleState extends State<ZoomExample> {
  double initZoom = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          minScale: 10,
          maxScale: 15,
          child: Image.network("https://yt3.ggpht.com/ytc/AKedOLQkusni0A_miSgASzbS1EO8aob-xanXO8fwRsy18Q=s48-c-k-c0x00ffffff-no-rj"),
        ),
      ),
    );
  }
}
