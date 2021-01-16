import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:http/http.dart'as http;
import 'package:imei_plugin/imei_plugin.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginRepository {
  Future getLoginResponse({@required String email,@required String password});
}

class LoginRepositoryImp extends LoginRepository{

  @override
  Future getLoginResponse({String email, String password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var imei = await ImeiPlugin.getImei();
    Map body={
      "email":email,
      "password":password,
      "imei_number":imei.toString()
    };
    try{
      final response= await http.post(Configuration.BASE_URL+"api/customers/login",body: body);

      if(response.statusCode==200){
        final responsedecode=jsonDecode(response.body);
        if(responsedecode["success"]){
          var user_name=responsedecode["user_info"]["user_name"];
          var user_id=responsedecode["user_info"]["user_id"];
          var gender=responsedecode["user_info"]["gender"];
          var first_name=responsedecode["user_info"]["first_name"];
          var last_name=responsedecode["user_info"]["last_name"];
          var email=responsedecode["user_info"]["email"];
          var phone=responsedecode["user_info"]["phone"];
          var address=responsedecode["user_info"]["address"];
          var city=responsedecode["user_info"]["city"];
          var session_id=responsedecode["session_info"]["session_id"];

          sharedPreferences.setString("user_name",user_name);
          sharedPreferences.setString("user_id",user_id);
          sharedPreferences.setString("gender",gender);
          sharedPreferences.setString("first_name",first_name);
          sharedPreferences.setString("last_name",last_name);
          sharedPreferences.setString("email",email);
          sharedPreferences.setString("phone",phone);
          sharedPreferences.setString("address",address);
          sharedPreferences.setString("city",city);
          sharedPreferences.setString("session_id",session_id);
        }
        return responsedecode["success"].toString();
      }else{
        throw Exception();
      }

    }catch(e){
      print("what is the exception "+e.toString());
    }

  }

}