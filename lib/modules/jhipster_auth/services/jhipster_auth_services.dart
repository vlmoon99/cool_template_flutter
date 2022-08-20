import 'dart:convert';

import 'package:cool_template/models/jwt_token.dart';
import 'package:cool_template/models/user.dart';
import 'package:cool_template/network/network_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';
//TODO CHECK 1

@GenerateMocks([JhipsterAuthService])
class JhipsterAuthService {
  JhipsterAuthService(this.networkClient, this.secureStorage);
  final NetworkClient networkClient;
  final FlutterSecureStorage secureStorage;

  Future<bool> login(JhipsterLoginUser user) async {
    const apiUrl = '/authenticate';
    final response = await networkClient.postHTTP(apiUrl, user.toJson());
    if (!response.isSucsess) return false;

    final token = JwtToken.fromJson(response.data);
    await secureStorage.write(key: 'token', value: token.idToken);
    final accountInfo = await getAccountInfo();
    if (!accountInfo.isEmpty) {
      await secureStorage.write(
          key: 'accountInfo', value: jsonEncode(accountInfo.toJson()));
    }

    return token.isCorrect;
  }

  Future<bool> register(JhipsterRegisterUser user) async {
    const apiUrl = '/register';
    final response = await networkClient.postHTTP(apiUrl, user.toJson());
    return response.statusCode == 201 ? true : false;
  }

  Future<bool> resetPasswordInit(String email) async {
    const apiUrl = '/account/reset-password/init';
    final response = await networkClient.postHTTP(apiUrl, email);
    return response.statusCode == 200 ? true : false;
  }

  Future<bool> resetPasswordFinish(JhipsterResetCode resetCode) async {
    const apiUrl = '/account/reset-password/finish';
    final response = await networkClient.postHTTP(apiUrl, resetCode.toJson());
    return response.statusCode == 200 ? true : false;
  }

  Future<JhipsterAccountInfo> getAccountInfo() async {
    const apiUrl = '/account';
    final response = await networkClient.getRequest(apiUrl);
    if (!response.isSucsess) return JhipsterAccountInfo.empty();

    return JhipsterAccountInfo.fromJson(response.data);
  }
}
