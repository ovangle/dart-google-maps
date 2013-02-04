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

abstract class _MarkerShape {
  List<num> coords;
  MarkerShapeType type;
}

class MarkerShape extends jsw.TypedProxy implements _MarkerShape {
  static MarkerShape cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MarkerShape.fromJsProxy(jsProxy));

  MarkerShape() : super();
  MarkerShape.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<num> get coords => jsw.JsArray.cast($unsafe.coords);
  @override set coords(List<num> coords) => $unsafe.coords = jsw.JsArray.jsify(coords);
  @override MarkerShapeType get type => MarkerShapeType.find($unsafe.type);
}

class MarkerShapeType extends IsEnum<String> {
  static final CIRCLE = new MarkerShapeType._("circle");
  static final POLY = new MarkerShapeType._("poly");
  static final RECT = new MarkerShapeType._("rect");

  static final _INSTANCES = [CIRCLE, POLY, RECT];

  static MarkerShapeType find(Object o) => findIn(_INSTANCES, o);

  MarkerShapeType._(String value) : super(value);

  bool operator ==(Object other) => value == (other is MarkerShapeType ? (other as MarkerShapeType).value : other);
}