import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RequestPassBaseEvent extends Equatable {
  RequestPassBaseEvent([List props = const []]) : super(props);
}

class InitEvent extends RequestPassBaseEvent {}

class RequestPassEvent extends RequestPassBaseEvent {
  final String email;

  RequestPassEvent(this.email) : super([email]);
}

class ChangePassEvent extends RequestPassBaseEvent {
  String password;
  String rePassword;
  String code;
  String email;

  ChangePassEvent(this.email, this.password, this.rePassword, this.code);
}
