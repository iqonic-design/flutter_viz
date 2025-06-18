import 'package:flutter_viz/components/centerView/dashboard-preview_component.dart';
import 'package:flutter_viz/components/keyboard_shortCuts_dialog.dart';
import 'package:flutter_viz/model/device_screen_size.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/handle_keyboard_event.dart';
import 'package:flutter_viz/widgets/on_accept_widgets.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:screenshot/screenshot.dart';

import '../../main.dart';

// ignore: must_be_immutable
class CenterBodyComponent extends StatefulWidget {
  @override
  _CenterBodyComponentState createState() => _CenterBodyComponentState();
}

class _CenterBodyComponentState extends State<CenterBodyComponent> with TickerProviderStateMixin {
  final FocusNode focusNode = FocusNode();

  /// Device Size
  List<DeviceScreenSize> screenDeviceSize = [];

  bool _fromBottom = true;

  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    screenDeviceSize.clear();
    screenDeviceSize.add(appStore.selectedDeviceScreenSize);

    /// https://yesviz.com/viewport/
    screenDeviceSize.add(DeviceScreenSize(screenId: 101, name: language!.samsungS20, deviceWidth: 360, deviceHeight: 800));
    screenDeviceSize.add(DeviceScreenSize(screenId: 102, name: language!.samsungS10, deviceWidth: 360, deviceHeight: 760));
    screenDeviceSize.add(DeviceScreenSize(screenId: 103, name: language!.samsungS7Edge, deviceWidth: 360, deviceHeight: 640));
    screenDeviceSize.add(DeviceScreenSize(screenId: 104, name: language!.samsungS20Plus, deviceWidth: 384, deviceHeight: 854));
    screenDeviceSize.add(DeviceScreenSize(screenId: 105, name: language!.onePlus8Pro, deviceWidth: 412, deviceHeight: 906));
    screenDeviceSize.add(DeviceScreenSize(screenId: 106, name: language!.googlePixel4XL, deviceWidth: 412, deviceHeight: 869));
    screenDeviceSize.add(DeviceScreenSize(screenId: 107, name: language!.onePlus7TPro, deviceWidth: 412, deviceHeight: 892));
    screenDeviceSize.add(DeviceScreenSize(screenId: 108, name: language!.appleIPhone12Mini, deviceWidth: 360, deviceHeight: 780));
    screenDeviceSize.add(DeviceScreenSize(screenId: 109, name: language!.appleIPhone12ProMax, deviceWidth: 428, deviceHeight: 926));
    screenDeviceSize.add(DeviceScreenSize(screenId: 110, name: language!.samsungGalaxyS7, deviceWidth: 360, deviceHeight: 640));
    screenDeviceSize.add(DeviceScreenSize(screenId: 111, name: language!.appleIPhone8Plus, deviceWidth: 414, deviceHeight: 736));
    screenDeviceSize.add(DeviceScreenSize(screenId: 112, name: language!.appleIPadMini, deviceWidth: 768, deviceHeight: 1024));
    screenDeviceSize.add(DeviceScreenSize(screenId: 112, name: language!.appleIPadPro12Point9, deviceWidth: 800, deviceHeight: 1100));
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: GestureDetector(
        child: KeyboardListener(
          focusNode: focusNode,
          autofocus: true,
          onKeyEvent: (event) {
            handleKeyboardEvent(event, context);
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.90,
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Transform.scale(
                        scale: _scale,
                        transformHitTests: false,
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: appStore.isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                            ),
                            width: deviceWidth,
                            height: deviceHeight,
                            child: DragTarget<WidgetModel>(
                              builder: (context, candidateItems, rejectedItems) {
                                return Screenshot(
                                  controller: screenshotController,
                                  child: DashboardPreviewComponent().cornerRadiusWithClipRRect(0),
                                );
                              },
                              onAccept: (item) {
                                rootViewAcceptChild(item);
                              },
                            ),
                          ).cornerRadiusWithClipRRect(5),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Image.asset("images/keyboard_icon.png", width: 80, height: 40, color: context.iconColor),
                            onTap: () {
                              showGeneralDialog(
                                barrierColor: Colors.transparent,
                                transitionBuilder: (context, a1, a2, widget) {
                                  return SlideTransition(
                                    position: Tween(begin: Offset(0, _fromBottom ? 1 : -1), end: Offset(0, 0)).animate(a1),
                                    child: widget,
                                  );
                                },
                                transitionDuration: Duration(milliseconds: 400),
                                barrierDismissible: true,
                                barrierLabel: '',
                                context: context,
                                pageBuilder: (context, animation1, animation2) {
                                  return Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 350,
                                      margin: EdgeInsets.only(top: 70),
                                      padding: EdgeInsets.all(16),
                                      child: KeyboardShortCutsDialog(),
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: context.scaffoldBackgroundColor,
                                        boxShadow: [
                                          commonCardBoxShadow(),
                                        ],
                                        borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                        border: Border.all(color: appStore.isDarkMode ? Colors.grey : btnBackgroundColor),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          GestureDetector(
                            child: Icon(Icons.zoom_out, size: 40),
                            onTap: () {
                              if (_scale > 0.7) {
                                _scale = _scale - 0.1;
                                setState(() {});
                              }
                            },
                          ),
                          GestureDetector(
                            child: Icon(Icons.zoom_in, size: 40),
                            onTap: () {
                              if (_scale < 1.3) {
                                _scale = _scale + 0.1;
                                setState(() {});
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
          if (!appStore.isPreviewCode) {
            appStore.selectRootView();
            appStore.refreshMainViewData();
          }
        },
      ),
    );
  }
}
