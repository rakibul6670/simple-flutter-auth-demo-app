import 'dart:convert';
import 'package:flutter_autho_demo/api_services/api_constant.dart';
import 'package:http/http.dart' as http;



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
        print("Data get failed");
      }
    }


    catch(e){
      print("Data get Error: $e");
    }
  }

  //----------------------------------POST userData----------------------------------

  Future<void> postData(Map<String,dynamic> userData) async{
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
        print("data post response failed:");
      }
    }
    catch(e){
      print('Data post failed: $e');
    }
  }


}