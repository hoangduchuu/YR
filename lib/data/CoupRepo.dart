import 'dart:convert';

import 'package:your_reward_user/model/CouponEntity.dart';
import 'package:your_reward_user/model/CreatePostRequest.dart';
import 'package:your_reward_user/model/GetGeneralCouponEntity.dart';
import 'package:your_reward_user/model/GetPostEntity.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/model/PostEntity.dart';
import 'PostRepo.dart';
import 'YRService.dart';
import 'base/BaseParser.dart';

class CouponRepo {
  MyHttpClient client;

  CouponRepo() {
    client = MyHttpClient.instance;
  }

  Future<dynamic> getCoupons() async {
    String url = '${YRService.END_POINT}${YRService.PATH_COUPONS}';
    String raw =
        await client.get(url, YRService.generateHeadersWithToken(""), Map());
    var result = new GetCouponParser().parse(raw);
    return result;
  }

  Future<dynamic> getCouponDetails(String couponId) async {
    String url = '${YRService.END_POINT}${YRService.PATH_COUPONS}/$couponId';
    String raw =
    await client.get(url, YRService.generateHeadersWithToken(""), Map());
    var result = new GetCouponDetaiParser().parse(raw);
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