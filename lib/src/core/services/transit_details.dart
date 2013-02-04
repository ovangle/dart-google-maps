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

abstract class _TransitDetails {
  @jsw.dartified TransitStop arrival_stop;
  @jsw.dartified Time arrival_time;
  @jsw.dartified TransitStop departure_stop;
  @jsw.dartified Time departure_time;
  String headsign;
  num headway;
  TransitLine line;
  @jsw.dartified num num_stops;
}

class TransitDetails extends jsw.TypedProxy implements _TransitDetails {
  static TransitDetails cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new TransitDetails.fromJsProxy(jsProxy));

  TransitDetails() : super();
  TransitDetails.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override TransitStop get arrival_stop => TransitStop.cast($unsafe.arrival_stop);
  @override Time get arrival_time => Time.cast($unsafe.arrival_time);
  @override TransitStop get departure_stop => TransitStop.cast($unsafe.departure_stop);
  @override Time get departure_time => Time.cast($unsafe.departure_time);
  @override TransitLine get line => TransitLine.cast($unsafe.line);

  TransitStop get arrivalStop => arrival_stop;
  set arrivalStop(TransitStop arrivalStop) => this.arrival_stop = arrivalStop;
  Time get arrivalTime => arrival_time;
  set arrivalTime(Time arrivalTime) => this.arrival_time = arrivalTime;
  TransitStop get departureStop => departure_stop;
  set departureStop(TransitStop departureStop) => this.departure_stop = departureStop;
  Time get departureTime => departure_time;
  set departureTime(Time departureTime) => this.departure_time = departureTime;
  num get numStops => num_stops;
  set numStops(num numStops) => this.num_stops = numStops;
}