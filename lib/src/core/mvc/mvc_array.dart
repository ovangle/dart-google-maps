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

abstract class _MVCArray<E> {
  void clear();
  void forEach(void callback(E o, num index));
  jsw.JsArray<E> getArray();
  E getAt(num i);
  // num getLength(); // num get length;
  void insertAt(num i, E elem);
  E pop();
  num push(E elem);
  E removeAt(num i);
  void setAt(num i, E elem);
}

class MVCArray<E> extends MVCObject implements _MVCArray<E>{
  static MVCArray cast(js.Proxy jsProxy, [jsw.Transformer instantiator]) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new MVCArray.fromJsProxy(jsProxy, instantiator));
  static bool isInstance(js.Proxy jsProxy) => js.instanceof(jsProxy, maps.MVCArray);

  jsw.Transformer _transform;

  MVCArray([List<E> array, E transform(e)]) : super(maps.MVCArray, [array]) {
    _transform = transform != null ? transform : ((e) => e);
  }
  MVCArray.fromJsProxy(js.Proxy jsProxy, [E transform(e)]) : super.fromJsProxy(jsProxy) {
    _transform = transform != null ? transform : ((e) => e);
  }

  @override void forEach(void callback(E o, num index)) {
    $unsafe.forEach(new jsw.Callback.once((dynamic o, num index) => callback(jsw.transformIfNotNull(o, _transform), index)));
  }
  @override jsw.JsArray<E> getArray() => jsw.JsArray.cast($unsafe.getArray(), _transform);
  @override E getAt(num i) => jsw.transformIfNotNull($unsafe.getAt(i), _transform);
  @override num get length => $unsafe.getLength();
  @override E pop() => jsw.transformIfNotNull($unsafe.pop(), _transform);
  @override E removeAt(num i) => jsw.transformIfNotNull($unsafe.removeAt(i), _transform);

  MVCArrayEvents<E> get on => new MVCArrayEvents<E>._(this);
}

class MVCArrayEvents<E> {
  static final INSERT_AT = "insert_at";
  static final REMOVE_AT = "remove_at";
  static final SET_AT = "set_at";

  final MVCArray<E> _mvcArray;

  MVCArrayEvents._(this._mvcArray);

  NumEventListenerAdder get insertAt => new NumEventListenerAdder(_mvcArray, INSERT_AT);
  NumAndElementEventListenerAdder<E> get removeAt => new NumAndElementEventListenerAdder<E>(_mvcArray, REMOVE_AT, _mvcArray._transform);
  NumAndElementEventListenerAdder<E> get setAt => new NumAndElementEventListenerAdder<E>(_mvcArray, SET_AT, _mvcArray._transform);
}