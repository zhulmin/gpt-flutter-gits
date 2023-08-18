import 'dart:io';

import 'package:get/get.dart';
import 'package:gpt_flutter/core/config/comom.dart';

class AccountService {
  static signin() {

    var locale = Get.deviceLocale;

    logDev(locale?.countryCode);
    logDev(locale?.languageCode);
    logDev(DateTime.now().timeZoneName); //时区: cst
    logDev(DateTime.now().timeZoneOffset.inHours); //时区:  -12 ~ 12 (以UTC为基准)
    var _locale = Platform.localeName;
    logDev(_locale); //en_US   语言

    //DateTime.parse('2021-11-01 20:18:04Z').toLocal();
    //时间生成默认是utc

    var map = {
      "countryCode": "US",
      "languageCode": "en",
      "timeZone":"cst"
    };

    
  }
}
