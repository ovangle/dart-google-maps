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

abstract class _KmlLayer {
  // LatLngBounds getDefaultViewport(); // LatLngBounds get defaultViewport;
  // GMap getMap(); // GMap get map;
  // KmlLayerMetadata getMetadata(); // KmlLayerMetadata get metadata;
  // KmlLayerStatus getStatus(); // KmlLayerStatus get status;
  // String getUrl(); // String get url;
  // setMap(GMap map); // set map(GMap map);
  // setUrl(String url); // set url(String url);
}

class KmlLayer extends MVCObject implements _KmlLayer {
  static KmlLayer cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new KmlLayer.fromJsProxy(jsProxy));

  KmlLayer([KmlLayerOptions options]) : super(maps.KmlLayer, [options]);
  KmlLayer.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  LatLngBounds get defaultViewport => LatLngBounds.cast($unsafe.getDefaultViewport());
  GMap get map => GMap.cast($unsafe.getMap());
  KmlLayerMetadata get metadata => KmlLayerMetadata.cast($unsafe.getMetadata());
  KmlLayerStatus get status => KmlLayerStatus.find($unsafe.getStatus());
  String get url => $unsafe.getUrl();
  set map(GMap map) => $unsafe.setMap(map);
  set url(String url) => $unsafe.setUrl(url);

  KmlLayerEvents get on => new KmlLayerEvents._(this);
}

class KmlLayerEvents {
  static final CLICK = "click";
  static final DEFAULTVIEWPORT_CHANGED = "defaultviewport_changed";
  static final STATUS_CHANGED = "status_changed";

  final KmlLayer _kmlLayer;

  KmlLayerEvents._(this._kmlLayer);

  KmlMouseEventListenerAdder get click => new KmlMouseEventListenerAdder(_kmlLayer, CLICK);
  NoArgsEventListenerAdder get defaultviewportChanged => new NoArgsEventListenerAdder(_kmlLayer, DEFAULTVIEWPORT_CHANGED);
  NoArgsEventListenerAdder get statusChanged => new NoArgsEventListenerAdder(_kmlLayer, STATUS_CHANGED);
}