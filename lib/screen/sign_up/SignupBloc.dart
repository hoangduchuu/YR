//region Bloc
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

//region bloc
class SignUpBloc extends Bloc<BaseSignUpEvent, BaseBlocState> {
  AuthRepo authRepo = injector<AuthRepo>();

  @override
  SignUpState get initialState => InitialState();

  @override
  Stream<BaseBlocState> mapEventToState(BaseSignUpEvent event) async* {
    if (event is SignUpEvent) {
      yield* _handleLoginState(event.body);
    }
  }

  Stream<BaseBlocState> _handleLoginState(SignupModel model) async* {
    try {
      Pair<STATE, User> result = await authRepo.register(model);
      if (result.left == STATE.SUCCESS) {
        yield SignUpSuccessState(result.right);
      } else {
        yield UIControlState.showError(result.erroMsg.toString());
        yield ResetState();
      }
    } catch (e) {
      yield UIControlState.showError(e.toString());
      yield ResetState();
    }
  }
}

//endregion

//region Event
@immutable
abstract class BaseSignUpEvent extends Equatable {
  bool checkLogin;

  BaseSignUpEvent([List props = const []]) : super(props);
}

class SignUpEvent extends BaseSignUpEvent {
  SignupModel body;

  SignUpEvent(this.body);
}
//endregion

//region State
@immutable
abstract class SignUpState extends BaseBlocState {
  SignUpState([List props = const []]) : super(props);
}

class GetUserInfoState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  User user;

  SignUpSuccessState(this.user);
}

class ResetState extends SignUpState {}

class InitialState extends SignUpState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}

//endregion

//region Params request
class SignupModel {
  String email, role, fullName, password, confirmPasswrod, thumbnail, phone, gender, status;

  SignupModel(
      {this.email,
      this.role,
      this.fullName,
      this.password,
      this.confirmPasswrod,
      this.thumbnail,
      this.phone,
      this.gender,
      this.status});
}
//endregion
