import 'package:dio/dio.dart';
import 'package:meal_app/core/dio_client/dio_client.dart';

class DioImplementation implements DioClient {
  Dio dio = new Dio();

  @override
  Future<DioResponse> get(String url) async {
    Response response = await dio.get(url);
    return DioResponse(data: response.data, statusCode: response.statusCode);
  }
}
