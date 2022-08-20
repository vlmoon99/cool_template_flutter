import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
  final secureStorage = Modular.get<FlutterSecureStorage>();
    String? value = await secureStorage.read(key: 'token');
    if (value?.isNotEmpty ?? false){
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
