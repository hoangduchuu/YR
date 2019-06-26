import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/CouponEntity.dart';
import 'package:your_reward_user/entity/GetGeneralCouponEntity.dart';
import 'package:your_reward_user/entity/GetMemberShipEntity.dart';
import 'package:your_reward_user/entity/GetStoreEntity.dart';
import 'package:your_reward_user/entity/GetTransactionEntity.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class TransactionProvider {
  MyHttpClient client;

  TransactionProvider() {
    client = MyHttpClient.instance;
  }

  Future<dynamic> getAllTransactions({int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_TRANSACTIONS}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}';
    String raw =
    await client.get(url, YRService.generateHeadersWithToken(), Map());
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
