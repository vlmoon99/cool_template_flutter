import 'package:cool_template/modules/auth/pages/forgot_password_page.dart';
import 'package:cool_template/modules/auth/pages/login_page.dart';
import 'package:cool_template/modules/auth/pages/register_page.dart';
import 'package:cool_template/modules/auth/pages/reset_password_page.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    
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
