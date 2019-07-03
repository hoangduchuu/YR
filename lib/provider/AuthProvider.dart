import 'dart:convert';

import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/entity/RegisterEntity.dart';
import 'package:your_reward_user/entity/RegisterFacbookRequest.dart';
import 'package:your_reward_user/entity/RegisterRequest.dart';
import 'package:your_reward_user/entity/SignupEntity.dart';
import 'package:your_reward_user/entity/userEntity.dart';

class AuthProvider {
  MyHttpClient client;

  AuthProvider() {
    client = MyHttpClient.instance;
  }

  //register
  Future<dynamic> register(RegisterRequest body) async {
    String url = '${YRService.END_POINT}${YRService.PATH_REGSITER}';
    String raw =
        await client.post(url, YRService.DEFAULT_HEADER, body.toJSON());
    var result = new RegisterRespParser().parse(raw);
    return result;
  }

  //register Facebook
  Future<dynamic> registerWithFacebook(RegisterFacebookRequest body) async {
    String url = '${YRService.END_POINT}${YRService.PATH_LOGIN_FACEBOOK}';
    String raw =
        await client.post(url, YRService.DEFAULT_HEADER, body.toJSON());
    var result = new RegisterRespParser().parse(raw);
    return result;
  }

  //login
  Future<dynamic> login(String email, String password) async {
    var body = {'email': email, 'password': password, 'strategy': 'local'};
    String url = '${YRService.END_POINT}${YRService.PATH_LOGIN}';
    String raw =
        await client.post(url, YRService.DEFAULT_HEADER, jsonEncode(body));
    var result = new LoginResponseParser().parse(raw);
    return result;
  }
  Future<dynamic> getUserInfo(String userId, String token) async {
    String url = '${YRService.END_POINT}${YRService.PATH_REGSITER}/$userId';
    Map<String, String> params = new Map();
    String raw =
        await client.get(url,YRService.inputToken(token),params );
    var result = new GetUserInfoParser().parse(raw);
    return result;
  }
}

class RegisterRespParser extends BaseParser<SignupEntity> {
  @override
  SignupEntity parseInfo(Map<String, dynamic> raw) {
    return SignupEntity.fromMap(raw);
  }
}

class LoginResponseParser extends BaseParser<LoginEntity> {
  @override
  LoginEntity parseInfo(Map<String, dynamic> raw) {
    return LoginEntity.fromJson(raw);
  }
}

class GetUserInfoParser extends BaseParser<UserEntity>{
  @override
  UserEntity parseInfo(Map<String, dynamic > raw) {
    return UserEntity.fromJson(raw);
  }

}
