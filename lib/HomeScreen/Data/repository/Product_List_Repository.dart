
import 'dart:convert';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:http/http.dart' as http;
import 'package:ciblecommerce/HomeScreen/Data/model/Product_List_Data_Model.dart';

abstract class ProductListRepository{
  Future <List<ProductList>>getProductList();
}

class ProductListRepositoryImp extends ProductListRepository{
  List<ProductList>productList;
  @override
  Future<List<ProductList>> getProductList() async{
    final respose= await http.get(Configuration.BASE_URL+"api/products/get_product_list");
    if(respose.statusCode==200){
      var list=json.decode(respose.body);
      productList=ProductListDataModel.fromJson(list).productList;
      return productList;
    }else{
      throw Exception();
    }
  }

}