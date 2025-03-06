import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';
import 'package:video_streaming/app/widgets/video_progress.dart';
import 'package:video_streaming/generated/locales.g.dart';

import 'package:video_streaming/app/utils/extensions.dart';

import '../controllers/tab_shorts_controller.dart';

class TabShortsView extends GetView<TabShortsController> {
  const TabShortsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(Assets.randomFilm()))),
            child: Stack(
              children: [infoView(context), actionsView(), progressView()],
            ),
          );
        },
      ),
    );
  }
}

extension TabShortsInfoView on TabShortsView {
  infoView(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CustomElevateButton(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.grey,
                      minimumSize: Size(40, 40),
                      onPressed: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    Assets.randomAvatar()),
                                fit: BoxFit.cover)),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faker.person.name(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          DateFormat.MMMd().format(faker.date
                              .dateTime(minYear: 2024, maxYear: 2025)),
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  CustomElevateButton(
                      backgroundColor: CColors.colorff325b,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      minimumSize: Size(40, 32),
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.subscribe,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Text(
                  faker.conference.name(),
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      );
}

extension TabShortsActionView on TabShortsView {
  actionsView() => Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            actionItem(Assets.shortLikeUnselected,
                selected: Assets.shortLikeSelected),
            actionItem(Assets.shortDislikeUnselected,
                selected: Assets.shortDislikeSelected),
            actionItem(Assets.videoComments),
            actionItem(Assets.videoShare),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      );

  actionItem(String unselected, {String? selected}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: CustomElevateButton(
            backgroundColor: CColors.colorffffff5,
            radius: 28,
            padding: EdgeInsets.all(5),
            minimumSize: Size(40, 40),
            onPressed: () {},
            child: SvgPicture.asset(unselected)),
      );
}

extension TabShortsProgressView on TabShortsView {
  progressView() => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: 1,
          child: VideoProgress(),
        ),
      );
}
