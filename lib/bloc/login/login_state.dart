import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/User.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class InitialLoginState extends LoginState {}

class LoggedInState extends LoginState {
  final bool isInvalidEmail;
  final bool isInValidPass;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  String errorMsg = '';

  LoggedInState(
      {this.isInvalidEmail,
      this.isInValidPass,
      this.isSubmitting,
      this.isSuccess,
      this.isFailure,
      this.errorMsg})
      : super([
          isInvalidEmail,
          isInValidPass,
          isSubmitting,
          isSuccess,
          isFailure,
          errorMsg
        ]);

  factory LoggedInState.invalidEmail() {
    return LoggedInState(
        isInvalidEmail: true,
        isInValidPass: false,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  factory LoggedInState.invalidPassword() {
    return LoggedInState(
        isInvalidEmail: false,
        isInValidPass: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  factory LoggedInState.submitting() {
    return LoggedInState(
        isInvalidEmail: true,
        isInValidPass: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }

  factory LoggedInState.success(User user) {
    return LoggedInState(
        isInvalidEmail: false,
        isInValidPass: false,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false);
  }

  factory LoggedInState.failed(String msg) {
    return LoggedInState(
        isInvalidEmail: false,
        isInValidPass: false,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        errorMsg: msg);
  }

  factory LoggedInState.empty() {
    return LoggedInState(
      isInvalidEmail: false,
      isInValidPass: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  @override
  String toString() {
    return 'LoggedInState{isValidEmail: $isInvalidEmail,'
        ' isValidPass: $isInValidPass,'
        ' isSubmitting: $isSubmitting,'
        ' isSuccess: $isSuccess,'
        ' isFailure: $isFailure}';
  }
}
