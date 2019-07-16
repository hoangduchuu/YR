import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/entity/GetStoreEntity.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/provider/StoreProvider.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

class StoreRepo {
  StoreProvider _provider = injector<StoreProvider>();
  StoreMapper _mapper;

  StoreRepo() {
    this._mapper = StoreMapper();
  }

  // request and mapping from entity to model
  Future<Pair<STATE, List<Store>>> getStores() async {
    try {
      var result = await _provider.getStores();
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is GetStoreEntity) {
        List<Store> stores = List<Store>();
        result.data.forEach((it) {
          stores.add(_mapper.mapFrom(it));
        });
        return Pair(STATE.SUCCESS, stores);
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }

  // request and mapping from entity to model
  Future<Pair<STATE, List<Store>>> getStoresByStoreId(String ownerId) async {
    try {
      var result = await _provider.getStoresByOwnerId(ownerId);
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is GetStoreEntity) {
        List<Store> stores = List<Store>();
        result.data.forEach((it) {
          stores.add(_mapper.mapFrom(it));
        });
        return Pair(STATE.SUCCESS, stores);
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }
}
