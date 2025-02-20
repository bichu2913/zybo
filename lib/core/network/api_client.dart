import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;
  // final Dio _dio = Dio(
  //   BaseOptions(
  //     baseUrl: "https://admin.kushinirestaurant.com/api/",
  //     connectTimeout: Duration(seconds: 10),
  //     receiveTimeout: Duration(seconds: 10),
  //     headers: {"Content-Type": "application/json"},
  //   ),
  // );
  static Dio createDio() {
    return Dio(BaseOptions(
      baseUrl: 'https://admin.kushinirestaurant.com/api',
      receiveTimeout: const Duration(milliseconds: 15000), // 15 seconds
      connectTimeout: const Duration(milliseconds: 15000),
      sendTimeout: const Duration(milliseconds: 15000),
      headers: {"Content-Type": "application/json"},
    ));
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    try {
      final response = await dio.post(url, data: body);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "API Error");
    }
  }
  DioClient() {
    dio = createDio();
    
    
  }
}
