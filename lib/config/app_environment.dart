import 'dart:io';

import 'package:flutter/foundation.dart';

class AppEnvironment {
  static Environment environment = Environment.dev;
  static String appUrl = prodBaseUrl;
  static const String prodBaseUrl = "https://prod/api";
  static const String devBaseUrlAndroidEmulator = "http://10.0.2.2:8080/api";
  static const String devBaseUrlIOSdEmulator = "http://127.0.0.1:8080/api";

  static void setBaseUrl(Environment environment) {
    AppEnvironment.environment = environment;
    appUrl = environment == Environment.dev
        ? !kIsWeb && Platform.isAndroid
            ? devBaseUrlAndroidEmulator
            : devBaseUrlIOSdEmulator
        : prodBaseUrl;
  }
}

enum Environment { dev, prod }
