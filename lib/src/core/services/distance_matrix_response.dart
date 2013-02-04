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

abstract class _DistanceMatrixResponse {
  List<String> destinationAddresses;
  List<String> originAddresses;
  List<DistanceMatrixResponseRow> rows;
}

class DistanceMatrixResponse extends jsw.TypedProxy implements _DistanceMatrixResponse {
  static DistanceMatrixResponse cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DistanceMatrixResponse.fromJsProxy(jsProxy));

  DistanceMatrixResponse() : super();
  DistanceMatrixResponse.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<String> get destinationAddresses => jsw.JsArray.cast($unsafe.destinationAddresses);
  @override set destinationAddresses(List<String> destinationAddresses) => $unsafe.destinationAddresses = jsw.JsArray.jsify(destinationAddresses);
  @override List<String> get originAddresses => jsw.JsArray.cast($unsafe.originAddresses);
  @override set originAddresses(List<String> originAddresses) => $unsafe.originAddresses = jsw.JsArray.jsify(originAddresses);
  @override List<DistanceMatrixResponseRow> get rows => jsw.JsArray.cast($unsafe.rows, DistanceMatrixResponseRow.cast);
  @override set rows(List<DistanceMatrixResponseRow> rows) => $unsafe.rows = jsw.JsArray.jsify(rows);
}