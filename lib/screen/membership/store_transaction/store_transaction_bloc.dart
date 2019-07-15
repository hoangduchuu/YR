import 'package:bloc/bloc.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/repository/TransactionRepo.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_event.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_state.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

class TransactionStoreBloc
    extends Bloc<StoreTransactionEvent, BaseBlocState> {
  TransactionRepo _transactionRepo = injector<TransactionRepo>();


  @override
  StoreTransactionBaseState get initialState => InitialState();

  @override
  Stream<BaseBlocState> mapEventToState(
      StoreTransactionEvent event) async* {
    if (event is GetTransactionRequest) {
      yield* _handleGetTransactionRequest(event.ownerId);
    }
  }

  Stream<BaseBlocState> _handleGetTransactionRequest(
      String ownerId) async* {
    yield UIControlState.showLoading();
    try {
      Pair<STATE, List<Transaction>> result =
          await _transactionRepo.getTransactionOfStore(ownerId);
      if (result.left == STATE.ERROR) {
        yield UIControlState.showError(result.erroMsg);
      } else if (result.right.isEmpty) {
        yield OnGetTransactionSuccess(transactions: List());
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetTransactionSuccess(transactions: result.right);
      }
    } catch (e) {
      yield UIControlState.showError(e.erroMsg);
    }
  }
}
