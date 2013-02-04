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

abstract class _Rectangle {
  @jsw.dartified LatLngBounds getBounds();
  @jsw.dartified bool getEditable();
  @jsw.dartified GMap getMap();
  @jsw.dartified bool getVisible();
  @jsw.dartified void setBounds(LatLngBounds bounds);
  @jsw.dartified void setEditable(bool editable);
  @jsw.dartified void setMap(GMap map);
  @jsw.dartified void setOptions(RectangleOptions options);
  @jsw.dartified void setVisible(bool visible);
}

class Rectangle extends MVCObject implements _Rectangle {
  static Rectangle cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Rectangle.fromJsProxy(jsProxy));
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.Rectangle);

  Rectangle([RectangleOptions opts]) : super(maps.Rectangle, [opts]);
  Rectangle.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override LatLngBounds getBounds() => LatLngBounds.cast($unsafe.getBounds());
  @override GMap getMap() => GMap.cast($unsafe.getMap());

  LatLngBounds get bounds => getBounds();
  bool get editable => getEditable();
  GMap get map => getMap();
  bool get visible => getVisible();
  set bounds(LatLngBounds bounds) => setBounds(bounds);
  set editable(bool editable) => setEditable(editable);
  set map(GMap map) => setMap(map);
  set options(RectangleOptions options) => setOptions(options);
  set visible(bool visible) => setVisible(visible);

  RectangleEvents get on => new RectangleEvents._(this);
}

class RectangleEvents {
  static final BOUNDS_CHANGED = "bounds_changed";
  static final CLICK = "click";
  static final DBLCLICK = "dblclick";
  static final MOUSEDOWN = "mousedown";
  static final MOUSEMOVE = "mousemove";
  static final MOUSEOUT = "mouseout";
  static final MOUSEOVER = "mouseover";
  static final MOUSEUP = "mouseup";
  static final RIGHTCLICK = "rightclick";

  final Rectangle _rectangle;

  RectangleEvents._(this._rectangle);

  NoArgsEventListenerAdder get boundsChanged => new NoArgsEventListenerAdder(_rectangle, BOUNDS_CHANGED);
  MouseEventListenerAdder get click => new MouseEventListenerAdder(_rectangle, CLICK);
  MouseEventListenerAdder get dblclick => new MouseEventListenerAdder(_rectangle, DBLCLICK);
  MouseEventListenerAdder get mousedown => new MouseEventListenerAdder(_rectangle, MOUSEDOWN);
  MouseEventListenerAdder get mousemove => new MouseEventListenerAdder(_rectangle, MOUSEMOVE);
  MouseEventListenerAdder get mouseout => new MouseEventListenerAdder(_rectangle, MOUSEOUT);
  MouseEventListenerAdder get mouseover => new MouseEventListenerAdder(_rectangle, MOUSEOVER);
  MouseEventListenerAdder get mouseup => new MouseEventListenerAdder(_rectangle, MOUSEUP);
  MouseEventListenerAdder get rightclick => new MouseEventListenerAdder(_rectangle, RIGHTCLICK);
}