import 'package:get/get.dart';

import '../controllers/tab_shorts_controller.dart';

class TabShortsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabShortsController>(
      () => TabShortsController(),
    );
  }
}
