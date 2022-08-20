import 'package:cool_template/modules/jhipster_auth/widgets/forgot_password_page_actions_buttons.dart';
import 'package:cool_template/modules/jhipster_auth/widgets/forgot_password_page_text_field_inputs.dart';
import 'package:cool_template/shared_widgets/logo.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textTheme = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Logo(
              width: 50.w,
              height: 40.w,
            ),
          ),
          Expanded(
            child: ForgotPasswordPageTextFieldInputs(
              formKey: _formKey,
              textTheme: textTheme,
            ),
          ),
          Expanded(
            child: ForgotPasswordPageActionsButtons(
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
