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

abstract class _CircleOptions {
  LatLng center;
  bool clickable;
  bool editable;
  String fillColor;
  num fillOpacity;
  GMap map;
  num radius;
  String strokeColor;
  num strokeOpacity;
  num strokeWeight;
  bool visible;
  num zIndex;
}

class CircleOptions extends jsw.TypedProxy implements _CircleOptions {
  static CircleOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new CircleOptions.fromJsProxy(jsProxy));

  CircleOptions() : super();
  CircleOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  LatLng get center => LatLng.cast($unsafe.center);
  GMap get map => GMap.cast($unsafe.map);
}