import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tab_library_controller.dart';

class TabLibraryView extends GetView<TabLibraryController> {
  const TabLibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabLibraryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TabLibraryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
