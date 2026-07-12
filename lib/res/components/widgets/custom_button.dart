import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final double borderRadius;
  final TextStyle? textStyle;
  final bool isDisabled;
  final Widget? icon;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.color,
    this.borderRadius = 12,
    this.textStyle,
    this.isDisabled = false,
    this.icon,
    this.iconPosition = IconPosition.left,
  }) : assert(
         text != null || icon != null,
         'At least one of text or icon must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: isDisabled ? AppColor.grey400 : (color ?? AppColor.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: _buildChild(),
        ),
    );
  }

  Widget _buildChild() {
    // Icon only — no text
    if (text == null && icon != null) {
      return icon!;
    }

    // Text only — no icon
    if (icon == null) {
      return Text(
        text!,
        style:
            textStyle ??
            const TextStyle(
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      );
    }

    // Both icon and text
    final textWidget = Text(
      text!,
      style:
          textStyle ??
          const TextStyle(
            color: AppColor.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children:
          iconPosition == IconPosition.left
              ? [icon!, const SizedBox(width: 8), textWidget]
              : [textWidget, const SizedBox(width: 8), icon!],
    );
  }
}

enum IconPosition { left, right }
