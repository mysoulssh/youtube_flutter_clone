import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tab_subs_controller.dart';

class TabSubsView extends GetView<TabSubsController> {
  const TabSubsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabSubsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TabSubsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
