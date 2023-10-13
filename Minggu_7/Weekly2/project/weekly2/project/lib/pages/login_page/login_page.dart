import 'package:flutter/material.dart';
import 'package:project/constants/assets_constants.dart';
import 'package:project/constants/text_style.dart';
import 'package:project/widget/drawer_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FindFluence",
          style: ThemeTextStyle().headlineSmall,
        ),
        backgroundColor: const Color.fromARGB(255, 247, 250, 252),
        centerTitle: true,
        leading: Image.asset(Assets.assetsImagesIcon),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.menu));
          })
        ],
      ),
      endDrawer: buildDrawer(),
      body: Center(
        child: Text("Login Page"),
      ),
    );
  }
}