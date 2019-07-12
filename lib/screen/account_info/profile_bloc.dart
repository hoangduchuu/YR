import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/auth_utils.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthRepo _authRepo = injector<AuthRepo>();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
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

  Stream<ProfileState> _handleUpload(String userid, File file) async* {
    try {
      yield UploadState.Loading(true);
      yield ResetState();
      var result = await _authRepo.upload(userid, file);
      if (result.left) {
        yield UploadState.Success(result.right);
        yield ResetState();
      } else {
        yield UploadState.Error(result.erroMsg);
        yield ResetState();
      }
    } catch (e) {
      yield UploadState.Error(e..toString());
      yield ResetState();
    }
  }

  Stream<ProfileState> _handleUserInfo(User user) async* {
    try {
      yield UpdateState.Loading(true);
      yield ResetState();
      var result = await _authRepo.updateProfile(user.id, AuthUtils.buildUser(user));
      if (result.left) {
        yield UpdateState.Success();
        yield ResetState();
      } else {
        yield UpdateState.Error(result.erroMsg);
        yield ResetState();
      }
    } catch (e) {
      yield UpdateState.Error(e..toString());
      yield ResetState();
    }
  }
  Stream<ProfileState> _handleSignOut(String userid) async* {
    try {
      yield Signout.Loading();
      yield ResetState();
      var result = await _authRepo.updateDeviceId(userid, "");
      if (result.left) {
        yield Signout.Success();
        yield ResetState();
      } else {
        yield Signout.Error(result.erroMsg);
        yield ResetState();
      }
    } catch (e) {
      yield Signout.Error(e..toString());
      yield ResetState();
    }
  }
}
