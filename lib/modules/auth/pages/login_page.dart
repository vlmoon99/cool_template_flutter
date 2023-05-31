import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    // final textTheme = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: CupertinoButton(
          onPressed: () {
            Modular.to.navigate(Routes.home.getModule());
          },
          child: Container(
            width: 200,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.customColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Go to the home module",
            ),
          ),
        ),
      ),
    );
  }
}
