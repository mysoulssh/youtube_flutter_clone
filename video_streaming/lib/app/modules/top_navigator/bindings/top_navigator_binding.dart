import 'package:get/get.dart';

import '../controllers/top_navigator_controller.dart';

class TopNavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopNavigatorController>(
      () => TopNavigatorController(),
    );
  }
}
