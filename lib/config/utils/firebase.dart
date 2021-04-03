import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'app_name_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.max,
);

Future handleFirebaseConfig(RemoteMessage? backgroundMessage) async {
// Init Firebase.
  await Firebase.initializeApp();

// Declare local notification plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

// Android notification settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');

// iOS notification settings
// final IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

// Init local notification plugin
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);

// Handle notification channel on Android
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

// Firebase instance
  FirebaseMessaging messaging = FirebaseMessaging.instance;

// Request for permissions
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (backgroundMessage != null) {
    displayNotification(flutterLocalNotificationsPlugin, backgroundMessage);
  } else {
// Notification listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      displayNotification(flutterLocalNotificationsPlugin, message);
    });
  }
}

void displayNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    RemoteMessage message) {
  AndroidNotification? android = message.notification?.android;
  flutterLocalNotificationsPlugin.show(
    int.parse(message.data['id']),
    message.data['title'],
    message.data['body'],
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channel.description,
      ),
    ),
  );
}

Future selectNotification(String? a) async {
  // Do something with the notification click
}

// JSON to be returned by the backend server
// {
//   "to":"caBqmfmeSGqm1a3Kbhp2TL:APA91bEwHf50GxfBo68Ur7oxUpeX-nx4f2bsHbZaqHTlPg5iqwgRx8Civ5kYLNagNead7VjlZ_sNuZg5upBomTjbNjUXoeUdekrw-QXXkVzh5jssmQG0XvIlvM1ijhX46gQxOsMmKgEl",
//   "data":{
//     "id": "123",
//            "title":"Message",
//         "body":"This is an FCM notification message!"
//       },
//     "android": {
//     "priority": "high"
//   },
//   "apns": {
//     "payload": {
//       "aps": {
//         "contentAvailable": true
//       }
//     },
//     "headers": {
//       "apns-push-type": "background",
//       "apns-priority": "5", 
//       "apns-topic": "io.flutter.plugins.firebase.messaging"
//     }
//   }
// }