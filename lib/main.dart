import 'dart:async';
import 'dart:developer';
import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/config/app_environment.dart';
import 'package:cool_template/config/constants.dart';
import 'package:cool_template/exceptions/exceptions.dart';
import 'package:cool_template/modules/app_module.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/services/in_activity_service.dart';
import 'package:cool_template/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initOfApp(Environment.dev);
    FlutterError.onError = (details) {
      final catcher = Modular.get<Catcher>();
      catcher.exceptionsHandler.add(
        AppExceptions(
          messageForUser: details.exception.toString(),
          messageForDev: details.exception.runtimeType.toString(),
          statusCode: AppErrorCodes.errorFromFlutter,
        ),
      );
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
            child: const AppWidget(),
          ),
        )));
  }, (error, stack) {
    final catcher = Modular.get<Catcher>();
    final appException = AppExceptions(
      messageForUser:
          ErrorMessageHandler.getErrorMessageForNotFlutterExceptions(error),
      messageForDev: error.toString(),
      statusCode: AppErrorCodes.errorFromZone,
    );
    catcher.exceptionsHandler.add(
      appException,
    );
  });
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final inactivityService = Modular.get<InactivityService>();

    if (state == AppLifecycleState.resumed) {
      if (inactivityService.isActive()) {
        inactivityService.reset();
      } else {
        log("time Out");
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(Routes.auth.getModule());
    final inactivityService = Modular.get<InactivityService>();

    ScreenUtil.init(
      context,
      designSize: const Size(390, 800),
    );

    return Listener(
      onPointerDown: (_) => inactivityService.reset(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'Cool Template',
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      }),
    );
  }
}
