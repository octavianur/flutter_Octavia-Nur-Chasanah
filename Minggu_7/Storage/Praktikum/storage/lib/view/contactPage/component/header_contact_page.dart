import 'package:advance_form/theme/color_style.dart';
import 'package:advance_form/theme/text_style.dart';
import 'package:flutter/material.dart';



class HeaderContactPage extends StatelessWidget {
  const HeaderContactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Icon(
              Icons.phone_iphone_outlined,
              color: ColorStyle().darkgrey,
              ),
          ),
          Text(
            "Create New Contacts",
            style: ThemeTextStyle().headlineMedium,
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ",
              style: ThemeTextStyle().bodyMedium
            ),
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              thickness: 1,
              color: ColorStyle().darkgrey,
            ),
          ),
        ],
      ),
    );
  }
}