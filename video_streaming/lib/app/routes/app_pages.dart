import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/tab_home/bindings/tab_home_binding.dart';
import '../modules/tab_home/views/tab_home_view.dart';
import '../modules/tab_library/bindings/tab_library_binding.dart';
import '../modules/tab_library/views/tab_library_view.dart';
import '../modules/tab_search/bindings/tab_search_binding.dart';
import '../modules/tab_search/views/tab_search_view.dart';
import '../modules/tab_shorts/bindings/tab_shorts_binding.dart';
import '../modules/tab_shorts/views/tab_shorts_view.dart';
import '../modules/tab_subs/bindings/tab_subs_binding.dart';
import '../modules/tab_subs/views/tab_subs_view.dart';
import '../modules/top_navigator/bindings/top_navigator_binding.dart';
import '../modules/top_navigator/views/top_navigator_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      bindings: [
        TabHomeBinding(),
        TabShortsBinding(),
        TabSearchBinding(),
        TabSubsBinding(),
        TabLibraryBinding(),
        TopNavigatorBinding(),
      ],
    ),
    GetPage(
      name: _Paths.TAB_HOME,
      page: () => const TabHomeView(),
      binding: TabHomeBinding(),
    ),
    GetPage(
      name: _Paths.TAB_SHORTS,
      page: () => const TabShortsView(),
      binding: TabShortsBinding(),
    ),
    GetPage(
      name: _Paths.TAB_SEARCH,
      page: () => const TabSearchView(),
      binding: TabSearchBinding(),
    ),
    GetPage(
      name: _Paths.TAB_SUBS,
      page: () => const TabSubsView(),
      binding: TabSubsBinding(),
    ),
    GetPage(
      name: _Paths.TAB_LIBRARY,
      page: () => const TabLibraryView(),
      binding: TabLibraryBinding(),
    ),
    GetPage(
      name: _Paths.TOP_NAVIGATOR,
      page: () => const TopNavigatorView(),
      binding: TopNavigatorBinding(),
    ),
  ];
}
