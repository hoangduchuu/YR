import 'package:bloc/bloc.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/repository/StoreRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBLoc extends Bloc<HomeEvent, HomeState> {
  StoreRepo _storeRepo;

  HomeBLoc() {
    this._storeRepo = StoreRepo();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetStoreRequest) {
      yield* _handleHomeRequest();
    }
  }

  @override
  HomeState get initialState => GetStoresState.isLoading();

  Stream<HomeState> _handleHomeRequest() async* {
    yield GetStoresState.isLoading();
    try {
      Pair<STATE, List<Store>> result = await _storeRepo.getStores();
      if (result.left == STATE.ERROR) {
        yield GetStoresState.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetStoresState.empty();
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetStoresSuccess(stores: result.right);
      }
    } catch (e) {
      yield GetStoresState.isError(errMsg: e.toString());
    }
  }
}
