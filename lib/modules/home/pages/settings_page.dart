import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textTheme = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    //TODO ADD THEME SWITCHER PAGE
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizationsStrings.home.settings.title.tr(),
          style: textTheme.loginTitle?.copyWith(
            color: colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.account_box),
            title: Text(
              LocalizationsStrings.home.settings.accountListTitleText.tr(),
              style: textTheme.loginTitle?.copyWith(
                color: colors.black,
              ),
            ),
            onTap: () => Modular.to
                .pushNamed(Routes.home.getRoute(Routes.home.editAccount)),
          ),
          ListTile(
            leading: const Icon(Icons.password),
            title: Text(
              LocalizationsStrings.home.settings.passwordListTitleText.tr(),
              style: textTheme.loginTitle?.copyWith(
                color: colors.black,
              ),
            ),
            onTap: () => Modular.to
                .pushNamed(Routes.home.getRoute(Routes.home.changePassword)),
          ),
          ListTile(
              leading: const Icon(Icons.arrow_back_outlined),
              title: Text(
                LocalizationsStrings.home.settings.singOutListTitleText.tr(),
                style: textTheme.loginTitle?.copyWith(
                  color: colors.black,
                ),
              ),
              onTap: () async {}),
        ],
      ),
    );
  }
}
