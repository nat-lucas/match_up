// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helper/sharedprefarences.dart';

class NotificationController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      await preferencesHelper.init();
      await preferencesHelper.setString('fcm_token', fcmToken);
      print("🔁 Refreshed FCM Token: $fcmToken");
    });

    _initializeLocalNotifications();
    configureNotificationListener();
    saveTokenForiOS();
  }

  void _initializeLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("Notification clicked with payload: ${response.payload}");
      },
    );
  }

  Future<void> getAndSaveFCMToken() async {
    try {
      await _firebaseMessaging.requestPermission();

      String? fcmToken = await _firebaseMessaging.getToken();

      if (fcmToken != null) {
        await preferencesHelper.init();
        await preferencesHelper.setString('fcm_token', fcmToken);

        print("FCM Token: $fcmToken");
      } else {
        print("Failed to get FCM token.");
      }
    } catch (e) {
      print("Error getting FCM token: $e");
    }
  }

  Future<void> saveTokenForiOS() async {
    try {
      if (!GetPlatform.isIOS) {
        print("saveTokenForiOS function is being called on a non-iOS platform");
        return;
      }

      await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      print('User granted permission for notifications');

      // Wait for APNs token to be set
      String? apnsToken;
      int retries = 5;
      while (apnsToken == null && retries > 0) {
        await Future.delayed(Duration(seconds: 1));
        apnsToken = await _firebaseMessaging.getAPNSToken();
        retries--;
      }

      if (apnsToken == null) {
        print('❌ Failed to fetch APNs token after retries.');
      } else {
        print('✅ APNs Token: $apnsToken');
      }

      String? fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken != null) {
        await preferencesHelper.init();
        await preferencesHelper.setString('fcm_token', fcmToken);

        print("✅ FCM Token for iOS: $fcmToken");
      } else {
        print("❌ Failed to get FCM token on iOS.");
      }

      _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        sound: true,
        badge: true,
      );
    } catch (e) {
      print("Error in saveTokenForiOS: $e");
    }
  }

  Future<String?> getSavedFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcm_token');
  }

  void configureNotificationListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notification received:");
      print("Title: ${message.notification?.title}");
      print("Body: ${message.notification?.body}");
      print("Data: ${message.data}");

      _showLocalNotification(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notification opened:");
      print("Title: ${message.notification?.title}");
      print("Body: ${message.notification?.body}");
      print("Data: ${message.data}");
    });
  }

  void _showLocalNotification(
      {required String title, required String body}) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    await _localNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  // Future<void> fetchNotifications() async {
  //   await preferencesHelper.init();
  //   var token = preferencesHelper.getString("userToken");
  //   debugPrint("Token: $token");

  //   if (token != null) {
  //     try {
  //       final response = await NetworkCaller().getRequest(
  //         Utils.baseUrl + Utils.notification,
  //         token: token,
  //       );
  //       debugPrint("Response Status: ${response.isSuccess}");
  //       debugPrint("Response Body: ${response.responseData}");

  //       if (response.isSuccess) {
  //         final List<dynamic> jsonData = response.responseData is List<dynamic>
  //             ? response.responseData
  //             : jsonDecode(response.responseData);

  //         notificationList.value = jsonData
  //             .map((item) => NotificationData.fromJson(item))
  //             .toList()
  //             .cast<NotificationData>();

  //         debugPrint("Notifications fetched: ${notificationList.length}");
  //         debugPrint("Notifications fetched: $notificationList");
  //       } else {
  //         debugPrint("Failed to fetch notifications: ${response.responseData}");
  //       }
  //     } catch (e) {
  //       debugPrint("Error occurred while fetching notifications: $e");
  //     }
  //   } else {
  //     debugPrint("Token is null");
  //   }
  // }
}
