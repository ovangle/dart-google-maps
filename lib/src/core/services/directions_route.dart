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

abstract class _DirectionsRoute {
  LatLngBounds bounds;
  String copyrights;
  List<DirectionsLeg> legs;
  @jsw.dartified List<LatLng> overview_path;
  List<String> warnings;
  @jsw.dartified List<num> waypoint_order;
}

class DirectionsRoute extends jsw.TypedProxy implements _DirectionsRoute {
  static DirectionsRoute cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DirectionsRoute.fromJsProxy(jsProxy));

  DirectionsRoute() : super();
  DirectionsRoute.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override LatLngBounds get bounds => LatLngBounds.cast($unsafe.bounds);
  @override List<DirectionsLeg> get legs => jsw.JsArray.cast($unsafe.legs, DirectionsLeg.cast);
  @override set legs(List<DirectionsLeg> legs) => $unsafe.legs = jsw.JsArray.jsify(legs);
  @override List<LatLng> get overview_path => jsw.JsArray.cast($unsafe.overview_path, LatLng.cast);
  @override set overview_path(List<LatLng> overview_path) => $unsafe.overview_path = jsw.JsArray.jsify(overview_path);
  @override List<String> get warnings => jsw.JsArray.cast($unsafe.warnings);
  @override set warnings(List<String> warnings) => $unsafe.warnings = jsw.JsArray.jsify(warnings);
  @override List<num> get waypoint_order => jsw.JsArray.cast($unsafe.waypoint_order);
  @override set waypoint_order(List<num> waypoint_order) => $unsafe.waypoint_order = jsw.JsArray.jsify(waypoint_order);

  List<LatLng> get overviewPath => overview_path;
  set overviewPath(List<LatLng> overviewPath) => overview_path = overviewPath;
  List<num> get waypointOrder => waypoint_order;
  set waypointOrder(List<num> waypointOrder) => waypoint_order = waypointOrder;
}