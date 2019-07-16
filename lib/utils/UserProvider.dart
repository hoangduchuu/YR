import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/entity/userEntity.dart';

/**
 * the Fake token provider after login
 *
 */
class UserProvider {
  static UserEntity _user;

  static UserEntity get userEntity => _user;

  static set userEntity(UserEntity value) {
    _user = value;
  }

  static LoginEntity _login;

  static LoginEntity get loginEntity => _login;

  static set loginEntity(LoginEntity value) {
    _login = value;
  }
}
