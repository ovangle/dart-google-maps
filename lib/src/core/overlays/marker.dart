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

abstract class _Marker {
  @jsw.dartified Animation getAnimation();
  @jsw.dartified bool getClickable();
  @jsw.dartified String getCursor();
  @jsw.dartified bool getDraggable();
  @jsw.dartified bool getFlat();
  @jsw.dartified dynamic/*string|Icon|Symbol*/ getIcon();
  @jsw.dartified dynamic/*Map|StreetViewPanorama*/ getMap();
  @jsw.dartified LatLng getPosition();
  @jsw.dartified dynamic/*string|Icon|Symbol*/ getShadow();
  @jsw.dartified MarkerShape getShape();
  @jsw.dartified String getTitle();
  @jsw.dartified bool getVisible();
  @jsw.dartified num getZIndex();
  @jsw.dartified void setAnimation(Animation animation);
  @jsw.dartified void setClickable(bool flag);
  @jsw.dartified void setCursor(String cursor);
  @jsw.dartified void setDraggable(bool flag);
  @jsw.dartified void setFlat(bool flag);
  @jsw.dartified void setIcon(dynamic/*string|Icon|Symbol*/ icon);
  @jsw.dartified void setMap(dynamic/*Map|StreetViewPanorama*/ map);
  @jsw.dartified void setOptions(MarkerOptions options);
  @jsw.dartified void setPosition(LatLng latlng);
  @jsw.dartified void setShadow(dynamic/*string|Icon|Symbol*/ shadow);
  @jsw.dartified void setShape(MarkerShape shape);
  @jsw.dartified void setTitle(String title);
  @jsw.dartified void setVisible(bool visible);
  @jsw.dartified void setZIndex(num zIndex);
}

class Marker extends MVCObject implements _Marker {
  static Marker cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Marker.fromJsProxy(jsProxy));
  static final num MAX_ZINDEX = maps.Marker.MAX_ZINDEX;
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.Marker);
  static String _isSymbolOrIcon(js.Proxy jsProxy) {
    try {
      final path = jsProxy.path;
      return "Symbol";
    } on NoSuchMethodError {
      return "Icon";
    }
  }

  Marker([MarkerOptions opts]) : super(maps.Marker, [opts]);
  Marker.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override Animation getAnimation() => Animation.find($unsafe.getAnimation());
  @override dynamic/*string|Icon|Symbol*/ getIcon() {
    final result = $unsafe.getIcon();
    if (result is String) {
      return result;
    } else if (result is js.Proxy) {
      final type = _isSymbolOrIcon(result);
      if (type == "Symbol") {
        return Symbol.cast(result);
      } else if (type == "Icon") {
        return Icon.cast(result);
      }
    }
    return result;
  }
  @override dynamic/*Map|StreetViewPanorama*/ getMap() {
    final result = $unsafe.getMap();
    if (GMap.isInstance(result)) {
      return GMap.cast(result);
    } else if (StreetViewPanorama.isInstance(result)) {
      return StreetViewPanorama.cast(result);
    }
    return result;
  }
  @override LatLng getPosition() => LatLng.cast($unsafe.getPosition());
  @override dynamic/*string|Icon|Symbol*/ getShadow() {
    final result = $unsafe.getShadow();
    if (result is String) {
      return result;
    } else if (result is js.Proxy) {
      final type = _isSymbolOrIcon(result);
      if (type == "Symbol") {
        return Symbol.cast(result);
      } else if (type == "Icon") {
        return Icon.cast(result);
      }
    }
    return result;
  }
  @override MarkerShape getShape() => MarkerShape.cast($unsafe.getShape());

  Animation get animation => getAnimation();
  bool get clickable => getClickable();
  String get cursor => getCursor();
  bool get draggable => getDraggable();
  bool get flat => getFlat();
  dynamic get icon => getIcon();
  dynamic get map => getMap();
  LatLng get position => getPosition();
  dynamic get shadow => getShadow();
  MarkerShape get shape => getShape();
  String get title => getTitle();
  bool get visible => getVisible();
  num get zIndex => getZIndex();
  set animation(Animation animation) => setAnimation(animation);
  set clickable(bool clickable) => setClickable(clickable);
  set cursor(String cursor) => setCursor(cursor);
  set draggable(bool draggable) => setDraggable(draggable);
  set flat(bool flag) => setFlat(flag);
  set icon(dynamic icon) => setIcon(icon);
  set map(dynamic map) => setMap(map);
  set options(MarkerOptions options) => setOptions(options);
  set position(LatLng latlng) => setPosition(latlng);
  set shadow(dynamic shadow) => setShadow(shadow);
  set title(String title) => setTitle(title);
  set visible(bool visible) => setVisible(visible);
  set zIndex(num zIndex) => setZIndex(zIndex);

  // js events

  MarkerEvents get on => new MarkerEvents._(this);
}

class MarkerEvents {
  static final ANIMATION_CHANGED = "animation_changed";
  static final CLICK = "click";
  static final CLICKABLE_CHANGED = "clickable_changed";
  static final CURSOR_CHANGED = "cursor_changed";
  static final DBLCLICK = "dblclick";
  static final DRAG = "drag";
  static final DRAGEND = "dragend";
  static final DRAGGABLE_CHANGED = "draggable_changed";
  static final DRAGSTART = "dragstart";
  static final FLAT_CHANGED = "flat_changed";
  static final ICON_CHANGED = "icon_changed";
  static final MOUSEDOWN = "mousedown";
  static final MOUSEOUT = "mouseout";
  static final MOUSEOVER = "mouseover";
  static final MOUSEUP = "mouseup";
  static final POSITION_CHANGED = "position_changed";
  static final RIGHTCLICK = "rightclick";
  static final SHADOW_CHANGED = "shadow_changed";
  static final SHAPE_CHANGED = "shape_changed";
  static final TITLE_CHANGED = "title_changed";
  static final VISIBLE_CHANGED = "visible_changed";
  static final ZINDEX_CHANGED = "zindex_changed";

  final Marker _marker;

  MarkerEvents._(this._marker);

  NoArgsEventListenerAdder get animationChanged => new NoArgsEventListenerAdder(_marker, ANIMATION_CHANGED);
  MouseEventListenerAdder get click => new MouseEventListenerAdder(_marker, CLICK);
  NoArgsEventListenerAdder get clickableChanged => new NoArgsEventListenerAdder(_marker, CLICKABLE_CHANGED);
  NoArgsEventListenerAdder get cursorChanged => new NoArgsEventListenerAdder(_marker, CURSOR_CHANGED);
  MouseEventListenerAdder get dblclick => new MouseEventListenerAdder(_marker, DBLCLICK);
  MouseEventListenerAdder get drag => new MouseEventListenerAdder(_marker, DRAG);
  MouseEventListenerAdder get dragend => new MouseEventListenerAdder(_marker, DRAGEND);
  NoArgsEventListenerAdder get draggableChanged => new NoArgsEventListenerAdder(_marker, DRAGGABLE_CHANGED);
  MouseEventListenerAdder get dragstart => new MouseEventListenerAdder(_marker, DRAGSTART);
  NoArgsEventListenerAdder get flatChanged => new NoArgsEventListenerAdder(_marker, FLAT_CHANGED);
  NoArgsEventListenerAdder get iconChanged => new NoArgsEventListenerAdder(_marker, ICON_CHANGED);
  MouseEventListenerAdder get mousedown => new MouseEventListenerAdder(_marker, MOUSEDOWN);
  MouseEventListenerAdder get mouseout => new MouseEventListenerAdder(_marker, MOUSEOUT);
  MouseEventListenerAdder get mouseover => new MouseEventListenerAdder(_marker, MOUSEOVER);
  MouseEventListenerAdder get mouseup => new MouseEventListenerAdder(_marker, MOUSEUP);
  NoArgsEventListenerAdder get positionChanged => new NoArgsEventListenerAdder(_marker, POSITION_CHANGED);
  MouseEventListenerAdder get rightclick => new MouseEventListenerAdder(_marker, RIGHTCLICK);
  NoArgsEventListenerAdder get shadowChanged => new NoArgsEventListenerAdder(_marker, SHADOW_CHANGED);
  NoArgsEventListenerAdder get shapeChanged => new NoArgsEventListenerAdder(_marker, SHAPE_CHANGED);
  NoArgsEventListenerAdder get titleChanged => new NoArgsEventListenerAdder(_marker, TITLE_CHANGED);
  NoArgsEventListenerAdder get visibleChanged => new NoArgsEventListenerAdder(_marker, VISIBLE_CHANGED);
  NoArgsEventListenerAdder get zindexChanged => new NoArgsEventListenerAdder(_marker, ZINDEX_CHANGED);
}