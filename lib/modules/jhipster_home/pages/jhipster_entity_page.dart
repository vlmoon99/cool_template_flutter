import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class JhipsterEntityPage extends StatelessWidget {
  const JhipsterEntityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizationsStrings.home.entity.title.tr(),
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
