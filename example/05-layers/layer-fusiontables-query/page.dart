import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

void main() {
  js.scoped(() {
    final chicago = new LatLng(41.948766, -87.691497);
    final map = new GMap(query("#map_canvas"), new MapOptions()
      ..center = chicago
      ..zoom = 12
      ..mapTypeId = MapTypeId.ROADMAP
    );

    final layer = new FusionTablesLayer(new FusionTablesLayerOptions()
      ..query = (new FusionTablesQuery()
        ..select = 'address'
        ..from = '1d7qpn60tAvG4LEg4jvClZbc1ggp8fIGGvpMGzA'
        ..where = 'ridership > 5000'
      )
    );
    layer.map = map;
  });
}
