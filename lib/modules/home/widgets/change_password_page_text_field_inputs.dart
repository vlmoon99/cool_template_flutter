import 'package:cool_template/theme/app_theme.dart';
import 'package:cool_template/validation/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordPageTextFieldInputs extends StatelessWidget {
  const ChangePasswordPageTextFieldInputs({
    Key? key,
    required GlobalKey<FormBuilderState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'currentPassword',
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              autofocus: false,
              decoration: CustomInputDecoration.getInputDecoration('Your current password'),
              validator: FormValidator.validatorPassword(context),
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
              decoration: CustomInputDecoration.getInputDecoration('Your new password'),
              validator: FormValidator.validatorPassword(context),
            ),
          ),
        ],
      ),
    );
  }
}
