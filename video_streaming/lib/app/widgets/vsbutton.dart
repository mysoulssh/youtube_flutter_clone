import 'package:flutter/material.dart';

class VSButtonConfig {
  // 常规情况按钮样式
  Widget? normalWidget;
  // 选中情况按钮样式
  Widget? selectedWidget;

  // 默认文本
  String? normalText;
  // 选中文本
  String? selectedText;

  // 默认背景颜色
  Color? normalTextColor;
  // 选中背景颜色
  Color? selectedTextColor;

  // 默认图片
  ImageProvider? normalImageProvider;
  // 选中图片
  ImageProvider? selectedImageProvider;
  // 图片布局方式
  Alignment? imageAlignment;

  // 默认背景颜色
  Color? normalBackgroundColor;
  // 选中背景颜色
  Color? selectedBackgroundColor;

  // 边框宽度
  double? borderWidth;
  // 边框颜色
  Color? borderColor;
}

class VSButton extends StatefulWidget {
  final VSButtonConfig config;

  const VSButton({super.key, required this.config});

  @override
  State<VSButton> createState() => _VSButtonState();
}

class _VSButtonState extends State<VSButton> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {}, child: Text("TEXT BUTTON")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {},
            child: Text("Elevated Button")),
        SizedBox(
          height: 10,
        ),
        OutlinedButton(onPressed: () {}, child: Text("Outlined Button"))
      ],
    );
  }
}
