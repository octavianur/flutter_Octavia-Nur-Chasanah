# Advance Form Flutter

Interactive Widget  (Interaksi antara aplikasi dan user, mengumpulkan input dan feedback dari user)

1. Date Picker
    > Widget dimana user bisa memasukkan tanggal (tanggal lahir, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll)

    Cara Membuat :
    1. Menggunakan fungsi bawaan flutter showDatePicker yang memiliki tipe data future
    2. Menampilkan dialog material desaign date picker

    Basic Code :
    final selectedDate = await show DatePicker(
        context: context,
        initialDate : currentDate, //real time
        firstDate : DateTime(1990), //tahun pertama 
        lastDate : DateTime(currentDate.year + 5) //tahun terakhir yang ditampilkan
    );

    Membuat Date Picker :
    > Menambahkan packages intl pada pubspec.yaml
    > Mempersiapkan variable 
        class _HomePageState extends State<HomePage> {
            DateTime _dueDate = DateTime.now();
            final currentDate = DateTime.now();
        }
    > Membangun UI
        Widget buildDatePicker(BuildContext context){
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                            const Text('Date),
                            TextButton(
                                child: const Text ('Select'),
                                onPressed: (){}
                            )
                        ]
                    )
                    Text(DataFormat('dd-MM-yyyy').format(_dueDate)),
                ]
            )
        }

    > Cara Membuat DatePicker
    onPressed: ()async{
                final selectDate = await showDatePicker(
                  context: context, 
                  initialDate: currentDate, 
                  firstDate: DateTime(1945), 
                  lastDate: DateTime(currentDate.year + 10)
                );
                <!-- Memanggil Fungsi -->
                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              }, 
2. Color Picker
    > Widget dimana user bisa memilih color, menggunakan package flutter_collorpicker

    Cara Membuat :
    1. Menambahkan packages  flutter_collorpicker
    2. Membuat variable 
        Color _currentColor = Colors.orange
    3. Membangun UI

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

              <!-- Membuat Color Picker -->

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
                )
              }
            )
          )
        ]
      )
    )
}

3. File Picker
    > Kemampuan widget untuk mengakses storage, memilih dan membuka file

    Cara Membuat :
    1. Menambahkan packages file_picker dan open_file di pubspac.yaml
    2. Membangun UI
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
            <!-- Memanggil Fungsi _pickFile -->
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

  3. Membuat File Picker
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

4. Camera
    > Kemampuan widget untuk mengakses camera, dapat berupa foto atau video

    Cara Membuat :
    1. Menambahkan packages flutter pub add camera

    
