import 'dart:convert';
import 'package:cool_template/models/user.dart';
import 'package:cool_template/network/network_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';

//Check 1
@GenerateMocks([JhipsterSettingsService])
class JhipsterSettingsService {
  JhipsterSettingsService(this.networkClient, this.secureStorage);

  final NetworkClient networkClient;
  final FlutterSecureStorage secureStorage;

  Future<void> clearAllData() async {
    await secureStorage.deleteAll();
  }

  Future<bool> changePassword(
      JhipsterChangePasswordModel changePassword) async {
    const apiUrl = '/account/change-password';
    final response =
        await networkClient.postHTTP(apiUrl, changePassword.toJson());
    return response.statusCode == 200 ? true : false;
  }

  Future<bool> editAccount(JhipsterAccountInfo accountInfo) async {
    const apiUrl = '/account';
    final response = await networkClient.postHTTP(apiUrl, accountInfo.toJson());
    await secureStorage.write(
        key: 'accountInfo', value: jsonEncode(accountInfo.toJson()));
    return response.statusCode == 200 ? true : false;
  }
}
