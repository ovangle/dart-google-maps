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

abstract class _Polyline {
  @jsw.dartified bool getEditable();
  @jsw.dartified GMap getMap();
  @jsw.dartified MVCArray<LatLng> getPath();
  @jsw.dartified bool getVisible();
  @jsw.dartified void setEditable(bool editable);
  @jsw.dartified void setMap(GMap map);
  @jsw.dartified void setOptions(PolylineOptions options);
  @jsw.dartified void setPath(dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path);
  @jsw.dartified void setVisible(bool visible);
}

class Polyline extends MVCObject implements _Polyline {
  static Polyline cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Polyline.fromJsProxy(jsProxy));
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.Polyline);

  Polyline([PolylineOptions opts]) : super(maps.Polyline, [opts]);
  Polyline.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override GMap getMap() => GMap.cast($unsafe.getMap());
  @override MVCArray<LatLng> getPath() => MVCArray.cast($unsafe.getPath(), (e) => LatLng.cast(e));
  @override void setPath(dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path) => $unsafe.setPath(path is List ? jsw.JsArray.jsify(path) : path);

  bool get editable => getEditable();
  GMap get map => getMap();
  MVCArray<LatLng> get path => getPath();
  bool get visible => getVisible();
  set editable(bool editable) => setEditable(editable);
  set map(GMap map) => setMap(map);
  set options(PolylineOptions options) => setOptions(options);
  set path(dynamic/*MVCArray.<LatLng>|Array.<LatLng>*/ path) => setPath(path);
  set visible(bool visible) => setVisible(visible);

  PolylineEvents get on => new PolylineEvents._(this);
}

class PolylineEvents {
  static final CLICK = "click";
  static final DBLCLICK = "dblclick";
  static final MOUSEDOWN = "mousedown";
  static final MOUSEMOVE = "mousemove";
  static final MOUSEOUT = "mouseout";
  static final MOUSEOVER = "mouseover";
  static final MOUSEUP = "mouseup";
  static final RIGHTCLICK = "rightclick";

  final Polyline _polyline;

  PolylineEvents._(this._polyline);

  PolyMouseEventListenerAdder get click => new PolyMouseEventListenerAdder(_polyline, CLICK);
  PolyMouseEventListenerAdder get dblclick => new PolyMouseEventListenerAdder(_polyline, DBLCLICK);
  PolyMouseEventListenerAdder get mousedown => new PolyMouseEventListenerAdder(_polyline, MOUSEDOWN);
  PolyMouseEventListenerAdder get mousemove => new PolyMouseEventListenerAdder(_polyline, MOUSEMOVE);
  PolyMouseEventListenerAdder get mouseout => new PolyMouseEventListenerAdder(_polyline, MOUSEOUT);
  PolyMouseEventListenerAdder get mouseover => new PolyMouseEventListenerAdder(_polyline, MOUSEOVER);
  PolyMouseEventListenerAdder get mouseup => new PolyMouseEventListenerAdder(_polyline, MOUSEUP);
  PolyMouseEventListenerAdder get rightclick => new PolyMouseEventListenerAdder(_polyline, RIGHTCLICK);
}