import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VideoPlayController extends GetxController with WidgetsBindingObserver {
  final count = 0.obs;
  final rxorientation = Orientation.portrait.obs;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this);
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
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.onClose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    rxorientation.value = MediaQuery.of(Get.context!).orientation;
    debugPrint("orientation = ${rxorientation.value}");
  }

  void increment() => count.value++;
}
