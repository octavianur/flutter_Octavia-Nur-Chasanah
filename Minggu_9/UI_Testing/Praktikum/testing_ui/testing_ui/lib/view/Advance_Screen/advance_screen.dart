import 'package:advance_form/model/contact_model.dart';
import 'package:advance_form/model/theme/text_style.dart';
import 'package:advance_form/model/widget/button_widget.dart';
import 'package:advance_form/model/widget/input_text_field.dart';
import 'package:flutter/material.dart';
import '../../model/theme/color_style.dart';

class AdvanceForm extends StatefulWidget {
  const AdvanceForm({super.key});

  @override
  State<AdvanceForm> createState() => _AdvanceFormState();
}

class _AdvanceFormState extends State<AdvanceForm> {
  String _nameValue = "";
  String _phoneValue = "";

  String? messageErrorname;
  String? messageErrorphone;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int selectedIndex = -1;

  List<ContactModel> contactModel = [];

  void nameOnChange(String value) {
    if (_nameValue.isEmpty) {
      messageErrorname = "Nama Tidak boleh kosong";
    } else if (_nameValue.length < 2) {
      messageErrorname = "Nama harus lebih dari 2 kata";
    } else if (_nameValue.isNotEmpty &&
        _nameValue[0] != _nameValue[0].toUpperCase()) {
      messageErrorname = "Nama harus diawali huruf kapital";
    } else if (!_isValidName(_nameValue)) {
      messageErrorname =
          "Nama tidak boleh mengandung angka atau karakter khusus";
    } else {
      messageErrorname = null;
    }
    setState(() {});
  }

  bool _isValidName(String name) {
    // Use a regular expression to check if the name contains only letters and spaces
    final RegExp nameRegExp = RegExp(r"^[A-Za-z\s]+$");
    return nameRegExp.hasMatch(name);
  }

  void phoneOnChange(String value) {
    if (_phoneValue.isEmpty) {
      messageErrorphone = "Phone Tidak boleh kosong";
    } else if (!_isValidPhoneNumber(_phoneValue)) {
      messageErrorphone = "Phone harus berisi hanya angka";
    } else if (_phoneValue.length < 8 || _phoneValue.length > 15) {
      messageErrorphone =
          "Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit";
    } else if (_phoneValue[0] != '0') {
      messageErrorphone = "Nomor telepon harus dimulai dengan angka 0";
    } else {
      messageErrorphone = null;
    }
    setState(() {});
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    // Use a regular expression to check if the phoneNumber contains only digits
    final RegExp phoneRegExp = RegExp(r"^[0-9]+$");
    return phoneRegExp.hasMatch(phoneNumber);
  }

  void addContact() {
    contactModel.add(ContactModel(
      name: _nameValue,
      phone: _phoneValue,
    ));
    resetField();
    setState(() {});
  }

  void removeContact(int index) {
    contactModel.removeAt(index);
    setState(() {});
  }

  void updateContact(int index) {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contactModel[index] = ContactModel(
        name: _nameValue,
        phone: _phoneValue,
      );
      resetField();
      selectedIndex = -1;
      setState(() {});
    }
  }

  void resetField() {
    nameController.clear();
    phoneController.clear();
    _nameValue = "";
    _phoneValue = "";
  }

  @override
  void dispose() {
    nameController.clear();
    phoneController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
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
                    style: ThemeTextStyle().bodyMedium.copyWith(
                        color: ColorStyle().m3SysLightOnSufraceVariant),
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
          ),
          InputTextField(
            label: "Nama",
            hintText: "Insert Your Name",
            controller: nameController,
            errorText: messageErrorname,
            onChanged: (val) {
              _nameValue = val;
              nameOnChange(_nameValue);
              setState(() {});
            },
          ),
          const SizedBox(
            height: 16,
          ),
          InputTextField(
            label: "Nomor",
            hintText: "+62..",
            keyboardType: TextInputType.number,
            controller: phoneController,
            errorText: messageErrorphone,
            onChanged: (val) {
              _phoneValue = val;
              phoneOnChange(_phoneValue);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: _nameValue.isNotEmpty && _phoneValue.isNotEmpty
                      ? () {
                          if (selectedIndex == -1) {
                            addContact();
                          } else {
                            updateContact(selectedIndex);
                          }
                        }
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(
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
              itemCount: contactModel.length,
              itemBuilder: (context, index) {
                var data = contactModel[index];
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
                            nameController.text = data.name;
                            phoneController.text = data.phone;
                            selectedIndex = index;
                            setState(() {});
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                          removeContact(index);
                        },
                        icon: const Icon(Icons.delete),
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
