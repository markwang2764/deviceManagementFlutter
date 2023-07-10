import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mine_platform_app/routes.dart';

import '../../main.dart';
import '../../store/localStorage.dart';
import 'config.dart';

class HttpUtil {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      // responseType: ResponseType.plain,
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
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        String requestStr =
            "\n==================== REQUEST ====================\n"
            "- URL:\n${options.baseUrl + options.path}\n"
            "- METHOD: ${options.method}\n";
        requestStr += "- HEADER:\n${options.headers.toString()}\n";

        final data = options.data;
        if (data != null) {
          if (data is Map)
            requestStr += "- BODY:\n${data.toString()}\n";
          else if (data is FormData) {
            final formDataMap = Map()
              ..addEntries(data.fields)
              ..addEntries(data.files);
            requestStr += "- BODY:\n${formDataMap.toString()}\n";
          } else
            requestStr += "- BODY:\n${data.toString()}\n";
        }
        print(requestStr);
        return handler.next(options);
      },
      onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        String responseStr =
            "\n==================== RESPONSE ====================\n";
        responseStr += "- HEADER:\n{";
        response.headers.forEach(
            (key, list) => responseStr += "\n  " + "\"$key\" : \"$list\",");
        responseStr += "\n}\n";
        responseStr += "- STATUS: ${response.statusCode}\n";

        if (response.headers["authorization"] != null) {
          LocalStorage.instance
              .saveToken(response.headers["authorization"]![0]);
        }
        printWrapped(responseStr);
        return handler.next(response);
      },
      onError: (DioException err, ErrorInterceptorHandler handler) {
        String errorStr = "\n==================== ERROR ====================\n";
        errorStr += "- HEADER:\n${err.response?.headers.map.toString()}\n";
        if (err.response != null && err.response?.data != null) {
          print('╔ ${err.type.toString()}');
          errorStr += "- ERROR:\n${_parseResponse(err.response!)}\n";
          errorStr += "- statusCode:\n${err.response?.statusCode}\n";
          if (err.response?.statusCode == 401) {
            navigatorKey.currentState
                ?.pushNamedAndRemoveUntil(loginPage, (route) => false);
          }
        } else {
          errorStr += "- ERRORTYPE: ${err.type}\n";
          errorStr += "- MSG: ${err.message}\n";
        }
        print(errorStr);
        return handler.next(err);
      },
    );
    List<Interceptor> inters = [defaultInterceptor];
    if (reqInterceptor != null) {
      inters.add(reqInterceptor);
    }
    _dio.interceptors.addAll(inters);
    // _dio.httpClientAdapter =
    //     Http2Adapter(ConnectionManager(idleTimeout: Duration(seconds: 10)));
    var token = await LocalStorage.instance.readToken();

    var _headerWidthBear = {HttpHeaders.authorizationHeader: token};

    try {
      Options options = Options()
        ..method = method
        ..headers = {...?headers, ..._headerWidthBear};

      Response res = await _dio.request(path,
          queryParameters: params, data: data, options: options);
      if (res.statusCode == 200 || res.statusCode == 201) {
        if (res.data is Map) {
          return res.data;
        } else {
          return json.decode(res.data.toString());
        }
      } else {
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
    print(message);
  }

  static void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String _parseResponse(Response response) {
    String responseStr = "";
    var data = response.data;
    if (data is Map)
      responseStr += data.toString();
    else if (data is List)
      responseStr += data.toString();
    else
      responseStr += response.data.toString();

    return responseStr;
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
