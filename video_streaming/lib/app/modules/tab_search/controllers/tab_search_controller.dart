import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';

class TabSearchController extends GetxController {
  //TODO: Implement TabSearchController

  final count = 0.obs;
  final rxcategoryIndex = 1.obs;
  final List<GlobalKey> categoryKeys =
      List.generate(Assets.testCategories.length, (index) => GlobalKey());
  late Worker categoryIndexWorker;
  late ScrollController categoryScrollController;
  late TextEditingController editingController;
  late FocusNode focusNode;

  categoryItemClicked(int index) {
    rxcategoryIndex.value = index + 1;

    // 获取目标按钮的上下文
    final context = categoryKeys[index].currentContext;
    if (context == null) return;

    // 获取目标按钮的位置
    final box = context.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);

    // 计算需要滚动的偏移量
    final screenWidth = Get.width;
    final buttonWidth = box.size.width;
    var targetOffset = offset.dx -
        (screenWidth / 2) +
        (buttonWidth / 2) +
        categoryScrollController.offset;

    final maxScrollExtent = categoryScrollController.position.maxScrollExtent;
    if (targetOffset > maxScrollExtent) {
      targetOffset = maxScrollExtent;
    }

    if (targetOffset >= 0) {
      // 滚动到目标位置
      categoryScrollController.animateTo(
        targetOffset,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    } else {
      categoryScrollController.animateTo(0,
          duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    }
  }

  @override
  void onInit() {
    super.onInit();

    categoryIndexWorker = ever(rxcategoryIndex, (index) {});
    categoryScrollController = ScrollController();

    editingController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    focusNode.dispose();
    editingController.dispose();
    categoryIndexWorker.dispose();
    categoryScrollController.dispose();

    super.onClose();
  }

  void increment() => count.value++;
}
