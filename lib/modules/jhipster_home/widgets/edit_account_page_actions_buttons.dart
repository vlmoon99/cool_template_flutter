import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/models/user.dart';
import 'package:cool_template/modules/jhipster_auth/widgets/auth_button.dart';
import 'package:cool_template/modules/jhipster_home/services/jhipster_settings_service.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';

class EditAccountPageActionsButtons extends StatelessWidget {
  const EditAccountPageActionsButtons({
    Key? key,
    required this.colors,
    required GlobalKey<FormBuilderState> formKey,
    required this.accountInfo,
    required this.textTheme,
  })  : _formKey = formKey,
        super(key: key);

  final MyColors colors;
  final GlobalKey<FormBuilderState> _formKey;
  final JhipsterAccountInfo? accountInfo;
  final MyTextStyles textTheme;

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      color: colors.customColor,
      onPress: () async {
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          final firstName = _formKey.currentState!.value['firstName'];
          final lastName = _formKey.currentState!.value['lastName'];
          final email = _formKey.currentState!.value['email'];
          final langKey = _formKey.currentState!.value['langKey'];
          final settingService = Modular.get<JhipsterSettingsService>();

          settingService
              .editAccount(accountInfo!.copyWith(
            firstName: firstName,
            lastName: lastName,
            email: email,
            langKey: langKey,
          ))
              .then((value) {
            if (value) {
              Modular.to.navigate(Routes.home.getModule());
            }
          });
        }
      },
      child: Text(
        LocalizationsStrings.home.editAccount.sendButton.tr(),
        style: textTheme.loginButton,
      ),
    );
  }
}