import 'package:cool_template/modules/auth/pages/login_page.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.auth.login,
      child: (_, args) => const LoginPage(),
    ),
  ];
}
