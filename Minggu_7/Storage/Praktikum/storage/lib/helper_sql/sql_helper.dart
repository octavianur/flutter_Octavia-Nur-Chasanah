import 'package:advance_form/model/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<void> insertContact(ContactModel contactModel) async {
    final Database db = await database;
    await db.insert(_contacttabel, contactModel.toMap());
  }

  Future<List<ContactModel>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_contacttabel);

    return results.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<ContactModel> getContactById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results =
        await db.query(_contacttabel, where: 'id = ?', whereArgs: [id]);

    return results.map((e) => ContactModel.fromMap(e)).first;
  }

  Future<void> updateContact(ContactModel contactModel, int id) async {
    final db = await database;
    await db.update(_contacttabel, contactModel.toMap(),
        where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(_contacttabel, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllContact() async {
    final db = await database;
    await db.delete(_contacttabel);
  }
}