import 'package:cool_template/exceptions/exceptions.dart';
import 'package:cool_template/models/user.dart';
import 'package:cool_template/modules/jhipster_auth/services/jhipster_auth_services.mocks.dart';
import 'package:cool_template/modules/jhipster_home/services/jhipster_settings_service.mocks.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('Jhipster Auth Service', () {
    test('Login', () async {
      final authService = MockJhipsterAuthService();
      final user = JhipsterLoginUser(userLogin: 'admin', password: 'admin');
      when(authService.login(user)).thenAnswer((_) => Future.value(true));
      final res = await authService.login(user);
      expect(res, true);
    });
    test('Register ', () async {
      final authService = MockJhipsterAuthService();
      final user = JhipsterRegisterUser(
          login: 'vlad', password: 'admin', email: 'mykolaienkovlad@gmail.com');
      when(authService.register(user)).thenAnswer((_) => Future.value(true));
      final res = await authService.register(user);
      expect(res, true);
    });

    test('Reset Password Init', () async {
      final authService = MockJhipsterAuthService();
      const email = 'mykolaienkovlad@gmail.com';
      when(authService.resetPasswordInit(email))
          .thenAnswer((_) => Future.value(true));
      final res = await authService.resetPasswordInit(email);
      expect(res, true);
    });
    test('Reset Password Finish', () async {
      final authService = MockJhipsterAuthService();
      final resetCode =
          JhipsterResetCode(code: '0213213423', password: 'admin12345');
      when(authService.resetPasswordFinish(resetCode))
          .thenAnswer((_) => Future.value(true));
      final res = await authService.resetPasswordFinish(resetCode);
      expect(res, true);
    });
    test('Get Account Info', () async {
      final authService = MockJhipsterAuthService();
      final accountInfo = JhipsterAccountInfo.empty();
      when(authService.getAccountInfo())
          .thenAnswer((_) => Future.value(accountInfo));
      final res = await authService.getAccountInfo();
      expect(res, accountInfo);
    });
  });

  group('Jhipster Settings Service', () {
    test('Clear All Data', () async {
      final settingsService = MockJhipsterSettingsService();
      final dataFromSecureStorage = {'token': "Bearer 2Feiweh3hewfhewfwefaw"};
      when(settingsService.clearAllData()).thenAnswer((_) {
        dataFromSecureStorage.clear();
        return Future.value();
      });
      await settingsService.clearAllData();
      expect(true, dataFromSecureStorage.isEmpty);
    });
    test('Change Password', () async {
      final settingsService = MockJhipsterSettingsService();
      final changePasswordModel = JhipsterChangePasswordModel(
          currentPassword: 'test12345', newPassword: '12345test');
      when(settingsService.changePassword(changePasswordModel))
          .thenAnswer((_) => Future.value(true));
      final res = await settingsService.changePassword(changePasswordModel);
      expect(res, true);
    });
    test('Edit Account', () async {
      final settingsService = MockJhipsterSettingsService();
      final accountInfo = JhipsterAccountInfo.empty();
      when(settingsService.editAccount(accountInfo))
          .thenAnswer((_) => Future.value(true));
      final res = await settingsService.editAccount(accountInfo);
      expect(res, true);
    });
  });

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
