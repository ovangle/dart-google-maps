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

abstract class _Size {
  num height;
  num width;
  bool equals(Size other);
  String toString();
}

class Size extends jsw.TypedProxy implements _Size {
  static Size cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new Size.fromJsProxy(jsProxy));

  Size(num width, num height, [String widthUnit, String heightUnit]) : super(maps.Size, [width, height, widthUnit, heightUnit]);
  Size.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  String toString() => $unsafe.noSuchMethod(new jsw.ProxyInvocationMirror.method("toString", []));
}