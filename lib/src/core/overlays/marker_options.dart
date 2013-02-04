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

abstract class _MarkerOptions {
  Point anchorPoint;
  Animation animation;
  bool clickable;
  String cursor;
  bool draggable;
  bool flat;
  dynamic/*string|Icon|Symbol*/ icon;
  dynamic/*Map|StreetViewPanorama*/ map;
  bool optimized;
  LatLng position;
  bool raiseOnDrag;
  dynamic/*string|Icon|Symbol*/ shadow;
  MarkerShape shape;
  String title;
  bool visible;
  num zIndex;
}

class MarkerOptions extends jsw.TypedProxy implements _MarkerOptions {
  static MarkerOptions cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MarkerOptions.fromJsProxy(jsProxy));

  MarkerOptions() : super();
  MarkerOptions.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override Point get anchorPoint => Point.cast($unsafe.anchorPoint);
  @override Animation get animation => Animation.find($unsafe.animation);
  @override dynamic/*string|Icon|Symbol*/ get icon {
    final result = $unsafe.icon;
    if (result is String) {
      return result;
    } else if (result is js.Proxy) {
      final type = Marker._isSymbolOrIcon(result);
      if (type == "Symbol") {
        return new Symbol.fromJsProxy(result);
      } else if (type == "Icon") {
        return new Icon.fromJsProxy(result);
      }
    }
    return result;
  }
  @override dynamic/*Map|StreetViewPanorama*/ get map {
    final result = $unsafe.map;
    if (GMap.isInstance(result)) {
      return new GMap.fromJsProxy(result);
    } else if (StreetViewPanorama.isInstance(result)) {
      return new StreetViewPanorama.fromJsProxy(result);
    }
    return result;
  }
  @override LatLng get position => LatLng.cast($unsafe.position);
  @override dynamic/*string|Icon|Symbol*/ get shadow {
    final result = $unsafe.shadow;
    if (result is String) {
      return result;
    } else if (result is js.Proxy) {
      final type = Marker._isSymbolOrIcon(result);
      if (type == "Symbol") {
        return new Symbol.fromJsProxy(result);
      } else if (type == "Icon") {
        return new Icon.fromJsProxy(result);
      }
    }
    return result;
  }
  @override MarkerShape get shape => MarkerShape.cast($unsafe.shape);
}