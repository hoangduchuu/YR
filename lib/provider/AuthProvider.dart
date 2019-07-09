import 'dart:convert';
import 'dart:io';

import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/entity/RegisterEntity.dart';
import 'package:your_reward_user/entity/RegisterFacbookRequest.dart';
import 'package:your_reward_user/entity/RegisterRequest.dart';
import 'package:your_reward_user/entity/SignupEntity.dart';
import 'package:your_reward_user/entity/change_pass_entity.dart';
import 'package:your_reward_user/entity/find_email_entity.dart';
import 'package:your_reward_user/entity/forgot_entity.dart';
import 'package:your_reward_user/entity/update_profile_entity.dart';
import 'package:your_reward_user/entity/upload_entity.dart';
import 'package:your_reward_user/entity/userEntity.dart';
import 'package:your_reward_user/entity/user_update_request_entity.dart';

class AuthProvider {
  MyHttpClient client;

  AuthProvider() {
    client = MyHttpClient.instance;
  }

  //register
  Future<dynamic> register(RegisterRequest body) async {
    String url = '${YRService.END_POINT}${YRService.PATH_USERS}';
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
    String url = '${YRService.END_POINT}${YRService.PATH_USERS}/$userId';
    Map<String, String> params = new Map();
    String raw = await client.get(url, YRService.inputToken(token), params);
    var result = new GetUserInfoParser().parse(raw);
    return result;
  }

  Future<dynamic> requestChangePasswordCode(String email) async {
    String url = '${YRService.END_POINT}${YRService.PATH_FORGET_REQUEST}';
    var body = {"email": email};
    String raw =
        await client.post(url, YRService.DEFAULT_HEADER, jsonEncode(body));
    var result = new RequestPasswordParser().parse(raw);
    return result;
  }

  Future<dynamic> changePassword(
      String email, String code, String password) async {
    String url = '${YRService.END_POINT}${YRService.PATH_FORGET_CHANGE}';
    var body = {'email': email, 'forgotCode': code, 'password': password};
    String raw = await client.post(
        url, YRService.DEFAULT_HEADER, jsonEncode(body).toString());
    var result = new ChangePasswordParser().parse(raw);
    return result;
  }

  Future<dynamic> upload(File file) async {
    String url = '${YRService.END_POINT}${YRService.PATH_UPLOAD_IMAGE}';
    String raw = await client.uploadFile(url, file);
    var result = new UpLoadImageParser().parse(raw);
    return result;
  }

  //login
  Future<dynamic> updateAvatar(String userId, String imageUrl) async {
    var body = {'thumbnail': imageUrl};
    String url = '${YRService.END_POINT}${YRService.PATH_USERS}/$userId';
    String raw = await client.patch(
        url, YRService.generateHeadersWithToken(), jsonEncode(body));
    var result = new UpdateProfileParser().parse(raw);
    return result;
  }

  //update profile
  Future<dynamic> updateProfile(String userId, UserRequest requestBody) async {
    var body = {
      "email": requestBody.email,
      "phone": requestBody.phone,
      "fullname": requestBody.fullname
    };
    String url = '${YRService.END_POINT}${YRService.PATH_USERS}/$userId';
    String raw = await client.patch(
        url, YRService.generateHeadersWithToken(), jsonEncode(body));
    var result = new UpdateProfileParser().parse(raw);
    return result;
  }

  Future<dynamic> findEmailByPhone(String phone) async {
    String url = '${YRService.END_POINT}${YRService.PATH_CHECK_EMAIL}';
    var body = {"phone": phone};
    String raw =
        await client.post(url, YRService.DEFAULT_HEADER, jsonEncode(body));
    var result = FindEmailParser().parse(raw);
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

class GetUserInfoParser extends BaseParser<UserEntity> {
  @override
  UserEntity parseInfo(Map<String, dynamic> raw) {
    return UserEntity.fromJson(raw);
  }
}

class RequestPasswordParser {
  ForgotEntity parse(String raw) {
    Map<String, dynamic> map = jsonDecode(raw);
    return ForgotEntity(forgotCode: map['forgotCode'], status: map['status']);
  }
}

class ChangePasswordParser {
  ChangePasswordEntity parse(String raw) {
    Map<String, dynamic> map = jsonDecode(raw);
    return ChangePasswordEntity(
        status: map['status'], email: map['email'], role: map['role']);
  }
}

class UpLoadImageParser extends BaseParser<UploadEntity> {
  @override
  UploadEntity parseInfo(Map<String, dynamic> raw) {
    return UploadEntity.fromMap(raw);
  }
}

class UpdateProfileParser extends BaseParser<UpdateProfileEntity> {
  @override
  UpdateProfileEntity parseInfo(Map<String, dynamic> raw) {
    return UpdateProfileEntity.fromMap(raw);
  }
}

class FindEmailParser {
  dynamic parse(String raw) {
    if (raw == "{}" || raw.length <4 || raw.contains('"status":false')) {
      return FindEmailNotFoundEntity();
    } else {
    }
    return FindEmailEntity.fromJson(raw);
  }
}
