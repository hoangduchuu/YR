import 'package:bloc/bloc.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/repository/TransactionRepo.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_event.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_state.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

class TransactionStoreBloc
    extends Bloc<StoreTransactionEvent, StoreTransactionBaseState> {
  TransactionRepo _transactionRepo = injector<TransactionRepo>();


  @override
  StoreTransactionBaseState get initialState => InitialState();

  @override
  Stream<StoreTransactionBaseState> mapEventToState(
      StoreTransactionEvent event) async* {
    if (event is GetTransactionRequest) {
      yield* _handleGetTransactionRequest(event.ownerId);
    }
  }

  Stream<StoreTransactionBaseState> _handleGetTransactionRequest(
      String ownerId) async* {
    yield GetTransactionState.isLoading();
    try {
      Pair<STATE, List<Transaction>> result =
          await _transactionRepo.getTransactionOfStore(ownerId);
      if (result.left == STATE.ERROR) {
        yield GetTransactionState.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetTransactionState.empty();
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetTransactionSuccess(transactions: result.right);
      }
    } catch (e) {
      yield GetTransactionState.isError(errMsg: e.toString());
    }
  }
}
