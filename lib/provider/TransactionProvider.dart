import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/GetTransactionEntity.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class TransactionProvider {
  MyHttpClient client;

  TransactionProvider() {
    client = MyHttpClient.instance;
  }

  Future<dynamic> getAllTransactions(String userId, {int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_TRANSACTIONS}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}';
    Map<String, String> params = Map();
    params['userId'] = userId;
    String raw = await client.get(url, YRService.generateHeadersWithToken(), params);
    var result = GetTransactionParser().parse(raw);
    return result;
  }

  Future<dynamic> getTransactionAtStore(String userId, String ownerId, {int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_TRANSACTIONS}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}';

    // FIXME : UGENT : hỏi lại api này
    Map<String, String> params = Map();
    params['ownerId'] = ownerId;
    params['userId'] = userId;

    String raw = await client.get(url, YRService.generateHeadersWithToken(), params);
    var result = GetTransactionParser().parse(raw);
    return result;
  }
}

class GetTransactionParser extends BaseParser<GetTransactionEntity> {
  @override
  GetTransactionEntity parseInfo(Map<String, dynamic> raw) {
    return GetTransactionEntity.fromJson(raw);
  }
}
