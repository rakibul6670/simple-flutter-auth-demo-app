import 'package:flutter_autho_demo/routes/app_routes.dart';
import 'package:flutter_autho_demo/screen/auth/login_screen.dart';
import 'package:flutter_autho_demo/screen/auth/signup_screen.dart';
import 'package:flutter_autho_demo/screen/dashboard_screen/dashboard_screen.dart';
import 'package:flutter_autho_demo/screen/intro/splash_screen.dart';
import 'package:get/get.dart';
import '../screen/intro/intro_screen.dart';



class AppPages{

  static final routes =[

    GetPage(name: AppRoutes.initialScreen, page: () => SplashScreen()),
    GetPage(name: AppRoutes.loginScreen, page: ()=> LoginScreen()),
    GetPage(name: AppRoutes.signupScreen, page: ()=> SignupScreen()),
    GetPage(name: AppRoutes.dashboardScreen, page: ()=> DashboardScreen()),
    GetPage(name: AppRoutes.introScreen, page: ()=>IntroScreen())
  ];

}