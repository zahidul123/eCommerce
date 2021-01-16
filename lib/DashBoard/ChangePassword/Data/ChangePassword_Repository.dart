import 'dart:convert';

import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
abstract class ChangePassword_Repository {
  Future getChangePasswordResponse({@required String user_id,@required String old_password,@required String new_password,@required String confirm_password,});
}

class ChangePassword_RepositoryImp extends ChangePassword_Repository{
  @override
  Future getChangePasswordResponse({String user_id, String old_password, String new_password, String confirm_password}) async {
    Map body={
      "user_id":user_id,
      "oldpassword":old_password,
      "newpassword":new_password,
      "confirmpassword":confirm_password,
    };
    try{
      final response= await http.post(Configuration.BASE_URL+"api/customers/change_password",body: body);
      if(response.statusCode==200){
        var responseDecode=json.decode(response.body);
        String success=responseDecode["success"].toString();
        String message=responseDecode["msg"];
        return [success,message];
      }else{
        throw Exception();
      }
      
    }catch(e){
      print(e.toString());
    }
  }


}