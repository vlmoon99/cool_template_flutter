import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/models/user.dart';
import 'package:cool_template/modules/jhipster_auth/services/jhipster_auth_services.dart';
import 'package:cool_template/modules/jhipster_auth/widgets/auth_button.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPageActionsButtons extends StatelessWidget {
  const LoginPageActionsButtons({
    Key? key,
    required this.colors,
    required GlobalKey<FormBuilderState> formKey,
    required this.textTheme,
  })  : _formKey = formKey,
        super(key: key);

  final MyColors colors;
  final GlobalKey<FormBuilderState> _formKey;
  final MyTextStyles textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AuthButton(
          color: colors.customColor,
          //REFACTOR FUNC
          onPress: () async {
            if (_formKey.currentState?.saveAndValidate() ?? false) {
              final password = _formKey.currentState!.value['password'];
              final username = _formKey.currentState!.value['username'];
              final authService = Modular.get<JhipsterAuthService>();

              authService
                  .login(JhipsterLoginUser(
                      userLogin: username, password: password))
                  .then((value) {
                if (value) {
                  Modular.to.navigate(Routes.home.getModule());
                }
              });
            }
          },
          child: Text(
            LocalizationsStrings.auth.login.title.tr(),
            style: textTheme.loginButton,
          ),
        ),
        AuthButton(
          color: colors.customColor,
          onPress: () => Modular.to
              .pushNamed(Routes.auth.getRoute(Routes.auth.forgotPassword)),
          child: Text(
            LocalizationsStrings.auth.login.forgotPassword.tr(),
            style: textTheme.didYouForgotYourPassword,
            textAlign: TextAlign.center,
          ),
        ),
        AuthButton(
          color: colors.registerNewAccount,
          onPress: () =>
              Modular.to.pushNamed(Routes.auth.getRoute(Routes.auth.register)),
          child: Text(
            LocalizationsStrings.auth.login.registerNewAccount.tr(),
            style: textTheme.didYouForgotYourPassword,
          ),
        ),
      ],
    );
  }
}
