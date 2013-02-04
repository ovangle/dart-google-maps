import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:js_wrap/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';

class ColumnChart extends jsw.IsJsProxy {
  ColumnChart(Node div) : super.newInstance(js.context.google.visualization.ColumnChart, [div]);

  void draw(DataTable data, [jsw.IsJsProxy options]) { $.draw(data, options); }
}

class DataTable extends jsw.IsJsProxy {
  DataTable() : super.newInstance(js.context.google.visualization.DataTable);

  void addColumn(String type, [String label, String id]) { $.addColumn(type, label, id); }
  void addRow([List<Object> cellArray]) { $.addRow(cellArray); }
}

ElevationService elevator;
GMap map;
ColumnChart chart;
final InfoWindow infowindow = jsw.retain(new InfoWindow());
Polyline polyline;

// The following path marks a general path from Mt.
// Whitney, the highest point in the continental United
// States to Badwater, Death Vallet, the lowest point.
final LatLng whitney = jsw.retain(new LatLng(36.578581, -118.291994));
final LatLng lonepine = jsw.retain(new LatLng(36.606111, -118.062778));
final LatLng owenslake = jsw.retain(new LatLng(36.433269, -117.950916));
final LatLng beattyjunction = jsw.retain(new LatLng(36.588056, -116.943056));
final LatLng panamintsprings = jsw.retain(new LatLng(36.339722, -117.467778));
final LatLng badwater = jsw.retain(new LatLng(36.23998, -116.83171));

void main() {
  js.scoped(() {
    final mapOptions = new MapOptions()
      ..zoom = 8
      ..center = lonepine
      ..mapTypeId = MapTypeId.TERRAIN
      ;
    map = jsw.retain(new GMap(query('#map_canvas'), mapOptions));

    // Create an ElevationService.
    elevator = jsw.retain(new ElevationService());

    // Draw the path, using the Visualization API and the Elevation service.
    drawPath();
  });
}

void drawPath() {

  // Create a new chart in the elevation_chart DIV.
  chart = jsw.retain(new ColumnChart(query('#elevation_chart')));

  final path = [ whitney, lonepine, owenslake, panamintsprings, beattyjunction, badwater];

  // Create a PathElevationRequest object using this array.
  // Ask for 256 samples along that path.
  final pathRequest = new PathElevationRequest()
    ..path = path
    ..samples = 256
    ;

  // Initiate the path request.
  elevator.getElevationAlongPath(pathRequest, plotElevation);
}

// Takes an array of ElevationResult objects, draws the path on the map
// and plots the elevation profile on a Visualization API ColumnChart.
void plotElevation(List<ElevationResult> results, ElevationStatus status) {
  if (status == ElevationStatus.OK) {
    // Extract the elevation samples from the returned results
    // and store them in an array of LatLngs.
    final elevationPath = [];
    for (final elevation in results) {
      elevationPath.add(elevation.location);
    }

    // Display a polyline of the elevation path.
    final pathOptions = new PolylineOptions()
      ..path = elevationPath
      ..strokeColor = '#0000CC'
      ..$.opacity = 0.4  // TODO not in doc
      ..map = map
      ;
    polyline = jsw.retain(new Polyline(pathOptions));

    // Extract the data from which to populate the chart.
    // Because the samples are equidistant, the 'Sample'
    // column here does double duty as distance along the
    // X axis.
    final data = new DataTable();
    data.addColumn('string', 'Sample');
    data.addColumn('number', 'Elevation');
    for (final elevation in results) {
      data.addRow(['', elevation.elevation]);
    }

    // Draw the chart using the data within its DIV.
    query('#elevation_chart').style.display = 'block';
    chart.draw(data, new jsw.IsJsProxy()
      ..$.width = 640
      ..$.height = 200
      ..$.legend = 'none'
      ..$.titleY = 'Elevation (m)'
    );
  }
}