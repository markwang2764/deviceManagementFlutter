import 'dart:convert';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'config.dart';

class HttpUtil {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      connectTimeout: HttpConfig.connectTimeout,
      receiveTimeout: HttpConfig.receiveTimeout);
  static final Dio _dio = Dio(baseOptions);

  static Future<T> _request<T>(String path,
      {String method = 'get',
      Map<String, dynamic>? params,
      Object? data,
      Map<String, dynamic>? headers,
      Interceptor? reqInterceptor}) async {
    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print("path---------->" + options.path);
        print("method---------->" + options.method);
        print("header----------->" + options.headers.toString());
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
    // _dio.httpClientAdapter =
    //     Http2Adapter(ConnectionManager(idleTimeout: Duration(seconds: 10)));
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;
      Response res = await _dio.request(path,
          queryParameters: params, data: data, options: options);
      if (res.statusCode == 200 || res.statusCode == 201) {
        if (res.data is Map) {
          return res.data;
        } else {
          return json.decode(res.data.toString());
        }
      } else {
        EasyLoading.showInfo('error: ${res.statusCode}');
        _handleHttpError(res.statusCode!);
        return Future.error('HTTP错误');
      }
    } on DioException catch (e) {
      // EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    }
  }

  static String _dioError(DioException error) {
    print(error);
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "网络连接超时，请检查网络设置";
      case DioExceptionType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioExceptionType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioExceptionType.badResponse:
        return "服务器异常，请稍后重试！";
      case DioExceptionType.cancel:
        return "请求已被取消，请重新请求";
      case DioExceptionType.unknown:
        return "网络异常，请稍后重试！";
      default:
        return "Dio异常";
    }
  }

  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    EasyLoading.showError(message);
  }

  static Future<T> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Interceptor? reqInterceptor}) {
    return _request(path,
        method: 'get',
        params: queryParameters,
        headers: headers,
        reqInterceptor: reqInterceptor);
  }

  static Future<T> post<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Interceptor? reqInterceptor}) {
    return _request(path,
        method: 'post',
        params: queryParameters,
        data: data,
        headers: headers,
        reqInterceptor: reqInterceptor);
  }

  static Future<T> delete<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Interceptor? reqInterceptor}) {
    return _request(path,
        method: 'DELETE',
        params: queryParameters,
        data: data,
        headers: headers,
        reqInterceptor: reqInterceptor);
  }

  static Future<T> put<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Interceptor? reqInterceptor}) {
    return _request(path,
        method: 'PUT',
        params: queryParameters,
        data: data,
        headers: headers,
        reqInterceptor: reqInterceptor);
  }
}
