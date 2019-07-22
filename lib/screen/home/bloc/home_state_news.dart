import 'package:your_reward_user/model/Post.dart';

import 'home_state.dart';

class GetPostSuccessState extends HomeState {
  final List<Post> posts;

  GetPostSuccessState({this.posts}) : super([posts]);

  @override
  String toString() {
    return 'GetPostSuccessState{}';
  }
}

class GetPostEmptyState extends HomeState {
  @override
  String toString() {
    return 'GetPostEmptyState{}';
  }
}
