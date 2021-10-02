abstract class DioClient {
  Future<DioResponse> get(String url);
}

class DioResponse {
  final dynamic data;
  final int? statusCode;

  DioResponse({required this.data, required this.statusCode});
}
