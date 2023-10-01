import 'package:assets_dialog_bottomsheet_navigation/constants/color_style.dart';
import 'package:assets_dialog_bottomsheet_navigation/constants/text_style.dart';
import 'package:flutter/material.dart';

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
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorStyle().m3SysLightPrimary
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: ThemeTextStyle().labelLarge.copyWith(
          color: ColorStyle().m3SysLightOnPrimary
        ),
      ),
    );
  }
}