import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

final DirectionsRendererOptions rendererOptions = jsw.retain(new DirectionsRendererOptions()
  ..draggable = true
);
final DirectionsRenderer directionsDisplay = jsw.retain(new DirectionsRenderer(rendererOptions));
final DirectionsService directionsService = jsw.retain(new DirectionsService());
GMap map;

final LatLng australia = jsw.retain(new LatLng(-25.274398, 133.775136));

void main() {
  js.scoped(() {
    final mapOptions = new MapOptions()
      ..zoom = 7
      ..mapTypeId = MapTypeId.ROADMAP
      ..center = australia
      ;
    map = jsw.retain(new GMap(query("#map_canvas"), mapOptions));
    directionsDisplay.map = map;
    directionsDisplay.panel = query('#directionsPanel');

    directionsDisplay.on.directionsChanged.add(() {
      computeTotalDistance(directionsDisplay.directions);
    });

    calcRoute();
  });
}

void calcRoute() {
  final request = new DirectionsRequest()
    ..origin = 'Sydney, NSW'
    ..destination = 'Sydney, NSW'
    ..waypoints = [
      new DirectionsWaypoint()..location = 'Bourke, NSW',
      new DirectionsWaypoint()..location = 'Broken Hill, NSW'
    ]
    ..travelMode = TravelMode.DRIVING // TODO bad object in example DirectionsTravelMode
    ;
  directionsService.route(request, (DirectionsResult response, DirectionsStatus status) {
    if (status == DirectionsStatus.OK) {
      directionsDisplay.directions = response;
    }
  });
}

void computeTotalDistance(DirectionsResult result) {
  num total = 0;
  final myroute = result.routes[0];
  for (int i = 0; i < myroute.legs.length; i++) {
    total += myroute.legs[i].distance.value;
  }
  total = total / 1000.0;  // TODO bad synthax in example
  query('#total').innerHtml = '${total} km';
}