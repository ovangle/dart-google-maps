import 'dart:html' hide Events;
import 'dart:math';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final mapOptions = new MapOptions()
      ..zoom = 8
      ..center = new LatLng(-34.397, 150.644)
      ..mapTypeId = MapTypeId.ROADMAP
    ;

    final mapDiv = query("#map_canvas");
    final map = new GMap(mapDiv, mapOptions);

    // We add a DOM event here to show an alert if the DIV containing the
    // map is clicked. Note that we do this within the intialize function
    // since the document object isn't loaded until after the window.load
    // event.
    event.addDomListener(mapDiv, 'click', (e) { window.alert('DIV clicked'); });
  });
}
