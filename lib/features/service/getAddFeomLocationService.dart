import 'package:delivery_traky/features/models/placesMode.dart';
import 'package:dio/dio.dart';

class Getaddfeomlocationservice {
  final Dio dio = Dio();

  Future<placesModel> getuserAdd(double lat, double lon) async {
    try {
      final request = await dio.get(
        'https://nominatim.openstreetmap.org/reverse',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'format': 'jsonv2',
          'addressdetails': '1',
        },
        options: Options(headers: {'User-Agent': 'DeliveryTraky/1.0'}),
      );

      return placesModel.fromJson(request.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
