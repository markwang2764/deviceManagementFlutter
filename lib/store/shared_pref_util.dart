import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  SharedPrefUtil._privateConstructor();

  static final SharedPrefUtil _instance = SharedPrefUtil._privateConstructor();

  static SharedPrefUtil get instance {
    return _instance;
  }

  /// 保存用户名
  saveUserInfo(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username);
  }

  /// 读取保存的用户名
  readUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("username");
    return name;
  }
}
