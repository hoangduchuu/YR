import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/model/User.dart';

@immutable
abstract class ProfileState extends BaseBlocState {
  ProfileState([List props = const []]) : super(props);

  @override
  String toString() {
    return 'UpdateProfileState{}';
  }
}

class InitState extends ProfileState {}

class ResetState extends ProfileState {}

class UploadSuccessState extends ProfileState{
  final String uploadedUrl;

  UploadSuccessState(this.uploadedUrl) : super([uploadedUrl]);

  @override
  String toString() {
    return 'UploadSuccessState{uploadedUrl: $uploadedUrl}';
  }
}

class UpdateStateSuccess extends ProfileState{
  final User user;

  UpdateStateSuccess(this.user) : super([user]);

  @override
  String toString() {
    return 'UpdateStateSuccess{user: $user}';
  }
}

class SignOutSuccess extends ProfileState{
  @override
  String toString() {
    return 'SignOutSuccess{}';
  }
}

//enum SignOutState { SUCCESS, ERROR, LOADING }
//
//class Signout extends ProfileState {
//  SignOutState state;
//  String message;
//  Signout(this.state,{this.message});
//
//  factory Signout.Loading() {
//    return Signout(SignOutState.LOADING);
//  }
//  factory Signout.Error(String msg) {
//    return Signout(SignOutState.ERROR,message: msg);
//  }
//  factory Signout.Success() {
//    return Signout(SignOutState.SUCCESS);
//  }
//
//}
