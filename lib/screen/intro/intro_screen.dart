import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/controllers/intro/intro_controller.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  IntroController introController=Get.find<IntroController>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Auth Demo",
          body: "A simple and fast authentication system using Flutter & GetX.",
          image: Image.asset("assets/intro/intro_01.png", height: 200),
        ),
        PageViewModel(
          title: "Secure Login",
          body: "Login with your email and password with proper validation.",
          image: Image.asset("assets/intro/intro_02.png", height: 200),
        ),
        PageViewModel(
          title: "Get Started Now",
          body: "Sign up quickly and enjoy seamless user experience.",
          image: Image.asset("assets/intro/intro_03.png", height: 200),
        ),
      ],
      safeAreaList: [true,true,true,true],

      onDone: ()  {
        introController.setIntroSeen();
        Get.offNamed("/loginScreen");
      },
      onSkip: ()  {
        introController.setIntroSeen();
        Get.offNamed("/loginScreen");
      },

      showSkipButton: true,

      skip: Text("Skip"),
      next: Icon(Icons.arrow_forward),

      done: Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold)),

      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.blue,
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),

      ),

    );
  }
}
