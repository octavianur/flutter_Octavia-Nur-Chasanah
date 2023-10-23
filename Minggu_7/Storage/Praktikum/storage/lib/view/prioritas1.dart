import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class Prioritas1 extends StatefulWidget {
  const Prioritas1({super.key});

  @override
  State<Prioritas1> createState() => _Prioritas1State();
}

class _Prioritas1State extends State<Prioritas1> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = const Color.fromARGB(255, 100, 72, 105);


  void _pickFile() async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file){
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 203, 146, 214),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            //buildDatePicker
            buildDatePicker(context),
            SizedBox(height: 20,),
            //buidColorPicker
            buildColorPicker(context),
            //buildFilePicker
            SizedBox(height: 20,),
            buildFilePicker(),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context){
  return Column(
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
  );
}

  Widget buildColorPicker(BuildContext context){
    return Column(
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
    );
  }

  Widget buildFilePicker(){
    return Column(
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
    );
  }
}

