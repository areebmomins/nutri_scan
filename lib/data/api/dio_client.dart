import 'package:dio/dio.dart';

class DioClient {
  DioClient._internal();

  static final DioClient instance = DioClient._internal();

  late final _dio = Dio();

  Future<Response<Response>> post() async {
    return await _dio.post('/test', data: {'id': 12, 'name': 'dio'});
  }
}
