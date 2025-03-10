import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';

class MediaPlayer extends StatefulWidget {
  const MediaPlayer({super.key});

  @override
  State<MediaPlayer> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade700,
      child: Stack(
        children: [
          Column(
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
                      icon: SvgPicture.asset(Assets.appbarCast)),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SvgPicture.asset(Assets.videoQuality720p)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
