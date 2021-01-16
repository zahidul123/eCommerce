
import 'dart:convert';
import 'package:ciblecommerce/HomeScreen/Data/model/Category_Data_Model.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:http/http.dart' as http;
abstract class CategoryRepository {
  Future <List<CatList>>getCategoryBook();
}
class CategoryRepositoryImp extends CategoryRepository{
  List<CatList> booklist;
  @override
  Future<List<CatList>> getCategoryBook() async {
    final response=await http.get(Configuration.BASE_URL+"api/products/get_category_list");
    if(response.statusCode==200){
      var list=json.decode(response.body);
      booklist=CategoryDataModel.fromJson(list).catList;
      return booklist;
    }else{
      throw Exception();
    }
  }

}
