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

abstract class _DistanceMatrixResponseRow {
  List<DistanceMatrixResponseElement> elements;
}

class DistanceMatrixResponseRow extends jsw.TypedProxy implements _DistanceMatrixResponseRow {
  static DistanceMatrixResponseRow cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DistanceMatrixResponseRow.fromJsProxy(jsProxy));

  DistanceMatrixResponseRow() : super();
  DistanceMatrixResponseRow.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<DistanceMatrixResponseElement> get elements => jsw.JsArray.cast($unsafe.elements, DistanceMatrixResponseElement.cast);
  @override set elements(List elements) => $unsafe.elements = jsw.JsArray.jsify(elements);
}