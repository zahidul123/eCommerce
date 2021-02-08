
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
      "email":email,
      "country":country
    };

    try{
      print(Configuration.BASE_URLSean+"api/customers/edit");
      final response=await http.post(Configuration.BASE_URL+"api/customers/update",
        body: body,);
      print(response.statusCode);
      if(response.statusCode==200){
        String responses=response.body.toString();
        var responsedecode=json.decode(responses);
        var isSuccess=responsedecode["success"];
        if(isSuccess==true){
          return "true";
        }else{
          return "upload failed";
        }

      }
      /*var request =  http.MultipartRequest(
          'POST', Uri.parse(Configuration.BASE_URL+"api/customers/update"));

      request.fields["user_id"] = "user_id";
      request.fields["first_name"] ="first_name";
      request.fields["last_name"] = "last_name";
      request.fields["phone"] = "phone";
      request.fields["gender"] = "gender";
      request.fields["address"] = "address";
      request.fields["city"] = "city";
      request.fields["zip"] = "zip";
      request.fields["country"] = "country";
      request.files.add(await http.MultipartFile.fromPath(
          'picture',
          picture.path
      )
      );
      var response = await request.send();
      if(response.statusCode==200){
        print(response.stream);
        print(response.statusCode);
        final res = await http.Response.fromStream(response);
        print(res.body);
        return response;
      }*/
     return "upload failed";
    }catch(e){
      debugPrint(e.toString());
      throw Exception();
    }
  }
}
