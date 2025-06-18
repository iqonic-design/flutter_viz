import 'dart:html';
import 'dart:ui_web' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gmaps;
import 'package:web/src/dom/html.dart';

/// Constants (you can place these elsewhere in a constants file)
const double DEFAULT_LATITUDE = 37.7749; // Example: San Francisco
const double DEFAULT_LONGITUDE = -122.4194;
const double DEFAULT_ZOOM = 12.0;
ui.PlatformViewRegistry get platformViewRegistry => ui.platformViewRegistry;
class GoogleMapClass {
  double? latitude;
  double? longitude;
  double? zoom;
  bool? isDisableDefaultUI;

  GoogleMapClass({
    this.latitude,
    this.longitude,
    this.zoom,
    this.isDisableDefaultUI = true,
  });

  GoogleMapClass.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'] ?? DEFAULT_LATITUDE;
    longitude = json['longitude'] ?? DEFAULT_LONGITUDE;
    zoom = (json['zoom'] ?? DEFAULT_ZOOM).toDouble();
    isDisableDefaultUI = json['isDisableDefaultUI'] ?? true;
  }

  Map<String, dynamic> toJson() {
    return {
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (zoom != null) 'zoom': zoom,
      if (isDisableDefaultUI != null) 'isDisableDefaultUI': isDisableDefaultUI,
    };
  }

  /// Registers and returns the HTML Google Map Widget
  Widget getMap() {
    const String htmlId = "google-map-html-view";

    // ignore: undefined_prefixed_name
    if(kIsWeb)
      platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
        final myLatlng = gmaps.LatLng(latitude ?? DEFAULT_LATITUDE, longitude ?? DEFAULT_LONGITUDE);

        final mapOptions = gmaps.MapOptions()
          ..zoom = zoom ?? DEFAULT_ZOOM
          ..disableDefaultUI = isDisableDefaultUI ?? true
          ..center = myLatlng;

        final elem = DivElement()
          ..id = htmlId
          ..style.width = "100%"
          ..style.height = "100%"
          ..style.border = 'none';

        final map = gmaps.Map(elem as HTMLElement, mapOptions);

        gmaps.Marker(gmaps.MarkerOptions()
          ..position = myLatlng
          ..map = map
          ..title = 'Hello World!');

        return elem;
      });

    return HtmlElementView(viewType: htmlId);
  }


  /// Optional: Wrap map in AbsorbPointer if needed
  Widget getGoogleMapWidget({bool absorb = false}) {
    return AbsorbPointer(
      absorbing: absorb,
      child: getMap(),
    );
  }

  /// Placeholder for mobile code generation
  String getCodeAsString() {
    return "";
  }

  /// Header files for code export (if needed)
  List<String> getHeaderClassFiles() {
    return ["Your Google map lib"];
  }

  /// Pubspec.yaml libraries to include
  List<String> getYamlLib() {
    return ["# Google Maps for Flutter Web", "google_maps: any"];
  }
}