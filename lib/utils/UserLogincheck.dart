import 'package:shared_preferences/shared_preferences.dart';
class LoginCheck{
 static  checkUserLogin() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String sessionid=sharedPreferences.getString("session_id");
    if(sessionid!=null){
      return "Logged";
    }else{
      return "out";
    }
  }
 static Logout() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    print(sharedPreferences.remove("session_id"));
    print(sharedPreferences.getString("session_id"));
  }

}