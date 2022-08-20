import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/models/user.dart';
import 'package:cool_template/modules/jhipster_auth/services/jhipster_auth_services.dart';
import 'package:cool_template/modules/jhipster_home/widgets/edit_account_page_actions_buttons.dart';
import 'package:cool_template/modules/jhipster_home/widgets/edit_account_page_text_field_inputs.dart';
import 'package:cool_template/shared_widgets/default_loader.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';
//TODO Check performance

class JhipsterEditAccount extends StatelessWidget {
  JhipsterEditAccount({Key? key}) : super(key: key);
  //TODO remove harcode
  final options = ["ru", "eng"];
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textTheme = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;
    final authService = Modular.get<JhipsterAuthService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizationsStrings.home.editAccount.title.tr(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<JhipsterAccountInfo>(
          future: authService.getAccountInfo(),
          builder: (context, snapshot) {
            final accountInfo = snapshot.data;
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: EditAccountPageTextFieldInputs(
                      formKey: _formKey,
                      accountInfo: accountInfo,
                      options: options,
                    ),
                  ),
                  Expanded(
                    child: EditAccountPageActionsButtons(
                      colors: colors,
                      formKey: _formKey,
                      accountInfo: accountInfo,
                      textTheme: textTheme,
                    ),
                  ),
                ],
              );
            } else {
              return const DefaultLoader();
            }
          }),
    );
  }
}





