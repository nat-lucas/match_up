import 'package:get/route_manager.dart';
import 'package:match_up/feature/auth/screen/forgot_password.dart';
import 'package:match_up/feature/auth/screen/login.dart';
import 'package:match_up/feature/auth/screen/sign_up.dart';
import 'package:match_up/feature/home/screen/live_sport.dart';
import 'package:match_up/feature/nav_bar/screen/nav_bar.dart';
import 'package:match_up/feature/onboarding/screen/onboarding.dart';
import 'package:match_up/feature/select_sport/screen/choose_sport.dart';
import 'package:match_up/feature/select_sport/screen/select_team.dart';
import 'package:match_up/feature/setting/screen/contact_us.dart';
import 'package:match_up/feature/setting/screen/edit_team.dart';
import 'package:match_up/feature/setting/screen/help_and_support.dart';
import 'package:match_up/feature/setting/screen/personal_info.dart';
import 'package:match_up/feature/splash/screen/splash.dart';
import 'package:match_up/feature/subcription/screen/subcription.dart';

class Approute {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String onboarding = "/onboarding";
  static const String singup = "/signup";
  static const String forgot = '/forgot';
  static const String subcription = '/subcription';
  static const String chose = "/chose";
  static const String selectTeam = '/selectTeam';
  static const String navbar = '/navbar';
  static const String livescore = '/livescore';
  static const String personalinfo = '/personalinfo';
  static const String editTeam = '/editTeam';
  static const String contactUs = '/contactUs';
  static const String help = '/help';
  static final List<GetPage> page = [
    GetPage(name: help, page: () => HelpAndSupport()),
    GetPage(name: contactUs, page: () => ContactUs()),
    GetPage(name: personalinfo, page: () => PersonalInfo()),
    GetPage(name: navbar, page: () => NavBar()),
    GetPage(name: selectTeam, page: () => SelectTeam()),
    GetPage(name: splash, page: () => Splash()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: onboarding, page: () => Onboarding()),
    GetPage(name: singup, page: () => SignUp()),
    GetPage(name: forgot, page: () => ForgotPassword()),
    GetPage(name: subcription, page: () => Subcription()),
    GetPage(name: chose, page: () => ChooseSport()),
    GetPage(name: livescore, page: () => LiveSport()),
    GetPage(name: editTeam, page: () => EditTeam())
  ];
}
