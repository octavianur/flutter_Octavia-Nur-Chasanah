# State Management Provider

# State
Data yang dapat dibaca saat pembuatan widget, dapat berubah saat widget sedang aktif, hanya dimiliki oleh StatefulWidget.

Memerlukan Global State karena memudahkan menggunakan state yang sama antar widget.

Mengubah State dengan method setState
ex:
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

# Global State

State biasa yang dapat digunakan pada seluruh widget

# Provider

1. Perlu melakukan instalasi package provider pada bagian depedencies pada pubspec.yaml

2. Membuat State Provider dengan mendefinisikan state dalam bentuk class

Ex:

class NameTextFieldNotifier with ChangeNotifier {
  String _nameValue = "";
  String get nameValue => _nameValue;

  String? messageErrorname;
  String? get _messageErrorname => messageErrorname;

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
}

3. Mendaftarkan State Provider pada main.dart 

Ex: 
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NameTextFieldNotifier()),
      ChangeNotifierProvider(create: (_) => PhoneTextFieldNotifier()),
      ChangeNotifierProvider(
          create: (context) => ButtonSubmitNotifier(context)),
    ],
    child: const MyApp(),
  ));
}

4. Menggunakan State Provider menuliskan dibawah build karena membutuhkan parameter build

Ex :
Widget build(BuildContext context) {
    final nameTextFieldProvider = Provider.of<NameTextFieldNotifier>(context);

    InputTextField(
    label: "Nama",
    hintText: "Insert Your Name",
    controllernameTextFieldProvidenameController,
    errorTextnameTextFieldProvidemessageErrorname,
    onChanged: (val) {
        nameTextFieldProvidenameOnChange(val);
        },
    ),
}