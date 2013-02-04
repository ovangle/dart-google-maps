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

abstract class _TransitOptions {
  Date arrivalTime;
  Date departureTime;
}

class TransitOptions extends jsw.TypedProxy implements _TransitOptions {
  static TransitOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new TransitOptions.fromJsProxy(jsProxy));

  TransitOptions() : super();
  TransitOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override Date get arrivalTime => jsw.JsDate.cast($unsafe.arrivalTime);
  @override set arrivalTime(Date arrivalTime) => $unsafe.arrivalTime = jsw.JsDate.jsify(arrivalTime);
  @override Date get departureTime => jsw.JsDate.cast($unsafe.departureTime);
  @override set departureTime(Date departureTime) => $unsafe.departureTime = jsw.JsDate.jsify(departureTime);
}