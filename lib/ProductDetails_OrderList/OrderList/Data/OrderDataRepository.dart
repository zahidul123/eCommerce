import 'dart:convert';

import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class OrderRepository {
  Future fetchOrderList({@required String user_id}) async {
    try{
      final response=await http.get(Configuration.BASE_URL+"api/customers/my_order_list?user_id=$user_id");

      if(response.statusCode==200){
        //var responsebody=json.decode(response.body);
        var jsonresponse=jsonDecode(response.body);
        return jsonresponse;
      }
    }catch(e){
      debugPrint("order list error $e");
    }
  }
}
