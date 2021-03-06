import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final fenway = new LatLng(42.345573,-71.098326);
    final mapOptions = new MapOptions()
      ..center = fenway
      ..zoom = 14
      ..mapTypeId = MapTypeId.ROADMAP
      ;
    final map = new GMap(query('#map_canvas'), mapOptions);
  });
}