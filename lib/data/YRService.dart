import 'dart:io';

import 'package:your_reward_user/repository/DataProvider.dart';

class YRService {
  static const DEFAULT_HEADER = {HttpHeaders.contentTypeHeader: 'application/json'};
  static String myToken = DataProvider.userToken;

  static Map<String, String> generateHeadersWithToken() {
    return {HttpHeaders.authorizationHeader: 'Bearer $myToken', HttpHeaders.contentTypeHeader: 'application/json'};
  }

  static Map<String, String> inputToken(String token) {
    return {HttpHeaders.authorizationHeader: 'Bearer $token', HttpHeaders.contentTypeHeader: 'application/json'};
  }

  static const DEFAULT_FILE_HEADER = {HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'};

  static String END_POINT = 'http://206.189.149.115:3030';

  //authentication
  static String PATH_USERS = '/users';
  static String PATH_LOGIN = '/authentication';
  static String PATH_LOGIN_FACEBOOK = '/auth/facebook';
  static String PATH_FORGET_REQUEST = '/forgot-request';
  static String PATH_FORGET_CHANGE = '/forgot-verify';
  static String PATH_UPLOAD_IMAGE = '/upload/image';
  static String PATH_CHECK_EMAIL = '/check-email';

  // post /posts?$skip=0&$limit=500&$sort[title]=1&$search=Magna et&objectType=page
  static String PATH_POSTS = "/posts";
  static String PATH_POST_DETAIL = "/posts";
  static String PATH_POST_CREATE = "/posts";

  // Coupons
  static String PATH_COUPONS = "/coupons";
  static String PATH_MY_COUPONS = "/my-coupons";

  static String PATH_STORE_USER = "/store-users";
  static String PATH_STORES = "/stores";

  static String PATH_TRANSACTIONS = "/transactions";

  // notification

  static String PATH_NOTIFICATION = "/notifications";
}
