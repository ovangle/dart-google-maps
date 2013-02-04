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

abstract class _StreetViewTileData {
  String getTileUrl(String pano, num tileZoom, num tileX, num tileY);

  num centerHeading;
  Size tileSize;
  Size worldSize;
}

class StreetViewTileData extends jsw.TypedProxy implements _StreetViewTileData {
  static StreetViewTileData cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new StreetViewTileData.fromJsProxy(jsProxy));

  StreetViewTileData() : super();
  StreetViewTileData.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override Size get tileSize => Size.cast($unsafe.tileSize);
  @override Size get worldSize => Size.cast($unsafe.worldSize);

  void set_getTileUrl(String getTileUrl(String pano, num tileZoom, num tileX, num tileY)) {
    $unsafe.getTileUrl = new jsw.Callback.many(getTileUrl);
  }
}