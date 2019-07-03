import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/model/User.dart';

/// use for cache the User and Token to memory
class DataProvider {
  static User _user;
  static String _userToken;

  static User get user => _user;

  static String get userToken => _userToken;

  static provideData(User user, String token) {
    _user = user;
    _userToken = token;
  }
}
