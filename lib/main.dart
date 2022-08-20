import 'dart:async';
import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/config/app_environment.dart';
import 'package:cool_template/modules/app_module.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';


//TODO Add tools for adaptive UI

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await initOfApp(Environment.dev);
    final isAuthorized = await checkIfUserAuthorized();

    //Catch Errors caught by Flutter
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      //TODO add catcher

    };
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: LocalizationsStrings.localizationPath,
        fallbackLocale: const Locale('en'),
        saveLocale: false,
        child: ModularApp(
          module: AppModule(),
          child: AppWidget(isAuthorized),
        ),
      )));


  }, (error, stack) {
    //Catch Errors not caught by Flutter
    //TODO add catcher

  });
}

class AppWidget extends StatelessWidget {
  final bool isAuthorized;
  // ignore: use_key_in_widget_constructors
  const AppWidget(this.isAuthorized);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(
        isAuthorized ? Routes.home.getModule() : Routes.auth.getModule());

    return  Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'Cool Template',
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // locale: EasyLocalization.of(context)!.locale,
          // supportedLocales: EasyLocalization.of(context)!.supportedLocales,
          // localizationsDelegates: EasyLocalization.of(context)!.delegates,
        );
      });

  }
}
