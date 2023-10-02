import 'package:assets_dialog_bottomsheet_navigation/modal/contact_model.dart';
import 'package:assets_dialog_bottomsheet_navigation/provider/name_textfield_provider.dart';
import 'package:assets_dialog_bottomsheet_navigation/provider/phone_textfield_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonSubmitNotifier with ChangeNotifier {
  final BuildContext context;
  int selectedIndex = -1;
  List<ContactModel> contactModel = [];

  ButtonSubmitNotifier(this.context);
  List<ContactModel> get _contactModel => contactModel;

  void addContact({
    required int index,
    required String name,
    required String phone,
  }) {
    contactModel.add(ContactModel(
      name: name,
      phone: phone,
      index: index,
    ));
    notifyListeners();
  }

  void removeContact(int index) {
    contactModel.removeAt(index);
    notifyListeners();
  }

  void updateContact({
    required int index,
    required String name,
    required String phone,
  }) {
    if (name.isNotEmpty && phone.isNotEmpty) {
      contactModel[index] = ContactModel(
        name: name,
        phone: phone,
      );
      notifyListeners();
      resetField(context);
      selectedIndex = -1;
    }
  }

  void resetField(BuildContext context) {
    final nameTextFieldProvider =
        Provider.of<NameTextFieldNotifier>(context, listen: false);
    final phoneTextFieldProvider =
        Provider.of<PhoneTextFieldNotifier>(context, listen: false);
    nameTextFieldProvider.nameController.clear();
    phoneTextFieldProvider.phoneController.clear();
    nameTextFieldProvider.clearNameValue();
    phoneTextFieldProvider.clearPhoneValue();
  }
}
