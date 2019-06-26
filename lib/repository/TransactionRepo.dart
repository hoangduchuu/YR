import 'package:your_reward_user/entity/GetTransactionEntity.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/provider/TransactionProvider.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';


class TransactionRepo {
  TransactionProvider _provider;
  TransactionMapper _mapper;

  TransactionRepo() {
    this._provider = new TransactionProvider();
    this._mapper = new TransactionMapper();
  }

  // request and mapping from entity to model
  Future<Pair<STATE, List<Transaction>>> getTransactions() async {
      try {
        var result = await _provider.getAllTransactions();
        if (result is ErrorEntity && result.code != null) {
          return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
        }
        if (result is GetTransactionEntity) {
          List<Transaction> transactions = List<Transaction>();
          result.data.forEach((it) {
            transactions.add(_mapper.mapFrom(it));
          });
          return Pair(STATE.SUCCESS, transactions);
        }
      } catch (e) {
        return Pair(STATE.ERROR, null, erroMsg: e.toString());
      }
  }
}
