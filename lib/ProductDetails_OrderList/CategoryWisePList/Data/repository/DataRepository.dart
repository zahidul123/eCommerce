import 'dart:convert';

import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/Data/modelClass/CategoryResponseModel.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

abstract class CategoryDataListRepository {
  Future getCategoryListResponse({@required String caregoryId});
}

class ImpCategoryDataListRepository extends CategoryDataListRepository {
  @override
  Future getCategoryListResponse({String caregoryId}) async {
    List<BookList> categoryData;
    try {
      final response = await http.post(
        /*Configuration.BASE_URL*/
        "http://27.147.135.164/ebook/api/" +
            "books/get_book_list?category_id=$caregoryId",
      );
      if (response.statusCode == 200) {
        var responsebody = json.decode(response.body);
        categoryData = CategoryResponseModel.fromJson(responsebody).bookList;
        return categoryData;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
