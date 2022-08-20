import 'package:cool_template/modules/jhipster_auth/pages/forgot_password_page.dart';
import 'package:cool_template/modules/jhipster_auth/pages/login_page.dart';
import 'package:cool_template/modules/jhipster_auth/pages/register_page.dart';
import 'package:cool_template/modules/jhipster_auth/pages/reset_password_page.dart';
import 'package:cool_template/modules/jhipster_auth/services/jhipster_auth_services.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class JhipsterAuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => JhipsterAuthService(
          i(),
          i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.auth.login, child: (_, args) => LoginPage()),
    ChildRoute(Routes.auth.register, child: (_, args) => RegisterPage()),
    ChildRoute(Routes.auth.forgotPassword,
        child: (_, args) => ForgotPasswordPage()),
    ChildRoute(Routes.auth.resetPassword,
        child: (_, args) => ResetPasswordPage()),
  ];
}
