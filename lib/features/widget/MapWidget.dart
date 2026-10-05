import 'package:delivery_traky/features/models/Locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapwidget extends StatelessWidget {
  final MapController mapController;
  List<LatLng> coordinates;
  Mapwidget({
    super.key,
    required this.mapController,
    required this.coordinates,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: places[0].latLng,
          initialZoom: 15,
          cameraConstraint: CameraConstraint.containCenter(
            bounds: LatLngBounds(
              const LatLng(29.85, 30.95),
              const LatLng(30.35, 31.75),
            ),
          ),
        ),

        children: [
          TileLayer(
            urlTemplate:
                'https://tiles.stadiamaps.com/tiles/osm_bright/{z}/{x}/{y}.png?api_key=6ad2935a-1347-424b-adc9-4ecb57fbb25e',
            userAgentPackageName: 'com.example.delivery_traky',
          ),
          MarkerLayer(markers: intialMarker(places)),
          PolylineLayer(
            polylines: [
              Polyline(
                points: coordinates,
                strokeWidth: 3,
                color: Color(0xff185061),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Marker> intialMarker(List<locationModel> places) {
    return places.map((place) {
      return Marker(
        point: place.latLng,
        height: 50,
        width: 50,
        child: Icon(Icons.location_pin, color: Colors.red, size: 45),
      );
    }).toList();
  }
}
