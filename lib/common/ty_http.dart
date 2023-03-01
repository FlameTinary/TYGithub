import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TYHttp {
  // 单例模式
  static final TYHttp _instance = TYHttp._internal();
  // 工厂构造函数
  factory TYHttp() => _instance;

  late final Dio dio;
  final CancelToken _cancelToken = CancelToken();

  // 私有构造函数
  TYHttp._internal() {
    debugPrint('_internal');
    BaseOptions baseOptions = BaseOptions();
    baseOptions.headers['Accept'] = 'application/json';
    dio = Dio(baseOptions);

    // 添加request拦截器
    dio.interceptors.add(RequestInterceptor());
    // 添加response拦截器
    dio.interceptors.add(ResponseInterceptor());
    // 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());

    // 添加日志拦截器
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
    ));
  }

  // 初始化公共属性
  void init({
    required String baseUrl,
    int connectTimeout = 1500,
    int reciveTimeout = 1500,
    Map<String, String>? header,
    List<Interceptor>? interceptors,
  }) {
    debugPrint('init');
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: reciveTimeout),
      headers: header ?? const {},
    );
    // 如果有拦截器，就加载拦截器
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  // 关闭dio请求
  void cancelRequests({required CancelToken token}) {
    _cancelToken.cancel("cancelled");
  }

  // get请求
  // path 请求地址
  // params 请求对参数
  // 请求对配置
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.get(
        path,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // post请求
  // path 请求地址
  // params 请求对参数
  // 请求对配置
  Future? post(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Response response;
    try {
      response = await dio.post(
        path,
        data: params,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // put请求
  // path 请求地址
  // params 请求对参数
  // 请求对配置
  Future put(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    // 将pub包裹在try catch中，防止报错
    try {
      Response response = await dio.put(
        path,
        data: params,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // delete请求
  // path 请求地址
  // params 请求对参数
  // 请求对配置
  Future delete(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.delete(
        path,
        data: params,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

// request拦截器
class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('RequestInterceptor');
    super.onRequest(options, handler);
  }
}

// response拦截器
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('ResponseInterceptor');
    super.onResponse(response, handler);
  }
}

// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('ErrorInterceptor');
    super.onError(err, handler);
  }
}
