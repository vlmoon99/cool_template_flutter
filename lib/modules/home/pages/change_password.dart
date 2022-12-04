import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/modules/home/widgets/change_password_page_actions_buttons.dart';
import 'package:cool_template/modules/home/widgets/change_password_page_text_field_inputs.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textTheme = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizationsStrings.home.changePassword.title.tr(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: ChangePasswordPageTextFieldInputs(
              formKey: _formKey,
            ),
          ),
          Expanded(
            child: ChangePasswordPageActionsButtons(
              colors: colors,
              formKey: _formKey,
              textTheme: textTheme,
            ),
          ),
        ],
      ),
    );
  }
}
