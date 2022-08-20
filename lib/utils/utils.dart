import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_environment.dart';

Future<void> initOfApp(Environment environment) async {
  if (environment == Environment.dev) {
    await initializationsForDevMode();
  } else {
    await initializationsForProdMode();
  }
}

Future<void> initializationsForDevMode() async {
  AppEnvironment.setBaseUrl(Environment.dev);
  enablePlatformOverrideForDesktop();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('first_run') ?? true) {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    prefs.setBool('first_run', false);
  }
}

Future<void> initializationsForProdMode() async {
  AppEnvironment.setBaseUrl(Environment.prod);
  enablePlatformOverrideForDesktop();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('first_run') ?? true) {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    prefs.setBool('first_run', false);
  }
}

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

Future<bool> checkIfUserAuthorized() async {
  const storage = FlutterSecureStorage();
  String? value = await storage.read(key: 'token');
  final response = value == null ? false : true;
  return response;
}

