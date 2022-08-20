import 'dart:io';
import 'package:cool_template/models/device_user_info.dart';
import 'package:dio/dio.dart';


class AddMobileInfoInterceptor extends Interceptor {
  final DeviceUserInfo deviceUserInfo;

  AddMobileInfoInterceptor({required this.deviceUserInfo});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var customHeaders = {
      HttpHeaders.userAgentHeader : ' App Version ${deviceUserInfo.appBuildNumber} App BuildNumber ${deviceUserInfo.appBuildNumber}'
    };
    options.headers.addAll(customHeaders);
    return super.onRequest(options, handler);
  }
}