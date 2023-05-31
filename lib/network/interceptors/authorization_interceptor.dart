import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final secureStorage = Modular.get<FlutterSecureStorage>();
    var token = await secureStorage.read(key: 'token');
    options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    return super.onRequest(options, handler);
  }
}
