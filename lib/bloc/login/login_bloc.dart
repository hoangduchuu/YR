import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/auth_utils.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'login_event.dart';
import 'login_state.dart';
import '../../core/injector.dart';

class LoginBloc extends Bloc<LoginEvent, BaseBlocState> {
  AuthRepo authRepo = injector<AuthRepo>();

  @override
  LoginState get initialState => LoggedInState.empty();

  @override
  Stream<BaseBlocState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginRequest) {
      yield* _handleLoginState(event.email, event.password,event.deviceId);
    } else if (event is LoggedInRequest) {
      yield LoggedInState.success(User());
    }
  }

  Stream<BaseBlocState> _handleLoginState(String input, String password,String deviceId) async* {
    // login with email
    if (AuthUtils.mayEmail(input)) {
      yield* _handleLoginWithEmail(input, password,deviceId);
    } else {
      //login with mobile
      yield* _handleLoginWithMobile(input, password,deviceId);
    }

  }

  Stream<BaseBlocState> _handleLoginWithEmail(String input, String password,String deviceId) async*{
    if (!AuthUtils.validateEmailValid(input)) {
      yield UIControlState.showError('Vui lòng nhập đúng định dạng Email hoặc Số điện thoại');
    } else if (!AuthUtils.validatePasswordValid(password)) {
      yield UIControlState.showError('Vui lòng nhập password hợp lệ');
    } else {
      yield UIControlState.showLoading();
      try {
        Pair<STATE, User> result =
            await authRepo.loginByEmail(input, password,deviceId);
        if (result.left == STATE.SUCCESS) {
          yield LoggedInState.success(result.right);
        } else {
          yield UIControlState.showError(result.erroMsg);
        }
      } catch (e) {
        yield UIControlState.showError(e.erroMsg);
      }
    }
  }

  Stream<LoginState> _handleLoginWithMobile(String input, String password,String deviceId) async*{
    if (!AuthUtils.validateMobile(input)) {
      yield LoggedInState.invalidInput(
          "Vui lòng nhập đúng định dạng Email hoặc Số điện thoại");
    } else if (!AuthUtils.validatePasswordValid(password)) {
      yield LoggedInState.invalidInput("Vui lòng nhập password hợp lệ");
    } else {
      yield LoggedInState.submitting();
      try {
        Pair<STATE, User> result =
        await authRepo.loginByPhone(input, password,deviceId);
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
}
