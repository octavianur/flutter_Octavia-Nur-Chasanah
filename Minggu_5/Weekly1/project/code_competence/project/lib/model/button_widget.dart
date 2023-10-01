import 'package:flutter/material.dart';
import 'package:project/constants/colorstyle_theme.dart';
import 'package:project/constants/textstyle_theme.dart';

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