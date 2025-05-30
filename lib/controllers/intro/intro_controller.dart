import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/show_custom_snack.dart';


class IntroController extends GetxController{


  Future setIntroSeen() async{
    try{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      await prefs.setBool("isIntroSeen", true);
    }
    catch(e){
      showCustomSnack(
        title: "Error",
        message: "SetIntro failed : $e",
        icon: Icons.error_outline,
        bgColor: Colors.redAccent,
      );
    }
  }

}