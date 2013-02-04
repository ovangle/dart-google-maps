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

abstract class _MapType {
  html.Node getTile(Point tileCoord, num zoom, html.Document ownerDocument);
  html.Node releaseTile(html.Node tile);

  String alt;
  num maxZoom;
  num minZoom;
  String name;
  Projection projection;
  num radius;
  Size tileSize;
}

class MapType extends jsw.TypedProxy implements _MapType {
  static MapType cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MapType.fromJsProxy(jsProxy));

  MapType([js.FunctionProxy function, List args]) : super(function, args);
  MapType.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  Projection get projection => Projection.cast($unsafe.projection);
  Size get tileSize => Size.cast($unsafe.tileSize);
}