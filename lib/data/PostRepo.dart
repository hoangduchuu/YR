import 'dart:convert';

import 'package:your_reward_user/model/CreatePostRequest.dart';
import 'package:your_reward_user/model/GetPostEntity.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/model/PostEntity.dart';
import 'YRService.dart';
import 'base/BaseParser.dart';

class PostRepo {
  MyHttpClient client;

  PostRepo() {
    client = MyHttpClient.instance;
  }

  //register
  Future<dynamic> getPosts() async {
    String url = '${YRService.END_POINT}${YRService.PATH_POSTS}';
    String raw = await client.get(
        url,
        YRService.generateHeadersWithToken(
            "eyJhbGciOiJIUzI1NiIsInR5cCI6ImFjY2VzcyJ9.eyJ1c2VySWQiOiI1YzlmNjk5NmMzZDM5MTA0NzY0M2VjYzAiLCJfaWQiOiI1YzlmNjk5NmMzZDM5MTA0NzY0M2VjYzAiLCJnZW5kZXIiOiJtYWxlIiwic3RhdHVzIjoiYWN0aXZlIiwicm9sZSI6ImFkbWluIiwiZnVsbG5hbWUiOiJodW5ncGhhbWJtcyIsImVtYWlsIjoiaHVuZ3BoYW1ibXNAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhZGRyZXNzIjoiIiwidGh1bWJuYWlsIjoiaHR0cDovLzEyOC4xOTkuNzguMTExOjMwMzAvbG9hZC9pbWFnZS81YzllMmU1NjYxOTAzZTA3NDlhZGMzOGQiLCJzdG9yZUlkIjoiIiwicGFzc3dvcmQiOiIkMmEkMTMkSWt6QVFhT2JHdFNmbHJXcmJpbnpvZUVOQUNYU2wwUDRaQUdoakY1bzlYWERxRGJ0ckhPS3kiLCJjcmVhdGVkQXQiOiIyMDE5LTAzLTMwVDEzOjA1OjI2Ljg0OVoiLCJ1cGRhdGVkQXQiOiIyMDE5LTA0LTAzVDE2OjM5OjQ0LjMxNVoiLCJfX3YiOjAsInBvaW50cyI6MTYwLCJpYXQiOjE1NjA5MTI1NTcsImV4cCI6MTU2MDk5ODk1NywiYXVkIjoiaHR0cHM6Ly95b3VyZG9tYWluLmNvbSIsImlzcyI6ImZlYXRoZXJzIiwic3ViIjoiYW5vbnltb3VzIiwianRpIjoiYmQ1YzFiYWUtY2FjMC00MDgzLWFiYjItY2VjZGM1YWE4YzA1In0.FHSMe_VMtp7TBBZpui6YqPVJmllKVIgYDFZOgewoTdE"),
        Map());
    var result = new GetPostParser().parse(raw);
    return result;
  }

  //register
  Future<dynamic> getPostDetail(String postID) async {
    String url = '${YRService.END_POINT}${YRService.PATH_POST_DETAIL}/$postID';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken("x"), Map());
    var result = new PostEntityParser().parse(raw);
    return result;
  }

  //register
  Future<dynamic> createNewPost(CreatePostRequest body) async {
    String url = '${YRService.END_POINT}${YRService.PATH_POST_CREATE}';
    String raw = await client.post(
        url, YRService.generateHeadersWithToken("x"), body.toRawJson());
    var result = new PostEntityParser().parse(raw);
    return result;
  }
}

class GetPostParser extends BaseParser<GetPostEntity> {
  @override
  GetPostEntity parseInfo(Map<String, dynamic> raw) {
    return GetPostEntity.fromJson(raw);
  }
}

class PostEntityParser extends BaseParser<PostEntity> {
  @override
  PostEntity parseInfo(Map<String, dynamic> raw) {
    return PostEntity.fromJson(raw);
  }
}
