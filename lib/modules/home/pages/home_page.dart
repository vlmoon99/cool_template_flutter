import 'package:cool_template/routes/routes.dart';
import 'package:cool_template/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    // final textTheme = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return Scaffold(
      body: Center(
        child: CupertinoButton(
          onPressed: () async {
            Modular.to.navigate(Routes.auth.getModule());
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
              "Go to the auth module",
            ),
          ),
        ),
      ),
    );
  }
}
