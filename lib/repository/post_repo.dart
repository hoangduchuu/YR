import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/entity/GetPostEntity.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/model/Post.dart';
import 'package:your_reward_user/provider/PostProvider.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

class PostRepo {
  PostProvider _postProvider = injector<PostProvider>();
  PostMapper _postMapper;

  PostRepo() {
    _postMapper = PostMapper();
  }

  Future<Pair<STATE, List<Post>>> getPosts() async {
    try {
      var result = await _postProvider.getPosts();
      if (result is ErrorEntity) {
        return Pair(STATE.ERROR, null, erroMsg: result.message);
      }

      if (result != null && result is GetPostEntity) {
        List<Post> posts = List<Post>();
        result.data.forEach((it) {
          posts.add(_postMapper.mapFrom(it));
        });
        return Pair(STATE.SUCCESS, posts);
      }
      ;
    } catch (error) {
      return Pair(STATE.ERROR, null, erroMsg: error.toString());
    }
  }
}
