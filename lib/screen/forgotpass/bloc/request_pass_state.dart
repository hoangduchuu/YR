import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';

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

class RequestPassSuccessState extends RequestPassBaseState {
  @override
  String toString() {
    return 'RequestPassSuccess{}';
  }
}

class ChangePassSuccessState extends RequestPassBaseState {
  @override
  String toString() {
    return 'ChangePassSuccessState{}';
  }
}
