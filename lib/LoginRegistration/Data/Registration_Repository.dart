import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:http/http.dart'as http;
import 'package:imei_plugin/imei_plugin.dart';
import 'package:flutter/cupertino.dart';

abstract class RegistrationRepository {
  Future getRegistrationResponse({@required String email,@required String password});
}

class RegistrationRepositoryImp extends RegistrationRepository{

  @override
  Future getRegistrationResponse({String email, String password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var imei = await ImeiPlugin.getImei();
    var model;
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
       model = androidInfo.model;

      // Android 9 (SDK 28), Xiaomi Redmi Note 7
    }
    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
       model= iosInfo.model;
    }
    Map body={
      "email":email,
      "password":password,
      "imei_number":imei.toString(),
      "os_code":model,
    };
    try{
      final response= await http.post(Configuration.BASE_URL+"api/customers/register",body: body);
      if(response.statusCode==200){
        final responsedecode=jsonDecode(response.body);
        print("response $responsedecode");
        return responsedecode["success"].toString();
      }else{
        throw Exception();
      }

    }catch(e){
      print("what is the exception "+e.toString());
    }

  }

}