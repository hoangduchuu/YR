import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/entity/RegisterEntity.dart';
import 'package:your_reward_user/entity/RegisterRequest.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/entity/SignupEntity.dart';
import 'package:your_reward_user/entity/userEntity.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/provider/AuthProvider.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/screen/sign_up/SignupBloc.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'DataProvider.dart';

class AuthRepo {
  AuthProvider _authProvider = injector<AuthProvider>();


  // request and mapping from entity to model
  Future<Pair<STATE, User>> login(String email, String password) async {
    try {
      var result = await _authProvider.login(email, password);
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is LoginEntity) {
        if (result.accessToken == null || result.accessToken.isEmpty) {
          return Pair(STATE.ERROR, null, erroMsg: "Token Invalid");
        } else {
          SharedPrefRepo.saveToken(result.accessToken);
          SharedPrefRepo.saveUserId(result.user.id);
          DataProvider.provideData(
              UserMapper().mapFrom(result.user), result.accessToken);
          return Pair(STATE.SUCCESS, DataProvider.user);
        }
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }

  Future<Pair<STATE, User>> getUserInfo(String userId, String token) async {
    try {
      var result = await _authProvider.getUserInfo(userId, token);
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is UserEntity) {
        if (result == null) {
          return Pair(STATE.ERROR, null, erroMsg: "Token Invalid");
        } else {
          await SharedPrefRepo.saveToken(token);
          await SharedPrefRepo.saveUserId(result.id);
          DataProvider.provideData(UserMapper().mapFrom(result), token);
          return Pair(STATE.SUCCESS, DataProvider.user);
        }
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }

  Future<Pair<STATE, User>> register(SignupModel model) async {
    RegisterRequest body = RegisterRequest(
      role: "client",
      fullName: model.fullName,
      email: model.email,
      password: model.password,
      confirmPasswrod: model.confirmPasswrod,
      thumbnail: model.thumbnail,
      phone: model.phone,
      gender: model.gender,
      status: model.status,
    );
    try {
      var result = await _authProvider.register(body);
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is SignupEntity) {
        return Pair(STATE.SUCCESS, UserRegisterMapper().mapFrom(result));
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }
}
