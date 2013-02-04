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

abstract class _DirectionsStep {
  Distance distance;
  GDuration duration;
  @jsw.dartified LatLng end_location;
  String instructions;
  List<LatLng> path;
  @jsw.dartified LatLng start_location;
  List<DirectionsStep> steps;
  TransitDetails transit;
  @jsw.dartified TravelMode travel_mode;
}

class DirectionsStep extends jsw.TypedProxy implements _DirectionsStep {
  static DirectionsStep cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DirectionsStep.fromJsProxy(jsProxy));

  DirectionsStep() : super();
  DirectionsStep.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override Distance get distance => Distance.cast($unsafe.distance);
  @override GDuration get duration => GDuration.cast($unsafe.duration);
  @override LatLng get end_location => LatLng.cast($unsafe.end_location);
  @override List<LatLng> get path => jsw.JsArray.cast($unsafe.path, LatLng.cast);
  @override LatLng get start_location => LatLng.cast($unsafe.start_location);
  @override List<DirectionsStep> get steps => jsw.JsArray.cast($unsafe.steps, DirectionsStep.cast);
  @override TransitDetails get transit => TransitDetails.cast($unsafe.transit);
  @override TravelMode get travel_mode => TravelMode.find($unsafe.travel_mode);

  LatLng get endLocation => end_location;
  set endLocation(LatLng endLocation) => this.end_location = endLocation;
  LatLng get startLocation => start_location;
  set startLocation(LatLng startLocation) => this.start_location = startLocation;
  TravelMode get travelMode => travel_mode;
  set travelMode(TravelMode travelMode) => this.travel_mode = travelMode;
}