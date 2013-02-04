import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final mapOptions = new MapOptions()
      ..zoom = 12
      ..center = new LatLng(50.9179, -114.0140)
      ..mapTypeId = MapTypeId.ROADMAP
      ..styles = [
        new MapTypeStyle()
          ..stylers = [
            new MapTypeStyler()..hue = "#00ffe6",
            new MapTypeStyler()..saturation = -20
          ],
        new MapTypeStyle()
          ..featureType = MapTypeStyleFeatureType.ROAD
          ..elementType = MapTypeStyleElementType.GEOMETRY
          ..stylers = [
            new MapTypeStyler()..lightness = 100,
            new MapTypeStyler()..visibility = MapTypeStylerVisibility.SIMPLIFIED
          ],
        new MapTypeStyle()
          ..featureType = MapTypeStyleFeatureType.ROAD
          ..elementType = MapTypeStyleElementType.LABELS
          ..stylers = [
            new MapTypeStyler()..visibility = MapTypeStylerVisibility.OFF
          ]
      ]
      ;
    final map = new GMap(query("#map_canvas"), mapOptions);
  });
}
