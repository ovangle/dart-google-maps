import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final myLatlng = new LatLng(51.501904,-0.115871);
    final mapOptions = new MapOptions()
      ..zoom = 13
      ..center = myLatlng
      ..mapTypeId = MapTypeId.ROADMAP
      ;
    final map = new GMap(query("#map_canvas"), mapOptions);

    final transitLayer = new TransitLayer();
    transitLayer.map = map;
  });
}
