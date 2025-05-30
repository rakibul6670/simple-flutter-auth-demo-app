
import 'package:flutter/material.dart';


class ConstTextStyle{

  //-------------form title----
 static  TextStyle formTitle= TextStyle(
    fontSize: 25,
    color: Color(0xFFFFFFFF),
     fontWeight: FontWeight.bold
  );


  //-------------form sub title----
 static  TextStyle formSubTitle= TextStyle(
      fontSize: 15,
      color: Color(0xFFFFFFFF)
  );


  //------------- form field text title----
  static TextStyle fieldTextTitle= TextStyle(
      fontSize: 13,
      color: Color(0xFFFFFFFF)
  );

  //------------------forgot text
  static TextStyle forgotPassword =TextStyle(
   fontSize: 13,
   color: Color(0xFFFFFFFF),
   decoration: TextDecoration.underline,
   decorationColor: Color(0xFFFFFFFF),
  );

 //------------------Remember text---------
 static TextStyle rememberMe =TextStyle(
     fontSize: 13,
     color: Color(0xFFFFFFFF),
 );

 //------------------Sign up link text-----------
 static TextStyle signup =TextStyle(
  fontSize: 13,
  color: Color(0xFF1708DD),
  decoration: TextDecoration.underline,
  decorationColor: Color(0xFFFFFFFF),
 );


 //------hint text style-----------
 static TextStyle hintText =TextStyle(
  fontSize: 13,
  color: Color(0xFFC5C3C3),
 );

 //--------------form user input text--------
 static TextStyle inputText =TextStyle(
  fontSize: 13,
  color: Color(0xFFFFFFFF),
 );



}