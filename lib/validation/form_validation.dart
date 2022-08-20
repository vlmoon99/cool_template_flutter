import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class FormValidator {
  static String? Function(String?)? validatorUserName(BuildContext context) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(context),
      FormBuilderValidators.minLength(context, 1),
      FormBuilderValidators.maxLength(context, 50),
    ]);
  }

  static String? Function(String?)? validatorPassword(BuildContext context) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(context),
      FormBuilderValidators.minLength(context, 4),
      FormBuilderValidators.maxLength(context, 50),
    ]);
  }

  static String? Function(String?)? validatorEmail(BuildContext context) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(context),
      FormBuilderValidators.maxLength(context, 256),
      FormBuilderValidators.email(context)
    ]);
  }

  static String? Function(String?)? validatorDefault(BuildContext context) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(context),
    ]);
  }

  static String? Function(String?)? validatorHumanNames(BuildContext context) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.minLength(context, 1),
      FormBuilderValidators.maxLength(context, 50)
    ]);
  }
}
