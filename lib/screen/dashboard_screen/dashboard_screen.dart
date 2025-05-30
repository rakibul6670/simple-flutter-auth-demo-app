
import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/controllers/auth/logout_controller.dart';
import 'package:flutter_autho_demo/utils/custom_button.dart';
import 'package:get/get.dart';
import '../../controllers/auth/login_controller.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});

 LogoutController logoutController =Get.find<LogoutController>();
 LoginController loginController =Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    //---------screen size-----------
    double screenHeight =MediaQuery.sizeOf(context).height;
    double screenWidth =MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // Profile Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    children: [

                      // User Avatar
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.person, color: Colors.white, size: 40),
                      ),

                      SizedBox(height: 16),

                      // User Name
                      Obx(() => Text(
                        "Name: ${loginController.userName.value}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )),

                      SizedBox(height: 8),

                      // User Email
                      Obx(() => Text(
                        "Email: ${loginController.userEmail.value}",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      )),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Logout Button
              CustomButton(
                minimumSize: Size(screenWidth * .60, screenHeight * 0.06),
                onPressed: logoutController.logout,
                buttonName: "Logout",

              ),

            ],
          ),
        ),
      ),

    );
  }
}
