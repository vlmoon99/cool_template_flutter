import 'package:cool_template/theme/app_theme.dart';
import 'package:cool_template/validation/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class EditAccountPageTextFieldInputs extends StatelessWidget {
  const EditAccountPageTextFieldInputs({
    Key? key,
    required GlobalKey<FormBuilderState> formKey,
    required this.options,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;
  final List<String> options;

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
              name: 'firstName',
              autofocus: false,
              decoration:
                  CustomInputDecoration.getInputDecoration('First name'),
              validator: FormValidator.validatorHumanNames(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'lastName',
              autofocus: false,
              decoration: CustomInputDecoration.getInputDecoration('Last name'),
              validator: FormValidator.validatorHumanNames(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderTextField(
              name: 'email',
              autofocus: false,
              decoration: CustomInputDecoration.getInputDecoration('Email'),
              validator: FormValidator.validatorEmail(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: FormBuilderDropdown(
              name: 'langKey',
              decoration: CustomInputDecoration.getInputDecoration('Language'),
              allowClear: true,
              validator: FormValidator.validatorDefault(context),
              items: options
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
