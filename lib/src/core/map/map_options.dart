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

abstract class _MapOptions {
  String backgroundColor;
  LatLng center;
  bool disableDefaultUI;
  bool disableDoubleClickZoom;
  bool draggable;
  String draggableCursor;
  String draggingCursor;
  num heading;
  bool keyboardShortcuts;
  bool mapMaker;
  bool mapTypeControl;
  MapTypeControlOptions mapTypeControlOptions;
  // TODO bad online doc : should be MapTypeId|string
  // MapTypeId mapTypeId;
  Object mapTypeId;
  num maxZoom;
  num minZoom;
  bool noClear;
  bool overviewMapControl;
  OverviewMapControlOptions overviewMapControlOptions;
  bool panControl;
  PanControlOptions panControlOptions;
  bool rotateControl;
  RotateControlOptions rotateControlOptions;
  bool scaleControl;
  ScaleControlOptions scaleControlOptions;
  bool scrollwheel;
  StreetViewPanorama streetView;
  bool streetViewControl;
  StreetViewControlOptions streetViewControlOptions;
  List<MapTypeStyle> styles;
  num tilt;
  num zoom;
  bool zoomControl;
  ZoomControlOptions zoomControlOptions;
}

class MapOptions extends jsw.TypedProxy implements _MapOptions {
  static MapOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MapOptions.fromJsProxy(jsProxy));

  MapOptions() : super();
  MapOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  LatLng get center => LatLng.cast($unsafe.center);
  MapTypeControlOptions get mapTypeControlOptions => MapTypeControlOptions.cast($unsafe.mapTypeControlOptions);
  Object get mapTypeId {
    final mapTypeId = $unsafe.mapTypeId;
    return firstNotNull([MapTypeId.find(mapTypeId), mapTypeId]);
  }
  OverviewMapControlOptions get overviewMapControlOptions => OverviewMapControlOptions.cast($unsafe.overviewMapControlOptions);
  PanControlOptions get panControlOptions => PanControlOptions.cast($unsafe.panControlOptions);
  RotateControlOptions get rotateControlOptions => RotateControlOptions.cast($unsafe.rotateControlOptions);
  ScaleControlOptions get scaleControlOptions => ScaleControlOptions.cast($unsafe.scaleControlOptions);
  StreetViewPanorama get streetView => StreetViewPanorama.cast($unsafe.streetView);
  StreetViewControlOptions get streetViewControlOptions => StreetViewControlOptions.cast($unsafe.streetViewControlOptions);
  List<MapTypeStyle> get styles => jsw.JsArray.cast($unsafe.mapTypeIds, (e) => MapTypeStyle.cast(e));
  ZoomControlOptions get zoomControlOptions => ZoomControlOptions.cast($unsafe.zoomControlOptions);
}