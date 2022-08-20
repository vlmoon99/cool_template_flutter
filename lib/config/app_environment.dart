import 'dart:io';
//Todo unit testing
class AppEnvironment {
  static late Environment environment;
  static late String appUrl;
  static const String prodBaseUrl = "https://prod/api";
  static const String devBaseUrlAndroidEmulator = "http://10.0.2.2:8080/api";
  static const String devBaseUrlIOSdEmulator = "http://127.0.0.1:8080/api";


  static void setBaseUrl(Environment environment) =>
       //Mobile and Desktops
      environment == Environment.dev
          ? appUrl = Platform.isAndroid
          ? devBaseUrlAndroidEmulator
          : devBaseUrlIOSdEmulator
          : appUrl = prodBaseUrl;
}

enum Environment {
  dev,prod
}
