# Flutter Form 

1. Form (menerima isian data dari pengguna, isian ini bisa lebih dari 1)

Membuat Form :
    1. Jika membuat form wajib menggunakan Statefulwidget
    2. Form disimpan menggunakan GlobalKey<FormState>();

    ex penulisan :
        var fromKEy = GlobalKey<FormState>();
        Form(
            key: formKey,
            child: //inputWidgets
        );

2. Input 

> TextField (Menerima isian dari pengguna, isian data dapat lebih dari satu)
    
Membuat textfield: 
    1. Dapat diambil menggunakan TextEditingController
    2. Isian data berupa teks.
    3. Untuk membuat nama controller lebih baik ditulis dengan belakangnya diberi controller (nameController, phoneController).

    ex. penulisan :
    var inputController = TextEditingController();

    TextField(
        controller : inputController,
    );


> Radio (Memberi opsi pada pengguna, hanya dapat memilih satu Penggunaan, opsi langsung muncul.Radio button ini biasanya untuk memilih Gender)

Membuat Radio
    1. Data diambil menggunakan property dengan tipe data sesuai dengan value

    ex penulisan :
    var radioValue = '';

    Radio<String>(
        value: 'Laki - Laki',
        grupValue: RadioValue,
        onChange: (String? value){
            setState((){});
        }
    )

> CheckBox (Memberi opsi pada pengguna, dapat memilih banyak opsi)

Membuat CheckBox:
    1. Data diambil menggunakan property bertipe bool

    ex penulisan:
    var checkValue = false;
    Checkbox(
        value: checkValue,
        onChange: (bool?value){
          setState((){});  
        }
    );

> Dropdown Button (Memberi opsi pada pengguna, hanya dapat memilih 1 opsi, opsi hanya tampil jika ditekan)

Membuat DropdownButton: 
    1.  Data diambil menggunakan property dengan tipe data sesuai value pada DropdownMenuItem

    ex penulisan:
    var dropdownValue = 0;

    DropdownButton(
        value: dropdownValue,
        onChange(int? value) {
            setState((){
                dropdownValue = value ?? 0
            });
        },
        items : const [
            DropdownMenuItem(
                value: 0,
                child: Text('Pilih...')
            ),
             DropdownMenuItem(
                value: 1,
                child: Text('satu')
            ),
             DropdownMenuItem(
                value: 0,
                child: Text('dua')
            )
        ],
    );
    
2. Button (Bersifat seperti tombol, dapat melakukan sesuatu jika ditekan)

> ElevatedButton (Tombol yang timbul, jika ditekan akan menjalankan onPressed, bisa diisi teks, gambar, icon)

    ex penulisan :
    ElevatedButton(
        child: Text("Submit"), 
        onPressed : (){
            //isi perintah
        } 
    )

> IconButton (tombol yang hanya menampilkan icon, jika ditekan akan menjakankan onPressed)

    ex penulisan :
    IconButton(
        icon: const Icon(Icons.add), //bisa diganti icon lainnya
        onPressed: (){
            //isi perintah
        }
    )

