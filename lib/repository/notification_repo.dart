import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/entity/notification/get_notification_entity.dart';
import 'package:your_reward_user/model/notification.dart';
import 'package:your_reward_user/provider/notification_provider.dart';
import 'package:your_reward_user/utils/pair.dart';

class NotificationRepo {
  NotificationProvider _notificationProvider = injector<NotificationProvider>();
  NotificationMapper _mapper = NotificationMapper();

  Future<Pair<bool, List<NotificationModel>>> getNotification(String userId) async {
    try {
      var result = await _notificationProvider.getNotification(userId);
      if (result is ErrorEntity) {
        return Pair(false, null, erroMsg: result.message.toString());
      }
      if (result is GetNotificationEntity) {
        List<NotificationModel> models = List<NotificationModel>();
        result.data.forEach((it) {
          models.add(_mapper.mapFrom(it));
        });
        return Pair(true, models);
      }
      return Pair(false, null, erroMsg: "Other exeption #01;");
    } catch (e) {
      return Pair(false, null, erroMsg: e.toString());
    }
  }
}
