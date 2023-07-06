import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._privateConstructor();

  static final LocalStorage _instance = LocalStorage._privateConstructor();

  static LocalStorage get instance {
    return _instance;
  }

  saveToken(String userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", userInfo);
  }

  readToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }

  saveUserInfo(String userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userInfo", userInfo);
  }

  readUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("userInfo");
    return name;
  }
}
