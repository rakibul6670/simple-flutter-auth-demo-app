import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController{


  Future<void> logout() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    //----remove user data
   await  prefs.remove("userName");
   await prefs.remove("userEmail");
   await prefs.remove("isLogin");


   //----------Navigate to login screen-------
    Get.offAllNamed("/loginScreen");
  }
}