import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/CreatePostRequest.dart';
import 'package:your_reward_user/entity/GetPostEntity.dart';
import 'package:your_reward_user/entity/PostEntity.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class PostRepo {
  MyHttpClient client;

  PostRepo() {
    client = MyHttpClient.instance;
  }

  //register
  Future<dynamic> getPosts(String searchContent, String objectType, {int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_POSTS}?${CommonUtils.getFilterParam()}&\$search=$searchContent &objectType=$objectType';
    String raw = await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = new GetPostParser().parse(raw);
    return result;
  }

  //register
  Future<dynamic> getPostDetail(String postID) async {
    String url = '${YRService.END_POINT}${YRService.PATH_POST_DETAIL}/$postID';
    String raw = await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = new PostEntityParser().parse(raw);
    return result;
  }

  //register
  Future<dynamic> createNewPost(CreatePostRequest body) async {
    String url = '${YRService.END_POINT}${YRService.PATH_POST_CREATE}';
    String raw = await client.post(url, YRService.generateHeadersWithToken(), body.toRawJson());
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
