import 'package:advance_form/constants/assets_constants.dart';
import 'package:advance_form/view/contactPage/contact_page.dart';
import 'package:advance_form/view/utils/shared_preference.dart';
import 'package:advance_form/widget/input_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            Assets.assetsImagesWelcome,
            height: 300,
          ),
          const SizedBox(
            height: 30,
          ),
          InputTextField(
            label: "Username",
            hintText: "Username",
            controller: _usernameController,
          ),
          const SizedBox(
            height: 30,
          ),
          const InputTextField(
            label: "Password",
            hintText: "Password",
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdvanceForm(),
                  ),
                );
                await SharedPref().saveToken(
                  _usernameController.text,
                );
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
