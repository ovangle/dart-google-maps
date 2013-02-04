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

abstract class _MapCanvasProjection {
  LatLng fromContainerPixelToLatLng(Point pixel, [bool nowrap]);
  LatLng fromDivPixelToLatLng(Point pixel, [bool nowrap]);
  Point fromLatLngToContainerPixel(LatLng latLng);
  Point fromLatLngToDivPixel(LatLng latLng);
  @jsw.dartified num getWorldWidth();
}

class MapCanvasProjection extends MVCObject implements _MapCanvasProjection {
  static MapCanvasProjection cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MapCanvasProjection.fromJsProxy(jsProxy));

  MapCanvasProjection() : super();
  MapCanvasProjection.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override LatLng fromContainerPixelToLatLng(Point pixel, [bool nowrap]) => LatLng.cast($unsafe.fromContainerPixelToLatLng(pixel, nowrap));
  @override LatLng fromDivPixelToLatLng(Point pixel, [bool nowrap]) => LatLng.cast($unsafe.fromDivPixelToLatLng(pixel, nowrap));
  @override Point fromLatLngToContainerPixel(LatLng latLng) => Point.cast($unsafe.fromLatLngToContainerPixel(latLng));
  @override Point fromLatLngToDivPixel(LatLng latLng) => Point.cast($unsafe.fromLatLngToDivPixel(latLng));
  num get worldWidth => getWorldWidth();
}