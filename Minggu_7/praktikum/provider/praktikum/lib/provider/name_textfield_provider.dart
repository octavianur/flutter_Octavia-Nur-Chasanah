import 'package:flutter/widgets.dart';

class NameTextFieldNotifier with ChangeNotifier {
  String _nameValue = "";
  String get nameValue => _nameValue;

  String? messageErrorname;
  String? get _messageErrorname => messageErrorname;

  TextEditingController nameController = TextEditingController();
  TextEditingController get _nameController => nameController;

  void nameOnChange(String value) {
    _nameValue = value;
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
    notifyListeners();
  }

  bool _isValidName(String name) {
    // Use a regular expression to check if the name contains only letters and spaces
    final RegExp nameRegExp = RegExp(r"^[A-Za-z\s]+$");
    return nameRegExp.hasMatch(name);
  }

  void clearNameValue() {
    _nameValue = "";
    notifyListeners();
  }
}
