import 'package:flutter/material.dart';

class CustomInkRipple extends InkRipple {
  CustomInkRipple({
    required super.controller,
    required super.referenceBox,
    required super.position,
    required super.color,
    required super.textDirection,
    super.containedInkWell,
    super.rectCallback,
    super.borderRadius,
    super.customBorder,
    super.radius, // 自定义水波纹半径
  });
}

class CustomInkRippleFactory extends InteractiveInkFeatureFactory {
  final double rippleRadius; // 动态调整水波纹大小

  const CustomInkRippleFactory({this.rippleRadius = 20});

  @override
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Offset position,
      required Color color,
      required TextDirection textDirection,
      bool containedInkWell = false,
      RectCallback? rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    return CustomInkRipple(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      textDirection: textDirection,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius ?? rippleRadius, // 使用传入的水波纹大小
    );
  }
}
