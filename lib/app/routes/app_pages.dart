import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/iap/iap_binding.dart';
import '../modules/iap/iap_view.dart';
import '../modules/intros/intros_binding.dart';
import '../modules/intros/intros_view.dart';
import '../modules/tabs/dialogue/dialogue_binding.dart';
import '../modules/tabs/dialogue/dialogue_view.dart';
import '../modules/tabs/game/game_binding.dart';
import '../modules/tabs/game/game_view.dart';
import '../modules/tabs/scene/scene_binding.dart';
import '../modules/tabs/scene/scene_view.dart';
import '../modules/tabs/settings/settings_binding.dart';
import '../modules/tabs/settings/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        bindings: [
          SceneBinding(),
          DialogueBinding(),
          SettingsBinding(),
          GameBinding()
        ]),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: _Paths.SCENE,
      page: () => const SceneView(),
    ),
    GetPage(
      name: _Paths.GAME,
      page: () => const GameView(),
    ),
    GetPage(
      name: _Paths.DIALOGUE,
      page: () => const DialogueView(),
    ),
    // GetPage(
    //   name: _Paths.CHAT,
    //   page: () => const ChatView(),
    //   binding: ChatBinding(),
    // ),
    GetPage(
      name: _Paths.IAP,
      page: () => const IapView(),
      binding: IapBinding(),
    ),
    GetPage(
      name: _Paths.INTROS,
      page: () => const IntrosView(),
      binding: IntrosBinding(),
    ),
  ];
}
