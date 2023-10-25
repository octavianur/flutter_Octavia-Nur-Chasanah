import 'package:flutter/material.dart';
import 'package:rest_api/model/contact_model.dart';
import 'package:rest_api/model/api/contact_api.dart';

class ContactViewModel extends ChangeNotifier {
  String _name = '';
  String get name => _name;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  ContactModel _data2 = ContactModel(id: 0, name: '', phone: '');
  ContactModel get data2 => _data2;

  Future<void> postData() async {
    final postResponse = await ContactApi().postData(
        dataContact:
            ContactModel(name: nameController.text, phone: phoneController.text)
                .toJson());
    notifyListeners();
  }

  Future<void> getContact() async {
    final getResponse = await ContactApi().getContact();

    _data2 = ContactModel.fromJson(getResponse);
    notifyListeners();
  }
}
