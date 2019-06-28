import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepo {
  static saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Saving token");
    await prefs.setString("ACCESS_TOKEN", token).then((onValue) {
      print("saved token");
    }).catchError((error) {
      print("Save token error ${error.toString()}");
    });
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('ACCESS_TOKEN');
    return accessToken;
  }

  static saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Saving UserID $userId");
    await prefs.setString("USER_ID", userId).then((onValue) {
      print("saved UserID $userId");
    }).catchError((error) {
      print("Save token error ${error.toString()}");
    });
  }

  static Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('USER_ID');
    return accessToken;
  }

  static clearAll() async {
    await saveUserId(null);
    await saveToken(null);
  }
}
