

import 'package:get/route_manager.dart';
import 'package:match_up/feature/auth/screen/login.dart';
import 'package:match_up/feature/onboarding/screen/onboarding.dart';
import 'package:match_up/feature/splash/screen/splash.dart';

class Approute {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String onboarding = "/onboarding";
  static final List<GetPage> page = [
    GetPage(name: splash, page: () => Splash()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: onboarding, page: () => Onboarding()),
  ];
}
