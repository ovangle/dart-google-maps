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

abstract class _TransitLine {
  List<TransitAgency> agencies;
  String color;
  String icon;
  String name;
  @jsw.dartified String short_name;
  @jsw.dartified String text_color;
  String url;
  TransitVehicle vehicle;
}

class TransitLine extends jsw.TypedProxy implements _TransitLine {
  static TransitLine cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new TransitLine.fromJsProxy(jsProxy));

  TransitLine() : super();
  TransitLine.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override List<TransitAgency> get agencies => jsw.JsArray.cast($unsafe.agencies, TransitAgency.cast);
  @override set agencies(List agencies) => $unsafe.agencies = jsw.JsArray.jsify(agencies);
  @override TransitVehicle get vehicle => TransitVehicle.cast($unsafe.vehicle);

  String get shortName => short_name;
  set shortName(String shortName) => this.short_name = shortName;
  String get textColor => text_color;
  set textColor(String textColor) => this.text_color = textColor;
}