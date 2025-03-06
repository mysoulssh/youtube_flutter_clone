import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';
import 'package:video_streaming/app/widgets/custom_header_delegate.dart';
import 'package:video_streaming/app/widgets/video_item.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [categories(context), bodyListView()],
      ),
    );
  }
}

extension TabHomeCategoryView on TabHomeView {
  categories(BuildContext context) => SliverPersistentHeader(
        floating: true, // 下滑时立即出现
        pinned: false, // 上滑时消失
        delegate: StickyHeaderDelegate(
          minHeight: 50,
          maxHeight: 50,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              controller: controller.categoryScrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w - 4, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i <= Assets.testCategories.length; i++)
                      categoryItem(context, i)
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  categoryItem(BuildContext context, int index) {
    if (index == 0) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CustomElevateButton(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            backgroundColor: Colors.white.withValues(alpha: 0.14),
            minimumSize: Size(48, 32),
            radius: 8,
            onPressed: () {},
            child: SvgPicture.asset(Assets.homeFilter)),
      );
    }
    return Obx(
      () => Padding(
        key: controller.categoryKeys[index - 1],
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CustomElevateButton(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            backgroundColor: controller.rxcategoryIndex.value == index
                ? Colors.white
                : Colors.white.withValues(alpha: 0.14),
            minimumSize: Size(48, 32),
            radius: 8,
            onPressed: () => controller.categoryItemClicked(index - 1),
            child: Text(
              Assets.testCategories[index - 1],
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: controller.rxcategoryIndex.value == index
                        ? Colors.black
                        : Colors.white,
                  ),
            )),
      ),
    );
  }
}

extension TabHomeListView on TabHomeView {
  bodyListView() {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return VideoItem();
      },
    );
  }
}
