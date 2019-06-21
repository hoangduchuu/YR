import 'dart:io';

import 'package:your_reward_user/utils/UserProvider.dart';
class YRService{
  static const DEFAULT_HEADER = {
    HttpHeaders.contentTypeHeader : 'application/json'
  };
static String myToken = UserProvider.loginEntity.accessToken;
  static Map<String, String> generateHeadersWithToken(){
    return {
      HttpHeaders.authorizationHeader: 'Bearer $myToken',
      HttpHeaders.contentTypeHeader : 'application/json'
    };
  }


  static String END_POINT = 'http://128.199.78.111:3030';
  //authentication
  static String PATH_REGSITER = '/users';
  static String PATH_LOGIN = '/authentication';
  static String PATH_LOGIN_FACEBOOK = '/facebook/auth';



  // post /posts?$skip=0&$limit=500&$sort[title]=1&$search=Magna et&objectType=page
  static String PATH_POSTS = "/posts?\$skip=0&\$limit=500&\$sort[title]=1&\$search=Magna et&objectType=page";
  static String PATH_POST_DETAIL = "/posts";
  static String PATH_POST_CREATE = "/posts";


  // Coupons
static String PATH_COUPONS = "/coupons";
static String PATH_MY_COUPONS = "/my-coupons";


static String PATH_STORE_USER = "/store-users";
static String PATH_STORES = "/stores";

static String PATH_TRANSACTIONS = "/transactions";

}