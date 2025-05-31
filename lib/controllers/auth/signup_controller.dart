
import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/api_services/api_services.dart';
import 'package:get/get.dart';
import '../../utils/show_custom_snack.dart';

class SignupController extends GetxController{

  RxBool isRemember=false.obs;

  final formKey=GlobalKey<FormState>();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController nameController =TextEditingController();


  //-----------for password hidden or visibility
  RxBool isPasswordHidden=true.obs;

  //-----------------password toggle----------
  void togglePasswordVisibility(){
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  //---------------------Signup with validation---------
  Future signupWithValidation() async{
    if(formKey.currentState!.validate()){
      if(isRemember.value){
        signup();
      }
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


//---------------------signup------------------
  Future<dynamic> signup() async{
    try{
      ApiService api =ApiService();

      final response =api.postData({
        "name":nameController.text.trim(),
        "email": emailController.text.trim(),
        "password":passwordController.text.trim(),
      });

      if(response != null){
        showCustomSnack(
          title: "Success",
          message: "You are Sign in!",
          icon: Icons.check_circle_outline,
          bgColor: Colors.green,
        );
        //------------Navigate to login screen------------
        Get.offNamed("/loginScreen");
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