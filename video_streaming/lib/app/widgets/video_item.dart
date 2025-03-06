import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_streaming/app/routes/app_pages.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';

import 'package:faker/faker.dart' as fk;
import 'dart:ui' as ui;

class VideoItem extends StatelessWidget {
  const VideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.VIDEO_PLAY);
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 375 / 209,
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(Assets.randomFilm()),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    "12:09",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
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
                                  text: DateFormat.yMMMd().format(fk.faker.date
                                      .dateTime(minYear: 2024, maxYear: 2025)))
                            ]))
                      ],
                    ),
                  ),
                  CustomElevateButton(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(30, 30),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      onPressed: () {},
                      child: SvgPicture.asset(Assets.homeMore))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
