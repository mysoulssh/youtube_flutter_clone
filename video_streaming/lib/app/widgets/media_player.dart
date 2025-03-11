import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/video_progress.dart';

class MediaPlayer extends StatefulWidget {
  const MediaPlayer({super.key});

  @override
  State<MediaPlayer> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  bool showTools = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showTools = !showTools;
        });
      },
      child: Container(
        color: Colors.grey.shade700,
        child: Stack(
          children: [
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 200),
              tween: Tween(begin: showTools ? 0 : 1, end: showTools ? 1 : 0),
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: AbsorbPointer(absorbing: !showTools, child: child),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: SvgPicture.asset(Assets.arrowLeft)),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.videoQuality720p)),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.appbarCast)),
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: pi,
                        child: IconButton(
                            onPressed: () {},
                            icon: Container(
                                width: 36,
                                height: 36,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color:
                                        Colors.white.withValues(alpha: 0.05)),
                                child: SvgPicture.asset(Assets.videoNext))),
                      ),
                      SizedBox(
                        width: 33.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SizedBox(
                            width: 54,
                            height: 54,
                            child: SvgPicture.asset(Assets.videoPlay)),
                      ),
                      SizedBox(
                        width: 33.w,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Container(
                              width: 36,
                              height: 36,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white.withValues(alpha: 0.05)),
                              child: SvgPicture.asset(Assets.videoNext)))
                    ],
                  )),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "10:12",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                )),
                        TextSpan(
                            text: " / 20:33",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                )),
                      ])),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              Assets.videoFullscreenUnselected))
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 1,
                    child: VideoProgress(
                      progressColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
