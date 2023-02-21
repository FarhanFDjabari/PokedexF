import 'package:dio/dio.dart';
import 'package:pokedex_f/data/datasources/remote/interceptor/log_interceptor.dart';

class AppDio {
  Dio getDio({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) {
    var dio = Dio(BaseOptions(
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
      contentType: "application/json",
    ));

    final defaultHeader = <String, dynamic>{};

    defaultHeader.addAll(headers);

    dio.options.headers.addAll(defaultHeader);

    dio.interceptors.add(APILogInterceptor());
    return dio;
  }
}
