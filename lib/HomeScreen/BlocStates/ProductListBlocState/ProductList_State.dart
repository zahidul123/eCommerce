import 'package:ciblecommerce/HomeScreen/Data/model/Product_List_Data_Model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductListState extends Equatable{
}
class ProductListInitialState extends ProductListState{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}

class ProductListLoadingState extends ProductListState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ProductListLoadedState extends ProductListState{
  List<ProductList> productList;
  ProductListLoadedState({@required this.productList});
  @override
  // TODO: implement props
  List<Object> get props => [productList];
}
class ProductListErrorState extends ProductListState{
  String message="Error No Data Found";
  ProductListErrorState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}



