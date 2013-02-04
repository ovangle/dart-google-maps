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

abstract class _PolygonOptions {
  bool clickable;
  bool editable;
  String fillColor;
  num fillOpacity;
  bool geodesic;
  GMap map;
  dynamic/*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ paths;
  String strokeColor;
  num strokeOpacity;
  StrokePosition strokePosition;
  num strokeWeight;
  bool visible;
  num zIndex;
}

class PolygonOptions extends jsw.TypedProxy implements _PolygonOptions {
  static PolygonOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new PolygonOptions.fromJsProxy(jsProxy));

  PolygonOptions() : super();
  PolygonOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override GMap get map => GMap.cast($unsafe.map);
  @override dynamic/*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ get paths {
    final result = $unsafe.paths;
    if (MVCArray.isInstance(result)) {
      return MVCArray.cast(result, (e) => LatLng.isInstance(e) ? LatLng.cast(e) : MVCArray.cast(e, (e) => LatLng.cast(e)));
    }
    return jsw.JsArray.cast(result, (e) => LatLng.isInstance(e) ? LatLng.cast(e) : jsw.JsArray.cast(e, (e) => LatLng.cast(e)));
  }
  @override set paths(dynamic/*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ paths) => $unsafe.setPaths(paths is List ? jsw.JsArray.jsify(paths) : paths);
  @override StrokePosition get strokePosition => StrokePosition.find($unsafe.strokePosition);
}