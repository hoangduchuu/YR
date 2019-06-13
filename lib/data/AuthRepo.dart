import 'dart:convert';

import 'package:your_reward_user/model/RegisterEntity.dart';
import 'package:your_reward_user/model/RespRegisterEntity.dart';

import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'YRService.dart';
import 'base/BaseParser.dart';

class AuthRepo {
  MyHttpClient client;

  AuthRepo() {
    client = MyHttpClient();
  }

  //register
  Future<dynamic> register(RegisterEntity body) async {
    String url = '${YRService.END_POINT} + "" + ${YRService.PATH_REGSITER}';
    String raw = await client.post(url, YRService.DEFAULT_HEADER, body.toJSON());
    var result =  new RegisterRespParser().parse(raw);
    return result;
  }

  //login
  Future<dynamic> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
      'strategy': 'local'
    };
    String url = '${YRService.END_POINT} + "" + ${YRService.PATH_LOGIN}';
    String raw = await client.post(url, YRService.DEFAULT_HEADER, jsonEncode(body));
    var result =  new RegisterRespParser().parse(raw);
    return result;
  }

}

class RegisterRespParser extends BaseParser<RespRegisterEntity> {
  @override
  RespRegisterEntity parseInfo(Map<String, dynamic> raw) {
    return RespRegisterEntity.fromJSON(raw);
  }
}
