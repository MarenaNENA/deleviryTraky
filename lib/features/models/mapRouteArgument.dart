import 'package:delivery_traky/features/models/Locations.dart';
import 'package:delivery_traky/features/models/Routes.dart';

class MapRouteArguments {
  final RoutesModel routeModel;
  final List<locationModel> places;

  MapRouteArguments({required this.routeModel, required this.places});
}
