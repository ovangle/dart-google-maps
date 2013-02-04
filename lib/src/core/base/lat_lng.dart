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

abstract class _LatLng {
  bool equals(LatLng other);
  // num lat(); // num get lat;
  // num lng(); // num get lng;
  String toString();
  String toUrlValue([num precision]);
}

class LatLng extends jsw.TypedProxy implements _LatLng {
  static LatLng cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new LatLng.fromJsProxy(jsProxy));
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.LatLng);

  LatLng(num lat, num lng, [bool noWrap]) : super(maps.LatLng, [lat, lng, noWrap]);
  LatLng.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  num get lat => $unsafe.lat();
  num get lng => $unsafe.lng();
  @override String toString() => $unsafe.noSuchMethod(new jsw.ProxyInvocationMirror.method("toString", []));
}