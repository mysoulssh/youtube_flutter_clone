import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController

  final count = 0.obs;

  final rxcurrentIndex = 0.obs;
  late TabController tabController;
  late PageController pageController;
  late Worker indexWorker;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 5, vsync: this);
    tabController.index = rxcurrentIndex.value;

    pageController = PageController(initialPage: rxcurrentIndex.value);

    indexWorker = ever(rxcurrentIndex, (index) {
      pageController.jumpToPage(index);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    tabController.dispose();
    pageController.dispose();
    indexWorker.dispose();
  }

  void increment() => count.value++;
}
