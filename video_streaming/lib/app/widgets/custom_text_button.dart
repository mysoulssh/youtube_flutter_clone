import 'package:flutter/material.dart';

class CustomTextButton extends TextButton {
  CustomTextButton({
    super.key,
    required super.onPressed,
    required super.child,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    ButtonStyle? style,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
  }) : super(
            style: style ??
                TextButton.styleFrom(
                  padding: padding,
                  minimumSize: minimumSize,
                ));
}
