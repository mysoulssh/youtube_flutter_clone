import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/modules/home/views/home_top_view.dart';
import 'package:video_streaming/app/modules/tab_home/views/tab_home_view.dart';
import 'package:video_streaming/app/modules/tab_library/views/tab_library_view.dart';
import 'package:video_streaming/app/modules/tab_search/views/tab_search_view.dart';
import 'package:video_streaming/app/modules/tab_shorts/views/tab_shorts_view.dart';
import 'package:video_streaming/app/modules/tab_subs/views/tab_subs_view.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_ink_ripple_factory.dart';
import 'package:video_streaming/generated/locales.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: controller.rxcurrentIndex.value == 1 ? null : topNavigatorView(),
        body: tabBody(context),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // splashFactory: CustomInkRippleFactory(rippleRadius: 30),
            splashFactory: NoSplash.splashFactory,
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
                navigationBarItem(Assets.homeUnselected, Assets.homeSelected, LocaleKeys.tabHome.tr),
                navigationBarItem(Assets.shortUnselected, Assets.shortSelected, LocaleKeys.tabShorts.tr),
                navigationBarItem(Assets.tabSearch, Assets.tabSearch, LocaleKeys.tabSearch.tr),
                navigationBarItem(Assets.subsUnselected, Assets.subsSelected, LocaleKeys.tabSubs.tr),
                navigationBarItem(Assets.libraryUnselected, Assets.librarySelected, LocaleKeys.tabLibrary.tr)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension HomeWidgets on HomeView {
  navigationBarItem(String unselected, String selected, String label) => BottomNavigationBarItem(
        label: label,
        icon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3),
          child: SvgPicture.asset(
            unselected,
            colorFilter: ColorFilter.mode(Get.isDarkMode ? Colors.white.withValues(alpha: 0.7) : Color(0xff111111).withValues(alpha: 0.7), BlendMode.srcIn),
          ),
        ),
        activeIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3),
          decoration: BoxDecoration(color: Color(0xffffaabb).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(16)),
          child: SvgPicture.asset(
            selected,
            colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
        ),
      );

  tabBody(BuildContext context) => PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [TabHomeView(), TabShortsView(), TabSearchView(), TabSubsView(), TabLibraryView()],
      );
}
