
import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/controllers/auth/signup_controller.dart';
import 'package:flutter_autho_demo/utils/validation.dart';
import 'package:get/get.dart';
import '../../constants/const_text_style.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text_form_field.dart';
import '../../utils/custom_text_link.dart';
import '../../utils/show_custom_snack.dart';


class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  //---------------------sign up controller----------------
  SignupController signupController =SignupController();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  final formKey=GlobalKey<FormState>();

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
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //------------------form Title-------------
                    Text("Welcome! Let's Get Started", style: ConstTextStyle.formTitle ),

                    //-----------------form subTitle--------------
                    Text("We're excited to have you! Just a few details below",style:ConstTextStyle.formSubTitle ),

                    SizedBox(height: 25,),
                    //-------------------Name section------------------
                    Text("Full name: ",style: ConstTextStyle.fieldTextTitle ,),
                    SizedBox(height: 10,),
                    CustomTextFormField(
                      validation: Validation().validateName,
                      controller: nameController,
                      obscureText: false,
                      errorTextStyle: TextStyle(
                        color: Colors.greenAccent
                      ),
                      filled: true,
                      fillColor: Color(0xFF040303),

                      hintText: "Enter your fullName",
                      hintTextStyle: ConstTextStyle.hintText,
                      inputTextStyle: ConstTextStyle.inputText,

                    ),

                    SizedBox(height: 15,),

                    //-------------------Email section------------------
                    Text("Email",style: ConstTextStyle.fieldTextTitle ,),
                    SizedBox(height: 10,),
                    CustomTextFormField(
                      validation: Validation().validateEmail,
                      errorTextStyle: TextStyle(
                          color: Colors.greenAccent
                      ),
                      controller: emailController,
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

                    Obx(()=>
                        CustomTextFormField(
                      validation: Validation().validatePassword,
                      contentPadding: EdgeInsets.only(
                          top: 0,
                          bottom: 20,
                          right: 30,
                          left: 20
                      ),
                      obscureText: signupController.isPasswordHidden.value,
                      suffix:SizedBox(
                        height: 20,
                        width: 20,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: IconButton(
                              onPressed: () {signupController.togglePasswordVisibility();
                              },
                              icon: Icon(
                                signupController.isPasswordHidden.value?
                                Icons.visibility_off:
                                Icons.visibility,color: Colors.white,
                              )
                          ),
                        ),
                      ),
                      errorTextStyle: TextStyle(
                          color: Colors.greenAccent
                      ),
                      controller: passwordController,
                      filled: true,
                      fillColor: Color(0xFF040303),

                      hintText: "Enter your password",
                      hintTextStyle: ConstTextStyle.hintText,
                      inputTextStyle: ConstTextStyle.inputText,

                    ),
                    ),

                    //-----------------forgot password and checkbox
                    SizedBox(height: 15,),

                    //---------------remember me
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //-------Checkbox-----------
                        Obx(()=>
                            Checkbox(
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                value: signupController.isRemember.value,
                                onChanged: (value){
                                  signupController.isRemember.value= value!;
                                }
                            ),
                        ),
                        SizedBox(width: 5,),
                        Text("Remember me",style: ConstTextStyle.rememberMe,)
                      ],
                    ),

                   // Text("Forgot Password",style: ConstTextStyle.forgotPassword,),


                    //----------------Login button-----------
                    SizedBox(height: 15,),

                    CustomButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          if(signupController.isRemember.value){
                            signupController.signup({
                                  "name": nameController.text.trim(),
                                  "email":emailController.text.trim(),
                                  "password":passwordController.text.trim(),
                                });
                            //-----------Navigate to login screen-------------
                            Get.offNamed("/loginScreen");
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
                      },
                      buttonName: "Sign up",
                      //backgroundColor: Colors.green,
                    ),

                    SizedBox(height: 15,),

                    //-----------I have not account and sign up link text------------
                    CustomTextLink(
                      onTap: (){
                        Get.offNamed("/loginScreen");
                      },
                      linkText:"login",
                      linkTextStyle: ConstTextStyle.forgotPassword,
                      text: "I have  an account     ",
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
