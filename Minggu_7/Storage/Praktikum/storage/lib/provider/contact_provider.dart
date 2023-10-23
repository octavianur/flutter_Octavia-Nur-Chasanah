import 'package:advance_form/helper_sql/sql_helper.dart';
import 'package:advance_form/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
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