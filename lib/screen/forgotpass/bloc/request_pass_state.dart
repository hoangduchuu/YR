import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';

@immutable
abstract class RequestPassBaseState extends BaseBlocState {
  RequestPassBaseState([List props = const []]) : super(props);

  @override
  String toString() {
    return 'RequestPassBaseState{}';
  }
}

class InitialState extends RequestPassBaseState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}

class ResetState extends RequestPassBaseState {
  @override
  String toString() {
    return 'ResetState{}';
  }
}

class RequestPassSuccessState extends RequestPassBaseState{
  @override
  String toString() {
    return 'RequestPassSuccess{}';
  }
}

class ChangePassSuccessState extends RequestPassBaseState{

  @override
  String toString() {
    return 'ChangePassSuccessState{}';
  }
}

//class RequestPassState extends RequestPassBaseState {
//  bool isLoading;
//  bool isError;
//  String errMsg;
//  bool success;
//  bool emailValid;
//
//  RequestPassState(
//      {this.success,
//      this.isLoading,
//      this.isError,
//      this.errMsg,
//      this.emailValid})
//      : super([isLoading, isError, errMsg]);
//
//  factory RequestPassState.empty() {
//    return RequestPassState(
//        isLoading: false, isError: false, success: false, emailValid: false);
//  }
//
//  factory RequestPassState.invalidEmail() {
//    return RequestPassState(
//        emailValid: false,
//        isLoading: false,
//        isError: false,
//        errMsg: "Vui lòng nhập đúng định dạng email",
//        success: false);
//  }
//
//  factory RequestPassState.isLoading() {
//    return RequestPassState(
//        isLoading: true, isError: false, success: false, emailValid: true);
//  }
//
//  factory RequestPassState.isError({String errMsg}) {
//    return RequestPassState(
//        isLoading: false,
//        isError: true,
//        errMsg: errMsg,
//        success: false,
//        emailValid: true);
//  }
//
//  factory RequestPassState.success() {
//    return RequestPassState(
//        success: true,
//        isError: false,
//        isLoading: false,
//        errMsg: "",
//        emailValid: true);
//  }
//
//  @override
//  String toString() {
//    return 'RequestPassState{isLoading: $isLoading, isError: $isError, errMsg: $errMsg, success: $success, emailValid: $emailValid}';
//  }
//}

//class ChangePassState extends RequestPassBaseState {
//  bool isPasswordMatching, isloading;
//  bool success, isError;
//  String errMsg;
//
//  ChangePassState(
//      {this.success,
//      this.isPasswordMatching,
//      this.errMsg,
//      this.isError,
//      this.isloading})
//      : super([isloading, errMsg, isError]);
//
//  factory ChangePassState.passwordNotMatch() {
//    return ChangePassState(
//        isloading: false,
//        isError: false,
//        errMsg: "Password không khớp",
//        success: false,
//        isPasswordMatching: false);
//  }
//  factory ChangePassState.Success() {
//    return ChangePassState(
//        isloading: false,
//        isError: false,
//        success: true,
//        isPasswordMatching: true);
//  }
//
//  factory ChangePassState.Loading() {
//    return ChangePassState(
//        isloading: true,
//        isError: false,
//        success: false,
//        isPasswordMatching: true);
//  }
//
//  factory ChangePassState.Error(String msg) {
//    return ChangePassState(
//      errMsg: msg,
//        isloading: false,
//        isError: true,
//        success: false,
//        isPasswordMatching: true);
//  }
//
//  @override
//  String toString() {
//    return 'ChangePassState{isPasswordMatching: $isPasswordMatching, isloading: $isloading, success: $success, isError: $isError, errMsg: $errMsg}';
//  }
//}
