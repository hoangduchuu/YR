import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/model/User.dart';

abstract class LoginState extends BaseBlocState {
  LoginState([List props = const []]) : super(props);
}

class InitialLoginState extends LoginState {}

class LoggedInState extends LoginState {
  final bool isInvalidInput;
  final bool isInValidPass;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  String errorMsg ;

  LoggedInState(
      {this.isInvalidInput,
      this.isInValidPass,
      this.isSubmitting,
      this.isSuccess,
      this.isFailure,
      this.errorMsg})
      : super([
          isInvalidInput,
          isInValidPass,
          isSubmitting,
          isSuccess,
          isFailure,
          errorMsg
        ]);

  factory LoggedInState.invalidInput(String message) {
    return LoggedInState(
        isInvalidInput: true,
        isInValidPass: false,
        isSubmitting: false,
        isSuccess: false,
        errorMsg: message,
        isFailure: true);
  }

  factory LoggedInState.invalidPassword() {
    return LoggedInState(
        isInvalidInput: false,
        isInValidPass: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  factory LoggedInState.submitting() {
    return LoggedInState(
        isInvalidInput: false,
        isInValidPass: false,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }

  factory LoggedInState.success(User user) {
    return LoggedInState(
        isInvalidInput: false,
        isInValidPass: false,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false);
  }

  factory LoggedInState.failed(String msg) {
    return LoggedInState(
        isInvalidInput: false,
        isInValidPass: false,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        errorMsg: msg);
  }

  factory LoggedInState.empty() {
    return LoggedInState(
      isInvalidInput: false,
      isInValidPass: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  @override
  String toString() {
    return 'LoggedInState{isValidEmail: $isInvalidInput,'
        ' isValidPass: $isInValidPass,'
        ' isSubmitting: $isSubmitting,'
        ' isSuccess: $isSuccess,'
        ' isFailure: $isFailure}';
  }
}
