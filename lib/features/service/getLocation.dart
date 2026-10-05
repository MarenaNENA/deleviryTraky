import 'package:location/location.dart';

class Getlocationfunc {
  final Location location = Location();

  Future<bool> requsetOpenLocation() async {
    bool isLocationOpen = await location.serviceEnabled();
    if (!isLocationOpen) {
      isLocationOpen = await location.requestService();
    }
    return isLocationOpen;
  }

  Future<bool> CheckAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    if (permissionStatus != PermissionStatus.granted) {
      return false;
    }
    return true;
  }

  Future<bool> CheckLocation() async {
    final isLocationOpen = await requsetOpenLocation();
    if (!isLocationOpen) {
      return false;
    }
    final hasPermission = await CheckAndRequestLocationPermission();
    if (!hasPermission) {
      return false;
    }
    return true;
  }

  Future<LocationData> Getlocation() async {
    return await location.getLocation();
  }
}
