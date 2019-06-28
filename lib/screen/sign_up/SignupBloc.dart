//region Bloc
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

//region bloc
class SignUpBloc extends Bloc<BaseSignUpEvent, SignUpState> {
  AuthRepo authRepo;

  @override
  SignUpState get initialState => InitialState();

  SignUpBloc() {
    this.authRepo = AuthRepo();
  }

  @override
  Stream<SignUpState> mapEventToState(BaseSignUpEvent event) async* {
    if (event is SignUpEvent) {
      yield* _handleLoginState(event.body);
    }
  }

  Stream<SignUpState> _handleLoginState(SignupModel model) async* {
    try {
      Pair<STATE, User> result = await authRepo.register(model);
      if (result.left == STATE.SUCCESS) {
        yield SignUpSuccessState(result.right);
      } else {
        print("ERER tren ${result.erroMsg}");
        yield SignUpErrorState(errorMessage: result.erroMsg);
        yield ResetState();
        return;
      }
    } catch (e) {
      yield SignUpErrorState(errorMessage: e.toString());
      yield ResetState();
      return;
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
abstract class SignUpState extends Equatable {
  SignUpState([List props = const []]) : super(props);
}

class GetUserInfoState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  User user;

  SignUpSuccessState(this.user);
}

class SignUpErrorState extends SignUpState {
  String errorMessage;

  SignUpErrorState({this.errorMessage});
}

class ResetState extends SignUpErrorState {}

class InitialState extends SignUpState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}

//endregion

//region Params request
class SignupModel {
  String email,
      role,
      fullName,
      password,
      confirmPasswrod,
      thumbnail,
      phone,
      gender,
      status;

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
