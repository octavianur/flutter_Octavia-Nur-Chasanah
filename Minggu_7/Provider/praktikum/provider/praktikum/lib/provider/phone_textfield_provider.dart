import 'package:flutter/material.dart';

class PhoneTextFieldNotifier with ChangeNotifier {
  String _phoneValue = "";
  String get phoneValue => _phoneValue;

  String? messageErrorphone;
  String? get _messageErrorphone => messageErrorphone;

  TextEditingController phoneController = TextEditingController();
  TextEditingController get _phoneController => phoneController;

  void phoneOnChange(String value) {
    _phoneValue = value;
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
    notifyListeners();
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    // Use a regular expression to check if the phoneNumber contains only digits
    final RegExp phoneRegExp = RegExp(r"^[0-9]+$");
    return phoneRegExp.hasMatch(phoneNumber);
  }

  void clearPhoneValue() {
    _phoneValue = "";
    notifyListeners();
  }
}
