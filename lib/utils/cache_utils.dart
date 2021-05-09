// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class CacheUtils {
  // 存储token
  static const String keyToken = 'admin_token';
  // 存储用户名
  static const String keyUserName = 'admin';

  static Future<bool> getLoginState() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.get(CacheUtils.keyToken) as String;
    // ignore: unnecessary_null_comparison
    if (token == null) {
      return false;
    }
    return true;
  }

  static Future<void> setLogin(String userName) async {
    if(userName == keyUserName){
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(keyToken, "flutter##"+userName+DateTime.now().toIso8601String());
    }
  }
}
