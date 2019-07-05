import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';

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

  UpdateState({this.success, this.loading, this.error, this.errorMessage});

  factory UpdateState.Loading(bool loading) {
    return UpdateState(loading: loading, errorMessage: "", success: false, error: false);
  }

  factory UpdateState.Error(String errorMessage) {
    return UpdateState(error: true, errorMessage: errorMessage,loading: false,success: false);
  }

  factory UpdateState.Success() {
    return UpdateState(success: true, loading: false, error: false, errorMessage: "");
  }

  @override
  String toString() {
    return 'UploadState{success: $success, loading: $loading, error: $error, errorMessage: $errorMessage}';
  }
}