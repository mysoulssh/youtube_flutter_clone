import 'package:flutter/material.dart';

class VideoProgress extends StatefulWidget {
  final Color progressColor;
  final Color backgroundColor;

  const VideoProgress(
      {super.key,
      this.progressColor = Colors.white24,
      this.backgroundColor = Colors.white10});

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
      backgroundColor: widget.backgroundColor,
      value: progress,
      valueColor: AlwaysStoppedAnimation(widget.progressColor),
    );
  }
}
