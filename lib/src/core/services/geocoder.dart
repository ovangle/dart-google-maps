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

abstract class _Geocoder {
  void geocode(GeocoderRequest request, void callback(List<GeocoderResult> results, GeocoderStatus status));
}

class Geocoder extends jsw.TypedProxy implements _Geocoder {
  static Geocoder cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Geocoder.fromJsProxy(jsProxy));

  Geocoder() : super(maps.Geocoder);
  Geocoder.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override void geocode(GeocoderRequest request, void callback(List<GeocoderResult> results, GeocoderStatus status)) {
    $unsafe.geocode(request, new jsw.Callback.once((js.Proxy results, js.Proxy status) => callback(jsw.JsArray.cast(results, GeocoderResult.cast), GeocoderStatus.find(status))));
  }
}