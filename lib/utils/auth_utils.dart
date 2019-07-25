import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/DataProvider.dart';

class AuthUtils {
  //check email valid
  static bool validateEmailValid(String email) {
    if (email == null || email.isEmpty) return false;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email))
      return true;
    else
      return false;
  }

//Check  the input may be email or not
  static bool mayEmail(String value) {
    return value.contains("@");
  }

  //check password!! password length must be 8 digit
  static bool validatePasswordValid(String password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    if (password.length < 6) {
      return false;
    }
    return true;
  }

  //confirm password
  static bool validatePassAndConfirmPassValid(String pass, String confirmPass) {
    bool isPassValid = validatePasswordValid(pass);
    if (!isPassValid) {
      return false;
    }
    return pass == confirmPass;
  }

  //validate mobile
  static bool validateMobile(String value) {
// Vietnam Mobile number are of 10 digit only    see https://www.regextester.com/98578
    Pattern pattern = r'(09|01[2|6|8|9])+([0-9]{8})\b';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  static User buildUser(User user) {
    var inputUser = new User();
    inputUser.fullName = user.fullName == null ? DataProvider.user.fullName : user.fullName;
    inputUser.phone = user.phone == null ? DataProvider.user.phone : user.phone;
    inputUser.email = user.email == null ? DataProvider.user.email : user.email;
    return inputUser;
  }
}
