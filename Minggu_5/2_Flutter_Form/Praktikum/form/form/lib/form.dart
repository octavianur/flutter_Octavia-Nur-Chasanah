import 'package:flutter/material.dart';
import 'package:form/contact_model.dart';
import 'package:form/header_contact_page.dart';
import 'package:form/theme_color_style.dart';
import 'package:form/theme_text_style.dart';
import 'package:form/widget/button_widget.dart';
import 'package:form/widget/input_text_field.dart';

class WidgetForm extends StatefulWidget {
  const WidgetForm({super.key});

  @override
  State<WidgetForm> createState() => _WidgetFormState();
}

class _WidgetFormState extends State<WidgetForm> {
  String _nameValue = "";
  String _phoneValue = "";

  String? messageErrorname;
  String? messageErrorphone;

  List<ContactModel> contactModel = [];

  void nameOnChange(String value){
    if (_nameValue.isEmpty) {
      messageErrorname = "Nama Tidak boleh kosong";
    } else if(_nameValue.length < 2){
      messageErrorname = "Nama harus lebih dari 2 kata";
    }else if (_nameValue.isNotEmpty && _nameValue[0] != _nameValue[0].toUpperCase()) {
      messageErrorname = "Nama harus diawali huruf kapital";
    } else if (!_isValidName(_nameValue)) {
      messageErrorname = "Nama tidak boleh mengandung angka atau karakter khusus";
    } else{
      messageErrorname = null;
    }
    setState(() {});
  }

  bool _isValidName(String name) {
  // Use a regular expression to check if the name contains only letters and spaces
    final RegExp nameRegExp = RegExp(r"^[A-Za-z\s]+$");
    return nameRegExp.hasMatch(name);
  }

  void phoneOnChange(String value){
    if (_phoneValue.isEmpty) {
      messageErrorphone = "Phone Tidak boleh kosong";
    } else if (!_isValidPhoneNumber(_phoneValue)) {
      messageErrorphone = "Phone harus berisi hanya angka";
    } else if (_phoneValue.length < 8 || _phoneValue.length > 15) {
      messageErrorphone = "Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit";
    } else if (_phoneValue[0] != '0') {
      messageErrorphone = "Nomor telepon harus dimulai dengan angka 0";
    }else{
      messageErrorphone = null;
    }
    setState(() {});
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    // Use a regular expression to check if the phoneNumber contains only digits
    final RegExp phoneRegExp = RegExp(r"^[0-9]+$");
    return phoneRegExp.hasMatch(phoneNumber);
  }

  void addContact(){
    contactModel.add(
      ContactModel(
        name: _nameValue, 
        phone: _phoneValue
      ));
      resetField();
      setState(() {});
  }

  void removeContact(int index){
    contactModel.removeAt(index);
    setState(() {});
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int selectedIndex = -1;

  void updateContact(int index){
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

  void resetField(){
    nameController.clear();
    phoneController.clear();
     _nameValue="";
    _phoneValue="";
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
        title: Text("Contacts"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          HeaderContactPage(),
          InputTextField(
            label: "Nama", 
            hintText: "Insert Your Name",
            controller: nameController,
            errorText: messageErrorname,
            onChanged: (val){
              _nameValue = val;
              nameOnChange(_nameValue);
              setState(() {});
            }, 
          ),
          SizedBox(height: 16,),
          InputTextField(
            label: "Nomor", 
            hintText: "+62..",
            keyboardType: TextInputType.number,
            controller: phoneController,
            errorText: messageErrorphone,
             onChanged: (val){
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
                  ? (){
                    if (selectedIndex == -1) {
                      addContact();
                    }else{
                    updateContact(selectedIndex);
                    }                    
                  } : null,
                ),
              ],
            ),
          ),
          SizedBox(height: 49,),

          Text(
            "List Contacts", 
            style: ThemeTextStyle().headlineSmall.copyWith(
              color: ColorStyle().m3SysLightOnSufrace
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14,),

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
                      "A",
                      style: ThemeTextStyle().titleMedium.copyWith(
                        color: ColorStyle().m3SysLightOnPrimaryContainer
                      ),

                    ),
                  ),
                  title: Text(
                    data.name,
                    style: ThemeTextStyle().bodyLarge.copyWith(
                      color: ColorStyle().m3SysLightOnSufrace
                    ),
                  ),
                  subtitle: Text(
                    data.phone,
                    style: ThemeTextStyle().bodyMedium.copyWith(
                      color: ColorStyle().m3SysLightOnSufraceVariant
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: (){
                          nameController.text=data.name;
                          phoneController.text=data.phone;
                          selectedIndex = index;
                          setState(() {});
                        }, 
                        icon: Icon(Icons.edit)
                      ),
                      IconButton(
                        onPressed: (){
                          removeContact(index);
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

