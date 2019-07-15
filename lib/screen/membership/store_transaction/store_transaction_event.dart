import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

//class StoreTransactionEvent{
//
//}

@immutable
abstract class StoreTransactionEvent extends Equatable {
  StoreTransactionEvent([List props = const []]) : super(props);
}

class GetTransactionRequest extends StoreTransactionEvent {
  final String ownerId;

  GetTransactionRequest(this.ownerId) : super([ownerId]);
}
