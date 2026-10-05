import 'package:delivery_traky/features/models/placesMode.dart';
import 'package:dio/dio.dart';

class Getplacesservice {
  final Dio dio = Dio();

  Future<List<placesModel>> getPlaces(String query) async {
    try {
      final request = await dio.get(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {
          'q': query,
          'format': 'json',
          'viewbox': '31.0,30.2,31.7,29.8',
          'bounded': '1',
        },
        options: Options(headers: {'User-Agent': 'DeliveryTraky/1.0'}),
      );
      List data = request.data;
      return data.map((data) => placesModel.fromJson(data)).toList();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
