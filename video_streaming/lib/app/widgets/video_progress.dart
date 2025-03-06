import 'package:flutter/material.dart';
import 'package:video_streaming/app/utils/extensions.dart';

class VideoProgress extends StatefulWidget {
  const VideoProgress({super.key});

  @override
  State<VideoProgress> createState() => _VideoProgressState();
}

class _VideoProgressState extends State<VideoProgress> {
  double progress = 0.5;

  // 更新进度
  updateProgress(double value) {
    setState(() {
      progress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: CColors.colorffffff5,
      value: progress,
      valueColor: AlwaysStoppedAnimation(Colors.white24),
    );
  }
}
