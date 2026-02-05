import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  static Future<bool> setLoginFlag(bool flag) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("isLoggedIn", flag);
  }
  static Future<bool> getLoginFlag() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }
  static Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("accesstoken", token ?? '');
  }
  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("accesstoken") ?? ''; // 4293467747
  }
  static Future<bool> setOtpVerified(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("isOtpVerified", status);
  }
  static Future<bool> getOtpVerified() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isOtpVerified") ?? false;
  }


  static Future<bool> clearPreferences() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.clear();
  }


}