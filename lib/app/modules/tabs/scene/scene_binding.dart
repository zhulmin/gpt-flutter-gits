import 'package:get/get.dart';

import 'scene_controller.dart';

class SceneBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(SceneController());
  }
}
