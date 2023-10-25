# REST API – JSON serialization/deserialization
    Representational State Transfer Application Programming Interface

> merupakan Arsitektual yang memisahkan tampilan dengan proses bisnis. Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request

HTTP 
> Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web. 

> Pola Komunikasi
    Client mengirim request dan server akan mengolah dan membalas dengan memberi response

> Struktur Request 
    > Url : Alamat halaman yang akan diakses
    > Method (Get, Put, Delete, Post) : Aksi yang diinginkan
    > Header : Informasi tambahan terkait request yang dikirim
    > Body : Data yang disertakan bersama request

> Struktur Response 
    > Status Code : Kode yang mewakili keseluruhan response, baik sukses atau gagal
    > Header : Informasi tambahan terkait response yang dikirim
    > Body : Data yang disertakan bersama response

Dio 
> Sebagai HTTP Client dan dimanfaatkan untuk melakukan REST API

> Penggunaan :

  Future<String> postData({required Map<String, dynamic> dataContact}) async {
    try {
      final postResponse = await Dio().post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/',
        data: dataContact,
      );

      debugPrint(postResponse.data.toString());
      return postResponse.statusCode.toString();
    } catch (e) {
      throw Exception(e);
    }
  }

Serealisasi JSON (Javascript Object Notation)
> Cara penulisan data dan umumnya digunakan pada REST API

> jsonEncode digunakan untuk mengonversi objek Dart ke format JSON. Fungsi ini berada di dalam pustaka dart:convert 

    import 'dart:convert';

    Map<String, dynamic> userData = {
    'name': 'John Doe',
    'age': 30,
    'email': 'john@example.com',
    };

    String jsonData = jsonEncode(userData);

    print(jsonData);

> jsonDecode digunakan untuk mengurai (parse) string JSON menjadi objek Dart.

    import 'dart:convert';

    String jsonString = '{"name": "John", "age": 30, "email": "john@example.com"}';

    Map<String, dynamic> userData = jsonDecode(jsonString);

    print(userData['name']); // Output: John
    
# MVVM
    Model - View - ViewModel
    Digunakan untuk memisahkan logic dengan tampilan ke dalan ViewModel.

> Keuntungan 
    1. Reusability : Dapat digunakan pada banyak tampilan
    2. Maintainability : Mudah dirawat karena pekerjaan tampilan tidak tertumpuk bersama logic
    3. Testability : Pengujian menjadi terpisah antara tampilan dan logic

> Melakukan MVVM
    1. Struktur Direktori :
    > Model memiliki 2 bagian model dan api
    > setiap direktori screen berisi view dan view model

    2. Model 
    > Bentuk data yang akan digunakan dalam class 

    class ApiModel {
        int userId;
        int id;
        String title;
        String body;

        ApiModel({
            required this.userId,
            required this.id,
            required this.title,
            required this.body,
        });

        Map<String, dynamic> toJson() => {
                "userId": userId,
                "id": id,
                "title": title,
                "body": body,
            };
        }

    3. Model API

    class ContactApi {
        Future<String> postData({required Map<String, dynamic> dataContact}) async {
            try {
            final postResponse = await Dio().post(
                'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/',
                data: dataContact,
            );

            debugPrint(postResponse.data.toString());
            return postResponse.statusCode.toString();
            } catch (e) {
            throw Exception(e);
            }
        }
    }

    4. ViewModel 
    > Menyimpan data - data dan logic yang diperlukan dan dapat digunakan banyak widget
    > Mendaftarkan View Model menggunakan MultiProvider

        void main() {
            runApp(MultiProvider(providers: [
                ChangeNotifierProvider(create: (context) => DicebearViewModel()),
                ChangeNotifierProvider(create: (context) => ContactViewModel()),
                ChangeNotifierProvider(create: (context) => RequestViewmodel()),
            ], child: const MyApp()));
        }

    5. View
    > Pada View menggunakan StatefulWidget

    6. Menampilakan Data di View
    class PutRequest extends StatefulWidget {
        const PutRequest({super.key});

        @override
        State<PutRequest> createState() => _PutRequestState();
        }

        class _PutRequestState extends State<PutRequest> {
        @override
        Widget build(BuildContext context) {
            final ProviderRequest =
                Provider.of<RequestViewmodel>(context, listen: false);

            return Scaffold(
            appBar: AppBar(
                title: const Text('Put Request'),
                centerTitle: true,
            ),
            body: ListView(
                shrinkWrap: true,
                children: [
                InputTextField(
                    label: 'ID',
                    hintText: 'Input ID',
                    controller: RequestViewmodel().idController,
                ),
                const SizedBox(
                    height: 20,
                ),
                InputTextField(
                    label: 'Title',
                    hintText: 'Input Title',
                    controller: ProviderRequest.titleController,
                ),
                const SizedBox(
                    height: 20,
                ),
                InputTextField(
                    label: 'Body',
                    hintText: 'Input Body',
                    controller: ProviderRequest.bodyController,
                ),
                const SizedBox(
                    height: 20,
                ),
                InputTextField(
                    label: 'User ID',
                    hintText: 'Input User ID',
                    controller: ProviderRequest.userIdController,
                ),
                const SizedBox(
                    height: 20,
                ),
                ButtonWidget(
                    title: 'Put Data 1',
                    onPressed: () {
                    ProviderRequest.updateData();
                    },
                )
                ],
            ),
            );
        }
    }

