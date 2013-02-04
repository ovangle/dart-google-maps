// Copyright (c) 2012, Alexandre Ardhuin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of google_maps;

abstract class _DirectionsRequest {
  bool avoidHighways;
  bool avoidTolls;
  dynamic/*LatLng|string*/ destination;
  bool optimizeWaypoints;
  dynamic/*LatLng|string*/ origin;
  bool provideRouteAlternatives;
  String region;
  TransitOptions transitOptions;
  TravelMode travelMode;
  UnitSystem unitSystem;
  List<DirectionsWaypoint> waypoints;
}

class DirectionsRequest extends jsw.TypedProxy implements _DirectionsRequest {
  static DirectionsRequest cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DirectionsRequest.fromJsProxy(jsProxy));

  DirectionsRequest() : super();
  DirectionsRequest.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override dynamic/*LatLng|string*/ get destination {
    final result = $unsafe.destination;
    if(LatLng.isInstance(result)) {
      return LatLng.cast(result);
    }
    return result;
  }
  @override dynamic/*LatLng|string*/ get origin {
    final result = $unsafe.origin;
    if(LatLng.isInstance(result)) {
      return LatLng.cast(result);
    }
    return result;
  }
  @override TransitOptions get transitOptions => TransitOptions.cast($unsafe.transitOptions);
  @override TravelMode get travelMode => TravelMode.find($unsafe.travelMode);
  @override UnitSystem get unitSystem => UnitSystem.find($unsafe.unitSystem);
  @override List<DirectionsWaypoint> get waypoints => jsw.JsArray.cast($unsafe.waypoints, DirectionsWaypoint.cast);
  @override set waypoints(List<DirectionsWaypoint> waypoints) => $unsafe.waypoints = jsw.JsArray.jsify(waypoints);
}