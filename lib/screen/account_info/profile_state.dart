import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/model/User.dart';

@immutable
abstract class ProfileState extends Equatable {
  ProfileState([List props = const []]) : super(props);

  @override
  String toString() {
    return 'UpdateProfileState{}';
  }
}

class InitState extends ProfileState {}

class ResetState extends ProfileState {}

class UploadState extends ProfileState {
  bool success = false;
  bool loading = false;
  bool error = false;
  String errorMessage = "";
  String uploadedUrl = "";

  UploadState({this.success, this.loading, this.error, this.errorMessage, this.uploadedUrl});

  factory UploadState.Loading(bool loading) {
    return UploadState(loading: loading, errorMessage: "", uploadedUrl: "", success: false, error: false);
  }

  factory UploadState.Error(String errorMessage) {
    return UploadState(error: true, errorMessage: errorMessage,loading: false);
  }

  factory UploadState.Success(String url) {
    return UploadState(success: true, loading: false, error: false, errorMessage: "", uploadedUrl: url);
  }

  @override
  String toString() {
    return 'UploadState{success: $success, loading: $loading, error: $error, errorMessage: $errorMessage, uploadedUrl: $uploadedUrl}';
  }
}

class UpdateState extends ProfileState {
  bool success = false;
  bool loading = false;
  bool error = false;
  String errorMessage = "";
  User user;

  UpdateState({this.success, this.loading, this.error, this.errorMessage,this.user});

  factory UpdateState.Loading(bool loading) {
    return UpdateState(loading: loading, errorMessage: "", success: false, error: false);
  }

  factory UpdateState.Error(String errorMessage) {
    return UpdateState(error: true, errorMessage: errorMessage,loading: false,success: false);
  }

  factory UpdateState.Success(User user) {
    return UpdateState(success: true, loading: false, error: false, errorMessage: "",user: user);
  }

  @override
  String toString() {
    return 'UploadState{success: $success, loading: $loading, error: $error, errorMessage: $errorMessage}';
  }
}

enum SignOutState { SUCCESS, ERROR, LOADING }

class Signout extends ProfileState {
  SignOutState state;
  String message;
  Signout(this.state,{this.message});

  factory Signout.Loading() {
    return Signout(SignOutState.LOADING);
  }
  factory Signout.Error(String msg) {
    return Signout(SignOutState.ERROR,message: msg);
  }
  factory Signout.Success() {
    return Signout(SignOutState.SUCCESS);
  }
  
}
