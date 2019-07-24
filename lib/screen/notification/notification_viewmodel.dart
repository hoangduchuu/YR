import 'package:your_reward_user/core/base_provider/base_model.dart';
import 'package:your_reward_user/core/base_provider/view_states.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/notification.dart';
import 'package:your_reward_user/repository/notification_repo.dart';

class NotificationViewModel extends BaseModel {
  NotificationRepo _notificationRepo = injector<NotificationRepo>();

  List<NotificationModel> notifications;

  Future getNotification(String userId) async {
    setState(ViewState.Busy);
    var result = await _notificationRepo.getNotification(userId);
    this.notifications = result.right;
    notifyListeners();
    setState(ViewState.Idle);
    return notifications;
  }
}
