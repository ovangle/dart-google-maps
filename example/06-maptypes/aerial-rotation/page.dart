import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

GMap map;

void main() {
  js.scoped(() {
    final mapOptions = new MapOptions()
      ..center = new LatLng(45.518970, -122.672899)
      ..zoom = 18
      ..mapTypeId = MapTypeId.SATELLITE
      ..heading = 90
      ..tilt = 45
      ;
    map = jsw.retain(new GMap(query("#map_canvas"), mapOptions));
    map.tilt = 45;

    query("#autoRotate").on.click.add((e) => autoRotate());
  });
}

void rotate90() {
  js.scoped(() {
    final headingMap = map.heading;
    final heading = headingMap != null ? headingMap : 0;
    map.heading = heading + 90;
  });
}

void autoRotate() {
  js.scoped(() {
    // Determine if we're showing aerial imagery
    if (map.tilt != 0) {
      window.setInterval(rotate90, 3000);
    }
  });
}