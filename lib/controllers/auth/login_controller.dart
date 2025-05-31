
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api_services/api_services.dart';
import '../../utils/show_custom_snack.dart';

class LoginController extends GetxController {

  RxBool isLoading=false.obs;

  //--------user data for show profile----------
  RxString userName="".obs;
  RxString userEmail="".obs;


  //------------Remember checkbox--------------
  RxBool isRemember=false.obs;

  //------------showPassword for password visibility or off-
  RxBool isPasswordHidden =true.obs;



  final formKey=GlobalKey<FormState>();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();



  //-------------User data loading-------------
  Future userLoading() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    userEmail.value = prefs.getString("userEmail")?? "Unknown Email";
    userName.value = prefs.getString("userName")?? "Unknown Name";
  }

  //---------------for password show and off ----------
  void togglePasswordVisibility(){
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  //-----------validation with login---------
  Future<void> loginWithValidate() async{

      if(formKey.currentState!.validate()){
        if(isRemember.value){
          isLoading.value =true;
          login();
        }
        //---------if is remember not selected then show it---
        else{
          showCustomSnack(
            title: "Info",
            message: "Remember me is not checked!",
            icon: Icons.info_outline,
            bgColor: Colors.blueAccent,
          );
        }

      }
  }

  //------------login function-------
  Future login() async {
    try{
      //---------Api service initialize------
      ApiService api=ApiService();

      //--------api call ----
      final allUser = await api.getData();

      //----------if all user not null and allUser type list ------
      if(allUser != null && allUser is List){
        //-------------user data find-------
        final matchUser=allUser.firstWhere((user)=>
        user["email"]==emailController.text.trim() &&
            user["password"]==passwordController.text.trim(),
            orElse: ()=> null
        );

        //--------when user data match----
        if(matchUser != null){
          SharedPreferences prefs= await SharedPreferences.getInstance();
          await prefs.setString("userName", matchUser["name"]);
          await prefs.setString("userEmail", matchUser["email"]);
          //------------login status store-----------
          await prefs.setBool("isLogin", true);

          //------------user login data diye profile update hobe----
          userLoading();

          //-------------show snack bar when login successful-------
          showCustomSnack(
            title: "Success",
            message: "You are logged in!",
            icon: Icons.check_circle_outline,
            bgColor: Colors.green,
          );

          //---------When user data match then go to dashboard screen--------
          Get.offNamed("/dashboardScreen");

        }
        //---------when user password and email don't match------
        else{
          showCustomSnack(
            title: "Login Failed",
            message: "Wrong email or password!",
            icon: Icons.warning_amber_rounded,
            bgColor: Colors.redAccent,
          );
        }

      }

      //---------all user empty
      else{
        showCustomSnack(
          title: "Error",
          message: "Something went wrong! Please try again.",
          icon: Icons.error_outline,
          bgColor: Colors.redAccent,
        );
      }
    }
    catch(e){
      showCustomSnack(
        title: "Error",
        message: "Login Error: $e.",
        icon: Icons.error_outline,
        bgColor: Colors.redAccent,
      );
    }
    finally{
      isLoading.value =false;
    }

  }

}


