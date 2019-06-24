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


  static Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('ACCESS_TOKEN');
    return accessToken;
  }
}
