import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/modules/tab_home/views/tab_home_view.dart';
import 'package:video_streaming/app/modules/tab_library/views/tab_library_view.dart';
import 'package:video_streaming/app/modules/tab_search/views/tab_search_view.dart';
import 'package:video_streaming/app/modules/tab_shorts/views/tab_shorts_view.dart';
import 'package:video_streaming/app/modules/tab_subs/views/tab_subs_view.dart';
import 'package:video_streaming/app/modules/top_navigator/views/top_navigator_view.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/generated/locales.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBody(context),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: CustomInkRippleFactory(rippleRadius: 30),
        ),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: controller.rxcurrentIndex.value,
            onTap: (value) {
              controller.rxcurrentIndex.value = value;
              controller.tabController.index = value;
            },
            items: [
              navigationBarItem(VSAssets.homeUnselected, VSAssets.homeSelected,
                  LocaleKeys.tabHome.tr),
              navigationBarItem(VSAssets.shortUnselected,
                  VSAssets.shortSelected, LocaleKeys.tabShorts.tr),
              navigationBarItem(VSAssets.tabSearch, VSAssets.tabSearch,
                  LocaleKeys.tabSearch.tr),
              navigationBarItem(VSAssets.subsUnselected, VSAssets.subsSelected,
                  LocaleKeys.tabSubs.tr),
              navigationBarItem(VSAssets.libraryUnselected,
                  VSAssets.librarySelected, LocaleKeys.tabLibrary.tr)
            ],
          ),
        ),
      ),
    );
  }
}

extension HomeWidgets on HomeView {
  navigationBarItem(String unselected, String selected, String label) =>
      BottomNavigationBarItem(
        label: label,
        icon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3),
          child: SvgPicture.asset(
            unselected,
            colorFilter: ColorFilter.mode(
                Get.isDarkMode
                    ? Colors.white.withValues(alpha: 0.7)
                    : Color(0xff111111).withValues(alpha: 0.7),
                BlendMode.srcIn),
          ),
        ),
        activeIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3),
          decoration: BoxDecoration(
              color: Color(0xffffaabb).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(16)),
          child: SvgPicture.asset(
            selected,
            colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
        ),
      );

  tabBody(BuildContext context) => Column(
        children: [
          Obx(() {
            if (controller.rxcurrentIndex.value == 1) {
              return Container();
            }
            return TopNavigatorView();
          }),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TabHomeView(),
                TabShortsView(),
                TabSearchView(),
                TabSubsView(),
                TabLibraryView()
              ],
            ),
          ),
        ],
      );
}

class CustomInkRipple extends InkRipple {
  CustomInkRipple({
    required super.controller,
    required super.referenceBox,
    required super.position,
    required super.color,
    required super.textDirection,
    super.containedInkWell,
    super.rectCallback,
    super.borderRadius,
    super.customBorder,
    super.radius, // 自定义水波纹半径
  });
}

class CustomInkRippleFactory extends InteractiveInkFeatureFactory {
  final double rippleRadius; // 动态调整水波纹大小

  const CustomInkRippleFactory({this.rippleRadius = 20});

  @override
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Offset position,
      required Color color,
      required TextDirection textDirection,
      bool containedInkWell = false,
      RectCallback? rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    return CustomInkRipple(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      textDirection: textDirection,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius ?? rippleRadius, // 使用传入的水波纹大小
    );
  }
}
