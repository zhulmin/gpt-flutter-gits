import 'package:get/get.dart';

import 'dialogue_controller.dart';

class DialogueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogueController>(
      () => DialogueController(),
    );
  }
}
