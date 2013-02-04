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

abstract class _GeocoderResult {
  List<GeocoderAddressComponent> address_components;
  String formatted_address;
  GeocoderGeometry geometry;
  List<String> types;
}

class GeocoderResult extends jsw.TypedProxy implements _GeocoderResult {
  static GeocoderResult cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new GeocoderResult.fromJsProxy(jsProxy));

  GeocoderResult() : super();
  GeocoderResult.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<GeocoderAddressComponent> get address_components => jsw.JsArray.cast($unsafe.address_components, GeocoderAddressComponent.cast);
  @override set address_components(List<GeocoderAddressComponent> address_components) => $unsafe.address_components = jsw.JsArray.jsify(address_components);
  @override GeocoderGeometry get geometry => GeocoderGeometry.cast($unsafe.geometry);
  @override List<String> get types => jsw.JsArray.cast($unsafe.types);
  @override set types(List<String> types) => $unsafe.types = jsw.JsArray.jsify(types);

  List<GeocoderAddressComponent> get addressComponents => address_components;
  set addressComponents(List<GeocoderAddressComponent> addressComponents) => this.address_components = addressComponents;
  String get formattedAddress => formatted_address;
  set formattedAddress(String formattedAddress) => this.formatted_address = formattedAddress;
}