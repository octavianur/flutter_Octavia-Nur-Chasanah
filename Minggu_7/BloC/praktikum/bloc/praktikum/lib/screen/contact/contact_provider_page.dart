import 'package:assets_dialog_bottomsheet_navigation/constants/color_style.dart';
import 'package:assets_dialog_bottomsheet_navigation/constants/text_style.dart';
import 'package:assets_dialog_bottomsheet_navigation/provider/button_submit_provider.dart';
import 'package:assets_dialog_bottomsheet_navigation/provider/name_textfield_provider.dart';
import 'package:assets_dialog_bottomsheet_navigation/provider/phone_textfield_provider.dart';
import 'package:assets_dialog_bottomsheet_navigation/screen/contact/widget/headerContactScreen.dart';
import 'package:assets_dialog_bottomsheet_navigation/widget/buttonWidget.dart';
import 'package:assets_dialog_bottomsheet_navigation/widget/drawer.dart';
import 'package:assets_dialog_bottomsheet_navigation/widget/input_textfield.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ContactProviderPage extends StatelessWidget {
  const ContactProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameTextFieldProvider = Provider.of<NameTextFieldNotifier>(context);
    final phoneTextFieldProvider = Provider.of<PhoneTextFieldNotifier>(context);
    final submitButtonProvider = Provider.of<ButtonSubmitNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        centerTitle: true,
        // backgroundColor: _currentColor,
      ),
      drawer: buildDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: [
          HeaderContactPage(),
          InputTextField(
            label: "Nama",
            hintText: "Insert Your Name",
            controller: nameTextFieldProvider.nameController,
            errorText: nameTextFieldProvider.messageErrorname,
            onChanged: (val) {
              nameTextFieldProvider.nameOnChange(val);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          InputTextField(
            label: "Nomor",
            hintText: "+62..",
            keyboardType: TextInputType.number,
            controller: phoneTextFieldProvider.phoneController,
            errorText: phoneTextFieldProvider.messageErrorphone,
            onChanged: (val) {
              phoneTextFieldProvider.phoneOnChange(val);
            },
          ),
          //DatePicker
          // buildDatePicker(context),
          SizedBox(
            height: 16,
          ),
          //ColorPicker
          // buildColorPicker(context),
          SizedBox(
            height: 16,
          ),
          // FilePicker
          // buildFilePicker(),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                    title: 'Submit',
                    onPressed: () {
                      if (nameTextFieldProvider.nameValue.isNotEmpty &&
                          phoneTextFieldProvider.phoneValue.isNotEmpty) {
                        submitButtonProvider.addContact(
                          name: nameTextFieldProvider.nameValue,
                          phone: phoneTextFieldProvider.phoneValue,
                          index: -1,
                        );
                        submitButtonProvider.resetField(context);
                      } else{
                        submitButtonProvider.updateContact(
                          index: submitButtonProvider.selectedIndex,
                          name: nameTextFieldProvider.nameController.text,
                          phone: phoneTextFieldProvider.phoneController.text,

                        );
                      }
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 49,
          ),

          Text(
            "List Contacts",
            style: ThemeTextStyle()
                .headlineSmall
                .copyWith(color: ColorStyle().m3SysLightOnSufrace),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: submitButtonProvider.contactModel.length,
              itemBuilder: (context, index) {
                var data = submitButtonProvider.contactModel[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorStyle().m3SysLightPrimaryContainer,
                    child: Text(
                      data.name.substring(0, 1),
                      style: ThemeTextStyle().titleMedium.copyWith(
                          color: ColorStyle().m3SysLightOnPrimaryContainer),
                    ),
                  ),
                  title: Text(
                    data.name,
                    style: ThemeTextStyle()
                        .bodyLarge
                        .copyWith(color: ColorStyle().m3SysLightOnSufrace),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.phone,
                        style: ThemeTextStyle().bodyMedium.copyWith(
                            color: ColorStyle().m3SysLightOnSufraceVariant),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            var selectedContact =
                                submitButtonProvider.contactModel[index];
                            nameTextFieldProvider.nameController.text =
                                selectedContact.name;
                            phoneTextFieldProvider.phoneController.text =
                                selectedContact.phone;
                            submitButtonProvider.selectedIndex = index;
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                          submitButtonProvider.removeContact(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
