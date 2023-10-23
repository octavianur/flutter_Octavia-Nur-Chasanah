import 'package:advance_form/model/contact_model.dart';
import 'package:advance_form/provider/contact_provider.dart';
import 'package:advance_form/theme/color_style.dart';
import 'package:advance_form/theme/text_style.dart';
import 'package:advance_form/view/contactPage/component/header_contact_page.dart';
import 'package:advance_form/widget/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvanceForm extends StatefulWidget {
  const AdvanceForm({super.key});

  @override
  State<AdvanceForm> createState() => _AdvanceFormState();
}

class _AdvanceFormState extends State<AdvanceForm> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');

  late SharedPreferences loginData;
  String? username;
  int currentContactLength = 0;

  @override
  void initState() {
    getUsername();
    getContactLength();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  void getUsername() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username');
    });
  }

  void getContactLength() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      currentContactLength = loginData.getInt('contactLength')! + 1;
    });
  }

  String _nameValue = "";
  String _phoneValue = "";

  String? messageErrorname;
  String? messageErrorphone;

  int selectedIndex = -1;

  void resetField() {
    nameController.clear();
    phoneController.clear();
    _nameValue = "";
    _phoneValue = "";
  }

  void phoneFieldValidator(String value) {
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

  void nameFieldValidator(String value) {
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

  void updateField(int index) {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      ContactModel(
        name: _nameValue,
        phone: _phoneValue,
      );
      resetField();
      selectedIndex = -1;
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    final dbManagerProvider =
        Provider.of<ContactProvider>(context, listen: false);

    final contactProviderNotListening =
        Provider.of<ContactProvider>(context, listen: false);
    final contactProviderListening = Provider.of<ContactProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              loginData = await SharedPreferences.getInstance();
              loginData.setBool('isLoggedIn', false);
              loginData.remove('username');
              loginData.setInt('contactLength', 0);

              if (mounted) {
                dbManagerProvider.deleteAllContact();
                Navigator.pushReplacementNamed(context, '/');
              }
            }),
        title: const Text('Contacts'),
        centerTitle: true,
        backgroundColor: ColorStyle().bluePrimary,
      ),
      body: ListView(
        children: [
          HeaderContactPage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Consumer<ContactProvider>(
                    builder: (context, contactProvider, child) => Column(
                      children: [
                        // TextField
                        InputTextField(
                          label: 'Name',
                          hintText: 'Insert Your Name',
                          errorText: contactProvider.nameErrorMessage,
                          controller: nameController,
                          onChanged: (value) {
                            nameFieldValidator(value);
                          },
                        ),
                        const SizedBox(height: 16),
                        InputTextField(
                            keyboardType: TextInputType.number,
                            label: 'Phone',
                            hintText: '+62 ...',
                            errorText: contactProvider.phoneErrorMessage,
                            controller: phoneController,
                            onChanged: (value) {
                              phoneFieldValidator(value);
                            }),
                        // End of TextField
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 14, right: 20),
                child: ElevatedButton(
                    onPressed: contactProviderListening.nameErrorMessage ==
                                'success' &&
                            contactProviderListening.phoneErrorMessage ==
                                'success' &&
                            nameController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty
                        ? contactProviderListening.selectedIndex == -1
                            ? () async {
                                loginData =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  loginData.setInt(
                                      'contactLength', currentContactLength++);
                                });
                                if (mounted) {
                                  dbManagerProvider.addContact(ContactModel(
                                      id: currentContactLength,
                                      name: nameController.text,
                                      phone: phoneController.text));
                                  nameController.clear();
                                  phoneController.clear();
                                  resetField();
                                }
                              }
                            : () {
                                dbManagerProvider.updateContact(
                                    ContactModel(
                                        id: contactProviderNotListening
                                            .selectedIndex,
                                        name: nameController.text,
                                        phone: phoneController.text),
                                    contactProviderNotListening.selectedIndex);
                                nameController.clear();
                                phoneController.clear();
                                resetField();
                              }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle().secondary,
                      disabledForegroundColor:
                          ColorStyle().white.withOpacity(0.42),
                      disabledBackgroundColor:
                          ColorStyle().darkgrey.withOpacity(0.20),
                    ),
                    child: Text(
                      contactProviderListening.selectedIndex == -1
                          ? 'Submit'
                          : 'Update',
                      style: ThemeTextStyle().labelLarge,
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            'List Contacts',
            textAlign: TextAlign.center,
            style: ThemeTextStyle().headlineSmall,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            color: ColorStyle().white,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Consumer<ContactProvider>(
              builder: (context, value, child) => ListView.builder(
                  itemCount: value.contactModels.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = value.contactModels[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(data.name![0]),
                      ),
                      title: Text(data.name ?? "-"),
                      subtitle: Text(data.phone ?? "-"),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                            onPressed: () {
                              updateField(data.id ?? 0);
                              nameController.text = data.name ?? "-";
                              phoneController.text = data.phone ?? "-";
                              // debugPrint(selectedIndex.toString());
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              ContactProvider().deleteContact(data.id ?? 0);
                            },
                            icon: const Icon(Icons.delete)),
                      ]),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }


}
