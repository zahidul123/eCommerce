import 'dart:convert';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
abstract class DashBoardDataRepository{
  Future getDashBoardDataRepository({@required String user_id});
}

class DashBoardDataRepositoryImp extends DashBoardDataRepository{
  @override
  Future getDashBoardDataRepository({String user_id}) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try{
      final response=await http.get(Configuration.BASE_URL+"/api/customers/my_profile/$user_id");
      if(response.statusCode==200){
        var responsedecode=json.decode(response.body);
        if(responsedecode["success"]){
          var user_name=responsedecode["user_info"]["user_name"];
          var user_id=responsedecode["user_info"]["user_id"];
          var first_name=responsedecode["user_info"]["first_name"];
          var last_name=responsedecode["user_info"]["last_name"];
          var email=responsedecode["user_info"]["email"];
          var picture=responsedecode["user_info"]["picture"];
          var phone=responsedecode["user_info"]["phone"];
          var address=responsedecode["user_info"]["address"];
          var city=responsedecode["user_info"]["city"];

          sharedPreferences.setString("user_name",user_name);
          sharedPreferences.setString("user_id",user_id);
          sharedPreferences.setString("first_name",first_name);
          sharedPreferences.setString("last_name",last_name);
          sharedPreferences.setString("email",email);
          sharedPreferences.setString("picture",picture);
          sharedPreferences.setString("phone",phone);
          sharedPreferences.setString("address",address);
          sharedPreferences.setString("city",city);
        }
      }
    }catch(e){
      throw Exception();
    }
  }

}