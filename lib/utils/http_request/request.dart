import 'package:dio/dio.dart';

import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);
  static Future<T> _request<T>(String url,
      {String method = 'get',
      Map<String, dynamic>? params,
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
    dio.interceptors.addAll(inters);
    try {
      Response res = await dio.request(url, queryParameters: parmas, Options options)
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}
