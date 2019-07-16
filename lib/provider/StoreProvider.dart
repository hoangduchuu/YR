import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/GetStoreEntity.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class StoreProvider {
  MyHttpClient client;

  StoreProvider() {
    client = MyHttpClient.instance;
  }

  Future<dynamic> getStores({int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_STORES}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}';
    String raw = await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = GetStoresParser().parse(raw);
    return result;
  }

  Future<dynamic> getStoresByOwnerId(String ownerId, {int limit = 200, int skip = 0}) async {
    Map<String, String> params = Map<String, String>();
    params['ownerId'] = ownerId;

    String url =
        '${YRService.END_POINT}${YRService.PATH_STORES}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}';
    String raw = await client.get(url, YRService.generateHeadersWithToken(), params);
    var result = GetStoresParser().parse(raw);
    return result;
  }
}

class GetStoresParser extends BaseParser<GetStoreEntity> {
  @override
  GetStoreEntity parseInfo(Map<String, dynamic> raw) {
    return GetStoreEntity.fromJson(raw);
  }
}
