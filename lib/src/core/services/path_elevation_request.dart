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

abstract class _PathElevationRequest {
  List<LatLng> path;
  num samples;
}

class PathElevationRequest extends jsw.TypedProxy implements _PathElevationRequest {
  static PathElevationRequest cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new PathElevationRequest.fromJsProxy(jsProxy));

  PathElevationRequest() : super();
  PathElevationRequest.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<LatLng> get path => jsw.JsArray.cast($unsafe.path, LatLng.cast);
  @override set path(List<LatLng> path) => $unsafe.path = jsw.JsArray.jsify(path);
}