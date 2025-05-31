import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_autho_demo/api_services/api_constant.dart';
import 'package:http/http.dart' as http;

import '../utils/show_custom_snack.dart';



class ApiService{

  //-----------------------------GET userData------------
  Future<dynamic> getData() async{
    try{
      final response =await http.get(Uri.parse(
          "${ApiConstant.url}${ApiConstant.endPoint}"
      ));
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }
      else{
        showCustomSnack(
          title: "Error",
          message: "getData failed ${response.statusCode}",
          icon: Icons.error_outline,
          bgColor: Colors.redAccent,
        );
      }
    }


    catch(e){
      showCustomSnack(
        title: "Error",
        message: "getData error: $e",
        icon: Icons.error_outline,
        bgColor: Colors.redAccent,
      );
    }
  }

  //----------------------------------POST userData----------------------------------

  Future<dynamic> postData(Map<String,dynamic> userData) async{
    try{
      final response= await http.post(
        Uri.parse("${ApiConstant.url}${ApiConstant.endPoint}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userData)
      );
      if(response.statusCode == 201 || response.statusCode==200){
        return jsonDecode(response.body);
      }
      else{
        showCustomSnack(
          title: "Error",
          message: "postData failed! ${response.statusCode}",
          icon: Icons.error_outline,
          bgColor: Colors.redAccent,
        );
      }
    }
    catch(e){
      showCustomSnack(
        title: "Error",
        message: "postData error: $e",
        icon: Icons.error_outline,
        bgColor: Colors.redAccent,
      );
    }
  }


}