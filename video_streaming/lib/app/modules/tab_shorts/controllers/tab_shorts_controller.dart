import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabShortsController extends GetxController {
  //TODO: Implement TabShortsController

  final count = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
