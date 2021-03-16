import 'package:shared_preferences/shared_preferences.dart';

class CacheUtils {
  // 存储token
  static const String keyToken = 'xxxxxxxxxTK';
  // 存储用户名
  static const String keyUserName = 'xxxxxxxxxUserName';

  static Future<bool> getLoginState() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.get(CacheUtils.keyToken) as String;
    if (token == null) {
      return false;
    }
    return true;
  }
}
