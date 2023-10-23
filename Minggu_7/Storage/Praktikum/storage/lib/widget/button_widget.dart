import 'package:advance_form/theme/color_style.dart';
import 'package:flutter/material.dart';
import '../theme/text_style.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(backgroundColor: ColorStyle().bluePrimary),
      onPressed: onPressed,
      child: Text(
        title,
        style:
            ThemeTextStyle().labelLarge.copyWith(color: ColorStyle().black),
      ),
    );
  }
}
