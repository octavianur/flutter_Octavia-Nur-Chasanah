import 'package:shared_preferences/shared_preferences.dart';

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
