import 'package:latlong2/latlong.dart';

class locationModel {
  final String name;
  final LatLng latLng;

  locationModel({required this.name, required this.latLng});
}

List<locationModel> places = [
  locationModel(name: 'SlidesEat', latLng: LatLng(30.0616, 31.2197)),
];
