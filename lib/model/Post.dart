import 'package:your_reward_user/entity/PostEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class Post {
  String title;
  String content;
  String image;

  Post({this.title, this.content, this.image});

  @override
  String toString() {
    return 'Post{title: $title, content: $content, image: $image}';
  }
}

class PostMapper extends BaseMapper<Post, PostEntity> {
  @override
  Post mapFrom(PostEntity entity) {
    Post model = Post();
    model.title = entity.title;
    model.content = entity.description;
    model.image = entity.thumbnail;
    return model;
  }

  @override
  PostEntity mapTo(Post model) {}
}
