import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayController extends GetxController with WidgetsBindingObserver {
  final count = 0.obs;
  final rxorientation = Orientation.portrait.obs;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);

    super.onClose();
  }

  @override
  void didChangeMetrics() {
    rxorientation.value = MediaQuery.of(Get.context!).orientation;
    debugPrint("orientation = ${rxorientation.value}");

    super.didChangeMetrics();
  }

  void increment() => count.value++;
}
