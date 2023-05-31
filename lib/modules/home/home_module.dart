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
  ];
}
