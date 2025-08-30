import 'package:dio/dio.dart';

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 20)
    ..options.receiveTimeout = Duration(seconds: 20);
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      responseBody: true,
    ),
  );

  return dio;
}
