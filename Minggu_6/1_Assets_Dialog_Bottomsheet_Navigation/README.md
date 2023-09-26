# Assets Dialog BottomSheet Navigation

# Assets

ASSETS

File yang di bundle dan di deploy bersamaan dengan aplikasi, tipe - assets data (JSON files), icons, images, dan font file

Menulisakan assets pada pubspec.yaml 
ex: 
assets:
assets/image/ (/ untuk memasukkan semua assets dibawah folder image)

IMAGE

Flutter mendukung format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, PNG,BMP dan WBMP. 

Loading Image 
> menggunakan Widget Image, membutuhkan property image dengan nilai class AssetImage()

ex: 
Image(
    image: AssetImage('assets/image/background.png')
)

> Menggunakan method Image.asset, mendapatkan image yang sudah ditambahkan dalam project

ex: 
Image.asset('assets/image/background.png')

> Menggunakan method Image.network, mendapatkan data image melalui internet dengan menggunakan string url

ex:
Image.network('https.....')

FONT

Penerapan font menggunakan custom font atau dari package

> Custom font dengan cara mendownload font dari google fonts lalu inport file .ttf dan daftarkan pada pubpec.yaml lalu atur font menjadi default pada theme di main.dart

> Font dari Packages dengan cara install google_fonts lalu panggil GoogleFonts.namaFont()


# Dialog dan BotttomSheet

> AlertDialog
    1. Untuk tampilan sndoid dari material design
    2. Menginformasikan pengguna tentnag situasi tertentu
    3. Untuk mendapatkan input dari user
    4. Membutuhkan helper method showDialog

    Cara Pembuatan:
    Return AlertDialog(
        title: //untuk judul dari dialog
        content: //isi dari dialog seperti body
        actions: [//button untuk eksekusi],
    );

> BottomSheet
    1. Seperti dialog tetapi munculnya dari bawah
    2. Menggunakna fungsi bawaan flutter showModalBottomSheet
    3. Membutuhkan 2 properti yaitu context dan builder

    Cara Pembuatan:
    showBottomSheet(
        context: context, 
        builder: (BuildContext context){
            return ..(

            );
        }
    )

# Flutter Navigation

> Navigation Dasar 
Perpindahan halaman menggunakan Navigation.push()

Kembali ke halaman menggunakan Navigation.pop()

> Navigation dengan Named Route
Perpindahan halaman menggunakan Navigation.pushNamed()

Kembali ke halaman menggunakan Navigation.pop()

> Navigation routes bisa didaftarkan pada class. 

Ex:
1. membuat route pada class
class RoutesNavigation{
    static const String spashScreen = '/'
    ....
}

2. memanggil di routes di main :

routes: {
    RoutesNavigation.homeScreen: (_)=> const SpashScreen(),
    .....
}

3. memanggil routes di halaman :
onPressed: (){
    Navigator.pushNamed(
        context,
        RoutesNavigation.homeScreen
    );
},

> Memberikan sebuah nilai dari halaman A ke halaman B atau sebaliknya:

Argument tipe object jadi bisa mengirim data apapun. 

> Mengirim halaman SpashScreen ke halaman contactScreen
onPressed: (){
    Navigator.pushNamed(
        context,
        RoutesNavigation.contactScreen,
        arguments: 'Raka', //bisa berbentuk apasaja karena type Object //Arguments hanya bisa masuk 1 nilai
    );
},

PADA CONTACTSCREEN

//ditulis dibawah 
    Widget build(buildContext context){  //karena membutuhkan context
        final parameter = ModalRoute.of(context)!.settings.arguments as String;
        
        return Scaffold(
        ....
        
        body: Center(
            child: Text(
                parameter
            ),
        ),
    );
}


> ARGUMENTS WITH LIST
onPressed: (){
    Navigator.pushNamed(
        context,
        RoutesNavigation.homeScreen,arguments: [0,false,true, 'aa']
    );
},


MEMANGGIL :

    build(buildContext context){  //karena membutuhkan context
        final parameter = ModalRoute.of(context)!.settings.arguments as List;

        return Scaffold(
        ....

        body: Center(
            child: Text(
            parameter[0].toString(),
            ),
        ),
    );
}


> ARGUMENTS WITH MAP
OnPressed:(){
    Navigator.pushNamed(
        context,
        RoutesNavigation.homeScreen,
        arguments: {
            'nama': 'Raka',
            'umur': 10,
            'gender': 'laki - laki'
        }
    );
},


MEMANGGIL :

    build(buildContext context){  //karena membutuhkan context
        final parameter = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

        return Scaffold(
        ....

        body: Center(
            child: Text(
            parameter["nama"],
            ),
        ),
    );
}

> Membuat Class untuk menampung nilai yang dapat dipanggil di Arguments

class ContactArguments {
final String nama;
final List<String> data;
final bool isMentor;
final Widget textWidget

ContactArguments({
required this.nama,
required this.data,
required this.isMentor,
required this.textWidget,
}),
}

PANGGIL DI SPLASHSCREEN: 
OnPressed: (){
    Navigator.pushNamed(
        context,
        RoutesNavigation.homeScreen,
        arguments: ContactArguments(
        nama: 'Raka',
        data : [
        Mentor,
        Mentee,
        ],
        isMentor: true,
        textWidget : 'Raka Fajar'
        ),
    );
},

MEMANGGIL :

    build(buildContext context){  //karena membutuhkan context
        final parameter = ModalRoute.of(context)!.settings.arguments as ContactArguments;

        return Scaffold(
        ....

        body: Center(
            child: Column(
            children: [
                Text(
                    contactArguments.name
                ),
                Text(
                    contactArguments.data
                ),
                Text(
                    contactArguments.isMentor
                ),
                Text(
                    contactArguments.textWidget
                ),
            ],
        ),
    ));
}
