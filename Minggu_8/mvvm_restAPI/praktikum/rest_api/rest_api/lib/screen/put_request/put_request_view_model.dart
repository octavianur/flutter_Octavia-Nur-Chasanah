import 'package:flutter/material.dart';
import 'package:rest_api/model/request_model.dart';
import 'package:rest_api/model/api/contact_api.dart';

class RequestViewmodel extends ChangeNotifier {
  String _status = '';
  String get status => _status;

  final TextEditingController _idController = TextEditingController();
  TextEditingController get idController => _idController;

  final TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  final TextEditingController _bodyController = TextEditingController();
  TextEditingController get bodyController => _bodyController;

  final TextEditingController _userIdController = TextEditingController();
  TextEditingController get userIdController => _userIdController;

  Future<void> updateData() async {
    _status = await ContactApi().putData(
        dataPut: RequestModel(
                userId: int.tryParse(_userIdController.text) ?? 0,
                id: int.tryParse(_idController.text) ?? 0,
                title: _titleController.text,
                body: _bodyController.text)
            .toJson());
    notifyListeners();
  }
}
