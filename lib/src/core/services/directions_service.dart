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

abstract class _DirectionsService {
  void route(DirectionsRequest request, void callback(DirectionsResult results, DirectionsStatus status));
}

class DirectionsService extends jsw.TypedProxy implements _DirectionsService {
  static DirectionsService cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new DirectionsService.fromJsProxy(jsProxy));

  DirectionsService() : super(maps.DirectionsService);
  DirectionsService.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override void route(DirectionsRequest request, void callback(DirectionsResult results, DirectionsStatus status)) {
    $unsafe.route(request, new jsw.Callback.once((js.Proxy results, js.Proxy status) => callback(DirectionsResult.cast(results), DirectionsStatus.find(status))));
  }
}