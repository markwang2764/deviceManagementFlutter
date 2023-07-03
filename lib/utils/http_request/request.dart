import 'package:dio/dio.dart';

import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      connectTimeout: HttpConfig.connectTimeout,
      receiveTimeout: HttpConfig.receiveTimeout);
  static final Dio _dio = Dio(baseOptions);
  static Future<T> _request<T>(String path,
      {String method = 'get',
      Map<String, dynamic>? params,
      Object? data,
      Options? options,
      Interceptor? reqInterceptor}) async {
    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        return handler.next(e);
      },
    );
    List<Interceptor> inters = [defaultInterceptor];
    if (reqInterceptor != null) {
      inters.add(reqInterceptor);
    }
    _dio.interceptors.addAll(inters);
    try {
      Response res = await _dio.request(path,
          queryParameters: params,
          options: Options(method: method, contentType: options?.contentType));
      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      }
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}
