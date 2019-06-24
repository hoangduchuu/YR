class AuthUtils{

  //check email valid
  static bool validateEmailValid(String email){
    if (email == null || email.isEmpty)
      return false;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email))
      return true;
    else
      return false;
  }

  //check password!! password length must be 8 digit
  static bool validatePasswordValid(String password){
    if (password == null || password.isEmpty){
      return false;
    }
    if (password.length < 6){
      return false;
    }
    return true;
  }

  //confirm password
  static bool validatePassAndConfirmPassValid(String pass, String confirmPass){
    bool isPassValid = validatePasswordValid(pass);
    if (!isPassValid){
      return false;
    }
    return pass == confirmPass;
  }

  //validate mobile
  static bool validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

}