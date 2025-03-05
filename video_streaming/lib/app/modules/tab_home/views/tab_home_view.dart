import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';
import 'package:video_streaming/app/widgets/red_dot.dart';

import '../controllers/tab_home_controller.dart';

import 'dart:ui' as ui;

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [subscriptionUsers(), categories(context), bodyListView()],
      ),
    );
  }
}

extension TabHomeSubsView on TabHomeView {
  subscriptionUsers() => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 12),
          child: SizedBox(
            height: 56.w + 26,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 14.w,
                crossAxisSpacing: 0,
                childAspectRatio: (56.w + 26) / 56.w,
              ),
              itemCount: Assets.testAvatars.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.w,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.network(Assets.testAvatars[index])
                                  .image,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(56.w / 2)),
                      child: RedDot(),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: 56.w,
                      height: 20,
                      child: Text(
                        fk.faker.person.name(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      );
}

extension TabHomeCategoryView on TabHomeView {
  categories(BuildContext context) => SliverPersistentHeader(
        floating: true, // 下滑时立即出现
        pinned: false, // 上滑时消失
        delegate: _StickyHeaderDelegate(
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
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 375 / 209,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                CachedNetworkImageProvider(Assets.randomFilm()),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        radius: 15,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    Assets.randomAvatar()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fk.faker.conference.name(),
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text.rich(TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: Colors.white70),
                                children: [
                                  TextSpan(text: fk.faker.person.name()),
                                  WidgetSpan(
                                      alignment: ui.PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Icon(
                                          Icons.verified,
                                          size: 11,
                                          color: Colors.white70,
                                        ),
                                      )),
                                  TextSpan(
                                      text:
                                          "· ${fk.faker.randomGenerator.numbers(999, 1).first}K views · "),
                                  TextSpan(
                                      text: DateFormat.yMMMd().format(
                                          fk.faker.date.dateTime(
                                              minYear: 2024, maxYear: 2025)))
                                ]))
                          ],
                        ),
                      ),
                      CustomElevateButton(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30, 30),
                          backgroundColor: Colors.transparent,
                          onPressed: () {},
                          child: SvgPicture.asset(Assets.homeMore))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// 自定义 SliverPersistentHeaderDelegate
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
