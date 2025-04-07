import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:purr_time/store/token.dart';

typedef DioResponse<T> = dio.Response<T>;
typedef DioException = dio.DioException;

class DioHelper {
  static late dio.Dio _dio;

  /// Initialize Dio once in main()
  static void init({
    String baseUrl = '',
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 10),
  }) {
    final options = dio.BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      responseType: dio.ResponseType.json,
    );

    _dio = dio.Dio(options);

    _dio.interceptors.add(dio.LogInterceptor(responseBody: true));

    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = TokenController.to.token.value;
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            print('⚠️ Unauthorized - token expired or invalid.');

            TokenController.to.clearToken();

            // Optionally redirect to login page
            // navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);

            return handler.reject(
              DioException(
                requestOptions: e.requestOptions,
                message: 'Unauthorized. Please log in again.',
              ),
            );
          }

          return handler.next(e);
        },
      ),
    );
  }

  static Future<DioResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  static Future<DioResponse> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  static Future<DioResponse> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  static Future<DioResponse> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  static Future<DioResponse> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  static Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case dio.DioExceptionType.connectionTimeout:
          return Exception("Connection timeout.");
        case dio.DioExceptionType.receiveTimeout:
          return Exception("Receive timeout.");
        case dio.DioExceptionType.badResponse:
          return Exception("Server error: ${error.response?.statusCode}");
        case dio.DioExceptionType.cancel:
          return Exception("Request cancelled.");
        default:
          return Exception("Unexpected error: ${error.message}");
      }
    } else {
      return Exception("Unknown error: $error");
    }
  }
}
