

import 'dart:convert';

import 'package:your_reward_user/model/RespErrorEntity.dart';

abstract class BaseParser<T>{
  dynamic parse(String raw){
    Map<String, dynamic> map = jsonDecode(raw);
    if (map.containsKey('code') && map.containsKey('errors')){
      return ErrorEntity.fromJSON(map);
    } else {
      return parseInfo(map);
    }
  }

  T parseInfo(Map<String, dynamic> raw);
}