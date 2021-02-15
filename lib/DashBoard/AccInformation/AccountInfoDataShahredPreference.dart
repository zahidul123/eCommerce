import 'package:ciblecommerce/LoginRegistration/LoginModelClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AccountInfoPreference{
  static Future<List<LoginModel>> checkUserLogin() async{
    List<LoginModel>userdata=List();
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var user_name=sharedPreferences.getString("user_name");
    var user_id=sharedPreferences.getString("user_id");
    var gender=sharedPreferences.getString("gender");
    var first_name=sharedPreferences.getString("first_name");
    var last_name=sharedPreferences.getString("last_name");
    var email=sharedPreferences.getString("email");
    var phone=sharedPreferences.getString("phone");
    var address=sharedPreferences.getString("address");
    var city=sharedPreferences.getString("city");
    var session_id=sharedPreferences.getString("session_id");
    var country=sharedPreferences.getString("country");
    var zip=sharedPreferences.getString("zip");
    userdata.add(LoginModel(user_name,user_id,gender,first_name,last_name,email,phone,address,city,session_id,country,zip));

    return userdata;
  }
}