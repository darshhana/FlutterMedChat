import 'package:flutter/material.dart';
import '../presentation/android_small_one_screen/android_small_one_screen.dart';
import '../presentation/android_small_two_screen/android_small_two_screen.dart';
import '../presentation/android_small_three_screen/android_small_three_screen.dart';
import '../presentation/android_small_four_screen/android_small_four_screen.dart';
import '../presentation/android_small_five_screen/android_small_five_screen.dart';
import '../presentation/android_small_six_screen/android_small_six_screen.dart';
import '../presentation/android_small_seven_screen/android_small_seven_screen.dart';
class AppRoutes {
  static const String androidSmallOneScreen = '/android_small_one_screen';
  static const String androidSmallTwoScreen = '/android_small_two_screen';
  static const String androidSmallThreeScreen = '/android_small_three_screen';
  static const String androidSmallFourScreen = '/android_small_four_screen';
  static const String androidSmallFiveScreen = '/android_small_five_screen';
  static const String androidSmallSixScreen = '/android_small_six_screen';
  static const String androidSmallSevenScreen = '/android_small_seven_screen';
  static const String initialRoute = '/initialRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case androidSmallFourScreen:
        //as we are passing the phone number as an argument when pushing the route to this screen
        final String phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) =>
              AndroidSmallFourScreen(phoneNumber: phoneNumber),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const AndroidSmallOneScreen(),
        );
    }
  }

  static Map<String, WidgetBuilder> routes = {
    androidSmallOneScreen: (context) => const AndroidSmallOneScreen(),
    androidSmallTwoScreen: (context) => AndroidSmallTwoScreen(),
    androidSmallThreeScreen: (context) => AndroidSmallThreeScreen(),
    androidSmallFourScreen: (context) => const AndroidSmallFourScreen(phoneNumber: '',),
    androidSmallFiveScreen: (context) => AndroidSmallFiveScreen(),
    androidSmallSixScreen: (context) =>  AndroidSmallSixScreen(patientId:0),
    androidSmallSevenScreen: (context) => AndroidSmallSevenScreen(),
    initialRoute: (context) => const AndroidSmallOneScreen()
  };
}
