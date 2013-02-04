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

abstract class _StreetViewPanorama {
  @jsw.dartified List<StreetViewLink> getLinks();
  @jsw.dartified String getPano();
  @jsw.dartified LatLng getPosition();
  @jsw.dartified StreetViewPov getPov();
  @jsw.dartified bool getVisible();
  void registerPanoProvider(StreetViewPanoramaData provider(String pano));
  @jsw.dartified void setPano(String pano);
  @jsw.dartified void setPosition(LatLng latLng);
  @jsw.dartified void setPov(StreetViewPov pov);
  @jsw.dartified void setVisible(bool flag);

  Controls controls;
}

class StreetViewPanorama extends MVCObject implements _StreetViewPanorama {
  static StreetViewPanorama cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new StreetViewPanorama.fromJsProxy(jsProxy));
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.StreetViewPanorama);

  StreetViewPanorama(html.Node container, [StreetViewPanoramaOptions opts]) : super(maps.StreetViewPanorama, [container, opts]);
  StreetViewPanorama.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<StreetViewLink> getLinks() => jsw.JsArray.cast($unsafe.getLinks(), StreetViewLink.cast);
  @override LatLng getPosition() => LatLng.cast($unsafe.getPosition());
  @override StreetViewPov getPov() => StreetViewPov.cast($unsafe.getPov());
  @override void registerPanoProvider(StreetViewPanoramaData provider(String pano)) {
    $unsafe.registerPanoProvider(new jsw.Callback.many((String pano) => provider(pano)));
  }
  @override Controls get controls => Controls.cast($unsafe.controls);

  List<StreetViewLink> get links => getLinks();
  String get pano => getPano();
  LatLng get position => getPosition();
  StreetViewPov get pov => getPov();
  bool get visible => getVisible();
  set pano(String pano) => setPano(pano);
  set position(LatLng latLng) => setPosition(latLng);
  set pov(StreetViewPov pov) => setPov(pov);
  set visible(bool flag) => setVisible(flag);

  StreetViewPanoramaEvents get on => new StreetViewPanoramaEvents._(this);
}

class StreetViewPanoramaEvents {
  static final CLOSECLICK = "closeclick";
  static final LINKS_CHANGED = "links_changed";
  static final PANO_CHANGED = "pano_changed";
  static final POSITION_CHANGED = "position_changed";
  static final POV_CHANGED = "pov_changed";
  static final RESIZE = "resize";
  static final VISIBLE_CHANGED = "visible_changed";

  final StreetViewPanorama _streetViewPanorama;

  StreetViewPanoramaEvents._(this._streetViewPanorama);

  NativeEventListenerAdder get closeclick => new NativeEventListenerAdder(_streetViewPanorama, CLOSECLICK);
  NoArgsEventListenerAdder get linksChanged => new NoArgsEventListenerAdder(_streetViewPanorama, LINKS_CHANGED);
  NoArgsEventListenerAdder get panoChanged => new NoArgsEventListenerAdder(_streetViewPanorama, PANO_CHANGED);
  NoArgsEventListenerAdder get positionChanged => new NoArgsEventListenerAdder(_streetViewPanorama, POSITION_CHANGED);
  NoArgsEventListenerAdder get povChanged => new NoArgsEventListenerAdder(_streetViewPanorama, POV_CHANGED);
  NoArgsEventListenerAdder get resize => new NoArgsEventListenerAdder(_streetViewPanorama, RESIZE);
  NoArgsEventListenerAdder get visibleChanged => new NoArgsEventListenerAdder(_streetViewPanorama, VISIBLE_CHANGED);
}