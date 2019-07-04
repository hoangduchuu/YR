import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class InitEvent extends ProfileEvent {}

class UploadEvent extends ProfileEvent {
  File file;

  UploadEvent(this.file);
}
