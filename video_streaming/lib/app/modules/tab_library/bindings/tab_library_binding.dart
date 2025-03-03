import 'package:get/get.dart';

import '../controllers/tab_library_controller.dart';

class TabLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabLibraryController>(
      () => TabLibraryController(),
    );
  }
}
