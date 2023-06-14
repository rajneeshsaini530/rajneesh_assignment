import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rajneesh_assignment/utils/services/fcm_service.dart';

class HomeViewModel extends GetxController {
  final String serverKey =
      'AAAAVIpe3lA:APA91bH7Kq9YPu3eqIiOIST8yQAnGlHB4GtgK7PDx5s0kG452ia_FwxlIa0xEyTPAbrsBTsODXfIcB840d1lOL-8duIQObbSvShxsgA134HIV2M7geJBIQX_4MUrv8Om5xUeRfW_vKqh';
  final String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

  @override
  void onInit() {
    super.onInit();
    FCMService().getFCMToken().then((value) {
      sendNotification(value);
    });
  }

  sendNotification(String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    Map<String, dynamic> notificationPayload = {
      'notification': {
        'title': 'Welcome to home.',
        'body': 'This is a Test notification.',
      },
      'priority': 'high',
      'data': {
        'title': 'Welcome to home.',
        'body': 'You have successfully completed Authentication flow.',
      },
      'to': token,
    };

    final response = await http.post(Uri.parse(fcmEndpoint),
        headers: headers, body: jsonEncode(notificationPayload));

    print('Notification sent successfully${response.body}');
    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Notification sending failed with status: ${response.statusCode}');
    }
  }
}
