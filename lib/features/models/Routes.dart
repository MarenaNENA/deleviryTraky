import 'package:latlong2/latlong.dart';

class RoutesModel {
  final GeometryModel geometry;
  final double duration;

  RoutesModel({required this.geometry, required this.duration});

  factory RoutesModel.fromJson(Map<String, dynamic> json) {
    return RoutesModel(
      geometry: GeometryModel.fromJson(json['geometry']),
      duration: (json['duration'] as num).toDouble(),
    );
  }
}

class GeometryModel {
  final List<LatLng> coordinates;

  GeometryModel({required this.coordinates});

  factory GeometryModel.fromJson(Map<String, dynamic> geojson) {
    return GeometryModel(
      coordinates: (geojson["coordinates"] as List)
          .map(
            (point) => LatLng(
              (point[1] as num).toDouble(),
              (point[0] as num).toDouble(),
            ),
          )
          .toList(),
    );
  }
}
