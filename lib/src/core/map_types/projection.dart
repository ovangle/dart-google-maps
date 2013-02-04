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

abstract class _Projection {
  Point fromLatLngToPoint(LatLng latLng, [Point point]);
  LatLng fromPointToLatLng(Point pixel, [bool nowrap]);
}

class Projection extends jsw.TypedProxy implements _Projection {
  static Projection cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Projection.fromJsProxy(jsProxy));

  Projection() : super();
  Projection.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  void set_fromLatLngToPoint(Point fromLatLngToPoint(LatLng latLng, [Point point])) {
    $unsafe.fromLatLngToPoint = new jsw.Callback.many((js.Proxy latLng, [js.Proxy point]) {
      if (?point) {
        return fromLatLngToPoint(LatLng.cast(latLng), Point.cast(point));
      } else {
        return fromLatLngToPoint(LatLng.cast(latLng));
      }
    });
  }
  void set_fromPointToLatLng(LatLng fromPointToLatLng(Point pixel, [bool nowrap])) {
    $unsafe.fromPointToLatLng = new jsw.Callback.many((js.Proxy pixel, [bool nowrap]) {
      if (?nowrap) {
        return fromPointToLatLng(Point.cast(pixel), nowrap);
      } else {
        return fromPointToLatLng(Point.cast(pixel));
      }
    });
  }

  @override Point fromLatLngToPoint(LatLng latLng, [Point point]) => Point.cast($unsafe.fromLatLngToPoint(latLng, point));
  @override LatLng fromPointToLatLng(Point pixel, [bool nowrap]) => LatLng.cast($unsafe.fromPointToLatLng(pixel, nowrap));
}