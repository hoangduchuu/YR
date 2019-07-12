import 'dart:io';
import 'dart:math';

import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/entity/RegisterEntity.dart';
import 'package:your_reward_user/entity/RegisterRequest.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/entity/SignupEntity.dart';
import 'package:your_reward_user/entity/change_pass_entity.dart';
import 'package:your_reward_user/entity/find_email_entity.dart';
import 'package:your_reward_user/entity/forgot_entity.dart';
import 'package:your_reward_user/entity/update_profile_entity.dart';
import 'package:your_reward_user/entity/upload_entity.dart';
import 'package:your_reward_user/entity/userEntity.dart';
import 'package:your_reward_user/entity/user_update_request_entity.dart';
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
  Future<Pair<STATE, User>> loginByEmail(String email, String password, String deviceId) async {
    try {
      var result = await _authProvider.login(email, password);
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is LoginEntity) {
        if (result.accessToken == null || result.accessToken.isEmpty) {
          return Pair(STATE.ERROR, null, erroMsg: "Token Invalid");
        } else {
          // login success --> Update UserIdToken

          await saveLoginResult(result);

          var updateResult = await _authProvider.updateDeviceId(result.user.id, deviceId);
          if (updateResult is ErrorEntity) {
            await clearLoginResult();
            return Pair(STATE.ERROR, null, erroMsg: "Có lỗi khi update DeviceId ${updateResult.toString()}");
          }
          if (updateResult is UpdateProfileEntity) {
            SharedPrefRepo.saveDeviceId(deviceId);
            DataProvider.provideData(UserMapper().mapFrom(result.user), result.accessToken);
            return Pair(STATE.SUCCESS, DataProvider.user);
          }
        }
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }

  void saveLoginResult(LoginEntity result) async {
    DataProvider.provideData(UserMapper().mapFrom(result.user), result.accessToken);
    await SharedPrefRepo.saveToken(result.accessToken);
    await SharedPrefRepo.saveUserId(result.user.id);
  }

  void clearLoginResult() async {
    DataProvider.provideData(null, null);
    await SharedPrefRepo.saveToken(null);
    await SharedPrefRepo.saveUserId(null);
  }

  Future<Pair<STATE, User>> loginByPhone(String phone, String password, String deviceId) async {
    try {
      var emailResponse = await _authProvider.findEmailByPhone(phone);

      if (emailResponse is FindEmailNotFoundEntity) {
        return Pair(STATE.ERROR, null, erroMsg: "Không tìm thấy số điện thoại trên hệ thống");
      } else if (emailResponse is FindEmailEntity) {
        var result = await _authProvider.login(emailResponse.email, password);

        if (result is ErrorEntity && result.code != null) {
          return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
        }
        if (result is LoginEntity) {
          if (result.accessToken == null || result.accessToken.isEmpty) {
            return Pair(STATE.ERROR, null, erroMsg: "Token Invalid");
          } else {
            // login success --> Update UserIdToken
            await saveLoginResult(result);

            var updateResult = await _authProvider.updateDeviceId(result.user.id, deviceId);
            DataProvider.provideData(UserMapper().mapFrom(result.user), result.accessToken);
            if (updateResult is ErrorEntity) {
              await clearLoginResult();
              return Pair(STATE.ERROR, null, erroMsg: "Có lỗi khi update DeviceId ${updateResult.toString()}");
            }
            if (updateResult is UpdateProfileEntity) {
              DataProvider.provideData(UserMapper().mapFrom(result.user), result.accessToken);
              return Pair(STATE.SUCCESS, DataProvider.user);
            }
          }
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

  Future<bool> requestChangeEmail(String email) async {
    try {
      ForgotEntity result = await _authProvider.requestChangePasswordCode(email);
      return result.status;
    } catch (error) {
      return false;
    }
  }

  Future<bool> changePassword(String code, String email, String password) async {
    try {
      ChangePasswordEntity result = await _authProvider.changePassword(email, code, password);
      return result.status;
    } catch (error) {
      return false;
    }
  }

  Future<Pair<bool, String>> upload(String userId, File file) async {
    try {
      UploadEntity uploadTask = await _authProvider.upload(file);
      var updateResult = await _authProvider.updateAvatar(userId, 'load/file/${uploadTask.image.filename}');
      if (updateResult is ErrorEntity) {
        return Pair(false, null, erroMsg: updateResult.message);
      }

      if (updateResult != null && updateResult is UpdateProfileEntity) {
        return Pair(true, 'load/file/${uploadTask.image.filename}', erroMsg: null);
      }
    } catch (error) {
      return Pair(false, null, erroMsg: error.toString());
    }
  }

  Future<Pair<bool, String>> updateProfile(String userId, User user) async {
    UserRequest userRequest = UserRequest();
    userRequest.phone = user.phone;
    userRequest.fullname = user.fullName;
    userRequest.email = user.email;

    try {
      var result = await _authProvider.updateProfile(userId, userRequest);
      if (result is ErrorEntity) {
        return Pair(false, null, erroMsg: result.message);
      }

      if (result != null && result is UpdateProfileEntity) {
        return Pair(true, "", erroMsg: "NO");
      }
      ;
    } catch (error) {
      return Pair(false, null, erroMsg: error.toString());
    }
  }

  Future<Pair<bool, String>> updateDeviceId(String userId, String deviceId) async {
    try {
      var result = await _authProvider.updateDeviceId(userId, deviceId);
      if (result is ErrorEntity) {
        return Pair(false, null, erroMsg: result.message);
      }

      if (result != null && result is UpdateProfileEntity) {
        await SharedPrefRepo.saveDeviceId(deviceId);
        return Pair(true, "", erroMsg: "NO");
      }
      ;
    } catch (error) {
      return Pair(false, null, erroMsg: error.toString());
    }
  }
}
