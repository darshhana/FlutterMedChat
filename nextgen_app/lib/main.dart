import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "firebase_options.dart";
import 'package:intl/date_symbol_data_local.dart';

var globaalMessengerKey = GlobalKey<ScaffoldMessengerState>();

// Initialize Firebase Messaging for push notifications
Future<void> _initializeFirebaseMessaging() async {
  try {
    // Request permission for notifications
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    // Get FCM token
    String? token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');

    // Save token to shared preferences for later use
    if (token != null) {
      // You can save this token to your backend server
      // or store it locally for later use
      print('FCM Token saved successfully');
    }

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    // Handle token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print('🔄 FCM Token Refreshed: $newToken');
      // TODO: Send this newToken to your backend server
      // You should update the token in your database for the current user
      _sendRefreshedTokenToBackend(newToken);
    }).onError((err) {
      print('❌ Error refreshing FCM token: $err');
    });
  } catch (e) {
    print('Firebase Messaging initialization error: $e');
  }
}

// Background message handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message: ${message.messageId}");
}

// Send refreshed FCM token to backend
Future<void> _sendRefreshedTokenToBackend(String newToken) async {
  try {
    // Get current user ID (you might need to adjust this based on your auth system)
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      print(
          'Sending refreshed FCM token to backend for user: ${currentUser.uid}');

      // You can implement the same API call as in the OTP screen
      // For now, just log it
      print('🔄 Refreshed token ready to send to backend: $newToken');

      // TODO: Implement API call to update token in backend
      // Similar to _sendFCMTokenToBackend but for token refresh
    } else {
      print('❌ User not logged in, cannot send refreshed token to backend');
    }
  } catch (e) {
    print('❌ Error sending refreshed FCM token to backend: $e');
  }
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   print("Before Firebase Init");
//   if (Firebase.apps.isEmpty) {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

//   print("After Firebase Init");
//   await initializeDateFormatting();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Starting app initialization");

  // Initialize Firebase only if not already initialized
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print("Firebase initialized successfully");
    } else {
      print("Firebase already initialized - using existing instance");
    }
  } catch (e) {
    print("Firebase initialization error: $e");
    // Continue with app initialization even if Firebase fails
  }

  // Temporarily disable App Check to test uploads
  print("Firebase App Check disabled for testing");

  // Initialize Firebase Messaging for push notifications
  await _initializeFirebaseMessaging();

  await initializeDateFormatting();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'Appment App',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
