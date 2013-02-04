import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final myLatlng = new LatLng(49.496675,-102.65625);
    final mapOptions = new MapOptions()
      ..zoom = 4
      ..center = myLatlng
      ..mapTypeId = MapTypeId.ROADMAP
      ;
    final map = new GMap(query("#map_canvas"), mapOptions);

    // TODO signature change 3.9 -> 3.10
    final georssLayer = new KmlLayer()
      ..url = 'http://api.flickr.com/services/feeds/geo/?g=322338@N20&lang=en-us&format=feed-georss';
    georssLayer.map = map;
  });
}
