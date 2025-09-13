// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';


class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.loading,
    required this.onPressed,
    required this.title,
    this.textColor = AppColor.kColorPrimary,
    this.buttonColor = AppColor.kColorAccent,
    this.buttonWidth = 60,
    this.buttonHeight = 50,
  });

  final bool loading;
  final VoidCallback onPressed;
  final String title;
  final Color textColor, buttonColor;
  final double buttonWidth;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white))),
      ),
    );
  }
}
