import 'package:flutter/material.dart';

class CustomElevateButton extends ElevatedButton {
  CustomElevateButton({
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
    ButtonStyle? style,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Color? backgroundColor,
    double? radius,
  }) : super(
            style: style ??
                TextButton.styleFrom(
                  padding: padding,
                  minimumSize: minimumSize,
                  backgroundColor: backgroundColor,
                  shape: radius != null
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius),
                        )
                      : null,
                ));
}
