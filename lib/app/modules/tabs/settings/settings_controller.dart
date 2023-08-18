import 'package:get/get.dart';
import 'package:gpt_flutter/core/network/service/account_service.dart';
import 'package:gpt_flutter/generated/assets.dart';


enum SettingsItemType {
  rate,
  share,
  feedback,
  clear,
  terms,
  privacy;
}


class SettingsItemModel {
  final String icon;
  final String title;
  final SettingsItemType settingsItemType;
  SettingsItemModel(this.icon, this.title, this.settingsItemType);
}


class SettingsController extends GetxController {

  
  List<SettingsItemModel> list = [
    SettingsItemModel(Assets.imagesSettingsRate, '评价', SettingsItemType.rate),
    SettingsItemModel(Assets.imagesSettingsShare, '分享', SettingsItemType.share),
    SettingsItemModel(Assets.imagesSettingsFeedback, '反馈', SettingsItemType.feedback),
    SettingsItemModel(Assets.imagesSettingsClear, '清理', SettingsItemType.clear),
    SettingsItemModel(Assets.imagesSettingsTermsOfUse, '用户条款', SettingsItemType.terms),
    SettingsItemModel(Assets.imagesSettingsPrivacy, '隐私条款', SettingsItemType.privacy),
  ];



  action(SettingsItemModel model) {
    
    switch (model.settingsItemType) {
      case SettingsItemType.rate:
        // TODO: Handle this case.
        AccountService.signin();
        break;
      case SettingsItemType.share:
        // TODO: Handle this case.
        break;
      case SettingsItemType.feedback:
        // TODO: Handle this case.
        break;
      case SettingsItemType.clear:
        // TODO: Handle this case.
        break;
      case SettingsItemType.terms:
        // TODO: Handle this case.
        break;
      case SettingsItemType.privacy:
        // TODO: Handle this case.
        break;
    }

  }
}
