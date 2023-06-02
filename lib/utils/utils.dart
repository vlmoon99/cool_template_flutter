import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../config/app_environment.dart';

Future<void> initOfApp(Environment environment) async {
  AppEnvironment.setBaseUrl(environment);
  enablePlatformOverrideForDesktop();
  await EasyLocalization.ensureInitialized();
}

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}
