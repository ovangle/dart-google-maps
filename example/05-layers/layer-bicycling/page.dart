import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final myLatlng = new LatLng(42.3726399, -71.1096528);
    final mapOptions = new MapOptions()
      ..zoom = 14
      ..center = myLatlng
      ..mapTypeId = MapTypeId.ROADMAP
      ;
    final map = new GMap(query("#map_canvas"), mapOptions);

    final bikeLayer = new BicyclingLayer();
    bikeLayer.map = map;
  });
}
