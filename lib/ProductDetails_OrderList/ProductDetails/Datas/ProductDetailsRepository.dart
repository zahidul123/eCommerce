import 'dart:convert';

import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
abstract class ProductDetailsRepository{
  Future getProductDetailsrepository({@required String Product_id/*,@required String company_id*/});
}

class ProductDetailsRepositoryImp extends ProductDetailsRepository {
  @override
  Future getProductDetailsrepository({String Product_id/*, String company_id*/})async {
    try{
      final response=await http.post(Configuration.BASE_URL+"api/products/get_product/$Product_id",);

      if(response.statusCode==200){
        var responsebody=json.decode(response.body);
        bool success=responsebody['success'];
        if(success){
          return responsebody['product'];
        }
      }
    }catch(e){
      throw Exception();
    }
  }
  
}
