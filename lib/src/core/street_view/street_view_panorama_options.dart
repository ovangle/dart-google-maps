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

typedef StreetViewPanoramaData PanoProvider(String pano);

abstract class _StreetViewPanoramaOptions {
  bool addressControl;
  StreetViewAddressControlOptions addressControlOptions;
  bool clickToGo;
  bool disableDoubleClickZoom;
  bool enableCloseButton;
  bool imageDateControl;
  bool linksControl;
  bool panControl;
  PanControlOptions panControlOptions;
  String pano;
  PanoProvider panoProvider;
  LatLng position;
  StreetViewPov pov;
  bool scrollwheel;
  bool visible;
  bool zoomControl;
  ZoomControlOptions zoomControlOptions;
}

class StreetViewPanoramaOptions extends jsw.TypedProxy implements _StreetViewPanoramaOptions {
  static StreetViewPanoramaOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new StreetViewPanoramaOptions.fromJsProxy(jsProxy));

  StreetViewPanoramaOptions() : super();
  StreetViewPanoramaOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override StreetViewAddressControlOptions get addressControlOptions => StreetViewAddressControlOptions.cast($unsafe.addressControlOptions);
  @override PanControlOptions get panControlOptions => PanControlOptions.cast($unsafe.panControlOptions);
  @override PanoProvider get panoProvider => (String pano) => $unsafe.provider(pano);
  @override set panoProvider(PanoProvider panoProvider) => $unsafe.panoProvider = new jsw.Callback.many(panoProvider);
  @override LatLng get position => LatLng.cast($unsafe.position);
  @override StreetViewPov get pov => StreetViewPov.cast($unsafe.pov);
  @override ZoomControlOptions get zoomControlOptions => ZoomControlOptions.cast($unsafe.zoomControlOptions);

}