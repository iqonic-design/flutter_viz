import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/widgetsClass/google_map_class.dart' hide DEFAULT_LONGITUDE, DEFAULT_ZOOM, DEFAULT_LATITUDE;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'comman_property_view.dart';

class GoogleMapPropertyView extends StatefulWidget {
  static String tag = '/GoogleMapPropertyView';

  @override
  GoogleMapPropertyViewState createState() => GoogleMapPropertyViewState();
}

class GoogleMapPropertyViewState extends State<GoogleMapPropertyView> {
  var googleMapClass;

  init() async {
    googleMapClass = appStore.currentSelectedWidget!.widgetViewModel as GoogleMapClass?;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionTileView(
          language!.latitude,
          context,
          <Widget>[
            Container(
              width: 120,
              child: getTextField(
                  controller: TextEditingController(text: googleMapClass.latitude != null ? googleMapClass.latitude.toString() : DEFAULT_LATITUDE.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (value) {
                    googleMapClass.latitude = double.parse(value);
                    appStore.updateData(googleMapClass);
                  }),
            ),
          ],
        ),
        ExpansionTileView(
          language!.longitude,
          context,
          <Widget>[
            Container(
              width: 120,
              child: getTextField(
                controller: TextEditingController(text: googleMapClass.longitude != null ? googleMapClass.longitude.toString() : DEFAULT_LONGITUDE.toString()),
                textAlign: TextAlign.center,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                ],
                onChanged: (s) {
                  googleMapClass.longitude = double.parse(s);
                  appStore.updateData(googleMapClass);
                },
              ),
            ),
          ],
        ),
        ExpansionTileView(
          language!.zoom,
          context,
          <Widget>[
            Container(
              width: 120,
              child: getTextField(
                  controller: TextEditingController(text: googleMapClass.zoom != null ? googleMapClass.zoom.toString() : DEFAULT_ZOOM.toString()),
                  textAlign: TextAlign.center,
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9 .]')),
                  ],
                  onChanged: (String s) {
                    googleMapClass.zoom = double.parse(s);
                    appStore.updateData(googleMapClass);
                  }),
            ),
          ],
        ),
        ExpansionTileView(
          language!.disableDefaultUI,
          context,
          <Widget>[
            checkBoxView(
              googleMapClass.isDisableDefaultUI ?? false,
              language!.disableDefaultUI,
              onChanged: (value) {
                googleMapClass.isDisableDefaultUI = value;
                setState(() {});
                appStore.updateData(googleMapClass);
              },
            ),
          ],
        ),
      ],
    );
  }
}