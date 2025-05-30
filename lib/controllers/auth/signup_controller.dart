
import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/api_services/api_services.dart';
import 'package:get/get.dart';
import '../../utils/show_custom_snack.dart';

class SignupController extends GetxController{

  RxBool isRemember=false.obs;

  //-----------for password hidden or visibility
  RxBool isPasswordHidden=true.obs;

  //-----------------password toggle
  void togglePasswordVisibility(){
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  Future signup(Map<String,dynamic> userData) async{
    try{
      ApiService api =ApiService();

      final response =api.postData(userData);
      if(response != null){
        showCustomSnack(
          title: "Success",
          message: "You are Sign in!",
          icon: Icons.check_circle_outline,
          bgColor: Colors.green,
        );

      }
      else{
        showCustomSnack(
          title: "Signup Failed",
          message: "Invalid email or password or name !",
          icon: Icons.warning_amber_rounded,
          bgColor: Colors.redAccent,
        );
      }

    }
    catch(e){
      Get.snackbar("Error", "$e");
    }


  }

}