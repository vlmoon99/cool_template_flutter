import 'package:cool_template/modules/home/pages/change_password.dart';
import 'package:cool_template/modules/home/pages/edit_account.dart';
import 'package:cool_template/modules/home/pages/home_page.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.home.startPage,
      child: (context, args) => const HomePage(),
    ),
    ChildRoute(
      Routes.home.editAccount,
      child: (context, args) => EditAccount(),
    ),
    ChildRoute(
      Routes.home.changePassword,
      child: (context, args) => ChangePassword(),
    ),
  ];
}
