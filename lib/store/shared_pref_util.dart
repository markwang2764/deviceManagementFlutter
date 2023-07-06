import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  SharedPrefUtil._privateConstructor();

  static final SharedPrefUtil _instance = SharedPrefUtil._privateConstructor();

  static SharedPrefUtil get instance {
    return _instance;
  }

  /// 保存用户名
  saveUserInfo(String userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userInfo", userInfo);
  }

  /// 读取保存的用户名
  readUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("userInfo");
    return name;
  }
}
