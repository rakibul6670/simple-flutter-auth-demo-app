import 'dart:async';
import 'package:flutter_autho_demo/controllers/auth/login_controller.dart';
import 'package:flutter_autho_demo/controllers/intro/intro_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashIntroController extends GetxController{

  LoginController loginController =Get.find<LoginController>();
  IntroController introController=Get.find<IntroController>();

  Future<void> splash() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //-----------Actual value load----------
    bool? isLogin= prefs.getBool("isLogin")?? false;
    bool? isIntro = prefs.getBool("isIntroSeen")?? false;

    //-----------Delay----------
    await Future.delayed(Duration(seconds: 3));

    //------------Navigation logic----------
    //-------intro not see >true
    if(!isIntro){
      Get.offNamed("/introScreen");
    }
    //-------login status >true
    else if(isLogin){
      Get.offNamed("/dashboardScreen");
    }
    //-------login status >false
    else{
      Get.offNamed("/loginScreen");
    }
  }

}