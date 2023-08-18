import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpt_flutter/core/config/app_manager.dart';
import 'package:gpt_flutter/core/ui/colors.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main()  async {

  await AppManager.initialApp();
  
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: Get.locale,
      theme: JTheme.lightTheme,
  );
}
