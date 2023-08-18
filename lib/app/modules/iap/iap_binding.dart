import 'package:get/get.dart';

import 'iap_controller.dart';

class IapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IapController>(
      () => IapController(),
    );
  }
}
