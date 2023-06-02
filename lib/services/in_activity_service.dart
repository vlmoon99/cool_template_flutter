import 'dart:collection';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class CallBackTypes {
  static const callback1Type = 'callback1Type';
}

class InactivityService implements Disposable {
  final int duration = 3;
  RestartableTimer? timer;
  final Queue<String> callbacksQueue = Queue<String>();
  final FlutterSecureStorage secureStorage;
  final BehaviorSubject<bool> isActiveTimer = BehaviorSubject<bool>();
  InactivityService(this.secureStorage) {
    start();
    final isNeedToBeUpdated =
        secureStorage.read(key: CallBackTypes.callback1Type);
    isNeedToBeUpdated.then((value) {
      if (value != null) {
        callbacksQueue.add(value);
      }
    });
  }

  void addCallbackToTheQueue(String callBackType) {
    secureStorage.write(key: callBackType, value: callBackType);
    callbacksQueue.add(callBackType);
  }

  void startExecuting() {
    log("timer?.isActive ${timer?.isActive}");
  }

  void start() {
    isActiveTimer.add(true);

    timer = RestartableTimer(
      Duration(seconds: duration),
      () {
        log("Expired");
        isActiveTimer.add(false);
      },
    );
  }

  void reset() {
    log("reset");
    timer?.reset();
    isActiveTimer.add(true);
  }

  bool isActive() => timer?.isActive ?? false;

  @override
  void dispose() {
    timer?.cancel();
  }
}
