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

abstract class _DirectionsResult {
  List<DirectionsRoute> routes;
}

class DirectionsResult extends jsw.TypedProxy implements _DirectionsResult {
  static DirectionsResult cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DirectionsResult.fromJsProxy(jsProxy));

  DirectionsResult() : super();
  DirectionsResult.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<DirectionsRoute> get routes => jsw.JsArray.cast($unsafe.routes, DirectionsRoute.cast);
  @override set routes(List<DirectionsRoute> routes) => $unsafe.routes = jsw.JsArray.jsify(routes);
}