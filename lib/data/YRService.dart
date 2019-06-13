import 'dart:io';

class YRService{
  static const DEFAULT_HEADER = {
    HttpHeaders.contentTypeHeader : 'application/json'
  };

  static Map<String, String> generateHeadersWithToken(String token){
    return {
      HttpHeaders.authorizationHeader: 'Token $token',
      HttpHeaders.contentTypeHeader : 'application/json'
    };
  }


  static String END_POINT = 'http://128.199.78.111:3030';
  //authentication
  static String PATH_REGSITER = '/users';
  static String PATH_LOGIN = '/authentication';
}