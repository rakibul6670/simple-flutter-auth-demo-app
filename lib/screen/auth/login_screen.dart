import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/constants/const_text_style.dart';
import 'package:flutter_autho_demo/controllers/auth/login_controller.dart';
import 'package:flutter_autho_demo/utils/custom_button.dart';
import 'package:flutter_autho_demo/utils/custom_text_form_field.dart';
import 'package:flutter_autho_demo/utils/custom_text_link.dart';
import 'package:flutter_autho_demo/utils/validation.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

   //--------------------Login controller----------------
  LoginController loginController=Get.find<LoginController>();


  @override
  Widget build(BuildContext context) {
    //---------screen size-----------
    double screenHeight =MediaQuery.sizeOf(context).height;
    double screenWidth =MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF793373),
                  Color(0xFF8C7660),
                ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: Form(
                  key: loginController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      //------------------form Title-------------
                      Text("Welcome to back", style: ConstTextStyle.formTitle ),
        
                      //-----------------form subTitle--------------
                      Text("Please Enter your Account details",style:ConstTextStyle.formSubTitle ),
        
                      SizedBox(height: 25,),



                      //-------------------Email section------------------
                      Text("Email",style: ConstTextStyle.fieldTextTitle ,),
                      SizedBox(height: 10,),
                      CustomTextFormField(
                          controller: loginController.emailController,
                          validation: Validation().validateEmail,

                          errorTextStyle: TextStyle(
                            color: Colors.greenAccent
                          ),

                          obscureText: false,
                          filled: true,
                          fillColor: Color(0xFF040303),

                          hintText: "Enter your email",
                          hintTextStyle: ConstTextStyle.hintText,
                          inputTextStyle: ConstTextStyle.inputText,

                      ),





        
                      SizedBox(height: 15,),
                      //-----------------------Password section---------------
                      Text("Password",style: ConstTextStyle.fieldTextTitle ,),
                      SizedBox(height: 10,),

                      //----------Update password visibility or visibility_off
                      Obx(()=>
                          CustomTextFormField(
                            validation: Validation().validatePassword,
                            controller: loginController.passwordController,
                            contentPadding: EdgeInsets.only(
                              top: 0,
                              bottom: 20,
                              right: 30,
                              left: 10
                            ),
                            obscureText: loginController.isPasswordHidden.value,
                            suffix:SizedBox(
                              height: 20,
                              width: 20,
                              child: IconButton(
                                  onPressed: () {
                                    loginController.togglePasswordVisibility();
                                  },
                                  icon: Icon(
                                    loginController.isPasswordHidden.value?
                                    Icons.visibility_off:
                                    Icons.visibility,color: Colors.white,
                                  )
                              ),
                            ),

                            errorTextStyle: TextStyle(
                                color: Colors.greenAccent
                            ),


                            filled: true,
                            fillColor: Color(0xFF040303),

                            hintText: "Enter your password",
                            hintTextStyle: ConstTextStyle.hintText,
                            inputTextStyle: ConstTextStyle.inputText,

                          ),
                      ),




                      //-----------------forgot password and checkbox
                      SizedBox(height: 15,),

                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          //---------check box and title
                         Row(
                           children: [
                             //-------Checkbox-----------
                             Obx(()=>
                                 Checkbox(
                                     activeColor: Colors.green,
                                     checkColor: Colors.white,
                                     value: loginController.isRemember.value,
                                     onChanged: (value){
                                       loginController.isRemember.value= value!;
                                     }
                                 ),
                             ),
                             
                             SizedBox(width: 5,),
                             Text("Remember me",style: ConstTextStyle.rememberMe,)
                           ],
                         ),
                          Text("Forgot Password",style: ConstTextStyle.forgotPassword,),
                        ],
                      ),
        
        
                      
                      
                      
                      //----------------Login button-----------
                      SizedBox(height: 15,),

                      Obx((){
                        return loginController.isLoading.value == true?
                        Center(child: CircularProgressIndicator(
                          color: Colors.green,
                          strokeWidth: 6,
                        )):
                        CustomButton(

                        onPressed: loginController.loginWithValidate,

                        buttonName: "Login",
                        );
                      }),

                      SizedBox(height: 15,),

                      
                      
                      
                      //-----------I have not account and sign up link text------------
                      CustomTextLink(
                        onTap: (){
                          Get.offNamed("/signupScreen");
                        },
                        linkText:"Sign up",
                        linkTextStyle: ConstTextStyle.forgotPassword,
                        text: "I have not an account     ",
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      
                      
                      
                    ],
                  )
              ),
            ),
        ),
      ),
    );
  }
}
