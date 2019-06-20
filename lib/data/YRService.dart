import 'dart:io';
class YRService{
  static const DEFAULT_HEADER = {
    HttpHeaders.contentTypeHeader : 'application/json'
  };
static String myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6ImFjY2VzcyJ9.eyJ1c2VySWQiOiI1YzlmNjk5NmMzZDM5MTA0NzY0M2VjYzAiLCJfaWQiOiI1YzlmNjk5NmMzZDM5MTA0NzY0M2VjYzAiLCJnZW5kZXIiOiJtYWxlIiwic3RhdHVzIjoiYWN0aXZlIiwicm9sZSI6ImFkbWluIiwiZnVsbG5hbWUiOiJodW5ncGhhbWJtcyIsImVtYWlsIjoiaHVuZ3BoYW1ibXNAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhZGRyZXNzIjoiIiwidGh1bWJuYWlsIjoiaHR0cDovLzEyOC4xOTkuNzguMTExOjMwMzAvbG9hZC9pbWFnZS81YzllMmU1NjYxOTAzZTA3NDlhZGMzOGQiLCJzdG9yZUlkIjoiIiwicGFzc3dvcmQiOiIkMmEkMTMkSWt6QVFhT2JHdFNmbHJXcmJpbnpvZUVOQUNYU2wwUDRaQUdoakY1bzlYWERxRGJ0ckhPS3kiLCJjcmVhdGVkQXQiOiIyMDE5LTAzLTMwVDEzOjA1OjI2Ljg0OVoiLCJ1cGRhdGVkQXQiOiIyMDE5LTA0LTAzVDE2OjM5OjQ0LjMxNVoiLCJfX3YiOjAsInBvaW50cyI6MTYwLCJpYXQiOjE1NjEwMjA0NzksImV4cCI6MTU2MTEwNjg3OSwiYXVkIjoiaHR0cHM6Ly95b3VyZG9tYWluLmNvbSIsImlzcyI6ImZlYXRoZXJzIiwic3ViIjoiYW5vbnltb3VzIiwianRpIjoiYzM3M2ZiZmMtYzk0ZS00MzZlLWFlNTItNjViOWVmNWI0OTcxIn0.KU8RBeYCEyJO3uBxhpC60Yk-FK427lMO6oXzPt7T2H4";
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

}