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

class ChangePasswordPageActionsButtons extends StatelessWidget {
  const ChangePasswordPageActionsButtons({
    Key? key,
    required this.colors,
    required GlobalKey<FormBuilderState> formKey,
    required this.textTheme,
  }) : _formKey = formKey, super(key: key);

  final MyColors colors;
  final GlobalKey<FormBuilderState> _formKey;
  final MyTextStyles textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AuthButton(
        color: colors.customColor,
        onPress:() {
          if(_formKey.currentState?.saveAndValidate() ?? false){
            final currentPassword = _formKey.currentState!.value['currentPassword'];
            final newPassword = _formKey.currentState!.value['newPassword'];
            final settingService = Modular.get<JhipsterSettingsService>();

            //Refactor callback method
            settingService.changePassword(JhipsterChangePasswordModel(newPassword: newPassword, currentPassword: currentPassword)).then((value) {
              if(value){
                Modular.to.navigate(Routes.home.getModule());
              }
            });
          }
        },
        child: Text(
          LocalizationsStrings.home.changePassword.changeButton.tr(),
          style: textTheme.loginButton,
        ),
      ),
    );
  }
}

