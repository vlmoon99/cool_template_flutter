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

class ResetPasswordPageActionsButtons extends StatelessWidget {
  const ResetPasswordPageActionsButtons({
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
    return Center(
      child: AuthButton(
        color: colors.registerNewAccount,
        onPress: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            final code = _formKey.currentState!.value['code'];
            final newPassword = _formKey.currentState!.value['newPassword'];
            final authService = Modular.get<JhipsterAuthService>();

            authService
                .resetPasswordFinish(
                    JhipsterResetCode(code: code, password: newPassword))
                .then((value) {
              if (value) {
                Modular.to.navigate(Routes.auth.getModule());
              }
            });
          }
        },
        child: Text(
          LocalizationsStrings.auth.resetPassword.resetButton.tr(),
          style: textTheme.didYouForgotYourPassword,
        ),
      ),
    );
  }
}
