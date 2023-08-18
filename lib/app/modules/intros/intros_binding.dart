import 'package:get/get.dart';

import 'intros_controller.dart';

class IntrosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntrosController>(
      () => IntrosController(),
    );
  }
}
