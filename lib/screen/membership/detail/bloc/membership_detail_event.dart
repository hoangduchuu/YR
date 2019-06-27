
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberShipDetailEvent extends Equatable {
  MemberShipDetailEvent([List props = const []]) : super(props);
}

class GetMemberShipDetailEvent extends MemberShipDetailEvent {
  String ownerId;

  GetMemberShipDetailEvent(this.ownerId);

}

class GetVoucherEvent extends MemberShipDetailEvent{
  String storeId;

  GetVoucherEvent(this.storeId);
}