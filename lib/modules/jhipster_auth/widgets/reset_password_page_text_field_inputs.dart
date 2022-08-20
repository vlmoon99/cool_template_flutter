import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:cool_template/validation/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ResetPasswordPageTextFieldInputs extends StatelessWidget {
  const ResetPasswordPageTextFieldInputs({
    Key? key,
    required GlobalKey<FormBuilderState> formKey,
    required this.textTheme,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;
  final MyTextStyles textTheme;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: <Widget>[
          Text(
            LocalizationsStrings.auth.resetPassword.title.tr(),
            style: textTheme.loginTitle,
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'code',
              autofocus: false,
              decoration: CustomInputDecoration.getInputDecoration(
                  'Your activation code'),
              validator: FormValidator.validatorDefault(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'newPassword',
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              autofocus: false,
              decoration:
                  CustomInputDecoration.getInputDecoration('Your new password'),
              validator: FormValidator.validatorPassword(context),
            ),
          ),
        ],
      ),
    );
  }
}
