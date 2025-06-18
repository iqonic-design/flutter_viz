import 'package:flutter/material.dart';

class StackClassWidgets extends StatefulWidget {
  @override
  _StackClassWidgetsState createState() => _StackClassWidgetsState();
}

class _StackClassWidgetsState extends State<StackClassWidgets> {
  var _x = 0.0;
  var _y = 0.0;
  final GlobalKey stackKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // 2.
        key: stackKey, // 3.
        fit: StackFit.expand,
        children: [
          Positioned(
            // 5.
            left: _x,
            top: _y,
            child: Draggable(
              // 6.
              child: Text('Move me'), // 7.
              feedback: Text('Move me'), // 8.
              childWhenDragging: Container(), // 9.
              onDragEnd: (dragDetails) {
                // 10.
                setState(() {
                  final parentPos = stackKey.globalPaintBounds;
                  if (parentPos == null) return;
                  _x = dragDetails.offset.dx - parentPos.left; // 11.
                  _y = dragDetails.offset.dy - parentPos.top;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final RenderObject? renderObject = currentContext?.findRenderObject()!;
    var translation = renderObject!.getTransformTo(null).getTranslation();
    return renderObject.paintBounds.shift(Offset(translation.x, translation.y));
  }
}
