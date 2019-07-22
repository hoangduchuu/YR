import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class GetMemberShipCardsRequest extends HomeEvent {
  String userId;

  GetMemberShipCardsRequest(this.userId);
}

class GetTransactionRequest extends HomeEvent {
  String userId;

  GetTransactionRequest(this.userId);
}

class GetPostsRequest extends HomeEvent {
  GetPostsRequest();

  @override
  String toString() {
    return 'GetPostsRequest{}';
  }
}
