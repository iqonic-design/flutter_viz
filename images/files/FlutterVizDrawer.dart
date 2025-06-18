import 'package:flutter_viz/externalClasses/flutterViz_drawerItem_model.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter/material.dart';

class FlutterVizDrawer extends StatefulWidget {
  static String tag = '/FlutterVizDrawer';

  final double? elevation;
  final ImageProvider? profileImage;
  final Color? headerColor;
  final String? name;
  final String? email;
  final TextStyle? nameStyle;
  final TextStyle? emailStyle;
  final List<FlutterVizDrawerItemModel>? drawerItems;
  final Color? iconColor;
  final double? iconSize;
  final TextStyle? labelStyle;

  FlutterVizDrawer({
    this.elevation,
    this.headerColor,
    this.profileImage,
    this.name,
    this.email,
    this.nameStyle,
    this.emailStyle,
    this.drawerItems,
    this.iconSize,
    this.iconColor,
    this.labelStyle,
  });

  @override
  FlutterVizDrawerState createState() => FlutterVizDrawerState();
}

class FlutterVizDrawerState extends State<FlutterVizDrawer> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: widget.elevation ?? 16.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: widget.profileImage,
                      radius: 35,
                    ),
                    SizedBox(height: 16),
                    Text(widget.name ?? DUMMY_USER_NAME, style: widget.nameStyle ?? TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 4),
                    Text(widget.email ?? DUMMY_USER_EMAIL, style: widget.emailStyle ?? TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
                decoration: BoxDecoration(
                  color: widget.headerColor ?? Color(0xFF3a57e8),
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: (widget.drawerItems ?? []).map((item) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      Icon(IconData(item.icon.codePoint, fontFamily: item.icon.fontFamily), color: widget.iconColor ?? Colors.black, size: widget.iconSize ?? Colors.black as double?),
                      SizedBox(width: 16),
                      Text(item.label!, style: widget.labelStyle ?? TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
