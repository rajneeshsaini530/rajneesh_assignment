
import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';

class FCMService {
  static final FCMService _fcmService = FCMService._internal();

  factory FCMService() {
    return _fcmService;
  }

  FCMService._internal();

  FirebaseMessaging? _messaging;

  init() {
    _messaging = FirebaseMessaging.instance;
  }

  Future<String> getFCMToken() async {
    String token = '';
    await _messaging!.getToken().then((value) {
      token = value!;
    });
    print('============FCM Token ---> $token');
    return token;
  }

  showForGroundMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      // final data = message.data;
      _handleNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessageClick(message);
    });
  }

  _handleNotification(RemoteMessage remoteMessage) {
    LocalNotificationService().showNotification(
      title: remoteMessage.notification!.title!,
      message: remoteMessage.notification!.body!,
      payload: remoteMessage.data,
      // payload: {"test":"test"},
    );
  }

  _handleMessageClick(RemoteMessage message) {
    ///Handle all message notification click
    final data = message.data;
    ///TODo: handle notification click event here
  }
}
