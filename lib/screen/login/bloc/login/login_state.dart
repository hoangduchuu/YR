import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/model/User.dart';

abstract class LoginState extends BaseBlocState {
  LoginState([List props = const []]) : super(props);
}

class InitialLoginState extends LoginState {}

class ResetState extends LoginState {}

class LoggedInFacebookState extends LoginState {
  @override
  String toString() {
    return 'LoggedInFacebookState{}';
  }
}

class LoggedInSuccess extends LoginState {
  final User user;

  LoggedInSuccess(this.user) : super([user]);

  @override
  String toString() {
    return 'LoggedInSuccess{user: $user}';
  }
}
