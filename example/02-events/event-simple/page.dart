import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final mapOptions = new MapOptions()
      ..zoom = 4
      ..center = new LatLng(-25.363882, 131.044922)
      ..mapTypeId = MapTypeId.ROADMAP
      ;

    final map = new GMap(query("#map_canvas"), mapOptions);

    final marker = new Marker(new MarkerOptions()
      ..position = map.center
      ..map = map
      ..title = "Click to zoom"
    );

    jsw.retain(map);
    jsw.retain(marker);
    map.on.centerChanged.add(() {
      // 3 seconds after the center of the map has changed, pan back to the marker.
      window.setTimeout(() {
        js.scoped(() {
          map.panTo(marker.position);
        });
      }, 3000);
    });

    jsw.retain(map);
    jsw.retain(marker);
    marker.on.click.add((e) {
      map.zoom = 8;
      map.center = marker.position;
    });
  });
}