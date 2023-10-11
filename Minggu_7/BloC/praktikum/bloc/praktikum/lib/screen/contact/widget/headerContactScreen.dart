import 'package:assets_dialog_bottomsheet_navigation/constants/color_style.dart';
import 'package:assets_dialog_bottomsheet_navigation/constants/text_style.dart';
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
              color: ColorStyle().m3SysLightSecondary,
            ),
          ),
          Text(
            "Create New Contacts",
            style: ThemeTextStyle().headlineMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ",
              style: ThemeTextStyle()
                  .bodyMedium
                  .copyWith(color: ColorStyle().m3SysLightOnSufraceVariant),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              thickness: 1,
              color: ColorStyle().m3SysLightOutlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}
