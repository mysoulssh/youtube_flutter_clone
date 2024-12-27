import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Obx(() {
            if (controller.windowWidth.value > 10) {}
            return LayoutBuilder(
              builder: (context, constraints) {
                if (controller.windowWidth.value < 788) {
                  return Container();
                }

                if (controller.windowWidth.value < 1280) {
                  return Container(
                    width: 96,
                    color: Colors.grey.shade800,
                  );
                }

                return Container(
                  width: 240,
                  color: Colors.grey.shade400,
                );
              },
            );
          }),
          Expanded(
              child: Container(
            color: Colors.grey.shade600,
          ))
        ],
      ),
    );
  }
}
