import 'package:your_reward_user/entity/notification/notification_entity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class NotificationModel {
  String title;
  String content;
  String status;

  @override
  String toString() {
    return 'NotificationModel{title: $title, content: $content, status: $status}';
  }
}

class NotificationMapper extends BaseMapper<NotificationModel, NotificationEntity> {
  @override
  NotificationModel mapFrom(NotificationEntity entity) {
    NotificationModel model = NotificationModel();
    model.title = entity.title;
    model.content = entity.description;
    model.status = entity.status.toString();
    return model;
  }

  @override
  NotificationEntity mapTo(NotificationModel model) {}
}
