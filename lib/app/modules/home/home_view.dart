import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpt_flutter/app/modules/tabs/dialogue/dialogue_view.dart';
import 'package:gpt_flutter/app/modules/tabs/game/game_view.dart';
import 'package:gpt_flutter/app/modules/tabs/scene/scene_view.dart';
import 'package:gpt_flutter/app/modules/tabs/settings/settings_view.dart';
import 'package:gpt_flutter/core/ui/picture.dart';
import 'package:gpt_flutter/generated/assets.dart';
import 'package:gpt_flutter/generated/locales.g.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  static const List<Widget> views = [
    DialogueView(),
    GameView(),
    SceneView(),
    SettingsView()
  ];

  BottomNavigationBarItem bottomNavItem(
          {required String title, required String icon, required String activeIcon}) =>
      BottomNavigationBarItem(
          // label: title,
          icon: PictureX(
            icon,
            width: 24,
            height: 24,
          ),
          activeIcon: PictureX(activeIcon));

  @override
  Widget build(BuildContext context) {
    
    return CupertinoTabScaffold(
      
      tabBar: CupertinoTabBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
        bottomNavItem(
          title: LocaleKeys.tabs_dialogue.tr,
            icon: Assets.imagesTabTabChatNormal,
            activeIcon: Assets.imagesTabTabChatActive),
        bottomNavItem(
          title: '游戏',
            icon: Assets.imagesTabTabGameNormal,
            activeIcon: Assets.imagesTabTabGameActive),
        bottomNavItem(
          title: '场景',
            icon: Assets.imagesTabTabSceneNormal,
            activeIcon: Assets.imagesTabTabSceneActive),
        bottomNavItem(
          title: '设置',
            icon: Assets.imagesTabTabSettingsNormal,
            activeIcon: Assets.imagesTabTabSettingsActive),
      ]),
      tabBuilder: (BuildContext context, int index) {
        return views[index];
      },
    );
  }
}
