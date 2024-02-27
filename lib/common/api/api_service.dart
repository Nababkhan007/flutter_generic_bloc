import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_generic_bloc/common/api/api_constants.dart';

class ApiService {
  Dio? _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiUrls.urlBase,
      contentType: ApiParams.paramContentType,
      receiveTimeout: const Duration(
        minutes: 1,
      ),
      connectTimeout: const Duration(
        minutes: 1,
      ),
      responseType: ResponseType.plain,
    );
    _dio = Dio(options);
  }

  Future<dynamic> get(String endpoint, {bool isHeader = false}) async {
    Response response;
    try {
      response = await _dio!.get(endpoint);
      return response;
    } on DioException catch (e) {
      log("Get api error data = ${e.response}");
    }
  }
}
