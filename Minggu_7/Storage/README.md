# Storage

Diperlukan untuk efisiensi penggunaan data internet,
Cara implementasi penyimpanann lokal seperti :
- Shared Preferences
- Local Database

1. Shared Preference
    menyimpan data sederhana,
    Penyimpanan dengan format key-value,
    Menyimpan tipe data dasar seperti teks, angka, dan boolean, 
    Biasanya digunakan untuk fitur login dan hanya digunakan menyimpan token saja. 

    Contoh Penggunaan :

    1. Membuat text editing controller :
    final _usernameController = TextEditingController();

    2. Membuat method dispose untuk menghindari kebocoran: 
    @override
    void dispose() {
        _usernameController.dispose();
        super.dispose();
    }

    3. Membuat variabel menyimpan SharedPrefence:
    late SharedPreference logindata;
    late bool newUSer;

    const String Token = "token";
    
    class SharedPref {
        Future<void> saveToken(String tokenValue) async {
            SharedPreferences sharedPref = await SharedPreferences.getInstance();
            sharedPref.setString(Token, tokenValue);
        }

        Future<void> removeToken() async {
            SharedPreferences sharedPref = await SharedPreferences.getInstance();
            await sharedPref.remove(Token);
        }

        Future<String> getToken() async {
            SharedPreferences sharedPref = await SharedPreferences.getInstance();

            return sharedPref.getString(Token) ?? "";
        }
    }   

2. Local Database (SQLite)
    Menyimpan dan meminta data dalam jumlah besar pada local device,
    bersifat privat,
    menggunakan SQLite database melalui package sqflite,
    SQLite adalah database open source yang mendukung insert, read, update, dan remove data

    Implementasi SQLite:
    1. Menambahkan package dqflite dan path

    2. Membuat model :
        class ContactModel {
            int? id;
            String? name;
            String? phone;

            ContactModel({
                this.id,
                required this.name,
                required this.phone,
            });

            Map<String, dynamic> toMap() {
                return {
                "id": id,
                "name": name,
                "phone": phone,
                };
            }

            ContactModel.fromMap(Map<String, dynamic> map) {
                id = map['id'];
                name = map['name'];
                phone = map[phone];
            }
        }
    
    3. Membuat helper
    class DatabaseHelper {
        static DatabaseHelper? _databaseHelper;
        static late Database _database;

        final String _contacttabel = 'contacts';

        DatabaseHelper._internal() {
            _databaseHelper = this;
        }

        factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

        Future<Database> get database async {
            _database = await _initializeDb();
            return _database;
        }

        Future<Database> _initializeDb() async {
            var db = openDatabase(
            join(await getDatabasesPath(), 'contact_db.db'),
            onCreate: (db, version) async {
                await db.execute('''CREATE TABLE $_contacttabel(
                id INTEGER PRIMARY KEY,
                name TEXT,
                phone TEXT
            )''');
            },
            version: 1,
            );

            return db;
        }
    }

    4. Membuat CRUD data melalui ViewModel provider

        Class ContactProvider extends ChangeNotifier {
            List<ContactModel> _contactModels = [];
            late DatabaseHelper _dbHelper;

            var phoneErrorMessage;

            var nameErrorMessage;

            List<ContactModel> get contactModels => _contactModels;

            ContactProvider() {
                _dbHelper = DatabaseHelper();
                _getAllContacts();
            }

            get selectedIndex => null;

            void _getAllContacts() async {
                _contactModels = await _dbHelper.getContacts();
                notifyListeners();
            }

            Future<void> addContact(ContactModel contactModel) async {
                await _dbHelper.insertContact(contactModel);
                _getAllContacts();
            }

            Future<ContactModel> getContactById(int id) async {
                return await _dbHelper.getContactById(id);
            }

            Future<List<ContactModel>> getContacts() async {
                return await _dbHelper.getContacts();
            }

            void updateContact(ContactModel contactModel, int id) async {
                await _dbHelper.updateContact(contactModel, id);
                _getAllContacts();
            }

            void deleteContact(int id) async {
                await _dbHelper.deleteContact(id);
                _getAllContacts();
            }

            void deleteAllContact() async {
                await _dbHelper.deleteAllContact();
                _getAllContacts();
            }
        }
    
    5. Pemanggilan UI
        final dbManagerProvider = Provider.of<DbManager>(context, listen: false);

            dbManagerProvider.deleteAllContact();

            dbManagerProvider.addContact(ContactModel(
                    id: currentContactLength,
                    name: nameController.text,
                    phone: phoneController.text));





