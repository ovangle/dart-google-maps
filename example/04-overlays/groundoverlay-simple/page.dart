import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final newark = new LatLng(40.740, -74.18);
    final imageBounds = new LatLngBounds(
        new LatLng(40.712216,-74.22655),
        new LatLng(40.773941,-74.12544));

    final mapOptions = new MapOptions()
      ..zoom = 13
      ..center = newark
      ..mapTypeId = MapTypeId.ROADMAP
      ;
    final map = new GMap(query("#map_canvas"), mapOptions);

    final oldmap = new GroundOverlay(
        'https://www.lib.utexas.edu/maps/historical/newark_nj_1922.jpg',
        imageBounds);
    oldmap.map = map;
  });
}
