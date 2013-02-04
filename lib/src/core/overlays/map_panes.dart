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

abstract class _MapPanes {
  html.Node floatPane;
  html.Node floatShadow;
  html.Node mapPane;
  html.Node overlayImage;
  html.Node overlayLayer;
  html.Node overlayMouseTarget;
  html.Node overlayShadow;
}

class MapPanes extends jsw.TypedProxy implements _MapPanes {
  static MapPanes cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MapPanes.fromJsProxy(jsProxy));

  MapPanes() : super();
  MapPanes.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);
}