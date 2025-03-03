import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tab_search_controller.dart';

class TabSearchView extends GetView<TabSearchController> {
  const TabSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabSearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TabSearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
