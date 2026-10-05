import 'package:delivery_traky/features/AppRoute.dart';
import 'package:delivery_traky/features/models/Locations.dart';
import 'package:delivery_traky/features/models/mapRouteArgument.dart';
import 'package:delivery_traky/features/service/RouteServer.dart';
import 'package:delivery_traky/features/service/getAddFeomLocationService.dart';
import 'package:delivery_traky/features/service/getLocation.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class handleLocation {
  final locationHelper = Getlocationfunc();
  bool isInsideCairo(double lat, double lon) {
    const minLat = 29.8;
    const maxLat = 30.2;

    const minLon = 31.0;
    const maxLon = 31.7;

    return lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon;
  }

  Future<void> handleCurrentLocation(BuildContext context) async {
    final hasLocationPermission = await locationHelper.CheckLocation();

    if (!hasLocationPermission) {
      await _showLocationRequiredBottomSheet(context);
      return;
    }

    final locationData = await locationHelper.Getlocation();

    final latitude = locationData.latitude;
    final longitude = locationData.longitude;

    if (latitude == null || longitude == null) {
      return;
    }

    // Check Cairo using the actual GPS coordinates
    final isCairo = isInsideCairo(latitude, longitude);

    if (!isCairo) {
      await showCairoOnlyDialog(context);
      return;
    }

    // Get address only after confirming the location is inside Cairo
    final locatUser = await Getaddfeomlocationservice().getuserAdd(
      latitude,
      longitude,
    );

    final userLocation = locationModel(
      name: locatUser.displayname,
      latLng: LatLng(latitude, longitude),
    );

    places.add(userLocation);

    try {
      final route = await Routeserver().getRoute(
        places.map((place) => place.latLng).toList(),
      );

      await Navigator.pushNamed(
        context,
        Approute.maproude,
        arguments: MapRouteArguments(routeModel: route, places: places),
      );
    } finally {
      places.remove(userLocation);
    }
  }

  Future<void> _showLocationRequiredBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_off, size: 50),
              SizedBox(height: 16),
              Text(
                'Location Required',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Please enable location permission to continue.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> showCairoOnlyDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('This Location is not Available'),
          content: const Text('Excuse, This Service For Cairo only'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}
