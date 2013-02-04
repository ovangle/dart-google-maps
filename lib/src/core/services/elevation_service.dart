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

abstract class _ElevationService {
  void getElevationAlongPath(PathElevationRequest request, void callback(List<ElevationResult> results, ElevationStatus status));
  void getElevationForLocations(LocationElevationRequest request, void callback(List<ElevationResult> results, ElevationStatus status));
}

class ElevationService extends jsw.TypedProxy implements _ElevationService {
  static ElevationService cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new ElevationService.fromJsProxy(jsProxy));

  ElevationService() : super(maps.ElevationService);
  ElevationService.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override void getElevationAlongPath(PathElevationRequest request, void callback(List<ElevationResult> results, ElevationStatus status)) {
    $unsafe.getElevationAlongPath(request, new jsw.Callback.once((js.Proxy results, js.Proxy status) => callback(jsw.JsArray.cast(results, ElevationResult.cast), ElevationStatus.find(status))));
  }
  @override void getElevationForLocations(LocationElevationRequest request, void callback(List<ElevationResult> results, ElevationStatus status)) {
    $unsafe.getElevationForLocations(request, new jsw.Callback.once((js.Proxy results, js.Proxy status) => callback(jsw.JsArray.cast(results, ElevationResult.cast), ElevationStatus.find(status))));
  }
}