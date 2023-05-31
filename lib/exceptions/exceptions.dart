import 'dart:developer';

import 'package:rxdart/rxdart.dart';

class AppExceptions {
  String messageForUser;
  String messageForDev;
  int statusCode;
  AppExceptions(
      {required this.messageForUser,
      required this.messageForDev,
      required this.statusCode});

  @override
  String toString() => "messageForDev$messageForDev";
}

class Catcher {
  Catcher() {
    exceptionsHandler.listen((value) {
      log(value.toString());
    });
  }
  final exceptionsHandler = BehaviorSubject<AppExceptions>();
}
