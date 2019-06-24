import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginRequest extends LoginEvent{
  final String email, password;

  LoginRequest({@required this.email, @required this.password})
      : super([email, password]);

  @override
  String toString() {
    return 'LoginRequest{email: $email, password: $password}';
  }
}

class LoggedInRequest extends LoginEvent{

  @override
  String toString() {
    return 'LoggedInRequest{}';
  }
}
