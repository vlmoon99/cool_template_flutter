class Routes {
  static final _Auth auth = _Auth();
  static final _Home home = _Home();
}

class _Auth extends RouteClass {
  @override
  String module = '/auth';
  String login = '/';
  String register = '/register';
  String forgotPassword = '/forgot-password';
  String resetPassword = '/reset-password';
}

class _Home extends RouteClass {
  @override
  String module = '/home';
  String startPage = '/';
  String editAccount = '/edit-account';
  String changePassword = '/change-password';
}

abstract class RouteClass {
  String module = '/';

  String getRoute(String moduleRoute) => module + moduleRoute;

  String getModule() => '$module/';
}
