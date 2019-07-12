import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginRequest extends LoginEvent {
  final String email, password,deviceId;

  LoginRequest({@required this.email, @required this.password,@required this.deviceId})
      : super([email, password,deviceId]);

  @override
  String toString() {
    return 'LoginRequest{email: $email, password: $password}';
  }
}

class LoggedInRequest extends LoginEvent {
  @override
  String toString() {
    return 'LoggedInRequest{}';
  }
}
