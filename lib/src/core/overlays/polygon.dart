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

abstract class _Polygon {
  @jsw.dartified bool getEditable();
  @jsw.dartified GMap getMap();
  @jsw.dartified MVCArray<LatLng> getPath();
  @jsw.dartified MVCArray<MVCArray<LatLng>> getPaths();
  @jsw.dartified bool getVisible();
  @jsw.dartified void setEditable(bool editable);
  @jsw.dartified void setMap(GMap map);
  @jsw.dartified void setOptions(PolygonOptions options);
  @jsw.dartified void setPath(dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path);
  @jsw.dartified void setPaths(dynamic/*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ paths);
  @jsw.dartified void setVisible(bool visible);
}

class Polygon extends MVCObject implements _Polygon {
  static Polygon cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Polygon.fromJsProxy(jsProxy));
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.Polygon);

  Polygon([PolygonOptions opts]) : super(maps.Polygon, [opts]);
  Polygon.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override GMap getMap() => GMap.cast($unsafe.getMap());
  @override MVCArray<LatLng> getPath() => MVCArray.cast($unsafe.getPath(), (e) => LatLng.cast(e));
  @override MVCArray<MVCArray<LatLng>> getPaths() => MVCArray.cast($unsafe.getPath(), (e) => MVCArray.cast(e, (e) => LatLng.cast(e)));
  @override void setPath(dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path) => $unsafe.setPath(path is List ? jsw.JsArray.jsify(path) : path);
  @override void setPaths(dynamic/*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ paths) => $unsafe.setPaths(paths is List ? jsw.JsArray.jsify(paths) : paths);

  bool get editable => getEditable();
  GMap get map => getMap();
  MVCArray<LatLng> get path => getPath();
  MVCArray<MVCArray<LatLng>> get paths => getPaths();
  bool get visible => getVisible();
  set editable(bool editable) => setEditable(editable);
  set map(GMap map) => setMap(map);
  set options(PolygonOptions options) => setOptions(options);
  set path(dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path) => setPath(path);
  set paths(dynamic/*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ paths) => setPaths(paths);
  set visible(bool visible) => setVisible(visible);

  PolygonEvents get on => new PolygonEvents._(this);
}

class PolygonEvents {
  static final CLICK = "click";
  static final DBLCLICK = "dblclick";
  static final MOUSEDOWN = "mousedown";
  static final MOUSEMOVE = "mousemove";
  static final MOUSEOUT = "mouseout";
  static final MOUSEOVER = "mouseover";
  static final MOUSEUP = "mouseup";
  static final RIGHTCLICK = "rightclick";

  final Polygon _polygon;

  PolygonEvents._(this._polygon);

  PolyMouseEventListenerAdder get click => new PolyMouseEventListenerAdder(_polygon, CLICK);
  PolyMouseEventListenerAdder get dblclick => new PolyMouseEventListenerAdder(_polygon, DBLCLICK);
  PolyMouseEventListenerAdder get mousedown => new PolyMouseEventListenerAdder(_polygon, MOUSEDOWN);
  PolyMouseEventListenerAdder get mousemove => new PolyMouseEventListenerAdder(_polygon, MOUSEMOVE);
  PolyMouseEventListenerAdder get mouseout => new PolyMouseEventListenerAdder(_polygon, MOUSEOUT);
  PolyMouseEventListenerAdder get mouseover => new PolyMouseEventListenerAdder(_polygon, MOUSEOVER);
  PolyMouseEventListenerAdder get mouseup => new PolyMouseEventListenerAdder(_polygon, MOUSEUP);
  PolyMouseEventListenerAdder get rightclick => new PolyMouseEventListenerAdder(_polygon, RIGHTCLICK);
}