import 'dart:convert';

import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class SaveCardDataInRepository{
   Future ImpSaveCartData({@required String customer_id,@required String book_id,@required String rating,
     @required String description}) async{
    ReturnDataResponse returnDataResponse;
     try{
       returnDataResponse.showProgressbar();
       Map requestbody={
         "customer_id":customer_id,
         "book_id":book_id,
         "rating":rating,
         "description":description
       };
       var url=Configuration.BASE_URLSean+"reviews/save_items";
       var httprequest= await http.post(url,body: requestbody);
       if(httprequest.statusCode==200){
         returnDataResponse.hideProgressBar();
         String response=jsonDecode(httprequest.body);
         returnDataResponse.onSuccessResponse(response);
       // return response;
       }

     }catch(e){
       debugPrint(e.toString());
     }
  }
}
class ReturnDataResponse{
  onSuccessResponse(String response){}
  onErrorResponse(){}
  showProgressbar(){}
  hideProgressBar(){}
}

