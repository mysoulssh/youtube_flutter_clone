import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';
import 'package:video_streaming/app/widgets/red_dot.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [subscriptionUsers(), categories(context)],
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
                          image: DecorationImage(image: Image.network(Assets.testAvatars[index]).image, fit: BoxFit.cover),
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

  categories(BuildContext context) => SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [for (int i = 0; i <= Assets.testCategories.length; i++) categoryItem(context, i)],
            ),
          ),
        ),
      );

  categoryItem(BuildContext context, int index) {
    if (index == 0) {
      return Padding(
        padding: EdgeInsets.only(right: 8),
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
        padding: EdgeInsets.only(right: 8),
        child: CustomElevateButton(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            backgroundColor: controller.rxcategoryIndex.value == index ? Colors.white : Colors.white.withValues(alpha: 0.14),
            minimumSize: Size(48, 32),
            radius: 8,
            onPressed: () {
              controller.rxcategoryIndex.value = index;
            },
            child: Text(
              Assets.testCategories[index - 1],
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: controller.rxcategoryIndex.value == index ? Colors.black : Colors.white,
                  ),
            )),
      ),
    );
  }
}
