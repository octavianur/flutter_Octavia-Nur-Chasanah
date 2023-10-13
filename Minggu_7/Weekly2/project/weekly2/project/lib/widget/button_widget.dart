import 'package:flutter/material.dart';
import 'package:project/constants/color_style.dart';
import 'package:project/constants/text_style.dart';

class buildButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  
  const buildButtonWidget({
    super.key, 
    required this.title, 
    this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorStyle().bluePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
      onPressed: onPressed, 
      child: Text(
        title,
        style: ThemeTextStyle().labelMedium.copyWith(
          color: ColorStyle().white,
        ),
      ),
    );
  }
}