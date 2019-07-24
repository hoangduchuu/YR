import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/data/base/BaseParser.dart';
import 'package:your_reward_user/data/base/MyHttpClient.dart';
import 'package:your_reward_user/entity/notification/get_notification_entity.dart';

class NotificationProvider {
  MyHttpClient client;

  NotificationProvider() {
    client = MyHttpClient.instance;
  }

  Future<dynamic> getNotification(String userId) async {
    String url = '${YRService.END_POINT}${YRService.PATH_NOTIFICATION}';
    Map<String, String> params = new Map();
    params['userId'] = userId;
    String raw = await client.get(url, YRService.generateHeadersWithToken(), params);
    GetNotificationEntity result = GetNotificationParser().parse(raw);
    return result;
  }
}

class GetNotificationParser extends BaseParser<GetNotificationEntity> {
  @override
  GetNotificationEntity parseInfo(Map<String, dynamic> raw) {
    return GetNotificationEntity.fromJson(raw);
  }
}
