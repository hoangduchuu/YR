import 'dart:convert';

import 'package:your_reward_user/model/GetPostEntity.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'YRService.dart';
import 'base/BaseParser.dart';

class PostRepo {
  MyHttpClient client;

  PostRepo() {
    client = MyHttpClient();
  }

  //register
  Future<dynamic> getPosts() async {
    String url = '${YRService.END_POINT}${YRService.demo}';
    String raw = await client.get(url, YRService.generateHeadersWithToken("eyJhbGciOiJIUzI1NiIsInR5cCI6ImFjY2VzcyJ9.eyJ1c2VySWQiOiI1YzlmNjk5NmMzZDM5MTA0NzY0M2VjYzAiLCJfaWQiOiI1YzlmNjk5NmMzZDM5MTA0NzY0M2VjYzAiLCJnZW5kZXIiOiJtYWxlIiwic3RhdHVzIjoiYWN0aXZlIiwicm9sZSI6ImFkbWluIiwiZnVsbG5hbWUiOiJodW5ncGhhbWJtcyIsImVtYWlsIjoiaHVuZ3BoYW1ibXNAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhZGRyZXNzIjoiIiwidGh1bWJuYWlsIjoiaHR0cDovLzEyOC4xOTkuNzguMTExOjMwMzAvbG9hZC9pbWFnZS81YzllMmU1NjYxOTAzZTA3NDlhZGMzOGQiLCJzdG9yZUlkIjoiIiwicGFzc3dvcmQiOiIkMmEkMTMkSWt6QVFhT2JHdFNmbHJXcmJpbnpvZUVOQUNYU2wwUDRaQUdoakY1bzlYWERxRGJ0ckhPS3kiLCJjcmVhdGVkQXQiOiIyMDE5LTAzLTMwVDEzOjA1OjI2Ljg0OVoiLCJ1cGRhdGVkQXQiOiIyMDE5LTA0LTAzVDE2OjM5OjQ0LjMxNVoiLCJfX3YiOjAsInBvaW50cyI6MTYwLCJpYXQiOjE1NjA5MTI1NTcsImV4cCI6MTU2MDk5ODk1NywiYXVkIjoiaHR0cHM6Ly95b3VyZG9tYWluLmNvbSIsImlzcyI6ImZlYXRoZXJzIiwic3ViIjoiYW5vbnltb3VzIiwianRpIjoiYmQ1YzFiYWUtY2FjMC00MDgzLWFiYjItY2VjZGM1YWE4YzA1In0.FHSMe_VMtp7TBBZpui6YqPVJmllKVIgYDFZOgewoTdE"), Map());
    var result = new GetPostParser().parse(raw);
    return result;
  }
}

class GetPostParser extends BaseParser<GetPostEntity> {
  @override
  GetPostEntity parseInfo(Map<String, dynamic> raw) {
    return GetPostEntity.fromJson(raw);
  }
}
