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

abstract class _LatLngBounds {
  bool contains(LatLng latLng);
  bool equals(LatLngBounds other);
  LatLngBounds extend(LatLng point);
  // LatLng getCenter(); // LatLng get center;
  // LatLng getNorthEast(); // LatLng get northEast;
  // LatLng getSouthWest(); // LatLng get southWest;
  bool intersects(LatLngBounds other);
  bool isEmpty();
  LatLng toSpan();
  String toString();
  String toUrlValue([num precision]);
  bool union(LatLngBounds other);
}

class LatLngBounds extends jsw.TypedProxy implements _LatLngBounds {
  static LatLngBounds cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new LatLngBounds.fromJsProxy(jsProxy));

  LatLngBounds([LatLng sw, LatLng ne]) : super(maps.LatLngBounds, [sw, ne]);
  LatLngBounds.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override LatLngBounds extend(LatLng point) => LatLngBounds.cast($unsafe.extend(point));
  LatLng get center => LatLng.cast($unsafe.getCenter());
  LatLng get northEast => LatLng.cast($unsafe.getNorthEast());
  LatLng get southWest => LatLng.cast($unsafe.getSouthWest());
  @override LatLng toSpan() => LatLng.cast($unsafe.toSpan());
  @override String toString() => $unsafe.noSuchMethod(new jsw.ProxyInvocationMirror.method("toString", []));
}