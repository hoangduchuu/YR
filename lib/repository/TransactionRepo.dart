import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/entity/GetTransactionEntity.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/provider/TransactionProvider.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'DataProvider.dart';

class TransactionRepo {
  TransactionProvider _provider = injector<TransactionProvider>();
  TransactionMapper _mapper;

  TransactionRepo() {
    this._mapper = new TransactionMapper();
  }

  // request and mapping from entity to model
  Future<Pair<STATE, List<Transaction>>> getTransactions(String userId) async {
    try {
      var result = await _provider.getAllTransactions(userId);
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

  Future<Pair<STATE, List<Transaction>>> getTransactionOfStore(String ownerId) async {
    try {
      var result = await _provider.getTransactionAtStore(DataProvider.user.id, ownerId);
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
