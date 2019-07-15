import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/auth_utils.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, BaseBlocState> {
  AuthRepo _authRepo = injector<AuthRepo>();

  @override
  Stream<BaseBlocState> mapEventToState(ProfileEvent event) async* {
    if (event is UploadEvent) {
      yield* _handleUpload(event.userId, event.file);
    }
    if (event is UpdateUserInfo) {
      yield* _handleUserInfo(event.user);
    }
    if(event is SignoutEvent){
      yield* _handleSignOut(event.userId);
    }
  }

  @override
  ProfileState get initialState => InitState();

  Stream<BaseBlocState> _handleUpload(String userid, File file) async* {
    try {
      yield UIControlState.showLoading();
      yield ResetState();
      var result = await _authRepo.upload(userid, file);
      if (result.left) {
        yield UploadSuccessState(result.right);
        yield ResetState();
      } else {
        yield UIControlState.showError(result.erroMsg);
        yield ResetState();
      }
    } catch (e) {
      yield UIControlState.showError(e..toString());
      yield ResetState();
    }
  }

  Stream<BaseBlocState> _handleUserInfo(User user) async* {
    try {
      yield UIControlState.showLoading();
      yield ResetState();
      var result = await _authRepo.updateProfile(user.id, AuthUtils.buildUser(user));
      if (result.left) {
        yield UpdateStateSuccess(user);
        yield ResetState();
      } else {
        yield UIControlState.showError(result.erroMsg);
        yield ResetState();
      }
    } catch (e) {
      yield UIControlState.showError(e..toString());
      yield ResetState();
    }
  }
  Stream<BaseBlocState> _handleSignOut(String userId) async* {
    try {
      yield UIControlState.showLoading();
      var result = await _authRepo.updateDeviceId(userId, "");
      if (result.left) {
        yield SignOutSuccess();
        yield ResetState();
      } else {
        yield UIControlState.showError(result.erroMsg);
        yield ResetState();
      }
    } catch (e) {
      yield UIControlState.showError(e..toString());
      yield ResetState();
    }
  }
}
