// import 'dart:convert';
// import 'dart:developer';
// import 'dart:typed_data';

// import 'package:cool_template/assets/localizations/localizations_strings.dart';
// import 'package:cool_template/config/app_environment.dart';
// import 'package:cool_template/keys/auth_pages/login_page.dart';
// import 'package:cool_template/main.dart';
// import 'package:cool_template/modules/app_module.dart';
// import 'package:cool_template/modules/jhipster_auth/jhipster_auth_module.dart';
// import 'package:cool_template/modules/jhipster_auth/pages/login_page.dart';
// import 'package:cool_template/modules/jhipster_auth/widgets/login_page_text_field_inputs.dart';
// import 'package:cool_template/routes/routes.dart';
// import 'package:cool_template/utils/utils.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// void main() {
//   testWidgets('App', (tester) async {
//     await initOfApp(Environment.dev);
//     await EasyLocalization.ensureInitialized();
//     final navigate = ModularNavigateMock();
//     Modular.navigatorDelegate = navigate;

//     final modularApp = EasyLocalization(
//       supportedLocales: const [
//         Locale('en'),
//       ],
//       path: LocalizationsStrings.localizationPath,
//       fallbackLocale: const Locale('en'),
//       saveLocale: false,
//       child: ModularApp(
//         module: AppModule(),
//         child: const AppWidget(false),
//       ),
//     );

//     await tester.pumpWidget(modularApp);
//     await tester.pump();
//     Modular.to.navigate(Routes.auth.getModule());
//     await tester.pump();

//     expect(find.byKey(LoginPageKeys.loginPageKey), findsOneWidget);

//   });
// }

// class ModularNavigateMock extends Mock implements IModularNavigator {}


