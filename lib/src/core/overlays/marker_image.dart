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

abstract class _MarkerImage {
  Point anchor;
  Point origin;
  Size scaledSize;
  Size size;
  String url;
}

@deprecated
class MarkerImage extends jsw.TypedProxy implements _MarkerImage {
  static MarkerImage cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MarkerImage.fromJsProxy(jsProxy));

  MarkerImage(String url, [Size size, Point origin, Point anchor, Size scaledSize]) : super(maps.MarkerImage, [url, size, origin, anchor, scaledSize]);
  MarkerImage.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override Point get anchor => Point.cast($unsafe.anchor);
  @override Point get origin => Point.cast($unsafe.origin);
  @override Size get scaledSize => Size.cast($unsafe.scaledSize);
  @override Size get size => Size.cast($unsafe.size);
}