import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class ApiService extends getx.GetxService {
  // Dio With Interceptors
  final _dio = Dio();
  final _baseUrl = 'http://10.0.2.2:5000';

  @override
  void onInit() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Content-Type'] = 'application/json';

          log('Request: ${options.method} ${options.path} ${options.headers}');

          if (options.method != 'GET') {
            log(' - With -');
            log('${options.data}');
          }
          if (options.method == 'GET') {
            log(' - With -');
            log('${options.queryParameters}');
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('Response: ${response.statusCode} ${response.statusMessage}');
          // TODO : Don't forget to Comment this

          return handler.next(response);
        },
        onError: (error, handler) {
          log('Error: ${error.message}');
          return handler.next(error);
        },
      ),
    );
    super.onInit();
  }

  Future<Response> get(
    String path, {
    bool? customBaseURL,
    bool? cache,
    Duration? cacheExpiry,
    Map<String, dynamic>? queryParameters,
  }) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;

    if (cache ?? false) {
      if (cacheExpiry == null) {
        log('Cache Expiry is required');
        throw Exception('Cache Expiry is required');
      }

      var response = await _dio.get(
        customBaseURL ?? false ? '' : path,
      );

      return response;
    }

    return await _dio.get(
      customBaseURL ?? false ? '' : path,
      queryParameters: queryParameters,
    );
    // return _dio.get(path);
  }

  Future<Response> post(
    String path,
    dynamic data, {
    bool? customBaseURL,
  }) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.post(
      customBaseURL ?? false ? '' : path,
      data: data,
    );
  }

  Future<Response> put(String path, dynamic data, {bool? customBaseURL}) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.put(
      customBaseURL ?? false ? '' : path,
      data: data,
    );
  }

  Future<Response> patch(
    String path,
    int id,
    dynamic data, {
    bool? customBaseURL,
  }) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.patch(
      customBaseURL ?? false ? '' : '$path$id/',
      data: data,
    );
  }

  Future<Response> delete(String path, int id, {bool? customBaseURL}) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.delete(
      customBaseURL ?? false ? '' : '$path$id/',
    );
  }
}
