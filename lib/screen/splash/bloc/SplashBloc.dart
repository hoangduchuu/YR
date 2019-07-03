import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

//region Bloc
class SplashBloc extends Bloc<BaseSplashEvent, SplashState> {
  AuthRepo authRepo = injector<AuthRepo>();

  @override
  SplashState get initialState => InitialState();

  @override
  Stream<SplashState> mapEventToState(BaseSplashEvent event) async* {
    if (event is GetUserInfoEvent) {
      yield* _handleLoginState(event.userId, event.token);
    }
  }

  Stream<SplashState> _handleLoginState(String userId, String token) async* {
    try {
      Pair<STATE, User> result = await authRepo.getUserInfo(userId, token);
      if (result.left == STATE.SUCCESS) {
        yield GetUserInfoSuccessState();
      } else {
        yield GetUserInfoErrorState();
      }
    } catch (e) {
      yield GetUserInfoErrorState();
    }
  }
}

//endregion

//region Event
@immutable
abstract class BaseSplashEvent extends Equatable {
  bool checkLogin;

  BaseSplashEvent([List props = const []]) : super(props);
}

class GetUserInfoEvent extends BaseSplashEvent {
  String token;
  String userId;

  GetUserInfoEvent(this.token, this.userId);
}
//endregion

//region State
@immutable
abstract class SplashState extends Equatable {
  SplashState([List props = const []]) : super(props);
}

class GetUserInfoState extends SplashState {}

class GetUserInfoSuccessState extends SplashState {}

class GetUserInfoErrorState extends SplashState {}

class InitialState extends SplashState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}
//endregion
