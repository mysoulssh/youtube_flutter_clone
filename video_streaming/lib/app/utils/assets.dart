import 'dart:math';

class Assets {
  static final testCategories = [
    "All",
    "Subscriptions",
    "Posts",
    "Music",
    "Tech",
    "Design",
    "Live",
    "Playlist",
    "Cats",
    "Electronics",
    "New Creators",
    "Art",
    "Tech News",
    "Lofi beats"
  ];

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

  static final testFilms = [
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.Rt909r6A2q9N0hr-Elu_AgHaDb?w=335&h=161&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse2-mm.cn.bing.net/th/id/OIP-C.dxB2y0OnJslTO1mMY3TYkQHaFj?w=257&h=192&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse1-mm.cn.bing.net/th/id/OIP-C.SMY4hVIOagrN-A3ACtEHnwHaDa?w=307&h=161&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse4-mm.cn.bing.net/th/id/OIP-C.RGU_I6df08aVKPUn1M6ewQHaEK?w=315&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse2-mm.cn.bing.net/th/id/OIP-C._r3y3e-UP3XVThSmqTgZRAHaKn?w=196&h=282&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse1-mm.cn.bing.net/th/id/OIP-C.YZB3JJjFBlzJN1IS1kZSbAHaDZ?w=196&h=90&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse1-mm.cn.bing.net/th/id/OIP-C.gF8fjeGB6M-5X63yAyHP6gHaEO?w=196&h=112&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.mU5_jPTF7TMq7mSjnwWrAwHaEX?w=196&h=116&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.LMSBPjN590oweJXrlUJAWAHaEK?w=196&h=110&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse4-mm.cn.bing.net/th/id/OIP-C.PKL5afTu0B0RbGuaJ51RFAHaFJ?w=196&h=136&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse3-mm.cn.bing.net/th/id/OIP-C.sBc1x_cap0R9AZjm_9GWIgHaEK?w=196&h=110&c=7&r=0&o=5&dpr=2&pid=1.7",
    "https://tse2-mm.cn.bing.net/th/id/OIP-C.SrBUBdHEsgANzP00QAdr9wHaEK?w=196&h=110&c=7&r=0&o=5&dpr=2&pid=1.7"
  ];

  static String randomFilm() => testFilms[Random().nextInt(testFilms.length)];

  static String randomAvatar() =>
      testAvatars[Random().nextInt(testAvatars.length)];

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

  static final homeFilter = "assets/images/home_filter.svg";
  static final homeMore = "assets/images/home_more.svg";

  static final shortDislikeSelected =
      "assets/images/short_dislike_selected.svg";
  static final shortDislikeUnselected =
      "assets/images/short_dislike_unselected.svg";
  static final shortLikeSelected = "assets/images/short_like_selected.svg";
  static final shortLikeUnselected = "assets/images/short_like_unselected.svg";

  static final videoLikeUnselected = "assets/images/video_like_selected.svg";
  static final videoLikeSelected = "assets/images/video_like_unselected.svg";
  static final videoComments = "assets/images/video_comments.svg";
  static final videoShare = "assets/images/video_share.svg";
}
