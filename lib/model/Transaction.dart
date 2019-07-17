import 'package:your_reward_user/entity/TransactionEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class Transaction {
  String time;
  String storeLocation;
  int point;
  int price;
  String logo;

//TODO huu: re-map data format
}

class TransactionMapper extends BaseMapper<Transaction, TransactionEntity> {
  @override
  Transaction mapFrom(TransactionEntity entity) {
    Transaction model = Transaction();
    model.price = entity.amt;
    model.point = entity.points;
    model.storeLocation = entity.store != null ? entity.store.address : "unknown";
    model.logo = entity.store != null ? entity.store.thumbnail : '';
    model.time = entity.createdAt.toString();
    return model;
  }

  @override
  TransactionEntity mapTo(Transaction model) {
    return null;
  }
}
