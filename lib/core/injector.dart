import 'package:get_it/get_it.dart';
import 'package:your_reward_user/provider/AuthProvider.dart';
import 'package:your_reward_user/provider/CouponProvider.dart';
import 'package:your_reward_user/provider/PostProvider.dart';
import 'package:your_reward_user/provider/StoreProvider.dart';
import 'package:your_reward_user/provider/TransactionProvider.dart';
import 'package:your_reward_user/provider/notification_provider.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/repository/CouponRepo.dart';
import 'package:your_reward_user/repository/StoreRepo.dart';
import 'package:your_reward_user/repository/TransactionRepo.dart';
import 'package:your_reward_user/repository/notification_repo.dart';
import 'package:your_reward_user/repository/post_repo.dart';
import 'package:your_reward_user/screen/notification/notification_viewmodel.dart';

GetIt injector = GetIt();

void setupInjector() {
  ///region repository
  injector.registerLazySingleton<AuthRepo>(() => AuthRepo());
  injector.registerLazySingleton<CouponRepo>(() => CouponRepo());
  injector.registerLazySingleton<StoreRepo>(() => StoreRepo());
  injector.registerLazySingleton<TransactionRepo>(() => new TransactionRepo());
  injector.registerLazySingleton<PostRepo>(() => new PostRepo());
  injector.registerLazySingleton<NotificationRepo>(() => new NotificationRepo());

  // region provider
  injector.registerLazySingleton<AuthProvider>(() => AuthProvider());
  injector.registerLazySingleton<CouponProvider>(() => CouponProvider());
  injector.registerLazySingleton<StoreProvider>(() => StoreProvider());
  injector.registerLazySingleton<TransactionProvider>(() => TransactionProvider());
  injector.registerLazySingleton<PostProvider>(() => new PostProvider());
  injector.registerLazySingleton<NotificationProvider>(() => new NotificationProvider());

  // provider state management

  injector.registerFactory(() => NotificationViewModel());
}
