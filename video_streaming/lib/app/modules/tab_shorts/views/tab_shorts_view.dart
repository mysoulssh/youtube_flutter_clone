import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tab_shorts_controller.dart';

class TabShortsView extends GetView<TabShortsController> {
  const TabShortsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabShortsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TabShortsView is working ${controller.count.value}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
