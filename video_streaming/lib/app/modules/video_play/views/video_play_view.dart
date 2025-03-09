import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/utils/extensions.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';
import 'package:video_streaming/app/widgets/media_player.dart';
import 'package:video_streaming/app/widgets/video_item.dart';
import 'package:video_streaming/generated/locales.g.dart';

import '../controllers/video_play_controller.dart';

class VideoPlayView extends GetView<VideoPlayController> {
  const VideoPlayView({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("landscape = ${MediaQuery.of(context).orientation == Orientation.landscape}");

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Obx(() {
                  if (controller.rxorientation.value == Orientation.landscape) {
                    return Container();
                  }
                  return AspectRatio(
                    aspectRatio: 390 / 209,
                    child: Container(),
                  );
                }),
                Expanded(
                  child: Obx(() => Opacity(
                        opacity: controller.rxorientation.value == Orientation.landscape ? 0.0 : 1.0,
                        child: videoPlayInfoView(context),
                      )),
                )
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: videoMediaPlayView(),
            )
          ],
        ),
      ),
    );
  }
}

extension VideoMediaPlayView on VideoPlayView {
  videoMediaPlayView() => AspectRatio(
        aspectRatio: 390 / 209,
        child: MediaPlayer(),
      );
}

extension VideoPlayInfoView on VideoPlayView {
  videoPlayInfoView(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    faker.conference.name(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      faker.conference.name(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white30,
                        size: 24,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${faker.randomGenerator.numbers(999, 1).first}K",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white30,
                        size: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        DateFormat.yMMMd().format(faker.date.dateTime(minYear: 2024, maxYear: 2025)),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          radius: 15,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: CachedNetworkImageProvider(Assets.randomAvatar()), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          faker.person.name(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.verified,
                            color: Colors.white70,
                            size: 16,
                          ),
                        ),
                        Spacer(),
                        CustomElevateButton(
                            backgroundColor: CColors.colorff325b,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            minimumSize: Size(40, 32),
                            onPressed: () {},
                            child: Text(
                              LocaleKeys.subscribe,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            CustomElevateButton(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                                minimumSize: Size(40, 40),
                                backgroundColor: Colors.white.withValues(alpha: 0.01),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.videoLikeUnselected),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${faker.randomGenerator.numbers(99, 1).first}K",
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                              child: Container(
                                width: 1,
                                height: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                            CustomElevateButton(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                                minimumSize: Size(40, 40),
                                backgroundColor: Colors.white.withValues(alpha: 0.01),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.shortDislikeUnselected),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${faker.randomGenerator.numbers(99, 1).first}K",
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 40,
                        child: CustomElevateButton(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                            minimumSize: Size(40, 40),
                            backgroundColor: Colors.white.withValues(alpha: 0.1),
                            onPressed: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.videoComments),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${faker.randomGenerator.numbers(99, 1).first}K",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 40,
                        child: CustomElevateButton(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                            minimumSize: Size(40, 40),
                            backgroundColor: Colors.white.withValues(alpha: 0.1),
                            onPressed: () {},
                            child: SvgPicture.asset(Assets.videoShare)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Up Next:",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                  )
                ],
              ),
            );
          }
          return VideoItem();
        },
      );
}
