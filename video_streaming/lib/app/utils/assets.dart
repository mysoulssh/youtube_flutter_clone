import 'dart:math';

class Assets {
  static final testAvatars = [
    "https://tse4-mm.cn.bing.net/th/id/OIP-C.TNV6OT1FkyfbD90eoL_BEQHaIw?w=166&h=197&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.AR9s5FI3fVfuUiLHAH--yAHaHa?w=197&h=197&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse1-mm.cn.bing.net/th/id/OIP-C.KZT1SVn3Y734bPMREWH1eAHaHh?w=193&h=197&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse1-mm.cn.bing.net/th/id/OIP-C.EkxnKfcgkniBkkG5V30EBQAAAA?w=197&h=197&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.P9xdAn3fxu7oZb38pw4YLwHaJQ?w=157&h=197&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.RlYPnRfp_rOjVzK56tmd6wHaFj?w=264&h=197&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.7SjxEJLSiEyaXy02Or8rFQHaE7?w=270&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.UFzctiKxd8Q8-SmOtZ6ExAHaFF?w=244&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.4V4NJu0_1uxmts4dFX75_QHaHa?w=168&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.vnaFYjOX6T4XG5sLrULv2gHaHa?w=163&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse4-mm.cn.bing.net/th/id/OIP-C.sLbD__AD86uVxJYq6K3PKQHaHa?w=162&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.w0qVy3DxAEkqUchOzqgGowHaHa?w=197&h=197&c=7&r=0&o=5&dpr=2&pid=1.7"
  ];

  static randomAvatar() => Random().nextInt(testAvatars.length);

  static final homeUnselected = "assets/images/home_unselected.svg";
  static final homeSelected = "assets/images/home_selected.svg";

  static final shortUnselected = "assets/images/short_unselected.svg";
  static final shortSelected = "assets/images/short_selected.svg";

  static final tabSearch = "assets/images/tab_search.svg";

  static final subsUnselected = "assets/images/subs_unselected.svg";
  static final subsSelected = "assets/images/subs_selected.svg";

  static final libraryUnselected = "assets/images/library_unselected.svg";
  static final librarySelected = "assets/images/library_selected.svg";

  static final appbarCast = "assets/images/appbar_cast.svg";
  static final appbarMenu = "assets/images/appbar_menu.svg";
  static final appbarNotifyDisable = "assets/images/appbar_notify_disable.svg";
  static final appbarNotifyEnable = "assets/images/appbar_notify_enable.svg";
  static final appbarLogo = "assets/images/appbar_logo.svg";
  static final appbarYoutube = "assets/images/appbar_youtube.svg";
}
