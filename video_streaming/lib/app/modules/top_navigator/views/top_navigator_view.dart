import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/top_navigator_controller.dart';

class TopNavigatorView extends GetView<TopNavigatorController> {
  const TopNavigatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
    );
  }
}
