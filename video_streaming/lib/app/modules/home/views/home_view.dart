import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/utils/helpers.dart';
import 'package:video_streaming/app/utils/uiutils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return HomeStateView(controller: controller);
  }
}

class HomeStateView extends StatefulWidget {
  final HomeController controller;

  const HomeStateView({super.key, required this.controller});

  @override
  State<HomeStateView> createState() => _HomeStateViewState();
}

class _HomeStateViewState extends State<HomeStateView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final type = Helpers.getDeviceType(Get.width);
    if (type != widget.controller.deviceType.value) {
      widget.controller.deviceType.value = type;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        leadingWidth: 40.r + 60.spMin + 80.sp,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20).r,
          child: Row(
            children: [
              Icon(
                Icons.logo_dev,
                color: Theme.of(context).primaryColor,
                size: 60.spMin,
              ),
              Text("Logo",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        title: Container(
          clipBehavior: Clip.hardEdge,
          child: TextField(
            decoration: InputDecoration(),
          ),
        ),
      ),
      body: Row(
        children: [
          Obx(
            () {
              if (widget.controller.deviceType.value == DeviceSizeType.phone) {
                return Container();
              } else if (widget.controller.deviceType.value ==
                  DeviceSizeType.pad) {
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
          ),
          Expanded(
              child: Container(
            color: Colors.grey.shade600,
          ))
        ],
      ),
    );
  }
}
