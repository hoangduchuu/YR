

import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/CouponEntity.dart';
import 'package:your_reward_user/entity/GetGeneralCouponEntity.dart';
import 'package:your_reward_user/entity/GetMemberShipEntity.dart';
import 'package:your_reward_user/entity/GetStoreEntity.dart';
import 'package:your_reward_user/entity/GetTransactionEntity.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class CouponRepo {
  MyHttpClient client;

  CouponRepo() {
    client = MyHttpClient.instance;
  }

  Future<dynamic> getCoupons() async {
    String url = '${YRService.END_POINT}${YRService.PATH_COUPONS}';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = new GetCouponParser().parse(raw);
    return result;
  }

  Future<dynamic> getCouponDetails(String couponId) async {
    String url = '${YRService.END_POINT}${YRService.PATH_COUPONS}/$couponId';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = new GetCouponDetaiParser().parse(raw);
    return result;
  }

  Future<dynamic> getMemberShipCards(String userId,
      {int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_STORE_USER}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}&userId=$userId';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = GetMemberShipCardParser().parse(raw);
    return result;
  }

  Future<dynamic> getStores(String ownerId,
      {int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_STORES}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}&userId=$ownerId';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = GetStoresParser().parse(raw);
    return result;
  }

  Future<dynamic> getTransactionByStoreId(String storeID,
      {int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_TRANSACTIONS}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}&ownerId=$storeID';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = GetTransactionParser().parse(raw);
    return result;
  }

  Future<dynamic> getAllTransactions({int limit = 200, int skip = 0}) async {
    String url =
        '${YRService.END_POINT}${YRService.PATH_TRANSACTIONS}?${CommonUtils.getFilterParam(limit: limit, skip: skip)}';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = GetTransactionParser().parse(raw);
    return result;
  }

  Future<dynamic> getCouponsOfUser({int limit = 200, int skip = 0}) async {
    String url = '${YRService.END_POINT}${YRService.PATH_MY_COUPONS}?${CommonUtils.getFilterParam(limit: limit,skip: skip)}';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = new GetCouponParser().parse(raw);
    return result;
  }
  Future<dynamic> getCouponDetailById(String couponId) async {
    String url = '${YRService.END_POINT}${YRService.PATH_MY_COUPONS}/$couponId';
    String raw =
    await client.get(url, YRService.generateHeadersWithToken(), Map());
    var result = CouponEntity.fromRawJson(raw);
    return result;
  }
}

class GetCouponParser extends BaseParser<GetGeneralCouponEntity> {
  @override
  GetGeneralCouponEntity parseInfo(Map<String, dynamic> raw) {
    return GetGeneralCouponEntity.fromJson(raw);
  }
}

class GetCouponDetaiParser extends BaseParser<CouponEntity> {
  @override
  CouponEntity parseInfo(Map<String, dynamic> raw) {
    return CouponEntity.fromJson(raw);
  }
}

class GetMemberShipCardParser extends BaseParser<GetMemberShipEntity> {
  @override
  GetMemberShipEntity parseInfo(Map<String, dynamic> raw) {
    return GetMemberShipEntity.fromJson(raw);
  }
}

class GetStoresParser extends BaseParser<GetStoreEntity> {
  @override
  GetStoreEntity parseInfo(Map<String, dynamic> raw) {
    return GetStoreEntity.fromJson(raw);
  }
}

class GetTransactionParser extends BaseParser<GetTransactionEntity> {
  @override
  GetTransactionEntity parseInfo(Map<String, dynamic> raw) {
    return GetTransactionEntity.fromJson(raw);
  }
}
