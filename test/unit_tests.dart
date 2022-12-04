import 'package:cool_template/exceptions/exceptions.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Catcher', () {
    test('Catch Exception', () async {
      final catcher = Catcher();
      final mockExcpetion = AppExceptions(
          messageForDev: 'Not Found',
          messageForUser: 'Not Found',
          statusCode: 404);
      catcher.exceptionsHandler.add(mockExcpetion);
      expect(mockExcpetion, catcher.exceptionsHandler.value);
    });
  });

  group('AppTheme', () {
    test('AppTheme init value', () async {
      final appTheme = AppTheme();
      final lightTheme = ThemeData.light().copyWith(extensions: [
        const MyColors.light(),
        const MyTextStyles.defaultTextStyles(),
      ]);
      expect(lightTheme, appTheme.appThemeStream.value);
    });
    test('AppTheme switch to darkTheme', () async {
      final appTheme = AppTheme();
      appTheme.setDarkMode();
      final darkTheme = ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          const MyColors.dark(),
          const MyTextStyles.defaultTextStyles(),
        ],
      );
      expect(darkTheme, appTheme.appThemeStream.value);
    });
    test('AppTheme switch to darkTheme and then switch to Light', () async {
      final appTheme = AppTheme();
      appTheme.setDarkMode();
      appTheme.setLightMode();
      final lightTheme = ThemeData.light().copyWith(extensions: [
        const MyColors.light(),
        const MyTextStyles.defaultTextStyles(),
      ]);
      expect(lightTheme, appTheme.appThemeStream.value);
    });
  });
}
