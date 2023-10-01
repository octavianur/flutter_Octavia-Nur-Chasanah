import 'package:flutter/material.dart';
import 'package:project/constants/assets_constants.dart';
import 'package:project/constants/textstyle_theme.dart';
import 'package:project/model/button_widget.dart';
import 'package:project/model/form_model.dart';
import 'package:project/model/input_text_field_widget.dart';
import 'package:project/pages/home/components/headerComponents.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FormModel> formModel = [];

  String _firstNameValue = "";
  String _lastNameValue = "";
  String _emailValue = "";
  String _messageValue = "";
  String _fullName = "";

  String? messageErrorfirstname;
  String? messageErroremail;

  void firstnameOnChange(String value) {
    _firstNameValue = value;
    if (_firstNameValue.isEmpty) {
      messageErrorfirstname = "Nama harus diisi";
    } else if (_firstNameValue.length < 2) {
      messageErrorfirstname = "Nama harus lebih dari 2";
    } else {
      messageErrorfirstname = null;
    }
    _updateFullName();
    setState(() {});
  }

  void emailOnChange(String value) {
    if (_emailValue.isEmpty) {
      messageErroremail = "Email harus diisi";
    } else if (!isEmailValid(value)) {
      messageErroremail = "Email tidak valid";
    } else {
      messageErroremail = null;
    }
    setState(() {});
  }

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  void _updateFullName() {
    _fullName = _firstNameValue +
        (_lastNameValue.isNotEmpty ? " " + _lastNameValue : "");
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Form Submission"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Name: $_fullName"),
              Text("Email: $_emailValue"),
              Text("Message: $_messageValue"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

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
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const headerComponents(),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Text(
                      "Contact Us",
                      style: ThemeTextStyle().headlineMedium,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Need to get in touch with us? Either fill out the form with your inquiry or find the departement email you'd like to contact below.",
                      style: ThemeTextStyle().bodyMedium,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                            label: "First name*",
                            errorText: messageErrorfirstname,
                            onChanged: (value) {
                              _firstNameValue = value;
                              firstnameOnChange(_firstNameValue);
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: InputTextField(
                            label: "Last Name",
                            onChanged: (value) {
                              _lastNameValue = value;
                              _updateFullName();
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextField(
                      label: "Email*",
                      keyboardType: TextInputType.emailAddress,
                      errorText: messageErroremail,
                      onChanged: (value) {
                        _emailValue = value;
                        emailOnChange(_emailValue);
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextField(
                      label: "What can we help you with?",
                      maxLines: 6,
                      onChanged: (value) {
                        _messageValue = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: buildButtonWidget(
                        title: "Submit",
                        onPressed:
                            _firstNameValue.isNotEmpty && _emailValue.isNotEmpty
                                ? () {
                                    _showAlertDialog(context);
                                  }
                                : null,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
