import 'package:cool_template/assets/localizations/localizations_strings.dart';
import 'package:cool_template/modules/jhipster_home/pages/jhipster_entity_page.dart';
import 'package:cool_template/modules/jhipster_home/pages/jhipster_settings_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const JhipsterEntityPage(),
    const JhipsterSettingsPage(),
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (id) {
            if (id == 0) {
              setState(() {
                _currentIndex = id;
              });
            } else if (id == 1) {
              setState(() {
                _currentIndex = id;
              });
            }
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.add),
              label: LocalizationsStrings.home.entity.title.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: LocalizationsStrings.home.settings.title.tr(),
            ),
          ]),
    );
  }
}
