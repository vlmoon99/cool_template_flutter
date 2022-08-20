import 'dart:convert';

import 'package:cool_template/exceptions/exceptions.dart';
import 'package:cool_template/models/device_user_info.dart';
import 'package:cool_template/network/interceptors/authorization_interceptor.dart';
import 'package:dio/dio.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/mobile_info_interceptor.dart';

//TODO Check 1

class NetworkClient {
  late Dio _dio;
  final Catcher catcher;
  NetworkClient(this.catcher,{required String baseUrl,}) {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.interceptors.add(LoggingInterceptor());
    _dio.interceptors.add(AuthorizationInterceptor());

    _dio.interceptors
        .add(AddMobileInfoInterceptor(deviceUserInfo: DeviceUserInfo()));
  }

  AppExceptions _handleError(DioError e) {
    final details = jsonDecode(e.response!.data)['detail'];
    final exception = AppExceptions(
        messageForUser: details,
        messageForDev: e.error.toString(),
        statusCode: e.response!.statusCode!);
    catcher.exceptionsHandler.add(exception);
    return exception;
  }

  Future<ApiResponse> getRequest(String url) async {
    AppExceptions? appExceptions;
    try {
      Response response = await _dio.get(url);
      return ApiResponse.sucsess(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }
    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }

  Future<ApiResponse> postHTTP(String url, dynamic data) async {
    AppExceptions? appExceptions;

    try {
      Response response = await _dio.post(
        url,
        data: data,
      );
      return ApiResponse.sucsess(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }
    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }

  Future<ApiResponse> putHTTP(String url, dynamic data) async {
    AppExceptions? appExceptions;

    try {
      Response response = await _dio.put(url, data: data);
      return ApiResponse.sucsess(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }
    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }

  Future<ApiResponse> deleteHTTP(String url, dynamic data) async {
    AppExceptions? appExceptions;

    try {
      Response response = await _dio.delete(url, data: data);
      return ApiResponse.sucsess(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }

    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }
}

class ApiResponse {
  ApiResponse.sucsess(this.data, this.statusCode, this.isSucsess);
  ApiResponse.error(this.data, this.statusCode, this.isSucsess);

  dynamic data;
  int statusCode;
  bool isSucsess;
}
