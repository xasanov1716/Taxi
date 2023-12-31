import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/blocs/notification_bloc/notification_bloc.dart';
import 'package:taxi_app/data/local/local_database/database_helper.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/services/local_notification_service.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //LocalDatabase.insertNews(NewsModel.fromJson(jsonDecode(message.data)))
  // await notificationMethod(message, notificationBloc);
  final NotificationModel notificationModel =
      NotificationModel.fromJson(message.data);
  await GetIt.I<DBHelper>().insertNotification(notificationModel);
  debugPrint(
      "NOTIFICATION BACKGROUND MODE: ${message.data["news_image"]} va ${message.notification!.title} in background");
}

final remoteConfig = FirebaseRemoteConfig.instance;

Future<void> initFirebase([NotificationBloc? notificationBloc]) async {
  await Firebase.initializeApp();
  setRemoteConfigs();

  debugPrint("API BASE URL: ${remoteConfig.getString("YANDEX_API_URL")}");

  String? fcmToken = await FirebaseMessaging.instance.getToken();
  debugPrint("FCM USER TOKEN: $fcmToken");
  await FirebaseMessaging.instance.subscribeToTopic("news");

  // FOREGROUND MESSAGE HANDLING.
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    debugPrint(
        "NOTIFICATION FOREGROUND MODE: ${message.data["news_image"]} va ${message.notification!.title} in foreground");
    LocalNotificationService.instance.showFlutterNotification(message);
    await notificationMethod(message, notificationBloc);
  });

  // BACkGROUND MESSAGE HANDLING
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // FROM TERMINATED MODE

  handleMessage(RemoteMessage message) async {
    debugPrint(
        "NOTIFICATION FROM TERMINATED MODE: ${message.data["news_image"]} va ${message.notification!.title} in terminated");
    LocalNotificationService.instance.showFlutterNotification(message);
    await notificationMethod(message, notificationBloc);
  }

  RemoteMessage? remoteMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  if (remoteMessage != null) {
    handleMessage(remoteMessage);
    //LocalDatabase.insertNews(NewsModel.fromJson(jsonDecode(remoteMessage.data)))
  }

  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}

Future<void> notificationMethod(
    RemoteMessage message, NotificationBloc? notificationBloc) async {
  final NotificationModel notificationModel =
      NotificationModel.fromJson(message.data);
  await GetIt.I<DBHelper>().insertNotification(notificationModel);
  if (notificationBloc != null) notificationBloc.add(UpdateNotifications());
}

Future<void> setRemoteConfigs() async {
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ),
  );
  await remoteConfig.fetchAndActivate();
}
