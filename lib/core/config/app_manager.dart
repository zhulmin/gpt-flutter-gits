import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:gpt_flutter/app/data/db/message_provider.dart';
import 'package:gpt_flutter/core/storage/storage.dart';
import 'package:sqflite/sqflite.dart';
import 'env.dart';

class AppManager {
  static initialLogined() async {}

  static initialApp() async {

    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // await deleteDatabase('my_db.db');
    await MessageProvider.open('my_db.db');
    Platform.localeName;


    configEnv(
        type: EnvType.dev,
        baseUrl: "http://192.168.100.2:8241",
        shouldShowLog: true);

    
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    configureUI();

    await StorageY.setup();
  }

 

  static void configEnv(
      {required EnvType type,
      required String baseUrl,
      bool shouldShowLog = false}) {
    
    EnvConfig.okCode = 0;
    EnvConfig.envType = type;
    EnvConfig.baseUrl = baseUrl;
    EnvConfig.shouldCollectCrashLog = shouldShowLog;
  }

  static configureUI() {

  }

  static void logout() async {
    Storage.clearSignUpResp();

    await Get.offNamed(Routes.LOGIN);
  }
}
