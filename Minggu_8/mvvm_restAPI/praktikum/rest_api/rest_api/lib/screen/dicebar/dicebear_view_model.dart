import 'package:flutter/material.dart';
import 'package:rest_api/model/api/dicebear_api.dart';

class DicebearViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _GenerateImage = '';
  String get GenerateImage => _GenerateImage;

  final TextEditingController _styleController = TextEditingController();
  TextEditingController get styleController => _styleController;

  final TextEditingController _seedController = TextEditingController();
  TextEditingController get seedController => _seedController;

  void generateImage() async {
    _isLoading = true;
    notifyListeners();

    _GenerateImage = await DicebearApi().generateImage(
        style: _styleController.text, seed: _seedController.text);

    _isLoading = false;
    notifyListeners();
  }
}