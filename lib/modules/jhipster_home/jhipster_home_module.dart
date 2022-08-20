import 'package:cool_template/modules/jhipster_auth/services/jhipster_auth_services.dart';
import 'package:cool_template/modules/jhipster_home/pages/jhipster_change_password.dart';
import 'package:cool_template/modules/jhipster_home/pages/jhipster_edit_account.dart';
import 'package:cool_template/modules/jhipster_home/pages/jhipster_home_page.dart';
import 'package:cool_template/modules/jhipster_home/services/jhipster_settings_service.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class JhipsterHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => JhipsterSettingsService(
          i(),
          i(),
        )),
    Bind.singleton((i) => JhipsterAuthService(
          i(),
          i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.home.startPage,
      child: (context, args) => const HomePage(),
    ),
    ChildRoute(
      Routes.home.editAccount,
      child: (context, args) => JhipsterEditAccount(),
    ),
    ChildRoute(
      Routes.home.changePassword,
      child: (context, args) => JhipsterChangePassword(),
    ),
  ];
}
