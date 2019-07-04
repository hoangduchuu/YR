import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthRepo _authRepo = injector<AuthRepo>();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is UploadEvent) {
      yield* _handleUpload(event.file);
    }
  }

  @override
  ProfileState get initialState => InitState();

  Stream<ProfileState> _handleUpload(File file) async* {
    try {
      var result = await _authRepo.upload(file);
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
}
