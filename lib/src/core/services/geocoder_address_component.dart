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

abstract class _GeocoderAddressComponent {
  @jsw.dartified String long_name;
  @jsw.dartified String short_name;
  List<String> types;
}

class GeocoderAddressComponent extends jsw.TypedProxy implements _GeocoderAddressComponent {
  static GeocoderAddressComponent cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new GeocoderAddressComponent.fromJsProxy(jsProxy));

  GeocoderAddressComponent() : super();
  GeocoderAddressComponent.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<String> get types => jsw.JsArray.cast($unsafe.types);
  @override set types(List<String> types) => $unsafe.types = jsw.JsArray.jsify(types);

  String get longName => long_name;
  set longName(String longName) => long_name = longName;
  String get shortName => short_name;
  set shortName(String shortName) => short_name = shortName;
}