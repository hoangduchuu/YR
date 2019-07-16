import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';

@immutable
abstract class HomeState extends BaseBlocState {
  HomeState([List props = const []]) : super(props);
}

class InitialState extends HomeState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}
