import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/User.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class InitEvent extends ProfileEvent {}

class UploadEvent extends ProfileEvent {
  File file;
  String userId;

  UploadEvent(this.userId, this.file);
}

class UpdateUserInfo extends ProfileEvent {
  User user;

  UpdateUserInfo(this.user);
}

class SignoutEvent extends ProfileEvent{
  String userId;

  SignoutEvent(this.userId);
}