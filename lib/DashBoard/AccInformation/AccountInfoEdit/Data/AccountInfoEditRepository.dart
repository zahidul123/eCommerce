
import 'dart:convert';
import 'dart:io';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:file/file.dart';
import 'package:path/path.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';

abstract class AccountInfoEditRepository {
  Future getAccountInfoEditRepositoryResponse({
    @required String user_id,
    @required String first_name,
    @required String last_name,
    @required String phone,
    @required String gender,
    @required String picture,
    @required String address,
    @required String city,
    @required String zip,
    @required String email,
    @required String country,
  });
}

class AccountInfoEditRepositoryImp extends AccountInfoEditRepository {
  @override
 Future getAccountInfoEditRepositoryResponse(
      {String user_id,
      String first_name,
      String last_name,
      String phone,
      String gender,
      String picture,
      String address,
      String city,
      String zip,
      String email,
      String country}) async{
    Map body={
      "user_id":user_id,
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "gender":gender,
      "picture":picture,
      "address":address,
      "city":city,
      "zip":zip,
      "country":country
    };

    try{
      print(Configuration.BASE_URL+"api/customers/edit");
      final response=await http.post(Configuration.BASE_URL+"api/customers/edit",body: body);
      print(response.statusCode);
      if(response.statusCode==200){
        var responsedecode=json.decode(response.body);
        return responsedecode.toString();
      }
      return response;
    }catch(e){
      throw Exception();
    }
  }
}
