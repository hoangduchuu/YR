import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/User.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class InitialLoginState extends LoginState {}
class ResetState extends LoginState {}

class LoggedInState extends LoginState {
  final bool isInvalidInput;
  final bool isInValidPass;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  String errorMsg;

  bool newFacebookUser;

  LoggedInState({this.isInvalidInput, this.isInValidPass, this.isSubmitting, this.isSuccess, this.isFailure, this.errorMsg, this.newFacebookUser})
      : super([isInvalidInput, isInValidPass, isSubmitting, isSuccess, isFailure, errorMsg, newFacebookUser]);

  factory LoggedInState.invalidInput(String message) {
    return LoggedInState(
        isInvalidInput: true,
        isInValidPass: false,
        isSubmitting: false,
        isSuccess: false,
        errorMsg: message,
        newFacebookUser: false,
        isFailure: true);
  }

  factory LoggedInState.invalidPassword() {
    return LoggedInState(isInvalidInput: false, isInValidPass: true, isSubmitting: false, isSuccess: false, newFacebookUser: false, isFailure: false);
  }

  factory LoggedInState.submitting() {
    return LoggedInState(isInvalidInput: false, isInValidPass: false, isSubmitting: true, isSuccess: false, newFacebookUser: false, isFailure: false);
  }

  factory LoggedInState.success(User user) {
    return LoggedInState(isInvalidInput: false, isInValidPass: false, isSubmitting: false, newFacebookUser: false, isSuccess: true, isFailure: false);
  }

  factory LoggedInState.failed(String msg) {
    return LoggedInState(
        isInvalidInput: false, isInValidPass: false, isSubmitting: false, newFacebookUser: false, isSuccess: false, isFailure: true, errorMsg: msg);
  }

  factory LoggedInState.empty() {
    return LoggedInState(
      isInvalidInput: false,
      isInValidPass: false,
      isSubmitting: false,
      isSuccess: false,
      newFacebookUser: false,
      isFailure: false,
    );
  }

  factory LoggedInState.NewFacebookUser() {
    return LoggedInState(
        isInvalidInput: false, isInValidPass: false, isSubmitting: false, newFacebookUser: true, isSuccess: false, isFailure: false, errorMsg: "");
  }

  @override
  String toString() {
    return 'LoggedInState{isInvalidInput: $isInvalidInput, isInValidPass: $isInValidPass, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, errorMsg: $errorMsg, newFacebookUser: $newFacebookUser}';
  }
}
