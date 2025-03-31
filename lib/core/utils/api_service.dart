import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Response> getQuery({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await _dio.get(
        '$baseUrl$endPoint',
        queryParameters: query,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
