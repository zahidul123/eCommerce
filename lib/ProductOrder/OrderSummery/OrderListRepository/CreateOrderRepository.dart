import 'dart:convert';

import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoDataShahredPreference.dart';
import 'package:ciblecommerce/LoginRegistration/LoginModelClass.dart';
import 'package:ciblecommerce/ProductOrder/OrderSummery/OrderListRepository/OrderModelClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ciblecommerce/CartListAndOrder/CartListUi/OrderListModel.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class ProductOrderRepository{
  Future fetchOrderList({@required String billing_firstName,
  @required String billing_lastName,@required String billing_phone,@required String billing_email,
  @required String billing_city
  ,@required String billing_country,@required String billing_zip,
  @required String billing_address,
  @required List<OrderListModel> orderListArray});
}
class OrderRepository extends ProductOrderRepository{
  Future fetchOrderList({@required String billing_firstName,
  @required String billing_lastName,@required String billing_phone,@required String billing_email,
    @required String billing_city
    ,@required String billing_country,@required String billing_zip,
    @required String billing_address,
    @required List<OrderListModel> orderListArray}) async {


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user_id = sharedPreferences.getString("user_id");
    Future<List<LoginModel>> loginModelSnap = AccountInfoPreference.checkUserLogin();
    LoginModel loginModel = await loginModelSnap.then((value) => value[0]);

    OrderModel orderModel=OrderModel(user_id,loginModel.first_name,loginModel.last_name,
        loginModel.phone,loginModel.email,loginModel.city,loginModel.country,loginModel.zip,
        billing_firstName, billing_lastName, billing_phone,
        billing_email, billing_city,billing_country,billing_address,orderListArray);

    try{
      var json = jsonEncode(orderListArray.map((e) => e.toJsonAttr()).toList());
      String mappingResponse=jsonDecode(json).toString();
      Map body={
        "customer_id":user_id,
        "billing_firstName":loginModel.first_name!=null?loginModel.first_name:"",
        "billing_lastName":loginModel.last_name!=null?loginModel.last_name:"",
        "billing_phone":loginModel.phone!=null?loginModel.phone:"",
        "billing_email":loginModel.email!=null?loginModel.email:"",
        "billing_city":loginModel.city!=null?loginModel.city:"",
        "billing_address":loginModel.address!=null?loginModel.address:"",
        "billing_country":loginModel.country!=null?loginModel.country:"",
        "billing_zip":loginModel.zip!=null?loginModel.zip:"",
        "shipping_firstName":billing_firstName,
        "shipping_lastName":billing_lastName,
        "shipping_phone":billing_phone,
        "shipping_email":billing_email,
        "shipping_city":billing_city,
        "shipping_address":billing_address,
        "shipping_country":billing_country,
        "items":mappingResponse,
      };
      final response=await http.post(Configuration.BASE_URL+"api/orders/create_order",body:body);

      if(response.statusCode==200){
        //var responsebody=json.decode(response.body);
        var jsonresponse=jsonDecode(response.body);
        return jsonresponse;
      }else{
        return "not success";
      }
    }catch(e){
      debugPrint("order list error $e");
    }
  }
}