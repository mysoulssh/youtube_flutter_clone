import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VideoPlayController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.onClose();
  }

  void increment() => count.value++;
}
