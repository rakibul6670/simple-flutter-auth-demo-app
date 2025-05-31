
import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/controllers/splash/splash_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashIntroController splashController=SplashIntroController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController.splash();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F0E7),
      body: Center(child: Image.asset("assets/logo/splash_logo.jpeg")),
    );
  }
}
