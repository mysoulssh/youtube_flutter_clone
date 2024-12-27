import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final windowWidth = Get.width.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(Get.width);
      windowWidth.value = Get.width;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
