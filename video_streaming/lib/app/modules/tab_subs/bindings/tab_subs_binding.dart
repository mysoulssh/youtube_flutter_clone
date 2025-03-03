import 'package:get/get.dart';

import '../controllers/tab_subs_controller.dart';

class TabSubsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabSubsController>(
      () => TabSubsController(),
    );
  }
}
