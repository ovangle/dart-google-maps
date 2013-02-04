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

abstract class _GMap {
  void fitBounds(LatLngBounds bounds);
  // LatLngBounds getBounds(); // LatLngBounds get bounds;
  // LatLng getCenter(); // LatLng get center;
  // html.Node getDiv(); // html.Node get div;
  // num getHeading(); // num get heading;
  // Object getMapTypeId(); // Object get mapTypeId;
  // Projection getProjection(); // Projection get projection;
  // StreetViewPanorama getStreetView(); // StreetViewPanorama get streetView;
  // num getTilt(); // num get tilt;
  // num getZoom(); // num get zoom;
  void panBy(num x, num y);
  void panTo(LatLng latLng);
  void panToBounds(LatLngBounds latLngBounds);
  // setCenter(LatLng latLng); // set center(LatLng latLng);
  // setHeading(num heading); // set heading(num heading);
  // setMapTypeId(Object mapTypeId); // set mapTypeId(Object mapTypeId);
  // setOptions(MapOptions options); // set options(MapOptions options);
  // setStreetView(StreetViewPanorama panorama); // set streetView(StreetViewPanorama panorama);
  // setTilt(num tilt); // set tilt(num tilt);
  // setZoom(num zoom); // set zoom(num zoom);

  Controls controls;
  MapTypeRegistry mapTypes;
  MVCArray<MapType> overlayMapTypes;
}

class GMap extends MVCObject implements _GMap {
  static GMap cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new GMap.fromJsProxy(jsProxy));
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.Map);

  GMap(html.Node mapDiv, [MapOptions opts]) : super(maps.Map, [mapDiv, opts]);
  GMap.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  LatLngBounds get bounds => LatLngBounds.cast($unsafe.getBounds());
  LatLng get center => LatLng.cast($unsafe.getCenter());
  html.Node get div => $unsafe.getDiv();
  num get heading => $unsafe.getHeading();
  Object get mapTypeId {
    final result = $unsafe.getMapTypeId();
    return firstNotNull([MapTypeId.find(result), result]);
  }
  Projection get projection => Projection.cast($unsafe.getProjection());
  StreetViewPanorama get streetView => StreetViewPanorama.cast($unsafe.getStreetView());
  num get tilt => $unsafe.getTilt();
  num get zoom => $unsafe.getZoom();
  set center(LatLng latLng) => $unsafe.setCenter(latLng);
  set heading(num heading) => $unsafe.setHeading(heading);
  set mapTypeId(Object mapTypeId) => $unsafe.setMapTypeId(mapTypeId);
  set options(MapOptions options) => $unsafe.setOptions(options);
  set streetView(StreetViewPanorama panorama) => $unsafe.setStreetView(panorama);
  set tilt(num tilt) => $unsafe.setTilt(tilt);
  set zoom(num zoom) => $unsafe.setZoom(zoom);

  Controls get controls => Controls.cast($unsafe.controls);
  MapTypeRegistry get mapTypes => MapTypeRegistry.cast($unsafe.mapTypes);
  MVCArray<MapType> get overlayMapTypes => MVCArray.cast($unsafe.overlayMapTypes, (e) => MapType.cast(e));

  GMapEvents get on => new GMapEvents._(this);
}

class GMapEvents {
  static final BOUNDS_CHANGED = "bounds_changed";
  static final CENTER_CHANGED = "center_changed";
  static final CLICK = "click";
  static final DBLCLICK = "dblclick";
  static final DRAG = "drag";
  static final DRAGEND = "dragend";
  static final DRAGSTART = "dragstart";
  static final HEADING_CHANGED = "heading_changed";
  static final IDLE = "idle";
  static final MAPTYPEID_CHANGED = "maptypeid_changed";
  static final MOUSEMOVE = "mousemove";
  static final MOUSEOUT = "mouseout";
  static final MOUSEOVER = "mouseover";
  static final PROJECTION_CHANGED = "projection_changed";
  static final RESIZE = "resize";
  static final RIGHTCLICK = "rightclick";
  static final TILESLOADED = "tilesloaded";
  static final TILT_CHANGED = "tilt_changed";
  static final ZOOM_CHANGED = "zoom_changed";

  final GMap _gmap;

  GMapEvents._(this._gmap);

  NoArgsEventListenerAdder get boundsChanged => new NoArgsEventListenerAdder(_gmap, BOUNDS_CHANGED);
  NoArgsEventListenerAdder get centerChanged => new NoArgsEventListenerAdder(_gmap, CENTER_CHANGED);
  MouseEventListenerAdder get click => new MouseEventListenerAdder(_gmap, CLICK);
  MouseEventListenerAdder get dblclick => new MouseEventListenerAdder(_gmap, DBLCLICK);
  NoArgsEventListenerAdder get drag => new NoArgsEventListenerAdder(_gmap, DRAG);
  NoArgsEventListenerAdder get dragend => new NoArgsEventListenerAdder(_gmap, DRAGEND);
  NoArgsEventListenerAdder get dragstart => new NoArgsEventListenerAdder(_gmap, DRAGSTART);
  NoArgsEventListenerAdder get headingChanged => new NoArgsEventListenerAdder(_gmap, HEADING_CHANGED);
  NoArgsEventListenerAdder get idle => new NoArgsEventListenerAdder(_gmap, IDLE);
  NoArgsEventListenerAdder get maptypeidChanged => new NoArgsEventListenerAdder(_gmap, MAPTYPEID_CHANGED);
  MouseEventListenerAdder get mousemove => new MouseEventListenerAdder(_gmap, MOUSEMOVE);
  MouseEventListenerAdder get mouseout => new MouseEventListenerAdder(_gmap, MOUSEOUT);
  MouseEventListenerAdder get mouseover => new MouseEventListenerAdder(_gmap, MOUSEOVER);
  NoArgsEventListenerAdder get projectionChanged => new NoArgsEventListenerAdder(_gmap, PROJECTION_CHANGED);
  NoArgsEventListenerAdder get resize => new NoArgsEventListenerAdder(_gmap, RESIZE);
  MouseEventListenerAdder get rightclick => new MouseEventListenerAdder(_gmap, RIGHTCLICK);
  NoArgsEventListenerAdder get tilesloaded => new NoArgsEventListenerAdder(_gmap, TILESLOADED);
  NoArgsEventListenerAdder get tiltChanged => new NoArgsEventListenerAdder(_gmap, TILT_CHANGED);
  NoArgsEventListenerAdder get zoomChanged => new NoArgsEventListenerAdder(_gmap, ZOOM_CHANGED);
}

class Controls extends jsw.TypedProxy {
  static Controls cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Controls.fromJsProxy(jsProxy));

  Controls() : super.fromJsProxy(js.array([]));
  Controls.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  MVCArray<html.Node> getNodes(ControlPosition controlPosition) => MVCArray.cast($unsafe[controlPosition.value]);
  void setNodes(ControlPosition controlPosition, MVCArray<html.Node> nodes) { $unsafe[controlPosition.value.toString()] = nodes; }
}