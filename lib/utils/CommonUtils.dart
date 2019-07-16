import 'dart:math';

import 'package:intl/intl.dart';
import 'package:your_reward_user/utils/pair.dart';

class CommonUtils {
  static int getRandomInt() {
    var random = new Random();
    return random.nextInt(1000);
  }

  static String getRandomEmail() {
    var random = new Random();
    int number = random.nextInt(1000);
    return 'testEmailaccount${number}@gmail.com';
  }

  static String getFilterParam({int limit = 200, int skip = 0}) {
    return "\$skip=$skip&\$limit=$limit";
  }

  static String getTimeFormated(String value) {
    var input = DateTime.parse(value);
    var formatter = new DateFormat('h:mm a');
    String result = formatter.format(input);
    return result;
  }

  static String getDateFormat(String value) {
    var input = DateTime.parse(value);
    var formatter = new DateFormat('MM-dd-yyyy');
    String result = formatter.format(input);
    return result;
  }

  static Pair<String, String> splitFirebaseToken(String token) {
    int colonPosition = token.indexOf(":");
    String deviceId = token.substring(0, colonPosition);
    String registrationToken = token.substring(colonPosition + 1, token.length);
    return Pair(deviceId, registrationToken);
  }
}
