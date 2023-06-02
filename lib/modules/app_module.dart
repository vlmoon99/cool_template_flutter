import 'package:cool_template/exceptions/exceptions.dart';
import 'package:cool_template/network/network_checker.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/services/in_activity_service.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth/auth_module.dart';
import 'home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Catcher(i())),
    Bind.singleton((i) => NetworkChecker()),
    Bind.singleton((i) => const FlutterSecureStorage()),
    Bind.singleton((i) => AppTheme()),
    Bind.singleton((i) => InactivityService(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Routes.home.module,
      module: HomeModule(),
    ),
    ModuleRoute(
      Routes.auth.module,
      module: AuthModule(),
    ),
  ];
}
