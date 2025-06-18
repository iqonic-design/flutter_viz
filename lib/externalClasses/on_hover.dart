import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered)? builder;

  const OnHover({Key? key, this.builder}) : super(key: key);

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: commonAnimationDuration,
        child: widget.builder!(isHovering),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovering = isHovered;
    });
  }
}
