import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingHelper {
  static Future<String?> getToken() async {
    await FirebaseMessaging.instance.requestPermission();
    String? token = await FirebaseMessaging.instance.getToken();
    print("Firebase Token: $token");
    return token;
  }
}
