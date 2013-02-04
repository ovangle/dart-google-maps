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

abstract class _DirectionsRendererOptions {
  DirectionsResult directions;
  bool draggable;
  bool hideRouteList;
  InfoWindow infoWindow;
  GMap map;
  MarkerOptions markerOptions;
  html.Node panel;
  PolylineOptions polylineOptions;
  bool preserveViewport;
  num routeIndex;
  bool suppressBicyclingLayer;
  bool suppressInfoWindows;
  bool suppressMarkers;
  bool suppressPolylines;
}

class DirectionsRendererOptions extends jsw.TypedProxy implements _DirectionsRendererOptions {
  static DirectionsRendererOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DirectionsRendererOptions.fromJsProxy(jsProxy));

  DirectionsRendererOptions() : super();
  DirectionsRendererOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override DirectionsResult get directions => DirectionsResult.cast($unsafe.directions);
  @override InfoWindow get infoWindow => InfoWindow.cast($unsafe.infoWindow);
  @override GMap get map => GMap.cast($unsafe.map);
  @override MarkerOptions get markerOptions => MarkerOptions.cast($unsafe.markerOptions);
  @override PolylineOptions get polylineOptions => PolylineOptions.cast($unsafe.polylineOptions);
}