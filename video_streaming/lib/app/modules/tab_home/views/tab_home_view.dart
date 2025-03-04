import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/red_dot.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [subscriptionUsers(), categories()],
      ),
    );
  }
}

extension TabHomeSubsView on TabHomeView {
  subscriptionUsers() => SliverToBoxAdapter(
        child: SizedBox(
          height: 56.w + 26,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 8,
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
                            image:
                                Image.network(Assets.testAvatars[index]).image,
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
      );

  categories() => SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 10; i++)
                  Container(
                    width: 40,
                    height: 20,
                    color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  )
              ],
            ),
          ),
        ),
      );
}
