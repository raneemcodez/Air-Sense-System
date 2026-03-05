import 'package:airaystem/view/models/deviceandroom/roompage.dart';
import 'package:airaystem/view/rooms/bedroom.dart';
import 'package:airaystem/view/rooms/livingroom.dart';
import 'package:airaystem/view/rooms/officeroom.dart';
import 'package:airaystem/view/screen/auth/forgetpassword/verfiycodesignup.dart';
import 'package:airaystem/view/screen/onboarding.dart';
import 'package:airaystem/view/screen/settings.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/routes.dart';
import 'package:airaystem/view/models/home.dart';
import 'package:airaystem/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:airaystem/view/screen/auth/login.dart';
import 'package:airaystem/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:airaystem/view/screen/auth/signup.dart';
import 'package:airaystem/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:airaystem/view/screen/auth/success_signup.dart';
import 'package:airaystem/view/screen/auth/forgetpassword/verfiycode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetpassowrd, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoute.verfiyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),
  //home
  GetPage(name: AppRoute.home, page: () => HomePage()),
  GetPage(name: AppRoute.roomPage, page: () => RoomPage()),
  GetPage(name: AppRoute.livingRoom, page: () => LivingRoom()),
  GetPage(name: AppRoute.officeRoom, page: () => OfficeRoom()),
  GetPage(name: AppRoute.bedRoom, page: () => BedroomPage()),
  GetPage(name: AppRoute.settings, page: () => Settings()),
];
