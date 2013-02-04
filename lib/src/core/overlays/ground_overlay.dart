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

abstract class _GroundOverlay {
  @jsw.dartified LatLngBounds getBounds();
  @jsw.dartified GMap getMap();
  @jsw.dartified num getOpacity();
  @jsw.dartified String getUrl();
  @jsw.dartified void setMap(GMap map);
  @jsw.dartified void setOpacity(num opacity);
}

class GroundOverlay extends MVCObject implements _GroundOverlay {
  static GroundOverlay cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new GroundOverlay.fromJsProxy(jsProxy));

  GroundOverlay(String url, LatLngBounds bounds, [GroundOverlayOptions opts]) : super(maps.GroundOverlay, [url, bounds, opts]);
  GroundOverlay.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override LatLngBounds getBounds() => LatLngBounds.cast($unsafe.getBounds());
  @override GMap getMap() => GMap.cast($unsafe.getMap());

  LatLngBounds get bounds => getBounds();
  GMap get map => getMap();
  num get opacity => getOpacity();
  String get url => getUrl();
  set map(GMap map) => setMap(map);
  set opacity(num opacity) => setOpacity(opacity);

  GroundOverlayEvents get on => new GroundOverlayEvents._(this);
}

class GroundOverlayEvents {
  static final CLICK = "click";
  static final DBLCLICK = "dblclick";

  final GroundOverlay _groundOverlay;

  GroundOverlayEvents._(this._groundOverlay);

  MouseEventListenerAdder get click => new MouseEventListenerAdder(_groundOverlay, CLICK);
  MouseEventListenerAdder get dblclick => new MouseEventListenerAdder(_groundOverlay, DBLCLICK);
}