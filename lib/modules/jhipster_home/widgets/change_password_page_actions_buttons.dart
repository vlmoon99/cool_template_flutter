import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/modules/auth/widgets/auth_button.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePasswordPageActionsButtons extends StatelessWidget {
  const ChangePasswordPageActionsButtons({
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
        color: colors.customColor,
        onPress: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            // final currentPassword =
            //     _formKey.currentState!.value['currentPassword'];
            // final newPassword = _formKey.currentState!.value['newPassword'];
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
