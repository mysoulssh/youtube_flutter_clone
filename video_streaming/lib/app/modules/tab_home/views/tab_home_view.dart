import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TabHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
