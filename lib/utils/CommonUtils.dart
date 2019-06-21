import 'dart:math';

class CommonUtils {
  static int getRandomInt() {
    var random = new Random();
    return  random.nextInt(1000);
  }

  static String getRandomEmail() {
    var random = new Random();
    int number = random.nextInt(1000);
    return 'testEmailaccount${number}@gmail.com';
  }
  static String getFilterParam( {int limit = 200, int skip = 0}){
    return "\$skip=$skip&\$limit=$limit";
  }
}
