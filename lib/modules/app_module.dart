import 'package:cool_template/config/app_environment.dart';
import 'package:cool_template/exceptions/exceptions.dart';
import 'package:cool_template/network/network_checker.dart';
import 'package:cool_template/network/network_client.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:logger/logger.dart';

//TODO LOGERR?
class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Catcher()),
    Bind.singleton((i) => NetworkChecker()),
    Bind.singleton(
      (i) => NetworkClient(i(), baseUrl: AppEnvironment.appUrl),
    ),
    Bind.singleton((i) => const FlutterSecureStorage()),
    Bind.singleton((i) => AppTheme()),
    // Bind.singleton((i) => Logger(printer: PrettyPrinter(
    //     methodCount: 0, // number of method calls to be displayed
    //     errorMethodCount: 8, // number of method calls if stacktrace is provided
    //     lineLength: 120, // width of the output
    //     colors: true, // Colorful log messages
    //     printEmojis: true, // Print an emoji for each log message
    //     printTime: false // Should each log print contain a timestamp
    // ),)),
  ];

  @override
  final List<ModularRoute> routes = [];
}
