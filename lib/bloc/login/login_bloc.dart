import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/auth_utils.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'login_event.dart';
import 'login_state.dart';
import '../../core/injector.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepo authRepo = injector<AuthRepo>();


  @override
  LoginState get initialState => LoggedInState.empty();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginRequest) {
      yield* _handleLoginState(event.email, event.password);
    } else if (event is LoggedInRequest) {
      yield LoggedInState.success(User());
    }
  }

  Stream<LoginState> _handleLoginState(String email, String password) async* {
    if (!AuthUtils.validateEmailValid(email)) {
      yield LoggedInState.invalidEmail();
      return;
    }
    if (!AuthUtils.validatePasswordValid(password)) {
      yield LoggedInState.invalidPassword();
      return;
    }
    yield LoggedInState.submitting();
    try {
      Pair<STATE, User> result = await authRepo.login(email, password);
      if (result.left == STATE.SUCCESS) {
        yield LoggedInState.success(result.right);
      } else {
        yield LoggedInState.failed(result.erroMsg);
      }
    } catch (e) {
      yield LoggedInState.failed(e.erroMsg);
    }
  }
}
