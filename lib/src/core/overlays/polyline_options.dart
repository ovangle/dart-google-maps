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

abstract class _PolylineOptions {
  bool clickable;
  bool editable;
  bool geodesic;
  List<IconSequence> icons;
  GMap map;
  dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path;
  String strokeColor;
  num strokeOpacity;
  num strokeWeight;
  bool visible;
  num zIndex;
}

class PolylineOptions extends jsw.TypedProxy implements _PolylineOptions {
  static PolylineOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new PolylineOptions.fromJsProxy(jsProxy));

  PolylineOptions() : super();
  PolylineOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override GMap get map => GMap.cast($unsafe.map);
  @override dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ get path {
    final result = $unsafe.path;
    if (MVCArray.isInstance(result)) {
      return MVCArray.cast(result, (e) => LatLng.cast(e));
    } else {
      return jsw.JsArray.cast(result, (e) => LatLng.cast(e));
    }
  }
  @override set path(dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path) => $unsafe.path = path is List ? jsw.JsArray.jsify(path) : path;

}