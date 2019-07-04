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

  UploadState(
      {this.success,
      this.loading,
      this.error,
      this.errorMessage,
      this.uploadedUrl});

  factory UploadState.Loading() {
    return UploadState(loading: true);
  }

  factory UploadState.Error(String errorMessage) {
    return UploadState(error: true, errorMessage: errorMessage);
  }

  factory UploadState.Success(String url) {
    return UploadState(
        success: true,
        loading: false,
        error: false,
        errorMessage: "",
        uploadedUrl: url);
  }
}
