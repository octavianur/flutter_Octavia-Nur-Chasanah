import 'package:advance_form/constants/assets_constants.dart';
import 'package:advance_form/view/contactPage/contact_page.dart';
import 'package:advance_form/view/loginPage/login_page.dart';
import 'package:advance_form/view/utils/shared_preference.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void loginCheck() async {
    String User = await SharedPref().getToken();

    print(User);

    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        if (User.isNotEmpty) {
          // homePage
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AdvanceForm(),
              ),
              (route) => false);
        } else {
          // login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false);
        }
      },
    );
  }

  @override
  void initState() {
    loginCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.assetsImagesSplash,
          width: 200,
        ),
      ),
    );
  }
}
