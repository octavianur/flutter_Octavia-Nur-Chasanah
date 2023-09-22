import 'package:advance_form/model/contact_model.dart';
import 'package:advance_form/model/theme/text_style.dart';
import 'package:advance_form/model/widget/button_widget.dart';
import 'package:advance_form/model/widget/input_text_field.dart';
import 'package:advance_form/view/prioritas2/component/header_contact_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import '../../model/theme/color_style.dart';

class AdvanceForm extends StatefulWidget {
  const AdvanceForm({super.key});

  @override
  State<AdvanceForm> createState() => _AdvanceFormState();
}

class _AdvanceFormState extends State<AdvanceForm> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = const Color.fromARGB(255, 100, 72, 105);
  Color _selectedColor = const Color.fromARGB(255, 100, 72, 105);
  String _nameFile = "";

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
        phone: _phoneValue,
        date: _dueDate,
        color: _currentColor, 
        fileName: _nameFile,
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
        color: _currentColor,
        date: currentDate, 
        fileName: _nameFile,
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

  void _pickFile() async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _nameFile = file.name;
    _openFile(file);
  }

  void _openFile(PlatformFile file){
    OpenFile.open(file.path);
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
        backgroundColor: _currentColor,
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
          //DatePicker
          buildDatePicker(context),
          SizedBox(height: 16,),
          //ColorPicker
          buildColorPicker(context),
          SizedBox(height: 16,),
          // FilePicker
          buildFilePicker(),
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
                      data.name.substring(0, 1),
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.phone,
                        style: ThemeTextStyle().bodyMedium.copyWith(
                          color: ColorStyle().m3SysLightOnSufraceVariant
                        ),
                      ),
                       Text(
                        DateFormat("EEEE, d MMMM yyyy").format(data.date),
                        style: ThemeTextStyle().bodyMedium.copyWith(
                          color: ColorStyle().m3SysLightOnSufraceVariant
                        ),
                      ),
                      Text(
                        data.fileName,
                        style: ThemeTextStyle().bodyMedium.copyWith(
                          color: ColorStyle().m3SysLightOnSufraceVariant
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        color: data.color,
                      ),
                    ],
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
  
  Widget buildDatePicker(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: ()async{
                final selectDate = await showDatePicker(
                  context: context, 
                  initialDate: currentDate, 
                  firstDate: DateTime(1945), 
                  lastDate: DateTime(currentDate.year + 10)
                );
                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              }, 
              child: Text("Select")
            )
          ],
        ),
        Text(
          DateFormat("EEEE, d MMMM yyyy").format(_dueDate), 
        ),
      ],
    ),
  );
}

  Widget buildFilePicker(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pick Files'),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: (){
                _pickFile();
              }, 
              child: Text("Pick and Open File"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColorPicker(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Color'),
          const SizedBox(height: 10,),
          Container(
            height: 100,
            width: double.infinity,
            color: _currentColor,
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(_currentColor)
              ),
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: Text("Pick Your Color"),
                      content: SingleChildScrollView(
                        child: SlidePicker(
                          pickerColor: _currentColor, 
                          onColorChanged: (color){
                            setState(() {
                              _currentColor = color;
                            });
                          }
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            print("Selected Color: $_selectedColor");
                            Navigator.pop(context);
                          }, 
                          child: Text("Save"),
                        ),
                      ],
                    );
                  }
                );
              }, 
              child: Text(
                'Pick Color',
                style: TextStyle(
                  color: Colors.white
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}