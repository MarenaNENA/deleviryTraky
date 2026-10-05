import 'package:delivery_traky/features/models/Routes.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

class Routeserver {
  final Dio dio = Dio();

  Future<RoutesModel> getRoute(List<LatLng> locations) async {
    try {
      final coordinates = locations
          .map((point) => '${point.longitude},${point.latitude}')
          .join(';');
      final response = await dio.get(
        'https://router.project-osrm.org/route/v1/driving/$coordinates',
        queryParameters: {'overview': 'full', 'geometries': 'geojson'},
      );

      final routes = response.data['routes'] as List;
      return RoutesModel.fromJson(routes[0]);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
