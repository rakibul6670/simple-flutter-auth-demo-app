
import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/controllers/intro/intro_controller.dart';
import 'package:flutter_autho_demo/routes/app_pages.dart';
import 'package:get/get.dart';
import 'controllers/auth/login_controller.dart';
import 'controllers/auth/logout_controller.dart';
import 'controllers/auth/signup_controller.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //----------------------Logout controller instance--------
   Get.put(LogoutController());

  //--------------------Login controller instance ------------
  LoginController loginController=Get.put(LoginController());

  //----------------------Signup controller instance------------
  Get.put(SignupController());


  //--------------------intro controller instance------------
 Get.put(IntroController());

  await loginController.userLoading();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(

     debugShowCheckedModeBanner: false,
     initialRoute: '/',
     getPages: AppPages.routes,

   );
  }

}
