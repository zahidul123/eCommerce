import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/Data/modelClass/CategoryResponseModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class CategoryListState extends Equatable{}

class CategoryListInitialState extends CategoryListState{
  @override
  List<Object> get props => [];
}
class CategoryListLoadingState extends CategoryListState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class CategoryListDataLoadState extends CategoryListState{

  @override
  // TODO: implement props
  List<BookList>response;
  CategoryListDataLoadState({@required this.response});
  List<Object> get props => [response];
}
class CategoryListErrorState extends CategoryListState{
   String errorResponse;
   CategoryListErrorState({@required this.errorResponse});
  @override
  // TODO: implement props
  List<Object> get props => [errorResponse];
}