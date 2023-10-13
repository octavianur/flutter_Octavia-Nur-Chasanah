import 'package:flutter/material.dart';
import 'package:project/constants/assets_constants.dart';
import 'package:project/constants/text_style.dart';

class headerComponents extends StatelessWidget {
  const headerComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Image.asset(
            Assets.assetsImagesWelcome,
            width: 350,
          ),
        ),
        Text(
          "Mulai Kolaborasi yang Luar Biasa Bersama Influencer Favorit Anda",
          style: ThemeTextStyle().headlineMedium,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Kami mengerti betapa pentingnya kerjasama dengan influencer yang tepat untuk pertumbuhan bisnis Anda, dan itulah sebabnya kami hadir di sini.",
          style: ThemeTextStyle().bodyMedium,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
