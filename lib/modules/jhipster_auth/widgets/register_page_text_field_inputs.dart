import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:cool_template/validation/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterPageTextFieldInputs extends StatelessWidget {
  const RegisterPageTextFieldInputs({
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
            LocalizationsStrings.auth.register.title.tr(),
            style: textTheme.error,
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'username',
              autofocus: false,
              decoration: CustomInputDecoration.getInputDecoration('Username'),
              validator: FormValidator.validatorUserName(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'email',
              autofocus: false,
              decoration:
                  CustomInputDecoration.getInputDecoration('Your email'),
              validator: FormValidator.validatorEmail(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'password',
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              autofocus: false,
              decoration: CustomInputDecoration.getInputDecoration('Password'),
              validator: FormValidator.validatorPassword(context),
            ),
          ),
        ],
      ),
    );
  }
}
