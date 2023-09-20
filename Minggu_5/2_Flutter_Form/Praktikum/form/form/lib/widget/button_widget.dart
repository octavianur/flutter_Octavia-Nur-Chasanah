import 'package:flutter/material.dart';
import 'package:form/theme_color_style.dart';
import 'package:form/theme_text_style.dart';

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