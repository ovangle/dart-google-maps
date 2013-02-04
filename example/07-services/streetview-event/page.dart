import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

final LatLng cafe = jsw.retain(new LatLng(37.869085,-122.254775));

void main() {
  js.scoped(() {
    final panoramaOptions = new StreetViewPanoramaOptions()
      ..position = cafe
      ..pov = (new StreetViewPov()
        ..heading = 270
        ..pitch = 0
        ..zoom = 1
      )
      ..visible = true
      ;
    final panorama = new StreetViewPanorama(query('#pano'), panoramaOptions);

    jsw.retainAll([panorama]);
    panorama.on.panoChanged.add(() {
      final panoCell = query('#pano_cell');
      panoCell.innerHtml = panorama.pano;
    });

    jsw.retainAll([panorama]);
    panorama.on.linksChanged.add(() {
      final linksTable = query('#links_table');
      linksTable.children.clear();
      final links =  panorama.links;
      for (int i = 0; i < links.length; i++) {
        final row = new TableRowElement();
        linksTable.children.add(row);
        final labelCell = new TableCellElement();
        labelCell.innerHtml = '<b>Link: ${i}</b>';
        final valueCell = new TableCellElement();
        valueCell.innerHtml = links[i].description;
        linksTable.children.add(labelCell);
        linksTable.children.add(valueCell);
      }
    });

    jsw.retainAll([panorama]);
    panorama.on.positionChanged.add(() {
      final positionCell = query('#position_cell');
      positionCell.innerHtml = '${panorama.position}';
    });

    jsw.retainAll([panorama]);
    panorama.on.povChanged.add(() {
      final headingCell = query('#heading_cell');
      final pitchCell = query('#pitch_cell');
      headingCell.innerHtml = '${panorama.pov.heading}';
      pitchCell.innerHtml = '${panorama.pov.pitch}';
    });
  });
}