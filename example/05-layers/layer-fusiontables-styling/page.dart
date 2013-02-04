import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final australia = new LatLng(-25, 133);
    final map = new GMap(query("#map_canvas"), new MapOptions()
      ..center = australia
      ..zoom = 4
      ..mapTypeId = MapTypeId.ROADMAP
    );

    final layer = new FusionTablesLayer(new FusionTablesLayerOptions()
      ..query = (new FusionTablesQuery()
        ..select = 'geometry'
        ..from = '1ertEwm-1bMBhpEwHhtNYT47HQ9k2ki_6sRa-UQ'
      )
      ..styles = [
        new FusionTablesStyle()
          ..polygonOptions = (new FusionTablesPolygonOptions()
            ..fillColor = '#00FF00'
            ..fillOpacity = 0.3
          )
        , new FusionTablesStyle()
          ..where = 'birds > 300'
          ..polygonOptions = (new FusionTablesPolygonOptions()
            ..fillColor = '#0000FF'
          )
        , new FusionTablesStyle()
          ..where = 'population > 5'
          ..polygonOptions = (new FusionTablesPolygonOptions()
            ..fillOpacity = 1.0
        )
      ]
    );
    layer.map = map;
  });
}
